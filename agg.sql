DROP FUNCTION agg_institution_basic(int,int,text);
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
