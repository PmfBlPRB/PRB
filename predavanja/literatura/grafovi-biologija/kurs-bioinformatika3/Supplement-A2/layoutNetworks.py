#!/usr/bin/python

# import scripts from exercise sheet 1
import sys
sys.path.append("../../01/src")

from AbstractNetwork import *
from Node import *
from GenericNetwork import *
from Layout import *

files = ['star.txt','square.txt','star++.txt','dog.txt']
files += ['2287.txt','11309.txt']
files += ['scalefree100.txt','scalefree200.txt']

for file in files:
	network = GenericNetwork(file)   
	forced = Layout(network)
	forced.layout(1000)