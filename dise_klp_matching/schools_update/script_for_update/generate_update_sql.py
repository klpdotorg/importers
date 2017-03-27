import csv

klpid_index=2 # Edit according to input file
disecode_index=0 # Edit according to input file

infile='dataentry_match_8657' # Input file
outfile='dataentry_match_update' # Output file

fp1=csv.reader(open('../school_matching_counts/'+infile+'.csv', 'r'), delimiter='|', quotechar='"')
fp2=csv.reader(open('../school_matching_counts/dise_school_data.csv', 'r'), delimiter='|', quotechar='"')# to get dise cluster name for update
fp3=csv.reader(open('../../boundary_update/result_file.csv', 'r'), delimiter='|', quotechar='"') # to get boundary id for school 
fp5=csv.reader(open('../../school_matching_counts/klp_schools_20876.csv)','r'), delimiter='|', quotechar='"') # to get old boundary id if dise boundary is empty

fp4=open('../sqls/'+outfile+'.sql','w')

fp1.next()
fp2.next()
fp3.next()
fp5.next()

boundaries=[row for row in fp3]
disedata=[row for row in fp2]
matchdata=[row for row in fp1]

bids={}
for row in fp5:
    bids[row[3].strip()]=row[5].strip()

for match in matchdata:
    temp=[]
    klpid=match[klpid_index].strip()
    bid=None
    name=None
    disecode=None
    for dise in disedata:
        if match[disecode_index].strip() == dise[5].strip(): # matching dise code to get boundary names and school_name
            temp=dise[:3]
            disecode=dise[5].strip()
            name=dise[6].strip()
            disedata.remove(dise)
            break
    for b in boundaries:
        if len(temp)<3: # if dise boundary data is empty then take klp boundary id.
            bid=bids[klpid]
            break           
        if b[0].strip().lower() == temp[0].strip().lower() and b[1].strip().lower() == temp[1].strip().lower() and b[2].strip().lower() == temp[2].strip().lower():
            bid=b[6].strip() # compare boundaries and get boundary_id
            break
    #print 'update schools_institution set (boundary_id, name, dise_code, active) = ' + str(tuple([bid, name, disecode, 2])) + ' where id = ' + klpid + ';\n' 
    if bid == None:
        print match # checking any boundary id missing
    fp4.write('update schools_institution set (boundary_id, name, dise_code, active) = ' + str(tuple([bid, name, disecode, 2])) + ' where id = ' + klpid + ';\n')
