select a.id, 
	a.institution_id, 
	a.name, 
	'a'||a.section||'b', 
	b.id, 
	b.institution_id, 
	b.name, 
	'a'||b.section||'b'
from (select * from schools_studentgroup where section is null) as a,
	(select id, institution_id, name, section, active, group_type from schools_studentgroup where section='') as b
where a.name=b.name
	and a.institution_id=b.institution_id;
