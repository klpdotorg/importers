import csv
import web
import sys

fname=sys.argv[1].strip()
folder=sys.argv[2].strip()
fp1=csv.reader(open('csv/'+fname,'r'), delimiter='|')
studentgrouprelation=open(folder+'/update_student_studentgroupreltion.sql','w')
studentgroup=open(folder+'/update_assessment_class_association.sql','w')
student=open(folder+'/update_assessment_studentgroup_association.sql','w')

db=web.database(dbn='postgres', user='username', pw='password', db='db')

fp1.next()


for row in fp1:
    if len(row)<=1:
        continue
    oldid=row[0].strip()
    newid=row[4].strip()
    studentgrouprelation.write('update schools_student_studentgrouprelation set student_group_id='+newid+' where student_group_id='+oldid+';\n')
    studentgroup.write('update schools_assessment_class_association set student_group_id='+newid+' where student_group_id='+oldid+';\n')
    student.write('update schools_assessment_studentgroup_association set student_group_id='+newid+' where student_group_id='+oldid+';\n')


studentgrouprelation.close()
studentgroup.close()
student.close()

