#!/usr/bin/python
#
# BioInf3 WS11/12 - Assignment 9
# Convolute a molecule with a Gaussian to create something similar to an experimental EM map
# 


import sys, math

# Grid dimensions and spacing
ngrid = 61
dx = 0.1
Xmax = ((ngrid-1) / 2.0) * dx
#sys.stderr.write("Grid spacing: dx = "+str(dx)+"  Xmax = "+str(Xmax)+"\n")

##### Read the Molecule file: ############
def readData():
	# per line: x- and y-position plus "size" of each "atom"
	molfile = open("hello.txt", "r")

	mol = []
	lein = 0

	while 1:
		# read the lines
		zeile = molfile.readline()
		if not zeile:
			break
		teile = zeile.split()

		# save information
		mol.append([])
		mol[lein].append(teile[0])
		mol[lein].append(teile[1])
		mol[lein].append(teile[2])
	
		lein += 1
	
	return mol


def computeGrid(mol, sigma):
	##### convolute and place molecule onto the image grid #########
	# Initialize the grid for the convoluted image
	grd = [0]
	grd = ngrid * grd

	for i in range(ngrid):
		grd[i] = []
		for k in range(ngrid):
			grd[i].append(0.0)

	# sum up contributions from each atom
	for im in range(len(mol)):
	
		# Gaussian:
		xm = float(mol[im][0])
		ym = float(mol[im][1])
		vor = float(mol[im][2]) / (math.sqrt(2.0*math.pi) * sigma)


		# place into the grid
		for	ix in range(ngrid):
			rx = xm - (ix*dx - Xmax)
		
			for	iy in range(ngrid):
				ry = ym - (iy*dx - Xmax)
			
				gaussArg = 0.5 * (rx*rx + ry*ry) / (sigma*sigma)
				grd[ix][iy] += vor * math.exp(-gaussArg)

	return grd




#read given grid
def readGrid(filename):
	expGridFile = open(filename, "r")

	expGrd = [0]
	expGrd = ngrid * expGrd

	for i in range(ngrid):
		expGrd[i] = []
		for k in range(ngrid):
			expGrd[i].append(0.0)

	counter = -1

	while 1:
		# read the lines
		row = expGridFile.readline()
		counter += 1
		if not row:
			break
		entry = row.split()

		# save information
		for i in range(len(entry)):
			expGrd[counter][i] = entry[i];
	
	return expGrd


def compareGrids(grid1, grid2):
	#TODO


def shift(data, expGrid):
	#TODO


def rotate(data, phi):
	#TODO


def scale(data, scale):
	#TODO


def constructGrid(myShift_x, myShift_y, mySigma, myPhi, myScale, filename):
	outfile = open(filename,'w')

	data = rotate(scale(readData(), myScale), myPhi*math.pi)
	for i in range(len(data)):
		data[i][0] = float(data[i][0]) + myShift_x
		data[i][1] = float(data[i][1]) + myShift_y
	g_rotshiftscale = computeGrid(data, mySigma)
	
	for i in range(len(g_rotshiftscale)):
		for j in range(len(g_rotshiftscale)):
			outfile.write(str(g_rotshiftscale[i][j])+ "\t")
		outfile.write("\n")

	outfile.close()



def a():
	#TODO
	

def b(sigma):
	#TODO
	
		
def c():
	#TODO
	
	

	

def constructGrids():
	constructGrid(?,?,?,0,1,"hello_shift.dat")
	constructGrid(?,?,?,?,1,"hello_rotshift.dat")
	constructGrid(?,?,?,?,?,"hello_rotshiftscale.dat")

##### done ##### 
