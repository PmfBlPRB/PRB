import random
from AbstractNetwork import AbstractNetwork
from Node import Node

class RandomNetwork(AbstractNetwork):
    """Random network implementation of AbstractNetwork"""
    
    def __createNetwork__(self, amount_nodes, amount_links):
        """
            Create a random network
            1. Build a list of n nodes
            2. For i=#links steps, add a connection between for two randomly chosen nodes
        """
        raise RuntimeError