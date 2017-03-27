import csv
import sys
from difflib import SequenceMatcher

btype=sys.argv[1]
#infile=sys.argv[2]
#refile=sys.argv[3]

fp1=csv.reader(open('dise_school_data.csv', 'r'), delimiter='|', quotechar='"')
fp2=csv.reader(open('boundaries.csv', 'r'), delimiter='|', quotechar='"')
fp3=csv.writer(open('result_file.csv', 'w'), delimiter='|', quotechar='"')
fp4=csv.writer(open('not_match_klp_'+btype+'.csv', 'w'), delimiter='|', quotechar='"')
fp5=csv.writer(open('not_match_dise_'+btype+'.csv', 'w'), delimiter='|', quotechar='"')
fp6=csv.writer(open('update_name_'+btype+'.csv', 'w'), delimiter='|', quotechar='"')
fp1.next()
fp2.next()
dise_data=[row for row in fp1]
klp_data=[row for row in fp2]
districts=[]
blocks=[]
clusters=[]

def match_max(a,b):
    return SequenceMatcher(None, a,b)


def check_district(dise, klp):
    tempwriter=[]
    fp3.writerow(['dise dist', 'klp dist'])
    dise.sort()
    for distd in dise:
        flag=0
        for distk in klp:
            if distd==distk:
                if [distd, distk] not in tempwriter:
                    tempwriter.append([distd, distk])
                flag=1
                break
        if flag==0:
            if [distd, 'not matched'] not in tempwriter:
                tempwriter.append([distd, 'not matched'])
        else:
            klp.remove(distk)
    for row in klp:
        if ['not matched', row] not in tempwriter:
            tempwriter.append(['not matched', row])
    for row in tempwriter:
        fp3.writerow(row)
     

def check_block(dise, klp):
    tempwriter=[]
    nomatchdise=[]
    matchdise=[]
    fp3.writerow(['dise dist', 'dise block', 'klp dist', 'klp block', 'check'])
    for dised in dise:
        rem=[]
        for klpd in klp:
            if dised[0]==klpd[0]:
                if dised[1]==klpd[1]:
                    tempwriter.append(dised+ klpd+[1.0])
                    rem=klpd
                    matchdise.append(dised)
                    break
                else:
                    if dised not in nomatchdise:
                        nomatchdise.append(dised)
            else:
                if dised not in nomatchdise:
                    nomatchdise.append(dised)
        if rem!=[]:
            klp.remove(rem)
    for row in matchdise:
        if row in nomatchdise:
            nomatchdise.remove(row)
    nomatchdise2=[]
    matchdise=[]
    for dised in nomatchdise:
        rem=[]
        for klpd in klp:
            if dised[0]==klpd[0]:
                s = SequenceMatcher(lambda x: x==" ", dised[1],klpd[1])
                if round(s.ratio(), 3)>=0.8:
                    rem=klpd
                    tempwriter.append(dised+klpd+[round(s.ratio(), 3)])
                    fp6.writerow(klpd + dised)
                    matchdise.append(dised)
                    break
                else:
                    if dised not in nomatchdise2:
                        nomatchdise2.append(dised)
            else:
                if dised not in nomatchdise2:
                    nomatchdise2.append(dised)
        if rem!=[]:
            klp.remove(rem)
    for row in matchdise:
        if row in nomatchdise2:
            nomatchdise2.remove(row)

    for dised in nomatchdise2:
        fp5.writerow(dised)
    for klpd in klp:
        fp4.writerow(klpd)   

               
    #for row in klp:
    #    tempwriter.append([row[0], 'not matched'] + row)
    for row in tempwriter:
        fp3.writerow(row)

