create table final_rating(
userID int not null, 
rating int not null,
food_rating int not null,
service_rating int not null,
primary key (userID)
);

select *
from final_rating;

create table employee(
employee_id serial primary key, 
first_name varchar(50) not null,
last_name varchar(50) not null,
salary int not null,
joining_date date not null,
department varchar(50) not null
);

insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(1, 'Jack', 'Zu',	75000, '2013-01-01', 'MANAGEMENT'), (2, 'Ashley', 'Leach', 90000, '2013-01-01', 'SERVICES'),
(3, 'Amna', 'Robles', 95000, '2013-02-01', 'SERVICES'), (4, 'Martin', 'Mullen', 65000, '2014-02-01', 'BANKING'),
(5, 'Jerry', 'Pinto', 70000, '2015-03-01', 'BANKING'), (6, 'Alex', 'Baran', 80000, '2014-02-01', 'MANAGEMENT'),
(7, 'John', 'Smith', 100000, '2013-01-01', 'DIRECTOR');

select *
from employee;

create table incentive(
emp_ref_id int not null, 
incentive_date date not null,
incentive_amount int not null,
foreign key (emp_ref_id) references employee(employee_id)
);

insert into incentive(emp_ref_id, incentive_date, incentive_amount)
values(7, '2014-02-01', 10000), (2, '2014-02-01', 5000),
(3, '2014-02-01', 4500), (1, '2015-03-01', 4000),
(2, '2015-03-01', 3500);

select *
from incentive;

select employee.first_name, sum(incentive.incentive_amount)
from employee
join incentive on incentive.emp_ref_id = employee.employee_id
group by employee.first_name
having sum(incentive.incentive_amount) > 4200;

select first_name, last_name, joining_date
from employee
order by joining_date DESC;

select employee.first_name, 
employee.last_name, employee.salary, 
incentive.incentive_amount, sum(incentive.incentive_amount
and employee.salary)
from employee
join incentive on incentive.emp_ref_id = employee.employee_id
group by employee.employee_id;

SELECT 
    employee.first_name, 
    employee.last_name, 
    employee.salary, 
    incentive.incentive_amount,
    employee.salary + incentive.incentive_amount AS new_salary
FROM employee
JOIN incentive ON employee.employee_id = incentive.emp_ref_id;