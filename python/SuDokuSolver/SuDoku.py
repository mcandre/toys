"""Brute force Sudoku solver"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "2 May 2006 - 11 Dec 2006"
__version__ = "0.0.1"
__credits__ = "Example solution from www.sudokusolver.co.uk"

from SuDokuCell import SuDokuCell

class SuDoku:
  """Matrix representation of a SuDoku puzzle"""
  def __init__(self, rows = [[SuDokuCell(1, SuDokuCell.BLANK)] * 9] * 9):
    """Initialize wrapper"""
    self.setRows(rows)

  def text2sudoku(self, text):
    # 9*9 cells,
    # each cell represented by three characters,
    # with 9 newlines between each row
    text = text[:252]

    textRows = text.split("\n")[:9]

    for i in range(9):
      textRow = textRows[i]

      row = [SuDokuCell() for t in range(9)]
      for j in range(9):
        textCell = textRow[3 * j:3 * j + 3]

        cell = SuDokuCell()
        cell.text2cell(textCell)

        row[j] = cell

      self.setRow(i, row)

  def setCell(self, i, j, cell):
    self.rows[i][j] = cell

  def setRow(self, index, row):
    self.rows[index] = row

  def setRows(self, rows):
    self.rows = rows

  def getCell(self, i, j):
    return self.rows[i][j]

  def getRow(self, index):
    return self.rows[index]

  def getRows(self):
    return self.rows

  def getColumns(self):
    columns = []
    for i in [0, 1, 2, 3, 4, 5, 6, 7, 8]:
      columns.append([self.getCell(j, i) for j in [0, 1, 2, 3, 4, 5, 6, 7, 8]])

    return columns

  def getColumn(self, index):
    return self.getColumns()[index]

  def getMiniSDs(self):
    return [
      [
        [
          self.getCell(3 * i, 3 * j),
          self.getCell(3 * i, 3 * j + 1),
          self.getCell(3 * i, 3 * j + 2),

          self.getCell(3 * i + 1, 3 * j),
          self.getCell(3 * i + 1, 3 * j + 1),
          self.getCell(3 * i + 1, 3 * j + 2),

          self.getCell(3 * i + 2, 3 * j),
          self.getCell(3 * i + 2, 3 * j + 1),
          self.getCell(3 * i + 2, 3 * j + 2)
        ]
        for j in [0, 1, 2]
      ]
      for i in [0, 1, 2]
    ]

  def getMiniSD(self, loc):
    return self.getMiniSDs()[loc[0]][loc[1]]

  def getMiniIndex(self, i, j):
    loc = 0, 0

    # sudoku (i,j)       mini sudokus (x, y)
    #
    #     0,0          0,1          0,2
    #
    # 0,0 0,1 0,2  0,3 0,4 0,5  0,6 0,7 0,8
    # 1,0 1,1 1,2  1,3 1,4 1,5  1,6 1,7 1,8
    # 2,0 2,1 2,2  2,3 2,4 2,5  2,6 2,7 2,8
    #
    #     1,0          1,1          1,2
    #
    # 3,0 3,1 3,2  3,3 3,4 3,5  3,6 3,7 3,8
    # 4,0 4,1 4,2  4,3 4,4 4,5  4,6 4,7 4,8
    # 5,0 5,1 5,2  5,3 5,4 5,5  5,6 5,7 5,8
    #
    #     2,0          2,1          2,2
    #
    # 6,0 6,1 6,2  6,3 6,4 6,5  6,6 6,7 6,8
    # 7,0 7,1 7,2  7,3 7,4 7,5  7,6 7,7 7,8
    # 8,0 8,1 8,2  8,3 8,4 8,5  8,6 8,7 8,8

    if i in [0, 1, 2]:
      if j in [0, 1, 2]:
        loc = 0, 0
      elif j in [3, 4, 5]:
        loc = 0, 1
      elif j in [6, 7, 8]:
        loc = 0, 2
    elif i in [3, 4, 5]:
      if j in [0, 1, 2]:
        loc = 1, 0
      elif j in [3, 4, 5]:
        loc = 1, 1
      elif j in [6, 7, 8]:
        loc = 1, 2
    elif i in [6, 7, 8]:
      if j in [0, 1, 2]:
        loc = 2, 0
      elif j in [3, 4, 5]:
        loc = 2, 1
      elif j in [6, 7, 8]:
        loc = 2, 2

    return loc

  def checkRow(self, row):
    values = [cell.getValue() for cell in row]

    for i in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
      if not (i in values):
        return False

    return True

  def checkRows(self, rows):
    for row in rows:
      if not self.checkRow(row):
        return False

    return True

  def checkColumns(self):
    return self.checkRows(self.getColumns())

  def checkThreeByThrees(self):
    miniSDs = self.getMiniSDs()

    for i in [0, 1, 2]:
      for j in [0, 1, 2]:
        if not self.checkRow(miniSDs[i][j]):
          return False

    return True

  def validate(self):
    rowsValid = self.checkRows(self.getRows())
    if rowsValid:
      columnsValid = self.checkColumns()
      if columnsValid:
        return self.checkThreeByThrees()

    return False

  def __repr__(self):
    result = ""
    for row in self.getRows():
      for cell in row:
        result += str(cell)
      result += "\n"

    return result

# example solution
SOLUTION0 = [
  [8, 3, 2, 5, 9, 1, 6, 7, 4],
  [4, 9, 6, 3, 8, 7, 2, 5, 1],
  [5, 7, 1, 2, 6, 4, 9, 8, 3],
  [1, 8, 5, 7, 4, 6, 3, 9, 2],
  [2, 6, 7, 9, 5, 3, 4, 1, 8],
  [9, 4, 3, 8, 1, 2, 7, 6, 5],
  [7, 1, 4, 6, 3, 8, 5, 2, 9],
  [3, 2, 9, 1, 7, 5, 8, 4, 6],
  [6, 5, 8, 4, 2, 9, 1, 3, 7]
]

SOLUTION0 = [
  [
    SuDokuCell(e, SuDokuCell.GIVEN)
    for e in SOLUTION0[i]
  ]
  for i in range(9)
]
