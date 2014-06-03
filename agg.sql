-- Function to define basic demographic data at school and boundary level
-- There is one aggregation table per year
-- SAMPLE DATA
-- id    | name     | bid  | sex    | mt        | count
-- 36171 | GUNNALLI | 9046 | male   | kannada   |  19
-- 36171 | GUNNALLI | 9046 | male   | urdu      |   3
-- 36171 | GUNNALLI | 9046 | female | kannada   |  16
-- 36171 | GUNNALLI | 9046 | female | urdu      |   2

DROP FUNCTION agg_institution_basic(int,int,text);
-- Takes in status of the records iin the student class relation, academic year  
-- And a string to construct table name
CREATE OR REPLACE FUNCTION agg_institution_basic(active int,ay int,yr text)RETURNS void AS $$
DECLARE
    schs record;
BEGIN
    EXECUTE 'DROP TABLE IF EXISTS agg_inst_basic_' || yr ;

    EXECUTE 'CREATE TABLE agg_inst_basic_' || yr || '(' ||
      '  "id" integer REFERENCES "tb_school" ("id") ON DELETE CASCADE,' ||
      '  "name" varchar(300),' ||
      '  "bid" integer REFERENCES "tb_boundary" ("id") ON DELETE CASCADE,' ||
      '  "sex" sex,' ||
      '  "mt" school_moi,' ||
      '  "num" integer' ||
      ')';

    FOR schs in SELECT s.id as id, replace(s.name,'''','') as name, s.bid as bid, c.sex as sex, c.mt as mt, 
		 count(distinct stu.id) AS count
                 FROM tb_student stu, tb_class cl, tb_student_class sc, tb_child c, tb_school s
                 WHERE cl.sid = s.id AND sc.clid = cl.id AND sc.stuid = stu.id AND sc.status=active
		 AND stu.cid = c.id AND sc.ayid = ay
                 GROUP BY s.id, s.name, s.bid, c.sex, c.mt
-- Status of the student class relationship will be 1 (deactivated). 
-- Data is ported and aggregated with a lag of one year.
    LOOP
                EXECUTE 'insert into agg_inst_basic_' || yr  || '(id,name,bid,sex,mt,num) values (' ||
                  schs.id || ',' ||
                  '''' || schs.name || ''',' ||
                  schs.bid || ',' ||
                  '''' || schs.sex || ''',' ||
                  '''' || schs.mt || ''',' ||
                  schs.count || ')';
    END LOOP;
END;
$$ language plpgsql;

SELECT agg_institution_basic(1,119,'09_10');
SELECT agg_institution_basic(1,101,'10_11');
SELECT agg_institution_basic(1,102,'11_12');
SELECT agg_institution_basic(1,121,'12_13');
SELECT agg_institution_basic(2,122,'13_14');

---------------------------------------------------------
-- Function to define Acad year to Programme/ Assessment linkage
-- Created for ease of querying
DROP FUNCTION link_ay_program(int[]);
CREATE OR REPLACE FUNCTION link_ay_program(aylist  int[])RETURNS void AS $$
DECLARE
    rec record;
BEGIN
    EXECUTE 'DROP TABLE IF EXISTS asmnt_pgm_ay';

    EXECUTE 'CREATE TABLE asmnt_pgm_ay (' ||
      '  "ayid" integer REFERENCES "tb_academic_year" ("id") ON DELETE CASCADE,' ||
      '  "ayname" varchar(300),' ||
      '  "pid" integer REFERENCES "tb_programme" ("id") ON DELETE CASCADE,' ||
      '  "pname" varchar(300),' ||
      '  "aid" integer REFERENCES "tb_assessment" ("id") ON DELETE CASCADE,' ||
      '  "aname" varchar(300)'
      ')';
    FOR rec in select ay.id as ayid, ay.name as ayname, p.id as pid, p.name as pname, 
        a.id as  aid, a.name as aname from tb_academic_year ay, tb_programme p, tb_assessment a 
        where EXTRACT(YEAR from p.start) || '-' || EXTRACT(YEAR from p.end) = ay.name  and ay.id = ANY(aylist)
    LOOP
        insert into asmnt_pgm_ay values (rec.ayid, rec.ayname, rec.pid ,rec.pname, rec.aid, rec.aname);
    END LOOP;
END;
$$ language plpgsql;

select link_ay_program(ARRAY[119,101,102,121,122]);

---------------------------------------------------------
-- Function to define basic assessment data at school and class level
-- NO COHORTS CALCULATIONS AT THIS STAGE

DROP FUNCTION agg_assessment_basic(int[]);
-- Takes in a collection of assessment IDs
-- This is table gives the as is demographic status per assessment
-- This table will tell you for Eg. How many girls, speaking kannada belonging to
-- GUHPS Austin Town were part of the English Pretest 
-- (with an id, that  can be viewed with Acad year then)
CREATE OR REPLACE FUNCTION agg_assessment_basic(pgmids int[])RETURNS void AS $$
DECLARE
    asmnt record;
BEGIN
    EXECUTE 'DROP TABLE IF EXISTS agg_asmnt_basic';

    EXECUTE 'CREATE TABLE agg_asmnt_basic (' ||
      ' "sid" integer REFERENCES "tb_school" ("id") ON DELETE CASCADE,' ||
      ' "aid" integer REFERENCES "tb_assessment" ("id") ON DELETE CASCADE,' ||
      ' "pid" integer REFERENCES "tb_programme" ("id") ON DELETE CASCADE,' ||
      ' "studentgroup" varchar(50),' ||
      ' "sex" sex,' ||
      ' "mt" school_moi,' ||
      ' "num" integer' ||
      ')';

    FOR asmnt in SELECT s.id as id,ass.id as assid, p.id, cl.name as clname,c.sex as sex, c.mt as mt, 
                    count(distinct stu.id) AS count 
                    FROM tb_student_eval se,tb_question q,tb_assessment ass, tb_programme p, tb_student stu, 
                    tb_class cl, tb_student_class sc, tb_child c, tb_school s 
                    WHERE se.objid=stu.id and se.qid=q.id and q.assid=ass.id and sc.stuid=stu.id 
                    and sc.clid=cl.id AND cl.sid = s.id AND stu.cid = c.id and ass.pid=p.id and p.id = ANY(pgmids) 
                    and (se.grade is not null or se.mark is not null) 
                    GROUP BY s.id, ass.id,cl.id,c.sex,c.mt
    LOOP
      insert into agg_asmnt_basic values (asmnt.id,asmnt.assid,p.id,asmnt.clname,asmnt.sex,asmnt.mt,asmnt.count);
    END LOOP;
END;
$$ language plpgsql;

-- Refer choice of Programmes from klp-exp.py
select agg_assessment_basic(ARRAY[1,2,3,5,6,7,8,9,10,11,12,13,14,15,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49]);


DROP FUNCTION agg_programme_cohorts(int[]);
-- Takes in a collection of assessment IDs
-- This is table gives the as is demographic status per assessment
CREATE OR REPLACE FUNCTION agg_programme_cohorts(pgmids int[])RETURNS void AS $$
DECLARE
    pgm record;
    asmnts int[];
    sch record;
BEGIN
    EXECUTE 'DROP TABLE IF EXISTS agg_pgm_cohorts';

    EXECUTE 'CREATE TABLE agg_pgm_cohorts (' ||
      ' "sid" integer REFERENCES "tb_school" ("id") ON DELETE CASCADE,' ||
      ' "pid" integer REFERENCES "tb_programme" ("id") ON DELETE CASCADE,' ||
      ' "studentgroup" varchar(50),' ||
      ' "sex" sex,' ||
      ' "mt" school_moi,' ||
      ' "cohortsnum" integer' ||
      ')';
    
    FOR i in array_lower(pgmids,1)..array_upper(pgmids,1)
    LOOP
        asmnts := ARRAY(select distinct id from tb_assessment where pid=pgmids[i]);
        FOR sch in SELECT s.id as id,ass.pid as pid,cl.name as clname,c.sex as sex, c.mt as mt, 
                count(distinct stu.id) AS count 
                FROM tb_student_eval se,tb_question q,tb_assessment ass, tb_student stu, 
                tb_class cl, tb_student_class sc, tb_child c, tb_school s 
                WHERE se.objid=stu.id and se.qid=q.id and q.assid=ass.id and sc.stuid=stu.id 
                and sc.clid=cl.id AND cl.sid = s.id AND stu.cid = c.id and ass.id = ALL(asmnts) 
                and (se.grade is not null or se.mark is not null) 
                GROUP BY s.id, ass.pid,cl.id,c.sex,c.mt
        LOOP
            insert into agg_asmnt_basic values (sch.id,sch.pid,sch.clname,sch.sex,sch.mt,sch.count);
        END LOOP;
    END LOOP;
END;
$$ language plpgsql;

-- Refer choice of Programmes from klp-exp.py
select agg_programme_cohorts(ARRAY[1,2,3,5,6,7,8,9,10,11,12,13,14,15,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49]);

