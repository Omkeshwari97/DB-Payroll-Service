
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

#uc8
alter table employee_payroll
    -> add phone numeric(10) not null after name;
alter table employee_payroll
    -> add address varchar(25) not null after phone;
alter table employee_payroll
    -> add department varchar(15) not null after address;
desc employee_payroll;
alter table employee_payroll
    -> alter address set default 'TBD';

#uc9
alter table employee_payroll
    -> rename column salary to basic_pay;
alter table employee_payroll
    -> add deductions double not null after basic_pay;
alter table employee_payroll
    -> add taxable_pay double not null after deductions;
alter table employee_payroll
    -> add income_tax double not null after taxable_pay;
alter table employee_payroll
    -> add net_pay double not null after income_tax;
desc employee_payroll;

#uc10
insert into employee_payroll
    -> (name, phone, department, gender, basic_pay, deductions, taxable_pay, income_tax, net_pay, start) values
    -> ('Suruchi', 9876543211, 'Sales', 'F', 90000, 18000, 72000, 7200, 82800, '2020-11-04');
select *  from employee_payroll;

#uc11
create table payroll_details(
    -> payroll_id int not null auto_increment,
    -> basic_pay double not null,
    -> deductions double not null,
    -> taxable_pay double not null,
    -> income_tax double not null,
    -> net_pay double not null,
    -> employee_id int not null,
    -> primary key (payroll_id)
    -> );

create table employee_payroll(
    -> department_id int not null auto_increment,
    -> department_name varchar(30) not null,
    -> employee_id int not null,
    -> primary key (department_id)
    -> );

alter table employee_payroll
    -> add column department_id int not null;

alter table payroll_details
    -> add foreign key(employee_id) references employee_payroll(id);

alter table department
    -> add foreign key(employee_id) references employee_payroll(id);

#uc12
select avg(salary) from employee_payroll where gender='F';
select gender, avg(salary) from employee_payroll group by gender;
select gender, sum(salary) from employee_payroll group by gender;
select gender, min(salary) from employee_payroll group by gender;
select gender, max(salary) from employee_payroll group by gender;
select count(*) from employee_payroll;
select gender, count(*) from employee_payroll group by gender;