def check_cluster(dise, klp):
    tempwriter=[]
    nomatchdise=[]
    matchdise=[]
    fp3.writerow(['dise dist', 'dise block', 'dise_cluster', 'klp dist', 'klp block', 'klp_cluster', 'check'])
    for dised in dise:
        rem=[]
        for klpd in klp:
            if dised[0]==klpd[0] and dised[1]==klpd[1]:
                if dised[2]==klpd[2]:
                    tempwriter.append(dised+ klpd+[1.0])
                    rem=klpd
                    matchdise.append(dised)
                    break
                else:
                    if dised not in nomatchdise:
                        nomatchdise.append(dised)
            else:
                if dised not in nomatchdise:
                    nomatchdise.append(dised)
        if rem!=[]:
            klp.remove(rem)
    for row in matchdise:
        if row in nomatchdise:
            nomatchdise.remove(row) 
    nomatchdise2=[]
    matchdise=[]
    for dised in nomatchdise:
        rem=[]
        for klpd in klp:
            if dised[0]==klpd[0] and dised[1]==klpd[1]:
                s = SequenceMatcher(lambda x: x==" ", dised[2],klpd[2])
                if round(s.ratio(), 3)>=0.8:
                    rem=klpd
                    tempwriter.append(dised+klpd+[round(s.ratio(), 3)])
                    matchdise.append(dised)
                    fp6.writerow(klpd + dised + [round(s.ratio(), 3)])
                    break
                else:
                    if dised not in nomatchdise2:
                        nomatchdise2.append(dised)
            else:
                if dised not in nomatchdise2:
                    nomatchdise2.append(dised)

        if rem!=[]:
            klp.remove(rem)
    for row in matchdise:
        if row in nomatchdise2:
            nomatchdise2.remove(row) 

    nomatchdise3=[]
    matchdise=[]
    for dised in nomatchdise2:
        rem=[]
        temp=[]
        for klpd in klp:
            if dised[0]==klpd[0] and dised[1]==klpd[1]:
                s = SequenceMatcher(lambda x: x==" ", dised[2],klpd[2])
                if round(s.ratio(), 3)>=0.7:
                    if input('matched?')!=1:
                        continue
                    rem=klpd
                    tempwriter.append(dised+klpd+[round(s.ratio(), 3)])
                    matchdise.append(dised)
                    fp6.writerow(klpd + dised + [round(s.ratio(), 3)])
                    break
                else:
                    if dised not in nomatchdise3:
                        nomatchdise3.append(dised)
            else:
                if dised not in nomatchdise3:
                    nomatchdise3.append(dised)

        if rem!=[]:
            klp.remove(rem)
    for row in matchdise:
        if row in nomatchdise3:
            nomatchdise3.remove(row) 


    for dised in nomatchdise2:
        fp5.writerow(dised)

    for klpd in klp:
        fp4.writerow(klpd) 
  
    for row in tempwriter:
        fp3.writerow(row)

#def check_school():

dise_districts=[]
klp_districts=[]
dise_blocks=[]
klp_blocks=[]
dise_clusters=[]
klp_clusters=[]
#dise_schools=[]
#klp_schools=[]

modified_dist={'yadgiri':'yadagiri', 'chamrajnagar':'chamarajanagara', 'chikballapur':'chikkaballapura', 'chikmagalur':'chikkamangalore', 'davanageree':'davanagere', 'davangere':'davanagere', 'madhugiri':'tumkur madhugiri', 'chikkodi':'belgaum chikkodi'}

modified_block={'north-1':'north1', 'north-2':'north2', 'north-3':'north3', 'north-4':'north4', 'south-1':'south1', 'south-2':'south2', 'south-3':'south3', 'south-4':'south4', 'belgaum rural':'belgaum rural.', 'kollegal':'kollegala', 'jagaloor':'jagalur', 'rannebennur':'ranebennur', 'nanjangud':'nanjanagud', 'kundapur':'kundapura'}

if btype=='1':
    for dise in dise_data:
        if dise[0].strip().lower() not in dise_districts:
            dise_districts.append(dise[0].strip().lower())
    for klp in klp_data:
        if klp[0].strip().lower() not in klp_districts:
            klp_districts.append(klp[0].strip().lower())
    check_district(dise_districts, klp_districts)
elif btype=='2':
    for dise in dise_data:
        if [dise[0].strip().lower(), dise[1].strip().lower()] not in dise_blocks:
            dise_blocks.append([dise[0].strip().lower(), dise[1].strip().lower()])
    for klp in klp_data:
        dist=modified_dist.get(klp[0].strip().lower(), klp[0].strip().lower())
        if [dist, klp[1].strip().lower(),klp[4].strip()] not in klp_blocks:
            klp_blocks.append([dist, klp[1].strip().lower(),klp[4].strip()])
    check_block(dise_blocks, klp_blocks)
elif btype=='3':
    for dise in dise_data:
        if [dise[0].strip().lower(), dise[1].strip().lower(), dise[2].strip().lower()] not in dise_clusters:
            dise_clusters.append([dise[0].strip().lower(), dise[1].strip().lower(), dise[2].strip().lower()])
    for klp in klp_data:
        dist=modified_dist.get(klp[0].strip().lower(), klp[0].strip().lower())
        blck=modified_block.get(klp[1].strip().lower(), klp[1].strip().lower())
        if [dist, blck, klp[2].strip().lower(), klp[5].strip()] not in klp_clusters:
            klp_clusters.append([dist, blck, klp[2].strip().lower(), klp[5].strip()])
    check_cluster(dise_clusters, klp_clusters)
#elif btype=='4':
    
