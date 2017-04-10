import csv

infile='dise_notmatch_with_details' # Input file
outfile='insert_schools' # Output file

fp1=csv.reader(open('../school_matching_counts/' + infile + '.csv', 'r'), delimiter='|', quotechar='"')# dise data to create new schools
fp2=csv.reader(open('../../boundary_update/result_file.csv', 'r'), delimiter='|', quotechar='"') # to get boundary id for school 
fp3=csv.writer(open('../school_matching_counts/bound_not_available.csv','w'), delimiter='|', quotechar='"') # if Dise boundary is empty get details. 


fp4=open('../sqls/'+outfile+'.sql','w')

fp1.next()
fp2.next()

boundaries=[row for row in fp2]
disedata=[row for row in fp1]

for dise in disedata:
    temp=[]
    bid=None
    name=None
    disecode=None
    temp=[row for row in dise[:3] if len(row.strip())>0] # if boundary empty
    address=dise[5].strip()
    pincode=dise[6].strip()
    if len(temp)<3:
        fp3.writerow(dise)
        continue
    disecode=dise[3].strip()
    name=dise[4].strip()
    cat_id=int(dise[9].strip())
    inst_gen=dise[10].strip()
    mgmt_id=int(dise[8].strip())
    moi=int(dise[7].strip())
    for b in boundaries:
        if b[0].strip().lower() == temp[0].strip().lower() and b[1].strip().lower() == temp[1].strip().lower() and b[2].strip().lower() == temp[2].strip().lower():
            bid=b[6].strip() # compare boundaries and get boundary_id
            break
    #print 'with addr as (insert into schools_institution_address (address, pincode) values ' + str(tuple([address, int(pincode)])) + ' returning id ), school as (insert into schools_institution (boundary_id, name, dise_code, cat_id, institution_gender, mgmt_id, inst_address_id, active) values ' + str(tuple([int(bid), name, disecode, cat_id, inst_gen, mgmt_id, "|(select id from addr)|", 2])).replace("'|","").replace("|'","") + ' returning id) insert into schools_institution_languages (institution_id, moi_type_id) values ' + str(tuple(["|(select id from school)|", moi])).replace("'|","").replace("|'","") 
    fp4.write('with addr as (insert into schools_institution_address (address, pincode) values ' + str(tuple([address, int(pincode)])) + ' returning id ), school as (insert into schools_institution (boundary_id, name, dise_code, cat_id, institution_gender, mgmt_id, inst_address_id, active) values ' + str(tuple([int(bid), name, disecode, cat_id, inst_gen, mgmt_id, "|(select id from addr)|", 2])).replace("'|","").replace("|'","") + ' returning id) insert into schools_institution_languages (institution_id, moi_type_id) values ' + str(tuple(["|(select id from school)|", moi])).replace("'|","").replace("|'","") + ';\n')
