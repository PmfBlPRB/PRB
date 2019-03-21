import math
import random
import sys

class Layout:
	def __init__(self, network):
		"""Layout the given network"""
		self.network = network
		
	def initPositions(self):
		"""Initialize the positions and forces of all network nodes"""
		
	def calculateForces(self):
		"""Calculate coulomb + harmonic forces betwen all nodes, store force in nodes"""
		
	def addRandomForces(self, interval):
		"""Add a random force to the node force within [-interval,interval]"""
		
	def calculateEnergy(self):

		
	def displaceNodes(self):
		"""Displace node according to the previously calculated force, then reset force"""
		
	def layout(self, iterations):
		"""Layout network algorithm"""
		self.initPositions()			
		for i in range(iterations):
			...
		self.calculateEnergy()
