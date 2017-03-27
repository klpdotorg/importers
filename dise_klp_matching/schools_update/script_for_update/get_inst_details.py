import csv
import web

fp1=csv.reader(open('klp_no_match_last.csv','r'), delimiter='|', quotechar='"')
fp2=csv.writer(open('result_inst_details_all.csv','w'), delimiter='|', quotechar='"')

fp1.next()

contents=[row for row in fp1]
db=web.database(dbn='postgres',user='klp',pw='',db='')


schools=[]
#progs=[]

#ayid={1:2, 2:1, 3:2, 4:2, 6:119, 7:119, 8:119, 9:119, 12:119, 13:119, 14:101, 15:101, 16:101, 17:101, 19:101, 23:102, 24:102, 35:121, 38:121, 46:122, 47:122, 48:122, 53:123, 54:123, 58:123, 59:123, 62:123, 63:123, 64:103, 65:103, 66:103, 67:104, 68:104}
insts={}

for row in contents:
    klpid=row[3].strip()
    if klpid not in schools: # to skip duplicates if any.
        schools.append(klpid)
    insts[klpid]=row

for inst in schools:
    temp=[]
    #get prog details if only student_id present in answer table for the school.
    result=db.query('select inst.dist_name, inst.blck_name, inst.clst_name, inst.inst_id, inst.inst_name, prog.prog_id, prog.prog_name, prog.prog_start_date, count(distinct ans.object_id) as stu_count from mvw_schools_institution as inst, mvw_programme_details as prog, mvw_answers as ans, mvw_studentgroup as sg, mvw_studentgrouprelation_104 as ssgr where inst.inst_id=sg.institution_id and sg.id=ssgr.student_group_id and ssgr.student_id=ans.object_id and ans.question_id=prog.ques_id and inst.inst_id=$s group by inst.dist_name, inst.blck_name, inst.clst_name, inst.inst_id, inst.inst_name, prog.prog_id, prog.prog_name, prog.prog_start_date',{'s':inst})
    for row in result:
        temp.append([row.dist_name, row.blck_name, row.clst_name, row.inst_id, row.inst_name, row.prog_id, row.prog_name, row.prog_start_date, row.stu_count])
    #get student counts classwise.
    result=db.query('select inst.dist_name, inst.blck_name, inst.clst_name, sg.institution_id, inst.inst_name, sg.name as cl, count(distinct ssgr.student_id) as stu_count from mvw_schools_institution as inst, mvw_studentgroup as sg, mvw_studentgrouprelation_104 as ssgr where inst.inst_id=sg.institution_id and sg.id=ssgr.student_group_id and sg.institution_id=$s and ssgr.active=2 and sg.name in (select id::text from generate_series(1,10) as id) group by inst.dist_name, inst.blck_name, inst.clst_name, sg.institution_id, inst.inst_name, sg.name', {'s':inst}) 
    classes=[0,0,0,0,0,0,0,0,0,0] #if no records found then default values.
    for row in result:
        classes[int(row.cl)-1]=int(row.stu_count) #replace 0's with student counts
    if len(temp)==0:
        temp=[insts[inst][:5]+['','','','']] #if no programmes found for school then default values.
    for row in temp:
        fp2.writerow(row+classes)

#print len(schools) 


