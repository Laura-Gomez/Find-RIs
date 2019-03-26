import sys, getopt


try:
    myopts, args = getopt.getopt(sys.argv[1:],"b:g:d:t:r:")
except getopt.GetoptError as e:
    print (str(e))
    print("Usage: %s -i in  -o output" % sys.argv[0])
    sys.exit(2)

for param, argument in myopts:
    if param == '-b':
        binding_file = argument
    elif param == '-g':
        gene_file = argument
    elif param == '-d':
        dis_file = argument
    elif param == '-t':
        tf_exp = argument
    elif param == '-r':
        output_file_regulon = argument


#### DEFINE REGIONS TO SEARCH FOR BINDING SITE
with open(dis_file) as handle:
    for line in handle:
        line = line.rstrip('\n')
        tf, min_tf, max_tf = line.split('\t')
        if tf == tf_exp:
        	up_exp = abs(min(int(float(min_tf)), -400))
        	dw_exp = abs(max(int(float(max_tf)), 100))
        	break

#print (up_exp)
#print (dw_exp)

#### HASH WITH PREGULATORY RANGE POSITIONS FOR EACH GENE ACCORDING TO THE ANALYZED TF

gene_min = {}
gene_max = {}

gene_start = {}
gene_strand = {}

with open(gene_file) as handle:
    for line in handle:
        line = line.rstrip('\n')
        chr, left, rigth, gene, strand = line.split('\t')
        gene_strand[gene] = strand
        if strand == '+':
            gene_min[gene] = int(left)-up_exp
            gene_max[gene] = int(left)+dw_exp
            gene_start[gene] = int(left)
        else:
            gene_min[gene] = int(rigth)-dw_exp
            gene_max[gene] = int(rigth)+up_exp
            gene_start[gene] = int(rigth)

            
output_reg = open(output_file_regulon, 'w')


with open(binding_file) as handle:
    for line in handle:
        line = line.rstrip('\n')
        chr, start_bs, end_bs, tf_bs, id, value, seq = line.split('\t')
        start_bs = int(start_bs)
        end_bs = int(end_bs)
        if tf_bs == tf_exp:
            for gene in gene_min:
                if start_bs >= gene_min[gene] and end_bs <= gene_max[gene]:

                    pos_center = (start_bs + end_bs)/2
                    if gene_strand[gene] == '+':
                        pos_to_center = pos_center - gene_start[gene]
                    else:
                        pos_to_center = gene_start[gene] - pos_center

                    output_reg.write(str(start_bs) + "\t" + str(end_bs) + "\t" + str(pos_to_center) + "\t" + tf_bs + "\t" + gene + "\t" + id + "\t" + seq + "\n")



output_reg.close()





 