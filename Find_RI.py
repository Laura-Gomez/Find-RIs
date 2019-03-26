import sys, getopt


try:
    myopts, args = getopt.getopt(sys.argv[1:],"b:f:g:d:t:o:")
except getopt.GetoptError as e:
    print (str(e))
    print("Usage: %s -i in  -o output" % sys.argv[0])
    sys.exit(2)

for param, argument in myopts:
    if param == '-b':
        binding_file = argument
    elif param == '-f':
        fc_file = argument
    elif param == '-g':
        gene_file = argument
    elif param == '-d':
        dis_file = argument
    elif param == '-t':
        tf_exp = argument
    elif param == '-o':
        output_file = argument


#### DEFINE REGIONS TO SEARCH FOR BINDING SITE
with open(dis_file) as handle:
    for line in handle:
        line = line.rstrip('\n')
        tf, min_tf, max_tf = line.split('\t')
        if tf == tf_exp:
        	min_exp = min(int(min_tf), -400)
        	max_exp = max(int(max_tf), 100)

#### HASH WITH PREGULATORY RANGE POSITIONS FOR EACH GENE ACCORDING TO THE ANALYZED TF

gene_min = {}
gene_max = {}

with open(gene_file) as handle:
    for line in handle:
        line = line.rstrip('\n')
        chr, rigth, left, gene, strand = line.split('\t')
        if strand == '+':
        	gene_min[gene] = int(left)+min_exp
        	gene_max[gene] = int(left)+max_exp
        else:
			gene_min[gene] = int(rigth)-max_exp
			gene_max[gene] = int(rigth)-min_exp


#### HASH WITH FC VALUES FOR EACH SIGNIFICANT GENE

fc = {}
with open(fc_file) as handle:
    for line in handle:
    	if "Gene" not in line:
        	line = line.rstrip('\n')
        	info = line.split('\t')
        	gene = info[0]
        	fc_gene = info[1]
        	fc[gene] = fc_gene

##### FOR EACH BS LOOK IF THERE IS A SIGNIFICANT DIFFERENTIALLY EXPRESSED GENE IN THE CORRESPONDING REGION

output = open(output_file, 'w')

with open(binding_file) as handle:
    for line in handle:
        line = line.rstrip('\n')
        chr, start_bs, end_bs, tf_bs, id, value, seq = line.split('\t')
        start_bs = int(start_bs)
        end_bs = int(end_bs)
        if tf_bs == tf_exp:
        	for gene in fc:
        		if start_bs >= gene_min[gene] and end_bs <= gene_max[gene]:
        			output.write(str(start_bs) + "\t" + str(end_bs) + "\t" + tf_bs + "\t" + gene + "\t" + fc[gene] + "\n")


output.close()




 