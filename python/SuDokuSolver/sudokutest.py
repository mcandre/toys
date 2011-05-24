#!/usr/bin/env python

import SuDokuCell
import SuDoku
import SuDokuSolver

sd=SuDoku.SuDoku(SuDoku.SOLUTION0)

sd.setCell(8, 8, SuDokuCell.SuDokuCell())

print "Initial SD:\n"
print sd

print "Initial SD validates?: "+str(sd.validate())+"\n"

print "Solving...\n"

solver=SuDokuSolver.SuDokuSolver(sd)
solver.solve()

print "\nSolved SD:\n"
print sd