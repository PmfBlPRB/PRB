# This is a class stub, remove the exceptions thrown and 
# implement your method

class AbstractNetwork:
	"""
	This is a general superclass for networks which provides functions 
	that are necessary for all different network types.
	"""
    
	def __init__(self, amount_nodes, amount_links):
		"""Create empty node dictionary and call createNetwork"""
		raise RuntimeError

	def __createNetwork__(self, amount_nodes, amount_links):
		"""Method to override by subclasses"""
		raise RuntimeError
		
	def appendNode(self, node):
		"""Append node to network, mapping node.id => node"""
		raise RuntimeError

	def __str__(self):
		"""Return string representation of the network"""
		return "This network has %6d nodes." % (len(self.nodes))

	def maxDegree(self):
		"""Return the maximum degree in this network"""
		raise RuntimeError
	
	def size(self):
		"""Return network size"""
		raise RuntimeError
		
	def getNode(self, id):
		"""Return node according to key"""
		raise RuntimeError
