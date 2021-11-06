--1a--
select * from dealer d join client c on d.id = c.dealer_id;
--1b--
select d, c.name, c.city, c.priority, s.id, s.date, s.amount from dealer d
left join client c on d.id = c.dealer_id
left join sell s on c.id = s.client_id
where  c.name is not null and c.city is not null and c.priority is not null and s.id is not null and s.date is not null and s.amount is not null;
--1c--
select d, c from dealer d
inner join client c on c.city = d.location;
--1d--
select s.id, s.amount, c.name, c.city from sell s
inner join client c on s.client_id = c.id where s.amount > 100 and s.amount < 500;
--1e--
select d.id, d.name from client
right join dealer as d on d.id = client.dealer_id;
--1f--
select c.name, c.city, d.name, d.charge from client c
join dealer d on c.dealer_id = d.id;
--1g--
select c.name, c.city, d from client c
join dealer d on dealer_id = d.id where d.charge > 0.12;
--1h--
select c.name, c.city, s.id, s.date, s.amount, d.name,d.charge from client c
join dealer d on c.dealer_id = d.id
join sell s on c.id = s.client_id;
--1i--
--2a--
create view d1 as
select s.date, count(distinct s.client_id), avg(s.amount), sum(s.amount) from sell s group by s.date;
--2b--
create view d2 as
select s.date, s.amount from sell s order by s.amount desc limit 5;
--2c--
create view d3 as
select  d, count(s.amount), avg(s.amount), sum(s.amount) from sell s
join dealer d on d.id = s.dealer_id group by d;
--2d--
create view d4 as
select d, sum(amount * d.charge) from sell s
join dealer d on d.id = s.dealer_id group by d;
--2e--
create view d5 as
select d.location, count(s.amount), avg(s.amount), sum(s.amount) from dealer d
join sell s on d.id = s.dealer_id group by d.location;
--2f--
create view d6 as
select c.city, count(s.amount), avg(s.amount * (d.charge + 1)), sum(s.amount * (d.charge + 1)) from client c
join dealer d on c.dealer_id = d.id
join sell s on c.id = s.client_id group by c.city;
--2g--
create view d7 as
select c.city, sum(s.amount * (d.charge + 1)) as totalexpense, sum(s.amount) as totalamount from client c
join sell s on c.id = s.client_id
join dealer d on s.dealer_id = d.id and c.city = d.location group by c.city;
