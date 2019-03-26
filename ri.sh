##### 
###### GSE65643
######

###### /home/lgomez/HT/RI
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE65643/Binding/BS/cra_glucose.gff.txt.bed -f /home/lgomez/HT-Browser/GSE65643/Expression/FC/GSE65643_WT_GlucosevsDeltacra_Glucose.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t Cra -o cra_glucose.ri -r cra_glucose.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE65643/Binding/BS/cra_acetate.gff.txt.bed -f /home/lgomez/HT-Browser/GSE65643/Expression/FC/GSE65643_WT_AcetatevsDeltacra_Acetate.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t Cra -o cra_acetate.ri -r cra_acetate.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE65643/Binding/BS/cra_fructose.gff.txt.bed -f /home/lgomez/HT-Browser/GSE65643/Expression/FC/GSE65643_WT_FructosevsDeltacra_Fructose.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t Cra -o cra_fructose.ri -r cra_fructose.ri.regulon


find . -name "*.ri" |  sed -e 's/\.\///g' | awk '{print "uniq " $0 " > " $0 }' | sed -e 's/ri$/uniq.ri/g'
uniq cra_glucose.ri > cra_glucose.uniq.ri
uniq cra_acetate.ri > cra_acetate.uniq.ri
uniq cra_fructose.ri > cra_fructose.uniq.ri

find . -name "*.uniq.ri" |  sed -e 's/\.\///g' | awk '{print "python /home/lgomez/HT-Browser/bin/ri_browser.py -r " $0 " -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o " $0 }' | sed -e 's/uniq.ri$/browser.ri/g'
python /home/lgomez/HT-Browser/bin/ri_browser.py -r cra_acetate.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o cra_acetate.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r cra_fructose.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o cra_fructose.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r cra_glucose.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o cra_glucose.browser.ri

find . -name "*.browser.ri" |  sed -e 's/\.\///g' | awk '{print "sort -n -k2,3 " $0 " | uniq  > " $0 }' | sed -e 's/browser.ri$/browser.sort.ri.bed/g'
sort -n -k2,3 cra_acetate.browser.ri | uniq  > cra_acetate.browser.sort.ri.bed
sort -n -k2,3 cra_fructose.browser.ri | uniq  > cra_fructose.browser.sort.ri.bed
sort -n -k2,3 cra_glucose.browser.ri | uniq  > cra_glucose.browser.sort.ri.bed

##### 
###### GSE88981
######

python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE88981/Binding/BS/ompR.txt.bed.sorted.bed -f /home/lgomez/HT-Browser/GSE88981/Expression/FC/GSE88981_WT_NaclvsDeltaompR_NaCl.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t OmpR -o ompR.ri -r ompR.ri.regulon
uniq ompR.ri > ompR.uniq.ri

find . -name "*.uniq.ri" |  sed -e 's/\.\///g' | awk '{print "python /home/lgomez/HT-Browser/bin/ri_browser.py -r " $0 " -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o " $0 }' | sed -e 's/uniq.ri$/browser.ri/g'
python /home/lgomez/HT-Browser/bin/ri_browser.py -r ompR.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o ompR.browser.ri

find . -name "*.browser.ri" |  sed -e 's/\.\///g' | awk '{print "sort -n -k2,3 " $0 " | uniq  > " $0 }' | sed -e 's/browser.ri$/browser.sort.ri.bed/g'
sort -n -k2,3 ompR.browser.ri | uniq  > ompR.browser.sort.ri.bed



##### 
###### GSE66482
######

python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE66482/Binding/BS/gadW.bed.sorted.bed -f /home/lgomez/HT-Browser/GSE66482/Expression/FC/GSE66482_WT_ph5vsDeltagadW_ph5.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t GadW -o gadW.ri -r gadW.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE66482/Binding/BS/gadX.bed.sorted.bed -f /home/lgomez/HT-Browser/GSE66482/Expression/FC/GSE66482_WT_ph5vsDeltagadX_ph5.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t GadX -o gadX.ri -r gadX.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE66482/Binding/BS/gadE.bed.sorted.bed -f /home/lgomez/HT-Browser/GSE66482/Expression/FC/GSE66482_WT_ph5vsDelgadE_ph5.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t GadE -o gadE.ri -r gadE.ri.regulon


find . -name "*.ri" |  sed -e 's/\.\///g' | awk '{print "uniq " $0 " > " $0 }' | sed -e 's/ri$/uniq.ri/g'
uniq gadX.ri > gadX.uniq.ri
uniq gadW.ri > gadW.uniq.ri
uniq gadE.ri > gadE.uniq.ri


find . -name "*.uniq.ri" |  sed -e 's/\.\///g' | awk '{print "python /home/lgomez/HT-Browser/bin/ri_browser.py -r " $0 " -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o " $0 }' | sed -e 's/uniq.ri$/browser.ri/g'
python /home/lgomez/HT-Browser/bin/ri_browser.py -r gadX.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o gadX.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r gadW.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o gadW.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r gadE.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o gadE.browser.ri

find . -name "*.browser.ri" |  sed -e 's/\.\///g' | awk '{print "sort -n -k2,3 " $0 " | uniq  > " $0 }' | sed -e 's/browser.ri$/browser.sort.ri.bed/g'
sort -n -k2,3 gadX.browser.ri | uniq  > gadX.browser.sort.ri.bed
sort -n -k2,3 gadW.browser.ri | uniq  > gadW.browser.sort.ri.bed
sort -n -k2,3 gadE.browser.ri | uniq  > gadE.browser.sort.ri.bed



##### 
###### GSE65712
######

