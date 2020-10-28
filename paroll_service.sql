
show databases;

#uc1
create database payroll_service;
show databases;
use payroll_service;

#uc2
create table employee_payroll(
    -> id int not null auto_increment,
    -> name varchar(100) not null,
    -> salary double not null,
    -> start date not null,
    -> primary key (id)
    -> );
describe employee_payroll;

#uc3
insert into employee_payroll (name, salary, start) values
    -> ('Omkeshwari', 40000, '2020-09-16');
select *  from employee_payroll;

#uc4
insert into employee_payroll (name, salary, start) values
    ->  ('Suruchi', 50000, '2020-05-18'),
    ->  ('Mital', 60000, '2018-06-24');
select *  from employee_payroll;

#uc5
select salary from employee_payroll where name='Omkeshwari';
select * from employee_payroll
    -> where start between cast('2020-01-01' as date) and date(now());

#uc6
alter table employee_payroll
    -> add gender char(1)
    -> after name;
describe employee_payroll;
update employee_payroll
    -> set gender = 'F'
    -> where name = 'Omkeshwari' or name = 'Suruchi';
select *  from employee_payroll;
update employee_payroll
    -> set gender = 'M'
    -> where name = 'Mital';
select *  from employee_payroll;

#uc7
select avg(salary) from employee_payroll where gender='F';
select gender, avg(salary) from employee_payroll group by gender;
select gender, sum(salary) from employee_payroll group by gender;
select gender, min(salary) from employee_payroll group by gender;
select gender, max(salary) from employee_payroll group by gender;
select count(*) from employee_payroll;
select gender, count(*) from employee_payroll group by gender;