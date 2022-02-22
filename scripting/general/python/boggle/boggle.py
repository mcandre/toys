#!/usr/bin/env python

'''Trie-based boggle solver'''

import random
import sys
import os

DEFAULT_DICT = 'dict.txt'

DICE = [
    ['A', 'O', 'B', 'B', 'O', 'J'],
    ['W', 'H', 'G', 'E', 'E', 'N'],
    ['N', 'R', 'N', 'Z', 'H', 'L'],
    ['N', 'A', 'E', 'A', 'G', 'E'],
    ['D', 'I', 'Y', 'S', 'T', 'T'],
    ['I', 'E', 'S', 'T', 'S', 'O'],
    ['A', 'O', 'T', 'T', 'W', 'O'],
    ['H', 'Qu', 'U', 'M', 'N', 'I'],
    ['R', 'Y', 'T', 'L', 'T', 'E'],
    ['P', 'O', 'H', 'C', 'S', 'A'],
    ['L', 'R', 'E', 'V', 'Y', 'D'],
    ['E', 'X', 'L', 'D', 'I', 'R'],
    ['I', 'E', 'N', 'S', 'U', 'E'],
    ['S', 'F', 'F', 'K', 'A', 'P'],
    ['I', 'O', 'T', 'M', 'U', 'C'],
    ['E', 'H', 'W', 'V', 'T', 'R']
]

CMD_STOP = '[stop]'
PROMPT = '> '
MIN_LENGTH = 3


def chomp(line):
    'Strip trailing line endings'''

    if line[-1] == '\n':
        return line[:-1]

    return line


def create_board():
    '''Initialize board'''

    # random faces
    board = [random.choice(d) for d in DICE]

    # random places
    board2 = []
    while len(board) > 0:
        board2.append(
            board.pop(
                random.choice(range(len(board)))
            )
        )
    board = board2

    # format 4x4
    board = [
        board[:4],
        board[4:8],
        board[8:12],
        board[12:]
    ]

    lower = [
        [e.lower() for e in line] for line in board
    ]

    return board, lower


def find(board, word):
    '''Test existence of word in board'''

    for i in range(len(board)):
        for j in range(len(board[i])):
            if word.startswith(board[i][j]):
                t = trace(board, word, [(i, j)])
                if t:
                    return t

    return False


def trace(board, word, positions):
    '''Trie-based word lookup'''

    start = ''
    for x, y in positions:
        start += board[x][y]
        rest = word[len(start):]

    if start == word:
        return positions
    elif len(positions) > len(word):
        return False
    else:
        x, y = positions[-1]

        for i in [x - 1, x, x + 1]:
            for j in [y - 1, y, y + 1]:
                if (
                        i >= 0 and i < len(board) and
                        j >= 0 and j < len(board[i]) and
                        (i, j) not in positions and
                        rest.startswith(board[i][j])
                ):
                    t = trace(board, word, positions + [(i, j)])
                    if t:
                        return t

    return False


def main():
    '''Play a game of boggle'''

    print('Loading dictionary')

    dictname = DEFAULT_DICT

    if len(sys.argv) == 0:
        print('error: missing program name')
        os.exit(1)

    if len(sys.argv) > 1:
        dictname = sys.argv[1]

    dictfile = open(dictname, 'r')

    wordlist = []

    for line in dictfile:
        wordlist.append(chomp(line))

    dictfile.close()

    print('Done')

    print('Creating board')

    board, lower = create_board()

    print('Done')

    print('Enter words.', CMD_STOP, 'when done.')

    wordsfound = []

    for line in board:
        print(line)

    word = input(PROMPT)
    while word != CMD_STOP:
        word = word.lower()

        if len(word) < MIN_LENGTH:
            print('Too short')
        elif word not in wordlist:
            print('Not in dictionary')
        elif word in wordsfound:
            print('Already used')
        else:
            if find(lower, word):
                wordsfound.append(word)
                print('Accepted (%d words)' % (len(wordsfound)))
            else:
                print('Not on board')

        for line in board:
            print(line)

        word = input(PROMPT)

    print('You found %d words.' % (len(wordsfound)))

    input('Press enter to find other words.')

    print('Finding words.')

    compwords = []

    for word in wordlist:
        word = word.lower()

        if len(word) >= MIN_LENGTH:
            if find(lower, word):
                compwords.append(word)

    print('Done')

    print('Computer found %d words.' % (len(compwords)))

    input('Press enter to list words.')

    for word in compwords:
        print(word)


if __name__ == '__main__':
    try:
        main()
    except (KeyboardInterrupt, EOFError) as e:
        pass