python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE65712/Binding/BS/soxR.cut.bed -f /home/lgomez/HT-Browser/GSE65712/Expression/FC/GSE65710_WT_paraquatvsDeltasoxR_paraqua.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t SoxR -o soxR.ri -r soxR.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE65712/Binding/BS/soxS.cut.bed -f /home/lgomez/HT-Browser/GSE65712/Expression/FC/GSE65710_WT_paraquatvsDeltasoxS_paraqua.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t SoxS -o soxS.ri -r soxS.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE65712/Binding/BS/oxyR.cut.bed -f /home/lgomez/HT-Browser/GSE65712/Expression/FC/GSE65710_WT_paraquatvsDeloxyR_paraquat.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t OxyR -o oxyR.ri -r oxyR.ri.regulon


find . -name "*.ri" |  sed -e 's/\.\///g' | awk '{print "uniq " $0 " > " $0 }' | sed -e 's/ri$/uniq.ri/g'
uniq soxR.ri > soxR.uniq.ri
uniq soxS.ri > soxS.uniq.ri
uniq oxyR.ri > oxyR.uniq.ri

find . -name "*.uniq.ri" |  sed -e 's/\.\///g' | awk '{print "python /home/lgomez/HT-Browser/bin/ri_browser.py -r " $0 " -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o " $0 }' | sed -e 's/uniq.ri$/browser.ri/g'
python /home/lgomez/HT-Browser/bin/ri_browser.py -r soxR.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o soxR.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r soxS.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o soxS.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r oxyR.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o oxyR.browser.ri

find . -name "*.browser.ri" |  sed -e 's/\.\///g' | awk '{print "sort -n -k2,3 " $0 " | uniq  > " $0 }' | sed -e 's/browser.ri$/browser.sort.ri.bed/g'
sort -n -k2,3 soxR.browser.ri | uniq  > soxR.browser.sort.ri.bed
sort -n -k2,3 soxS.browser.ri | uniq  > soxS.browser.sort.ri.bed
sort -n -k2,3 oxyR.browser.ri | uniq  > oxyR.browser.sort.ri.bed


##### 
###### GSE54901
######

python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE54901/Binding/BS/GSM1326335_chipexo_fur_fe.bed.seq.gff.bed -f /home/lgomez/HT-Browser/GSE54901/Expression/FC/GSE54901_WT_FEvsDeltaFur_FE.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t Fur -o fur_FE.ri -r fur_FE.ri.regulon
python /home/lgomez/HT-Browser/bin/Find_RI.py -b /home/lgomez/HT-Browser/GSE54901/Binding/BS/GSM1326337_chipexo_fur_dpd.bed.seq.gff.bed -f /home/lgomez/HT-Browser/GSE54901/Expression/FC/GSE54901_WT_DPDvsDeltaFur_DPD.txt -g /home/lgomez/HT-Browser/bin/gene_pos.bed -d /home/lgomez/HT-Browser/bin/MaximalDistancesPerTF.txt -t Fur -o fur_DPD.ri -r fur_DPD.ri.regulon


find . -name "*.ri" |  sed -e 's/\.\///g' | awk '{print "uniq " $0 " > " $0 }' | sed -e 's/ri$/uniq.ri/g'
uniq fur_FE.ri > fur_FE.uniq.ri
uniq fur_DPD.ri > fur_DPD.uniq.ri

find . -name "*.uniq.ri" |  sed -e 's/\.\///g' | awk '{print "python /home/lgomez/HT-Browser/bin/ri_browser.py -r " $0 " -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o " $0 }' | sed -e 's/uniq.ri$/browser.ri/g'
python /home/lgomez/HT-Browser/bin/ri_browser.py -r fur_FE.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o fur_FE.browser.ri
python /home/lgomez/HT-Browser/bin/ri_browser.py -r fur_DPD.uniq.ri -g /home/lgomez/HT-Browser/bin/gene_pos.bed -c 10 -o fur_DPD.browser.ri

find . -name "*.browser.ri" |  sed -e 's/\.\///g' | awk '{print "sort -n -k2,3 " $0 " | uniq  > " $0 }' | sed -e 's/browser.ri$/browser.sort.ri.bed/g'
sort -n -k2,3 fur_FE.browser.ri | uniq  > fur_FE.browser.sort.ri.bed
sort -n -k2,3 fur_DPD.browser.ri | uniq  > fur_DPD.browser.sort.ri.bed



##### 
###### ANALYSIS CRA
######


python ../bin/FC_Tu.py -r ../RI/cra_acetate.uniq.ri -t ../bin/TUSet.txt -f /home/lgomez/HT-Browser/GSE65643/Expression/FC/GSE65643_WT_AcetatevsDeltacra_Acetate.txt -o cra_acetate.ri.extended

python ../bin/FC_Tu.py -r ../RI/cra_glucose.uniq.ri -t ../bin/TUSet.txt -f /home/lgomez/HT-Browser/GSE65643/Expression/FC/GSE65643_WT_GlucosevsDeltacra_Glucose.txt -o cra_glucose.ri.extended

python ../bin/FC_Tu.py -r ../RI/cra_fructose.uniq.ri -t ../bin/TUSet.txt -f /home/lgomez/HT-Browser/GSE65643/Expression/FC/GSE65643_WT_FructosevsDeltacra_Fructose.txt -o cra_fructose.ri.extended

cut -f4 ../RI/cra_fructose.uniq.ri | sort -u | wc
wc cra_fructose.ri.extended

cut -f4 ../RI/cra_glucose.uniq.ri | sort -u | wc
wc cra_glucose.ri.extended

cut -f4 ../RI/cra_acetate.uniq.ri | sort -u | wc
wc cra_acetate.ri.extended


