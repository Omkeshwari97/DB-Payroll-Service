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