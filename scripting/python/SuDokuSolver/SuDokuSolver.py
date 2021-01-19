#!/usr/bin/env python

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '2 May 2006 - 11 Dec 2006'
__version__ = '0.0.1'

from SuDokuCell import SuDokuCell
from SuDoku import SuDoku

import random

import sys
from getopt import getopt


class SuDokuSolver:
    def __init__(self, sd=SuDoku()):
        self.setSuDoku(sd)

    def setSuDoku(self, sd):
        self.sd = sd

    def prepare(self):
        self.getUnsolved()
        self.getExclusions()
        self.getInclusions()

    def getSuDoku(self):
        return self.sd

    def getUnsolved(self):
        self.unsolved = []
        for i in range(9):
            for j in range(9):
                if self.sd.getCell(i, j).getMode() == SuDokuCell.BLANK:
                    self.unsolved.append((i, j))

    def getExclusions(self):
        self.exclusions = [[0] for i in range(len(self.unsolved))]

        for i in range(len(self.unsolved)):
            ex = []

            x, y = self.unsolved[i]

            row = self.sd.getRow(x)
            column = self.sd.getColumn(y)
            mini = self.sd.getMiniSD(self.sd.getMiniIndex(x, y))

            for cell in row:
                if cell.getMode() == SuDokuCell.GIVEN:
                    value = cell.getValue()
                    if not (value in ex):
                        ex.append(value)

            for cell in column:
                if cell.getMode() == SuDokuCell.GIVEN:
                    value = cell.getValue()
                    if not (value in ex):
                        ex.append(value)

            for cell in mini:
                if cell.getMode() == SuDokuCell.GIVEN:
                    value = cell.getValue()
                    if not (value in ex):
                        ex.append(value)

            ex.sort()

            self.exclusions[i] = ex

    def getInclusions(self):
        self.inclusions = [
            [1, 2, 3, 4, 5, 6, 7, 8, 9] for i in range(len(self.exclusions))
        ]

        for i in range(len(self.exclusions)):
            inc = []

            for j in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
                if not (j in self.exclusions[i]):
                    inc.append(j)

            inc.sort()

            self.inclusions[i] = inc

    def getPossibilities(self):
        total = 1
        for i in range(len(self.unsolved)):
            length = len(self.inclusions[i])
            if length > 0:
                total *= length

        return total

    def resetUnsolved(self):
        for i in range(len(self.unsolved)):
            x, y = self.unsolved[i]

            value = self.inclusions[i][0]

            self.sd.setCell(x, y, SuDokuCell(value, SuDokuCell.BLANK))

    def guess(self):
        for i in range(len(self.unsolved)):
            x, y = self.unsolved[i]

            value = random.choice(self.inclusions[i])

            self.sd.setCell(x, y, SuDokuCell(value, SuDokuCell.BLANK))

    def solve(self):
        self.resetUnsolved()

        while not self.sd.validate():
            self.guess()


def usage():
    print('Usage: ' + sys.argv[0] + '[options] <file> <file2> <file3> ...')
    print('\nSuDokus are read from files in the format:\n')

    print('[8][3][2][5][9][1][6][7][4]')
    print('[4][9][6][3][8][7][2][5][1]')
    print('[5][7][1][2][6][4][9][8][3]')
    print('[1][8][5][7][4][6][3][9][2]')
    print('[2][6][7][9][5][3][4][1][8]')
    print('[9][4][3][8][1][2][7][6][5]')
    print('[7][1][4][6][3][8][5][2][9]')
    print('[3][2][9][1][7][5][8][4][6]')
    print('[6][5][8][4][2][9][1][3]_0_')

    print('\nWhere [x] is a cell with given value x and')
    print('_x_ is a blank cell with guessed value x.')

    sys.exit()


def main():
    systemArgs = sys.argv[1:]

    optlist, args = [], []
    try:
        optlist, args = getopt(systemArgs, 'h', ['help'])
    except:
        usage()

    if len(args) < 1:
        usage()

    for option, value in optlist:
        if option == '-h' or option == '--help':
            usage()

    filenames = args

    for filename in filenames:
        print('Opening ' + filename)

        f = open(filename)

        print('Reading')

        lines = f.readlines()
        f.close()
        lines = ''.join(lines)

        print('Closed')

        sd = SuDoku()

        print('Parsing')

        try:
            sd.text2sudoku(lines)
        except:
            print(filename + ' improperly formatted')
            continue

        solver = SuDokuSolver(sd)
        solver.prepare()

        print(str(solver.getPossibilities()) + ' possibilities')

        print('Solving')

        try:
            solver.solve()
        except KeyboardInterrupt:
            print('Interrupted')
            continue
        except:
            print(filename + ' unsolvable')
            continue

        print('Solution:\n' + str(solver.getSuDoku()))

if __name__ == '__main__':
    main()
