/*
  Необходимо получить сотрудников всех нижестоящих подразделений от подразделения сотрудника “Сотрудник 1” с id 710253 у которых возраст менее 40 лет. 
  Исключить из результирующей таблицы подразделения с id 100055 и 100059. 
  Отсортировать по возрастанию уровня вложенности подразделения. 
*/

;with subdd (id, parent_id, name, lvl)
as (
	select id, parent_id, name, 0 as lvl
	from subdivisions
	where parent_id in (select subdivision_id from collaborators where id=710253) 
	union all
	select s.id, s.parent_id, s.name, r.lvl + 1 as lvl
	from 
		subdivisions s
		join subdd r on s.parent_id = r.id
) 
select 
	s.id, s.parent_id, s.name, s.lvl, replicate('+ ', s.lvl) + s.name as lvl_name, 
	c.id, c.name, c.age
from 
	subdd s
	join collaborators c on c.subdivision_id = s.id
where 
	c.age < 40
	and s.id not in (100055, 100059)
order by 
	s.lvl, s.id, s.parent_id

/*
id	parent_id	name	lvl	lvl_name	id	name	age
100009	100008	Department 100009	1	+ Department 100009	710267	Сотрудник 16	22
100006	100005	Department 100006	2	+ + Department 100006	710262	Сотрудник 11	29
100007	100059	Department 100007	5	+ + + + + Department 100007	710265	Сотрудник 14	38
*/