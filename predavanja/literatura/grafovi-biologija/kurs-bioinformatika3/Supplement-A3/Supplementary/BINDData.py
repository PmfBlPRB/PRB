class BINDData:
    def __init__(self, interactionFilename, taxonidFilename):
        """Read in BIND data from files"""
        self.interactionFilename = interactionFilename
        self.taxonidFilename = taxonidFilename
        # the taxon map stores keys => names
        self.taxonMap = {}
        # histogram stores keys => frequencies
        self.taxonHist = {}
        self.__readTaxonIdentifiers__()
        self.__countInteractions__()

    def __readTaxonIdentifiers__(self):
        """read taxon identifiers and names from file into a taxon map"""
        ...

    def __countInteractions__(self):
        """
        Count interactions for each taxonomy identifier, 
        store into self.taxonHist
        """
        ...

    def getMaxInteractions(self, last):
        """
        Get a list with the last x most interacting taxon ids, 
        each entry a tuple of (<name>, <taxonid>, <#interactions>
        """
        return [(self.taxonMap[taxID], taxID,interactions) \
                            for taxID, interactions in self.taxonSort[0:last]]

    def getPPIsFor(self, targetTaxonId):
        """Get a list of Protein-Protein Interactions (PPIs) for target taxonomy"""
        interactionFile = open(self.interactionFilename, 'r')
        interactions = []
        ...

class Interaction:
    """Class to store the protein identifiers for a single interaction"""
    def __init__(self,proteinA,proteinB):
        self.a = proteinA
        self.b = proteinB