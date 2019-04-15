#ifndef BLOCKDUDE_H_
#define BLOCKDUDE_H_

#include <stdint.h>

typedef uint8_t     u8;
typedef uint16_t    u16;
typedef uint32_t    u32;
typedef uint64_t    u64;
typedef int8_t      i8;
typedef int16_t     i16;
typedef int32_t     i32;

#define LISTEN_PORT     31337
#define GRID_SIZE       18

#define TILE_EMPTY      ' '
#define TILE_WALL       'w'
#define TILE_LEFT       'l'
#define TILE_RIGHT      'r'
#define TILE_BLOCK      'b'
#define TILE_DOOR       'd'

#define CMD_DEBUG       'D'
#define CMD_NORTH       'N'
#define CMD_SOUTH       'S'
#define CMD_EAST        'E'
#define CMD_WEST        'W'

#define MAP_Y           18
#define MAP_X           50
#define MAP_PATH        "map.txt"

#define DIR_LEFT        (1)
#define DIR_RIGHT       (-1)
#define FACING_EDGE(s)  (((s)->dir == DIR_LEFT && (s)->x == MAP_X - 1) || ((s)->dir == DIR_RIGHT && (s)->x == 0))
#define SOLID_TILE(c)   (((c) == TILE_BLOCK) || ((c) == TILE_WALL))

#define MAX(a,b)        ((a)>(b)? (a):(b))
#define MIN(a,b)        ((a)<(b)? (a):(b))

extern i32 SOCKET;
extern u8 gMAP[MAP_Y][MAP_X];

typedef struct State_t State;
typedef void (*update_t)(State *);

typedef struct Block_t {
    u8 x;
    u8 y;
} Block;

struct State_t {
    u8 num_blocks;
    u8 cur_block;
    u8 has_block;
    u8 y;
    u8 x;
    i8 dir;
    char cmd;
    u8 success;
    update_t update;
    // TODO: is 8 blocks enough?
    Block blocks[8];
};

void client_game(i32 socket);
void main_loop(void);
void update_north(State *state);
void update_south(State *state);
void update_east(State *state);
void update_west(State *state);

u8 get_block_index(u8 y, u8 x, State *state);
char get_block_at(u8 x, u8 y, State *state);
u8 output_window(State *state);
u8 load_map(const char *map_path);

#endif // BLOCKDUDE_H_
