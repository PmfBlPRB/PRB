The Blueprint Initiative
Samuel Lunenfeld Research Institute


(c)2005 The Blueprint Initiative of Mount Sinai Hospital.
All Rights Reserved.


README: BLUEPRINT DATA FTP AREA
ftp://ftp.bind.ca/pub/BIND/data/bindflatfiles/bindindex/


LAST UPDATE OF THIS README: February 3, 2005


This area contains selected fields for BIND records in plain-text, tab-delimited
format.  Files are released daily and are cumulative to the date specified in 
the file name; i.e., yyyymmdd.  These files may be used to locate BIND records 
that describe a given biomolecule.  BIND records contain many other fields than 
those listed in these indices.  Complete BIND records are available in XML or 
ASN.1 format from ftp://ftp.bind.ca/pub/BIND/data.

A complete description of these BIND index files is given below.


DIRECTORY-----------------------------------------------------------------------

interactions.txt               Contains selected fields for all BIND 
                               interactions.

taxon.txt                      Taxon identifiers and corresponding scientific 
                               names for organisms described in BIND.

================================================================================
--------------------------------------------------------------------------------
BIND interaction index (interactions.txt)
--------------------------------------------------------------------------------
column name	type		description			note
--------------------------------------------------------------------------------
rgid		INTEGER		redundant group id 		1
bid		INTEGER		bind record id 			2

A-type		text		molecule A type 		3
A-db		text		molecule A database		4
A-acc		VARCHAR		molecule A accession 		5,6
A-id		INTEGER		molecule A id 			5,7
A-tax		INTEGER		molecule A taxon-id 		8

B-type		text		molecule B type 		3
B-db		text		molecule B database 		4
B-acc		VARCHAR		molecule B accession		5,6
B-id		INTEGER		molecule B id 			5,7
B-tax		INTEGER		molecule B taxon-id 		8

AB		text		same AB order in both  		9
						rgid and iid?

================================================================================



================================================================================
--------------------------------------------------------------------------------
Taxon identifiers and organism names (taxon.txt)
--------------------------------------------------------------------------------
column name	type		description			note
--------------------------------------------------------------------------------
taxon		INTEGER		taxon identifier		10
name		text		taxon name
================================================================================

notes:

1.
This number (rgid) is used to group together a number of BIND records that 
describe interactions between the same two molecules (although they may be 
referred to by different identifiers).  As such, the 'rgid' corresponds to a 
group of BIND record identifiers.  See the table 'yyyymmdd.nrints.txt'. The rgid
is unstable and may not always refer to the same group of interactions from one 
release of this index to another. Note that two small molecules with identical 
database names and identifiers are considered to be the same even if they came 
from different organisms. For example, see BIND interaction 232 and 233. These 
interactions are redundant.


2. 
Every BIND record is represented in this table at least once if it describes an 
interaction between two objects that are of any type besides "not-specified".  
Records where one of the two objects is of the type "not-specified" are commonly
used to describe complexes that have an unknown topology.  These interaction 
records will not be found in this index (for example, BIND interaction 6558).


3. 
Fields named 'A-type', 'B-type' or 'type' describe the molecule type and are a 
choice of:

not-specified
protein
DNA
RNA
small-molecule
complex
gene
photon
	
The text is listed in this column (for example; "DNA" or "protein")
For more information see the BIND specification: 
BIND-object->BIND-object-type-id.
	

4. 
Fields named 'A-db' , 'B-db' or 'db' describe the database where the record for 
the molecule is found.  This is a choice of:

GenBank:  always the case for DNA, RNA and protein type molecules; also used for
          type 'gene'
          
