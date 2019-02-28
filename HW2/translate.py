#!/usr/bin/env python3
# Translate opcodes into categories

import sys
import os

translation = {}
with open("./translate.csv","r") as f:
  next(f) # remove header
  for line in f:
    mapping = line.replace("\n","").split()
    translation[mapping[0]] = mapping[1].lower()

for fil in os.listdir("./exmp"):
  if ".txt" not in fil:
    continue
  print(fil)
  with open("./exmp/"+fil,"r") as inf:
    with open("./exmp_categories/"+fil,"w") as ouf:
      for line in inf:
        ouf.write(translation[line.replace("\n","")])
