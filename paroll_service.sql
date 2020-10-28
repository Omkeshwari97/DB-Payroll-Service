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