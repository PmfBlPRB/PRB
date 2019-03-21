#!/usr/local/bin/python3
# Modify this script as needed for exercise 1.2 (c)

from RandomNetwork import RandomNetwork
from DegreeDistribution import DegreeDistribution
   

plot1 = [(50,100),(500,1000),(5000,10000),(50000,100000)]
plot2 = [(20000,5000),(20000,17000),(20000,40000),(20000,70000)]
plot3 = [(100,2)]


def createNetwork(networklist, NetworkType):
    for (x, y) in networklist:
        network = NetworkType(x,y)
        distribution = DegreeDistribution(network)
        distribution.writeToFile("%s-%06d-%06d.txt" % (network.__class__.__name__,x,y))

#createNetwork(plot1,RandomNetwork)
#createNetwork(plot2,RandomNetwork)
createNetwork(plot3,RandomNetwork)

