#include <stdlib.h>
#include <stdio.h>
#include <sys/socket.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <string.h>

#include "blockdude.h"

i32 SOCKET = 0;
u8 gMAP[MAP_Y][MAP_X];

update_t parse_command(char cmd)
{
    switch (cmd)
    {
    case CMD_NORTH:
        return update_north;
    case CMD_SOUTH:
        return update_south;
    case CMD_EAST:
        return update_east;
    case CMD_WEST:
        return update_west;
    default:
        return 0;
    }
}

u8 game_complete(State *state)
{
    return gMAP[state->y][state->x] == TILE_DOOR;
}

void update_north(State *state)
{
    if (FACING_EDGE(state))
    {
        return;
    }

    char horizontal = get_block_at(state->x + state->dir, state->y, state);
    char diagonal = get_block_at(state->x + state->dir, state->y + 1, state);
    if (SOLID_TILE(horizontal) &&
        diagonal == TILE_EMPTY)
    {
        state->y += 1;
        state->x += state->dir;
    }
}

void update_south(State *state)
{
    if (FACING_EDGE(state))
    {
        return;
    }

    char horizontal = get_block_at(state->x + state->dir, state->y, state);
    char diagonal = get_block_at(state->x + state->dir, state->y + 1, state);

    // Drop Box
    if (state->has_block && horizontal == TILE_EMPTY)
    {
        // Find height to drop
        u8 height = state->y;
        while(TILE_EMPTY == get_block_at(state->x + state->dir, height, state))
        {
            height--;
        }
        state->blocks[state->cur_block].y = height + 1;
        state->blocks[state->cur_block].x = state->x + state->dir;
        state->has_block = 0;
    }

    // Pickup Box if not carrying and there is a free block in front
    // plus special case for spawn box
    else if ((!state->has_block && horizontal == TILE_BLOCK && diagonal != TILE_BLOCK) ||
             (state->x == 1 && state->y == 1 && state->dir == DIR_RIGHT))
    {
        u8 index = 0;
        if (state->x == 1 && state->y == 1 && state->dir == DIR_RIGHT)
        {
            // TODO: do newly spawned boxes need to be initialized?
            index = state->num_blocks++;
        }
        else {
            index = get_block_index(state->x+state->dir, state->y, state);
        }

        state->has_block = 1;
        state->cur_block = index;
    }
}

void update_horizontal(State *state)
{
    if (FACING_EDGE(state))
    {
        return;
    }

    // Find height
    u8 height = state->y;
    while(!SOLID_TILE(get_block_at(state->x + state->dir, height, state)))
    {
        height--;
    }

    // Advance left if height is less
    if (state->y > height)
    {
        state->y = height + 1;
        state->x += state->dir;
    }
}

void update_west(State *state)
{
    // Regardless, set player direction left
    state->dir = DIR_LEFT;
    update_horizontal(state);
}

void update_east(State *state)
{
    // Regardless, set player direction right
    state->dir = DIR_RIGHT;
    update_horizontal(state);
}

void main_loop(void)
{
    State state;
    memset(&state, 0, sizeof(state));

    // Load map
    state.success = load_map(MAP_PATH);

    // Set player position
    state.y = 1;
    state.x = 2;
    state.dir = 1;

    // Output window
    if (state.success)
    {
        state.success = output_window(&state);
    }

    while (state.success)
    {
        // Recv command from client
        if (recv(SOCKET, &(state.cmd), sizeof(state.cmd), 0) > 0)
        {
            state.success = 1;
        }
        else
        {
            state.success = 0;
        }

        // Validate Command
        if (state.success)
        {
            state.update = parse_command(state.cmd);
            state.success = 0 != state.update;
        }

        // Update state
        if (state.success)
        {
            (void)state.update(&state);
            if (game_complete(&state))
            {
                return;
            }
        }

        // Output window
        if (state.success)
        {
            state.success = output_window(&state);
        }
    }

    if (!state.success)
    {
        exit(-1);
    }
}
