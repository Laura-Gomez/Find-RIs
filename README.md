# Find-RIS

## DESCRIPTION

This pipeline combines data from BSs regions, expression and annotation to identify a set of regulatory interactions.

It is divided in three stages:

 1. Identification of genomic range por TF regulation
 2. Association of each BS to its corresponding target gene or genes
 3. Identificaction of RIs, if there is change in expression of target gene

## Identification of genomic range por TF regulation

## Association of each BS to its corresponding target gene or genes

PROGRAM: Associate_BS-Gene

COMMAND LINE

```
python Associate_BS-Gene.py -b /home/lgomez/HT-Browser/GSE65643/Binding/BS/cra_glucose.gff.txt.bed -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t Cra -r cra_glucose.all.regulon
```

### INPUT

 - BSs positions: BED file (chromosome, start position bs, end position bs, tf, BS id, score, BS sequence)
 - Annotation file with gene positions (chromosome, start position gene, end position gene, gene, strand)
 - Maximal regulatory distances for each TF (TF, most upstream regulatory position, most downstream regulatory position)

### OUTPUT

Binding sites associated with possible target genes.

Description of columns:

 - Start position BS
 - End position BS
 - Distance from BS center to gene start
 - TF
 - Gene
 - BS ID
 - BS sequence



## Identificaction of RIs, if there is change in expression of target gene

### INPUT

### OUTPUT
