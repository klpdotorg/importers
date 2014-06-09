---------------------------------------------------------
DROP TABLE IF EXISTS asmnt_pairs;
CREATE TABLE asmnt_pairs (
     "pid" integer REFERENCES "tb_programme" ("id") ON DELETE CASCADE,
     "pname" varchar(300), 
     "ayid" integer,
     "ayname" varchar(12),
     "asmnts" int[],
     "class" varchar(24)
     );

insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (1,'Reading',90,'2006-2007','{1,2,3,4}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (2,'NNG',1,'2007-2008','{5,9}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (2,'NNG',1,'2007-2008','{6,10}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (2,'NNG',1,'2007-2008','{7,11}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (2,'NNG',1,'2007-2008','{8,12}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (3,'NNG',2,'2008-2009','{13,17}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (3,'NNG',2,'2008-2009','{14,18}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (3,'NNG',2,'2008-2009','{15,19}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (3,'NNG',2,'2008-2009','{16,20}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (5,'Anganwadi',119,'2009-2010','{23,24}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (6,'English',119,'2009-2010','{25,26}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (7,'Reading-Ramnagara',119,'2009-2010','{27,29,28}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (8,'Reading-Dharwad',119,'2009-2010','{30,32,31}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (9,'NNG3',119,'2009-2010','{33,34}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (14,'NNGSupport',101,'2010-2011','{41,42}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (14,'NNGSupport',101,'2010-2011','{43,44}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (14,'NNGSupport',101,'2010-2011','{45,46}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (14,'NNGSupport',101,'2010-2011','{47,48}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (15,'Akshara English',101,'2010-2011','{49,50}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (18,'Anganwadi',101,'2010-2011','{56,57,58}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (19,'Reading',102,'2011-2012','{59,60,61}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (23,'English',102,'2011-2012','{65,75}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (23,'English',102,'2011-2012','{66,76}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (23,'English',102,'2011-2012','{67,77}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (24,'Akshara Ganitha',102,'2011-2012','{68,73}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (24,'Akshara Ganitha',102,'2011-2012','{69,74}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (25,'Anganwadi Assessment',102,'2011-2012','{70,79}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (26,'Hulbi-Dwd Anganwadi Assessment',102,'2011-2012','{71,78}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (27,'Control Hubli Dharwad Anganwadi',102,'2011-2012','{72,80}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (28,'Control Math',102,'2011-2012','{81,82,83}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (28,'Control Math',102,'2011-2012','{84,85,86}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (29,'Control English',102,'2011-2012','{87,88,89}','1');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (29,'Control English',102,'2011-2012','{90,91,92}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (29,'Control English',102,'2011-2012','{93,94,95}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (30,'Treatment Math',102,'2011-2012','{96,97,98}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (30,'Treatment Math',102,'2011-2012','{99,100,101}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (31,'Treatment English',102,'2011-2012','{102,103,104}','1');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (31,'Treatment English',102,'2011-2012','{105,106,107}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (31,'Treatment English',102,'2011-2012','{108,109,110}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (32,'RCT English',121,'2012-2013','{111,130,144}','1');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (32,'RCT English',121,'2012-2013','{112,136,145}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (32,'RCT English',121,'2012-2013','{113,137,146}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (32,'RCT English',121,'2012-2013','{114,138,147}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (34,'RCT Math',121,'2012-2013','{115,131,139}','1');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (34,'RCT Math',121,'2012-2013','{116,132,140}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (34,'RCT Math',121,'2012-2013','{117,133,141}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (34,'RCT Math',121,'2012-2013','{118,134,142}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (34,'RCT Math',121,'2012-2013','{119,135,143}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (35,'Akshara Ganitha',121,'2012-2013','{120,150}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (35,'Akshara Ganitha',121,'2012-2013','{121,151}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (35,'Akshara Ganitha',121,'2012-2013','{122,152}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (35,'Akshara Ganitha',121,'2012-2013','{123,153}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (36,'Anganwadi',121,'2012-2013','{124,158}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (37,'Anganwadi-Bangalore',121,'2012-2013','{125,148}','Age 2.5-4.5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (37,'Anganwadi-Bangalore',121,'2012-2013','{126,149}','Age 4.5-6');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (38,'English',121,'2012-2013','{127,154}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (38,'English',121,'2012-2013','{128,155}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (38,'English',121,'2012-2013','{129,156}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (39,'Reading',121,'2012-2013','{157}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (41,'Anganwadi Infrastructure',121,'2012-2013','{162}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (42,'Infrastructure Survey',122,'2013-2014','{163}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (43,'Anganwadi-Indicator',122,'2013-2014','{164}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (43,'Anganwadi-Indicator',122,'2013-2014','{202}','null');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (44,'Control Treatment English',122,'2013-2014','{168,193,203}','1');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (44,'Control Treatment English',122,'2013-2014','{175,194,204}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (44,'Control Treatment English',122,'2013-2014','{176,195,205}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (44,'Control Treatment English',122,'2013-2014','{177,196,206}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (45,'Control Treatment Maths',122,'2013-2014','{169,197,207}','1');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (45,'Control Treatment Maths',122,'2013-2014','{178,198,209}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (45,'Control Treatment Maths',122,'2013-2014','{179,199,210}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (45,'Control Treatment Maths',122,'2013-2014','{180,200,211}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (45,'Control Treatment Maths',122,'2013-2014','{181,201,212}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (46,'Reading',122,'2013-2014','{182,192}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (47,'Akshara Ganita',122,'2013-2014','{183}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (47,'Akshara Ganita',122,'2013-2014','{184}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (47,'Akshara Ganita',122,'2013-2014','{185}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (47,'Akshara Ganita',122,'2013-2014','{186}','5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (48,'Akshara English',122,'2013-2014','{187}','2');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (48,'Akshara English',122,'2013-2014','{188}','3');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (48,'Akshara English',122,'2013-2014','{189}','4');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (49,'Anganwadi',122,'2013-2014','{190,218}','Age 2.5-4.5');
insert into asmnt_pairs (pid,pname,ayid,ayname,asmnts,class) values (49,'Anganwadi',122,'2013-2014','{191,219}','Age 4.5-6');


-------------------------------------------------------------------------
-- Function to define basic demographic data at school and boundary level
-- There is one aggregation table per year
-- SAMPLE DATA
-- id    | name     | sex    | mt        | count
-- 36171 | GUNNALLI | male   | kannada   |  19
-- 36171 | GUNNALLI | male   | urdu      |   3
-- 36171 | GUNNALLI | female | kannada   |  16
-- 36171 | GUNNALLI | female | urdu      |   2

DROP TABLE IF EXISTS agg_inst_basic;
CREATE TABLE agg_inst_basic (
  "id" integer REFERENCES "tb_school" ("id") ON DELETE CASCADE,
  "ayid" integer,
  "name" varchar(300),
  "sex" sex,
  "mt" school_moi,
  "num" integer
);


DROP FUNCTION agg_institution_basic(int,int);
-- Takes in status of the records iin the student class relation, academic year  
-- And a string to construct table name
CREATE OR REPLACE FUNCTION agg_institution_basic(active int,ay int)RETURNS void AS $$
DECLARE
    schs record;
BEGIN

    FOR schs in SELECT s.id as id,sc.ayid as ayid, replace(s.name,'''','') as name, c.sex as sex, c.mt as mt, 
		 count(distinct stu.id) AS count
                 FROM tb_student stu, tb_class cl, tb_student_class sc, tb_child c, tb_school s
                 WHERE cl.sid = s.id AND sc.clid = cl.id AND sc.stuid = stu.id AND sc.status=active
		 AND stu.cid = c.id AND sc.ayid = ay
                 GROUP BY s.id, s.name, c.sex, c.mt, sc.ayid
-- Status of the student class relationship will be 1 (deactivated). 
-- Data is ported and aggregated with a lag of one year.
    LOOP
                EXECUTE 'insert into agg_inst_basic'  || '(id,ayid,name,sex,mt,num) values (' ||
                  schs.id || ',' ||
                  schs.ayid || ',' ||
                  '''' || schs.name || ''',' ||
                  '''' || schs.sex || ''',' ||
                  '''' || schs.mt || ''',' ||
                  schs.count || ')';
    END LOOP;
END;
$$ language plpgsql;

SELECT agg_institution_basic(1,119);
SELECT agg_institution_basic(1,101);
SELECT agg_institution_basic(1,102);
SELECT agg_institution_basic(1,121);
SELECT agg_institution_basic(2,122);


---------------------------------------------------------
-- Function to define basic assessment data at school and class level
-- NO COHORTS CALCULATIONS AT THIS STAGE
DROP TABLE IF EXISTS agg_asmnt_basic;

CREATE TABLE agg_asmnt_basic (
  "sid" integer REFERENCES "tb_school" ("id") ON DELETE CASCADE,
  "aid" integer REFERENCES "tb_assessment" ("id") ON DELETE CASCADE,
  "pid" integer REFERENCES "tb_programme" ("id") ON DELETE CASCADE,
  "studentgroup" varchar(50),
  "sex" sex,
  "mt" school_moi,
  "num" integer
);

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
    FOR asmnt in SELECT s.id as id,ass.id as assid, p.id as pid, cl.name as clname,c.sex as sex, c.mt as mt, 
                    count(distinct stu.id) AS count 
                    FROM tb_student_eval se,tb_question q,tb_assessment ass, tb_programme p, tb_student stu, 
                    tb_class cl, tb_student_class sc, tb_child c, tb_school s 
                    WHERE se.objid=stu.id and se.qid=q.id and q.assid=ass.id and sc.stuid=stu.id 
                    and sc.clid=cl.id AND cl.sid = s.id AND stu.cid = c.id and ass.pid=p.id and p.id = ANY(pgmids) 
                    and (se.grade is not null or se.mark is not null) 
                    GROUP BY s.id, ass.id,p.id, cl.id,c.sex,c.mt
    LOOP
      RAISE NOTICE 'Processing Programe ID %', asmnt.pid;
      insert into agg_asmnt_basic values (asmnt.id,asmnt.assid,asmnt.pid,asmnt.clname,asmnt.sex,asmnt.mt,asmnt.count);
    END LOOP;
END;
$$ language plpgsql;

-- Refer choice of Programmes from klp-exp.py
select agg_assessment_basic(ARRAY[1,2,3,5,6,7,8,9,10,11,12,13,14,15,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49]);

---------------------------------------------------------
-- Function to define basic assessment data at school and class level
-- COHORTS CALCULATIONS HERE

DROP TABLE IF EXISTS agg_pgm_cohorts;

CREATE TABLE agg_pgm_cohorts (
  "sid" integer REFERENCES "tb_school" ("id") ON DELETE CASCADE,
  "aid" integer REFERENCES "tb_assessment" ("id") ON DELETE CASCADE,
  "pid" integer REFERENCES "tb_programme" ("id") ON DELETE CASCADE,
  "studentgroup" varchar(50),
  "sex" sex,
  "mt" school_moi,
  "cohortsnum" integer
);

DROP FUNCTION agg_programme_cohorts(int[]);
-- Takes in a collection of assessment IDs
-- This is table gives the as is demographic status per assessment
CREATE OR REPLACE FUNCTION agg_programme_cohorts(pgmids int[])RETURNS void AS $$
DECLARE
    pgm record;
    sch record;
    query text;
    i int;
    j int;
    k int;
    pair int[];
BEGIN
    
    -- The query below here is going to keep appending the constraint that the student in the 1st assessment 
    -- (of a Program) also has an answer in the 2nd assessment and in the 3rd and so on based on the number of
    -- assessments in the program.

    FOREACH i in ARRAY pgmids 
    LOOP
        FOR pair in EXECUTE 'select distinct asmnts from asmnt_pairs where pid=' || i
        LOOP
            IF ARRAY_LENGTH(pair,1) IS NOT NULL THEN
                RAISE NOTICE 'Pair is %', pair;
                FOREACH j in ARRAY pair
                LOOP
                    query:='SELECT s.id as id,ass.id as aid,ass.pid as pid,cl.name as clname,c.sex as sex, c.mt as mt, count(distinct stu.id) AS count FROM tb_student_eval se,tb_question q,tb_assessment ass,tb_student stu, tb_class cl, tb_student_class sc, tb_child c, tb_school s WHERE se.objid=stu.id and se.qid=q.id and q.assid=ass.id and sc.stuid=stu.id and sc.clid=cl.id AND cl.sid = s.id AND stu.cid = c.id and (se.grade is not null or se.mark is not null)';

                    FOREACH k in ARRAY pair
                    LOOP
                      query:= query||' and se.objid in (select se.objid from tb_student_eval se,tb_question q where se.qid=q.id and (se.grade is not null or se.mark is not null) and q.assid = '||k||')';
                    END LOOP;
                    query=query||'GROUP BY s.id, ass.id,cl.id,c.sex,c.mt';
                    FOR sch in EXECUTE query
                    LOOP
                        insert into agg_pgm_cohorts values (sch.id,sch.aid,sch.pid,sch.clname,sch.sex,sch.mt,sch.count);
                    END LOOP;
                END LOOP;
            END IF;
        END LOOP;
    END LOOP;
END;
$$ language plpgsql;

-- Refer choice of Programmes from klp-exp.py
select agg_programme_cohorts(ARRAY[1,2,3,5,6,7,8,9,10,11,12,13,14,15,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49]);

---------------------------------------------------------
-- UTILITY FUNCTION FOR MEDIAN
/*DROP FUNCTION _final_median;
CREATE FUNCTION _final_median(anyarray) RETURNS float8 AS $$ 
  WITH q AS
  (
     SELECT val
     FROM unnest($1) val
     WHERE VAL IS NOT NULL
     ORDER BY 1
  ),
  cnt AS
  (
    SELECT COUNT(*) AS c FROM q
  )
  SELECT AVG(val)::float8
  FROM 
  (
    SELECT val FROM q
    LIMIT  2 - MOD((SELECT c FROM cnt), 2)
    OFFSET GREATEST(CEIL((SELECT c FROM cnt) / 2.0) - 1,0)  
  ) q2;
$$ LANGUAGE sql IMMUTABLE;
 
DROP AGGREGATE median(anyelement);
CREATE AGGREGATE median(anyelement) (
  SFUNC=array_append,
  STYPE=anyarray,
  FINALFUNC=_final_median,
  INITCOND='{}'
);
*/
---------------------------------------------------------

/*DROP FUNCTION agg_score_school();
    CREATE OR REPLACE FUNCTION agg_programme_cohorts(pgmids int[])RETURNS void AS $$
    DECLARE
      pgm record;
      asmnts int[];
      sch record;
      query text;
      i int;
      j int;
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
    
    --The query below here is going to keep appending the constraint that the student in the 1st assessment 
    --(of a Program) also has an answer in the 2nd assessment and in the 3rd and so on based on the number of
    --assessments in the program.

    FOREACH i in ARRAY pgmids 
    LOOP
        asmnts := ARRAY(select distinct id from tb_assessment where pid=i);
        IF ARRAY_LENGTH(asmnts,1) IS NOT NULL THEN
            query:='SELECT s.id as id,ass.pid as pid,cl.name as clname,c.sex as sex, c.mt as mt, count(distinct stu.id) AS count FROM tb_student_eval se,tb_question q,tb_assessment ass,tb_student stu, tb_class cl, tb_student_class sc, tb_child c, tb_school s WHERE se.objid=stu.id and se.qid=q.id and q.assid=ass.id and sc.stuid=stu.id and sc.clid=cl.id AND cl.sid = s.id AND stu.cid = c.id and (se.grade is not null or se.mark is not null)';
            RAISE NOTICE 'asmt,pgm are %,%', asmnts, i;
            FOREACH j in ARRAY asmnts 
            LOOP
                query:= query||' and se.objid in (select se.objid from tb_student_eval se,tb_question q where se.qid=q.id and (se.grade is not null or se.mark is not null) and q.assid = '||j||')';
            END LOOP;
            query=query||'GROUP BY s.id, ass.id,cl.id,c.sex,c.mt';
            FOR sch in EXECUTE query
            LOOP
                insert into agg_pgm_cohorts values (sch.id,sch.pid,sch.clname,sch.sex,sch.mt,sch.count);
            END LOOP;
        END IF;
    END LOOP;
END;
$$ language plpgsql;

Refer choice of Programmes from klp-exp.py
select agg_programme_cohorts(ARRAY[1,2,3,5,6,7,8,9,10,11,12,13,14,15,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49]);
*/




