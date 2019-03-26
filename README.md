# Find-RIS

## DESCRIPTION

This pipeline combines data from BSs regions, expression and annotation to identify a set of regulatory interactions.

It is divided in three stages:

 1. Identification of genomic range por TF regulation
 2. Association of each BS to its corresponding target gene or genes
 3. Identificaction of RIs, if there is a change in expression of the target gene

## Identification of genomic range of regulation by TF

TFBS data was downloaded from RegulonDB. For every TF the most upstream distance and the most downstream distance was obtained. The distance was calculated between the center of the TFBS and the TSS. 

All this information is found at: data/MaximalDistancesPerTF.txt 


## Association of each BS to its corresponding target gene or genes

PROGRAM: Associate_BS-Gene

COMMAND LINE

```
python bin/Associate_BS-Gene.py -b data/cra_glucose.gff.txt.bed -g data/gene_pos.bed -d data/MaximalDistancesPerTF.txt -t Cra -r out/cra_glucose.all.regulon
```

### INPUT

 - Experiment BSs positions: BED file (chromosome, start position bs, end position bs, tf, BS id, score, BS sequence) [data/cra_glucose.gff.txt.bed]
 - Annotation file with gene positions (chromosome, start position gene, end position gene, gene, strand) [data/gene_pos.bed]
 - Maximal regulatory distances for each TF (TF, most upstream regulatory position, most downstream regulatory position) [data/MaximalDistancesPerTF.txt]
 - TF name of interest. The TF name must correspond to the name annotated in the Maximal regulatory distances file (case sensitive). [Cra]

### OUTPUT [cra_glucose.all.regulon]

Binding sites associated with possible target genes.

Description of columns:

 - Start position BS
 - End position BS
 - Distance from BS center to gene start
 - TF
 - Gene
 - BS ID
 - BS sequence



## Identificaction of RIs, if there is a change in expression of the target gene

COMMAND LINE

```
python bin/Find_RI.py -b data/cra_glucose.gff.txt.bed -f data/GSE65643_WT_GlucosevsDeltacra_Glucose.txt -g data/gene_pos.bed -d data/MaximalDistancesPerTF.txt -t Cra -o out/cra_glucose.ri -r out/cra_glucose.ri.regulon

unique out/cra_glucose.ri > out/cra_glucose.uniq.ri
```

### INPUT
 - Experiment BSs positions: BED file (chromosome, start position bs, end position bs, tf, BS id, score, BS sequence) [data/cra_glucose.gff.txt.bed]
 - Expression data. FC data between control and experiment. Column 1: gene name (gene symbol). Column 2: Fold change
 - Annotation file with gene positions (chromosome, start position gene, end position gene, gene, strand) [data/gene_pos.bed]. Genes names must correspond with expression data
 - Maximal regulatory distances for each TF (TF, most upstream regulatory position, most downstream regulatory position) [data/MaximalDistancesPerTF.txt]
- TF name of interest. The TF name must correspond to the name annotated in the Maximal regulatory distances file (case sensitive). [Cra]

### OUTPUT

Binding sites associated with target genes that have a change in expression

[out/cra_glucose.ri]

 - Start position BS
 - End position BS
 - TF
 - Gene
 - Fold change


[out/cra_glucose.ri.regulon]: Format required by RegulonDB
 - Start position BS
 - End position BS
 - Distance from BS center to gene start
 - TF
 - Gene
 - BS strand
 - BS ID
 - BS sequence

The BS ID is obtained from the "Experiment BSs positions" file
