create database lab4;

create table warehouses(
  code int primary key,
  location varchar(255),
  capacity int
);

create table boxes(
  code char(4),
  contents varchar(255),
  value real,
  warehouse int references warehouses(code)
);

select * from boxes where value > 150;

select distinct on(contents) * from boxes;

select warehouse, count(*) from boxes group by warehouse;

select warehouse, count(*) from boxes group by warehouse having count(*) > 2;

insert into warehouses (code, location, capacity) values (6, 'New York', 3);

insert into boxes values ('H5RT', 'Paper', 200, 6);

update boxes set value = value * 1.15 where code in (select code from boxes order by value desc nulls last limit 1 offset 2);

delete from boxes where value < 150;

delete from boxes where warehouse in (select code from warehouses where location = 'New York') returning *;
