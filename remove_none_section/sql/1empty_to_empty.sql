select a.id, 
	a.institution_id, 
	a.name, 
	'a'||a.section||'b', 
	b.id, 
	b.institution_id, 
	b.name, 
	'a'||b.section||'b'
from (select * from schools_studentgroup where section='' and active=0) as a,
	(select id, institution_id, name, section, active, group_type from schools_studentgroup where section='' and active in (2,1)) as b
where a.name=b.name
	and a.institution_id=b.institution_id;