select * from departments;
select * from employees;
select * from locations;

select * from hr.employees

select employee_id, first_name, employees.department_id, department_name
	from employees , departments
    where employees.department_id = departments.department_id;
    
    
select employee_id, first_name, employees.department_id, department_name
	from employees join departments
    on employees.department_id = departments.department_id
    
select employee_id, first_name, employees.department_id, department_name
	from employees left join departments
    on employees.department_id = departments.department_id
    
select employee_id, first_name, employees.department_id, department_name
	from employees right join departments -- from employees e right join departments d
    on employees.department_id = departments.department_id -- or on e.department_id = d.department_id 
    
select e.employee_id, e.first_name, m.first_name as ManagerName
	from employees e join employees m
    on e.manager_id = m.employee_id
    
select employee_id , first_name, department_name, street_address, city, state_province
	from employees e join departments d
    on e.department_id = d.department_id
    join locations l on l.location_id = d.location_id;
    