#!/usr/bin/env python
import Utility.EXIF
import os,sys
import psycopg2
import Utility.KLPDB



connection = Utility.KLPDB.getWwwConnection()
cursor = connection.cursor()


getrepeat="select se.* from tb_student_eval se,tb_question q where se.qid=q.id and q.assid=58"
checkposttest="select count(se.objid) from tb_student_eval se where se.objid=%s and se.qid=%s"

fixang=open('fixang.sql','w',0)

def getRow(row):
  line=str(row).strip('(')
  line = line.strip(')')
  line = line.strip()
  line = line.replace('\'','"')
  line = line.replace('None','')
  return line


def make_csv():
  cursor.execute(getrepeat)
  result=cursor.fetchall()
  print len(result)
  for row in result:
    oldqid=row[0]
    qid=oldqid-135
    stuid=row[1]
    grade=row[4]
    cursor.execute(checkposttest,(stuid,qid,))
    postresult=cursor.fetchall()
    for entry in postresult:
      if entry[0]==0:
        fixang.write("update tb_student_eval set qid="+str(qid)+" where objid="+str(stuid)+" and qid="+str(oldqid)+";\n")
      else:
        fixang.write("update tb_student_eval set grade="+str(grade)+" where objid="+str(stuid)+" and qid="+str(qid)+";\n")
        fixang.write("delete from tb_student_eval where objid="+str(stuid)+" and qid="+str(oldqid)+";\n")
  

make_csv()
connection.close()
