import csv
import web
import sys

fname=sys.argv[1].strip()
folder=sys.argv[2].strip()
fp1=csv.reader(open('csv/'+fname,'r'), delimiter='|')
deletegroup=open(folder+'/delete_group.sql','w')

db=web.database(dbn='postgres', user='username', pw='password', db='db')

fp1.next()

ids_todelete=[]

for row in fp1:
    if len(row)<=1:
        continue
    oldid=row[0].strip()
    if oldid not in ids_todelete: 
        ids_todelete.append(int(oldid))
    deletegroup.write('delete from schools_studentgroup where id='+oldid+';\n')

deletegroup.close()
groups={'ids':tuple(ids_todelete)}

msg=[]

if len(ids_todelete)>0:
    result=db.query('select count(*) from schools_student_studentgrouprelation where student_group_id in $ids', groups)
    if result[0].count>0:
        msg.append(' check schools_student_studentgrouprelation before deleting')
    else: 
        msg.append('schools_student_studentgrouprelation is clear')

    result=db.query('select count(*) from schools_assessment_class_association where student_group_id in $ids', groups) 
    if result[0].count>0:
        msg.append(' check schools_assessment_class_association before deleting')
    else: 
        msg.append('schools_assessment_class_association is clear')

    result=db.query('select count(*) from schools_assessment_studentgroup_association where student_group_id in $ids', groups)
    if result[0].count>0:
        msg.append(' check schools_assessment_studentgroup_association before deleting')
    else: 
        msg.append('schools_assessment_studentgroup_association is clear')

for row in msg:
    print row


