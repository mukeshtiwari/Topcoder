#!/usr/bin/python3

from pathlib import Path
import pygame
import socket
import logging
import time

TILE_PATH = Path('./tiles/')
MOVE_LOG    = logging.getLogger('blockdude.move')
ERROR_LOG   = logging.getLogger('blockdude.error')
ERROR_LOG.setLevel(logging.DEBUG)
MOVE_LOG.setLevel(logging.DEBUG)
ERROR_LOG.addHandler(logging.FileHandler("block_dude_error.log"))
fh = logging.FileHandler("block_dude_move.log", mode='w')
fh.setFormatter(logging.Formatter('%(message)s'))
MOVE_LOG.addHandler(fh)

class BlockDude:
    TILE_EMPTY  = b' '
    TILE_WALL   = b'w'
    TILE_LEFT   = b'l'
    TILE_RIGHT  = b'r'
    TILE_BLOCK  = b'b'
    TILE_DOOR   = b'd'

    TILE_PATHS = {
        TILE_EMPTY  : TILE_PATH / 'empty.png',
        TILE_WALL   : TILE_PATH / 'wall.png',
        TILE_LEFT   : TILE_PATH / 'left.png',
        TILE_RIGHT  : TILE_PATH / 'right.png',
        TILE_BLOCK  : TILE_PATH / 'block.png',
        TILE_DOOR   : TILE_PATH / 'door.png'
    }

    GRID_SIZE = 18
    TILE_SIZE = 24

    KEYS = {
        pygame.K_UP     : b'N',
        pygame.K_DOWN   : b'S',
        pygame.K_RIGHT  : b'E',
        pygame.K_LEFT   : b'W'
    }

    def __init__(self, hostname, port, replay=None):

        # Save replay
        self.replay = replay

        # Initialize connection to server
        self.socket = socket.socket()
        self.socket.connect((hostname, port))

        # Initialize pygame
        pygame.init()
        self.running = True

        # Initialize display
        self.display = pygame.display.set_mode((BlockDude.GRID_SIZE*BlockDude.TILE_SIZE, BlockDude.GRID_SIZE*BlockDude.TILE_SIZE))
        self.display.fill((255,255,255))    # White background

        # Load tiles
        self.tiles = {}
        for tile,path in BlockDude.TILE_PATHS.items():
            t = pygame.image.load(path.open('rb'))
            t.convert_alpha()
            self.tiles[tile] = t

        # Read initial map from server
        self.read_update_map()

    def __del__(self):
        self.socket.close()

    def read_update_map(self):

        # Read map from server
        data = b''
        while len(data) != BlockDude.GRID_SIZE * BlockDude.GRID_SIZE:
            d = self.socket.recv(BlockDude.GRID_SIZE * BlockDude.GRID_SIZE)
            # Break if socket closed
            if not d:
                break
            data += d

        # Verify map data
        if len(data) != BlockDude.GRID_SIZE * BlockDude.GRID_SIZE or set(data).issubset(self.tiles.keys()):
            from tkinter import Tk
            from tkinter import messagebox
            Tk().wm_withdraw()

            if len(data) == 0:
                err = "Server closed connection"
            else:
                try:
                    data = data.decode('utf-8')
                except:
                    pass
                err = f"Message: '{data}'"
            messagebox.showinfo("Connection Closed", err)
            ERROR_LOG.error(err)
            self.running = False
            return

        # Update display
        self.display.fill((255,255,255))
        for i,t in enumerate(data):
            x = (BlockDude.GRID_SIZE - (i % BlockDude.GRID_SIZE + 1)) * BlockDude.TILE_SIZE
            y = (BlockDude.GRID_SIZE - (i // BlockDude.GRID_SIZE + 1)) * BlockDude.TILE_SIZE
            self.display.blit(self.tiles[bytes([t])], (x,y))
        pygame.display.update()

    def send_update_map(self, cmd):
        MOVE_LOG.debug(cmd.decode('utf-8'))
        self.socket.send(cmd)
        self.read_update_map()

    def game_loop(self):

        # Setup events
        pygame.event.set_allowed(None)
        pygame.event.set_allowed([pygame.QUIT, pygame.KEYDOWN])

        # Consume replay first
        if self.replay:
            with open(self.replay, 'rb') as f:
                data = f.read()
            moves = data.split()
            for m in moves:
                if not self.running:
                    break
                if m in BlockDude.KEYS.values():
                    self.send_update_map(m)
                    time.sleep(.01)

        # Start game loop
        while self.running:
            event = pygame.event.wait()
            if event.type == pygame.QUIT:
                self.running = False
            elif event.type == pygame.KEYDOWN:
                cmd = BlockDude.KEYS.get(event.key)
                if cmd:
                    self.send_update_map(cmd)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('hostname',
        type=str,
        help='Hostname of blockdude server')
    parser.add_argument('--port',
        type=int,
        default=1337,
        help='Port number of blockdude server')
    parser.add_argument('--replay',
        type=str,
        help='Path to moves log file. This can be used to automatically perform a recorded set of moves. Once moves have been consumed, normal input resumes.')
    args = parser.parse_args()

    # Initialize and start game loop
    bd = BlockDude(**vars(args))
    bd.game_loop()