KLOTHO:   Biochemical Compounds Declarative Database
          (http://www.biocheminfo.org/klotho/) may be used for molecules of type
          'small-molecule'

LIGAND:   Database of Chemical Compounds and Reactions in Biological Pathways 
          (http://www.genome.ad.jp/ligand/) may be used for molecules of type 
          'small-molecule'

MMDB:     Molecular Modelling Database 
          (http://www.ncbi.nlm.nih.gov/Structure/MMDB/mmdb.shtml) may be used 
          for molecules of type 'small-molecule')

BIND:     Biomolecular Interaction Network Database (http://bind.ca/) always 
          used for molecules of type 'complex'

CHEMICAL ABSTRACTS SERVICE: 
          (http://www.cas.org/) may be used for molecules of type 
          'small-molecule'
	
The text name of the database is listed in this column 
(for example; GenBank or MMDB)

For more information see the BIND specification: 
BIND-object->BIND-object-type-id->BIND-id and 
BIND-object->BIND-object-type-id->BIND-small-molecule-id
BIND-object->BIND-object-type-id->Molecular-complex-id.	


5. 
All molecules will be identified by either an alphanumeric accession number 
(see 'A-acc' and 'B-acc' for interaction records and 'acc' for complex records) 
or by an integer identifier (see 'A-id' and 'B-id' for interaction records and 
'id' for complex records) or by both; the identifiers listed for a molecule 
depend upon the source database.  For example, molecules descibed by GenBank 
will have an entry in both the 'acc' and 'id' columns (corresponding to the 
accession number and GenInfo (GI) identifier of the sequence record).  On the 
other hand, molecules descibed in KLOTHO, LIGAND and MMDB will have only an 
alphanumeric idenifier and a zero (0) will be listed in place of an integer 
identifier in the 'id' column.  Finally, complexes described in BIND will have 
only an integer identifier and '-' will appear in place of an alphanumeric 
identifier in the 'acc' column.  

There may be cases when an alphanumeric GenBank accession number is expected but
the letters 'NA' appear instead.  These entries represent BIND records that 
reference a retired GenBank record (for example, see GI 6321066 in GenBank).  
BIND records are reviewed on an ongoing basis to replace these retired GI's with
the more up-to-date GI and accession identifiers. Therefore, these 'NA' entries 
will disappear over time.

 
6.
Fields named 'A-acc' , 'B-acc' or 'acc' contain alphanumeric record identifiers 
from the database (specified by 'A-db', 'B-db' or 'db' field) for the records 
describing molecule A or B (if you are looking at an interaction record) or a 
subunit of a complex (if you are looking at a complex record).


7. 
Fields named 'A-id', B-id or 'id' contain integer identifiers that point to 
records in some database (see corresponding column A-db , B-db or id).  This 
record describes a molecule A or B (if you are looking at an interaction 
record) or a subunit of a complex (if you are looking at a complex record). 


8. 
Fields named 'A-tax' , 'B-tax' or 'tax' contain integer taxon identifiers for 
the molecule described in the adjacent columns. This field is required where the
type of molecule is one of DNA, RNA, protein or gene; otherwise this field may 
contain '0' (zero).  The file "yyyymmdd.taxon.txt" contains a list of taxon 
identifiers and corresponding scientific names.


9.
Note that the A and B molecules may not be listed in the same order in both the 
redundant group record and  any one of the individual interaction records 
belonging to the group.  The value of the column AB answers the question: "Are A
and B listed in the same order in both the redundant group record and the 
individual interaction record table ("yes" or "no")."


10. 
Taxon identifier and name are from NCBI's taxonomy database.
(see http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=Taxonomy).
For example, taxon id 4932 refers to "Saccharomyces cerevisiae".

================================================================================
		end of notes to BIND index table descriptions
================================================================================

If you use BIND, please cite:

Bader GD, Betel D, Hogue CW. (2003) BIND: the Biomolecular
Interaction Network Database. Nucleic Acids Res. 31(1):248-50 
PMID: 12519993 

The Blueprint Initiative
Samuel Lunenfeld Research Institute
Mt. Sinai Hospital
522 University Ave.
Toronto, Ontario, Canada M5G 1W7
Phone: 416-596-8505
Fax:   416-596-8077

BIND Inquires:     info@bind.ca
SeqHound Inquires: seqhound@blueprint.org
TraDES Inquiries:  trades@blueprint.org
Other:             info@blueprint.org

DATA POLICY---------------------------------------------------------------------

BIND data is free for both commercial and academic use. 

If you use BIND data, please cite: 

Bader GD, Betel D, Hogue CW. (2003) 
BIND: the Biomolecular Interaction Network Database. 
Nucleic Acids Res. 31(1):248-50 PMID: 12519993 

This data is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 


BIND DIVISIONS

Get the BIND Division files when you want to assemble a complete
non-redundant BIND database.  The BIND Fungi division is currently the
largest in BIND.  Data is provided on the BIND FTP (<ftp://ftp.bind.ca>) site
in a variety of formats.

As the size of a database reaches critical mass, a method must be developed
by which data in the database is categorized. This facilitates the production
of data files of practical size for distribution. The categories developed must
partition the data in a non-redundant manner. That is, the collection of all 
data files from divisions must contain one and only one copy of every record in 
the database. We have established the following divisions based on the computer 
readable instances of the biological information and taxonomy:

*   BIND Taxroot|Record where all molecules are from any organism except those 
    within TaxID 4751 or TaxID 33208

*   BIND Fungi|Record where all molecules are from TaxID 4751

*   BIND Metazoa|Record where all molecules are from TaxID 33208

*   RefBIND Taxroot|Reference quality record where all molecules are from any 
    organism

*   PDB MMDB MMDBBIND 3DBP Taxroot|Auto-generated record where all molecules are
    protein, DNA or RNA and are from any organism

*   PDB MMDB MMDBBIND 3DSM Taxroot|Auto-generated record where at least one 
    molecule is a small molecule and molecules are from any organism.


BIND DATA SETS

Get the BIND Data Set files corresponding to specific BIND entries, grouped by 
taxonomy, by published paper or by experiment. Use BIND Data Sets to compare 
high-throughput experiments or data from different organisms.  Data is provided 
on the BIND FTP site (<ftp://ftp.bind.ca>) in a variety of formats.

As requested by our users, we also provide data files containing sets of related
data in order to facilitate data analysis. Users must be aware that the 
collection of data files from data sets contains redundant records.  Note that 
we have not yet at the time of writing included the MMDBBIND records into BIND 
data sets.  We have established data set categories based on the following:

1.   Publication
          One dataset in this category contains BIND Interaction records that 
          reference the same publication when that publication is referenced in 
          10 or more records. Thus, this category contains all high-throughput 
          datasets in BIND.

2.   Taxonomy
          One dataset in this category contains BIND Interaction records in 
          which one or both molecules are from the specified organism. Thus, 
          intra-organismal interactions will be found in the datasets from both 
          organisms. For example, a virus-host interaction would be found in 
          both the virus and host datasets.

3.   Experimental system
          One dataset in this category contains BIND Interaction records in 
          which the specified experimental system is identified one or more 
          times. Thus, if one BIND record contains results from both yeast 
          two-hybrid and co-immunoprecipitation experiments, the BIND record 
          will be found in both the yeast two-hybrid and co-immunoprecipitation 
          datasets.


HIGH-THROUGHPUT DATA

By default, BIND displays complexes with unknown interaction topology using a 
spoke (bait binds to prey) model, which we have shown to be three times more 
accurate than the (all-binding-all) matrix data model.

Certain high-throughput (HTP) techniques for studying protein interactions are
insufficient in their experimental approach to distinguish between direct and
indirect interactions. More specifically, identifying proteins by mass 
spectrometry that were isolated from a cell or tissue lysate via 
immunoprecipitation of a protein of interest does not establish that each of the
proteins identified (i.e. prey) bound directly to the protein of interest (i.e. 
bait). It may be that one or more proteins mediate the association of the bait 
and prey permitting the prey to be identified via immunoprecipitation of that 
bait.

The connections between molecules in a complex are referred to as topology. In 
order to elucidate topology for a given complex, data from multiple experimental
techniques, for example reciprocal immunoprecipitation experiments or yeast 
two-hybrid assays, are required.

In the absence of further experimental results, data from HTP 
immunoprecipitation experiments must be interpreted using a data model, which 
includes assumptions. Two common data models for representing HTP 
immunoprecipitation results are the spoke model and the matrix model (Bader and 
Hogue, Nature Biotechnology 2002 20:991).

The spoke model assumes that each prey protein interacts directly with the bait 
protein. A schematic of this topology resembles a wheel; the bait protein is the
hub and the lines to each prey protein representing the interaction are spokes 
(Figure 1).

The matrix model assumes that each protein identified in the complex interacts 
with each of the other proteins found in that complex. Thus, a two dimensional 
matrix of protein-protein interactions would have each protein listed on each of
the two dimensions and every possible pair-wise interaction would be identified 
(Table 1).

Our own comparison of results from HTP immunoprecipitation experiments with 
interactions previously identified in the literature demonstrates that the spoke
model is 3 times more accurate than the matrix model for the representation of 
HTP immunoprecipitation data. Therefore, the spoke model is used in BIND to 
visualize HTP immunoprecipitation results. However, since the direct interaction
partners are not identified, BIND does not store an Interaction record 
containing two known proteins rather a Complex record made up of Interaction 
records that each describe one bait or prey protein identified in the 
immunoprecipitation experiment. Specifically, data from Ho et al., 2002 and 
Gavin et al., 2002 are stored in BIND in this manner. BIND Complex 11509 
contains the experimental results from one immunoprecipitation experiment 
described by Ho et al., 2002. The bait, Kss1, isolated eight other proteins as 
identified by immunoprecipitation and mass spectrometry. Therefore, there are 
nine Interaction records in BIND Complex 11509. BIND Interaction 6558 describes 
the bait, Kss1. This is indicated by the fact that Kss1 is Molecule A of 
Interaction 6558. Each of the eight prey proteins is described as Molecule B in 
separate BIND Interaction records (BIND ID 6559, 6560, 6561, 6562, 6563, 6564,
6565, 6566). Each of the nine proteins is recorded as interacting with Unknown, 
an unspecified organismal molecule. The visualization tool for viewing BIND 
Interactions displays this complex in the spoke model representation (Figure 1).

For these two data sets, there is a difference in the number of BIND records 
that are counted. The statistics as shown on our webpage include the number of 
BIND complex records, i.e. 797 complexes for Ho et al., 2002, 454 complexes for 
Gavin et al., 2002. However, since the visualization and analysis of these 
interactions is conducted using the spoke model, the statistics for our ftp site
include the number of equivalent BIND Interaction records, i.e. 3225 for Ho et 
al., 2002, 3618 for Gavin et al., 2002.


DELETED SEQUENCE RECORDS

From time to time, sequence records are removed from NCBI's GenBank database. If
a BIND Interaction record references a sequence record that has been removed, 
the BIND record is no longer valid. For this reason, NCBI sequence record 
identifiers, i.e. GIs, must be monitored and potentially updated. If a GI is 
removed and replaced with a new record, we will automatically update the 
corresponding BIND record(s) to refer to the new GI.

--------------------------------------------------------------------------------
