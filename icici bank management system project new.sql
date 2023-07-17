create database icic ;
use icic ;



create table Account_type (
							Account_no int, 
                            Type_Account varchar (20), 
							Manager_id int, 
                            Department_name varchar (20), 
                            Opening_Date date, 
                            primary key (Account_no)
                            ) ;



use icic ;
use account_type ;
select * from account_type ;
insert into account_type (account_no, Type_account, Manager_id, Department_name, Opening_date)
values (12345,'Saving',20,'Account','2003-04-23'),
(67899,'loan',21,'Loan','2004-05-24'),
(10112,'Saving',22,'HR','2006-01-04'),
(13145,'loan',23,'Admin','2003-04-23'),
(15167,'current',24,'Sales','2004-05-24'),
(18190,'business',25,'Security','2006-01-04'),
(20210,'Loan',26,'Account','2003-04-23'),
(22230,'Saving',27,'Loan','2004-05-24'),
(24250,'Loan',28,'HR','2006-01-04'),
(26270,'current',29,'Admin','2003-04-23');

desc account_type ;


create table Department (
						Department_id int, 
                        Department_name varchar (30), 
						Manager_id int, 
                        Employee_id int, 
						Account_no int,
                        primary key (Department_id),
						foreign key (Account_no) references account_type(Account_no) 
                        on delete cascade) ;

select * from department ;
insert into department (department_id, department_name, manager_id, employee_id, account_no)
values (1,'Account',20,'50','12345'),
(8,'Loan',21,'51','67899'),
(11,'HR',22,'52','10112'),
(16,'Admin',23,'53','13145'),
(19,'Sales',24,'54','15167'),
(21,'Security',25,'55','18190');




create table bank_details (Branch_code int, Address varchar (20),  
Branch_name varchar (20), State varchar (20), department_id int,
primary key (Branch_code),
foreign key (department_id) references department (department_id) ON DELETE CASCADE) ;

select * from bank_details ;
insert into bank_details (Branch_code, address, Branch_name, State, Department_id)
values (100,'Nagpur','ICIC_N','Maharashtra',1),
(101,'pune','ICIC_P','Maharashtra',1),
(102,'Mumbai','ICIC_M','Maharashtra',1),
(103,'delhi','ICIC_D','Delhi',1),
(104,'Mumbai','ICIC_M','Maharashtra',1),
(105,'delhi','ICIC_D','Delhi',1),
(106,'Nagpur','ICIC_N','Maharashtra',1),
(107,'pune','ICIC_P','Maharashtra',8),
(108,'Mumbai','ICIC_M','Maharashtra',8),
(109,'Nagpur','ICIC_N','Maharashtra',8),
(110,'pune','ICIC_N','Maharashtra',11),
(111,'Mumbai','ICIC_N','Maharashtra',11),
(112,'delhi','ICIC_N','Delhi',11),
(113,'Nagpur','ICIC_N','Maharashtra',11),
(114,'pune','ICIC_N','Maharashtra',11),
(115,'Mumbai','ICIC_N','Maharashtra',16),
(116,'Nagpur','ICIC_N','Maharashtra',16),
(117,'pune','ICIC_N','Maharashtra',16),
(118,'Mumbai','ICIC_N','Maharashtra',19),
(119,'delhi','ICIC_N','Delhi',19),
(120,'pune','ICIC_N','Maharashtra',21);




create table job_details (
Job_id varchar (20),
Department_id int,
Branch_code int,
primary key (job_id),
foreign key (Department_id) references department (Department_id) on delete cascade,
foreign key (Branch_code) references bank_details (Branch_code) on delete cascade
);



select * from job_details ;
insert into job_details (job_id,Department_id,Branch_code)
values 
('ST_CLERK', 1, 101),
('ST_MAN', 8, 108),
('FI_ACCOUNT', 11, 113),
('SA_REP', 19, 118);







create table Employees (
Employee_id int, 
First_name varchar (20), 
Department_id int, 
Manager_id int, 
Job_id varchar (20), 
Email varchar (20), 
Hire_Date date,
Phone_no varchar (20), 
Salary int, 
primary key (Employee_id), 
foreign key (department_id) references department (department_id) on delete cascade, 
foreign key (Job_id) references job_details (job_id) on delete cascade ) ;

select * from employees ;
insert into employees (EMployee_id, First_name, Department_id, Manager_id, Job_id, EMail, Hire_date, Phone_no, Salary)
values 
(50,'Samuel',1,20,'ST_CLERK','SMCCAIN','2007-11-23','650.505.1876',3800),
(51,'Allan',8,21,'ST_CLERK','SSEWALL','2004-01-30','650.505.2876',3600),
(52,'Irene',11,22,'ST_CLERK','SSTILES','2004-03-04','650.505.3876',2900),
(53,'Kevin',16,23,'ST_CLERK','STOBIAS','2004-08-01','650.505.4876',2500),
(54,'Julia',19,24,'ST_CLERK','SVOLLMAN','2005-03-10','650.501.1876',4000),
(55,'Donald',21,25,'ST_CLERK','TFOX','2005-12-15','650.501.2876',3900),
(56,'Christopher',1,26,'ST_CLERK','TGATES','2006-11-03','650.501.3876',3200),
(57,'TJ',8,27,'ST_MAN','TJOLSON','2005-11-11','650.501.4876',2800),
(58,'Lisa',11,28,'ST_MAN','TRAJS','2007-03-19','650.507.9811',3100),
(59,'Karen',16,29,'ST_MAN','VJONES','2008-01-24','650.507.9822',3000),
(60,'Valli',19,30,'ST_MAN','VPATABAL','2008-02-23','650.507.9833',2600),
(61,'Joshua',21,31,'ST_MAN','WGIETZ','2003-05-01','650.507.9844',6400),
(62,'Randall',1,32,'FI_ACCOUNT','WSMITH','2005-10-10','515.123.4444',6200),
(63,'Hazel',8,33,'FI_ACCOUNT','WTAYLOR','2007-11-16','515.123.5555',11500),
(64,'Luis',11,34,'FI_ACCOUNT','JNAYER','2005-07-16','603.123.6666',10000),
(65,'Trenna',16,35,'FI_ACCOUNT','JPATEL','2006-09-28','515.123.7777',9600),
(66,'Den',19,36,'FI_ACCOUNT','JRUSSEL','2007-01-14','515.123.8888',7400),
(67,'Michael',21,37,'SA_REP','JSEO','2008-03-08','515.123.8080',7300),
(68,'John',1,38,'SA_REP','JTAYLOR','2005-08-20','011.44.1346.329268',6100),
(69,'Nandita',8,39,'SA_REP','JWHALEN','2005-10-30','011.44.1346.529268',11000),
(70,'Ismael',11,40,'SA_REP','KCHUNG','2005-02-16','011.44.1346.52',8800);





create table Customer (
Account_No int, 
First_Name varchar (20), 
City varchar (20), 
Branch_code int, 
Employee_id int,
Phone_no varchar (20),
ATM_no int unique,
Exp_date date,
Pin_No int unique,
primary key (Account_no),
foreign key (Branch_code) references bank_details (Branch_code) on delete cascade,
foreign key (Employee_id) references Employees (Employee_id) on delete cascade
);



select * from customer ;
insert into customer (Account_no,First_name,City,Branch_code,Employee_id,Phone_no,ATM_no,Exp_date,Pin_no)
values (12345,'Samuel','Nagpur',100,50,'650.505.1876',423705689,'2006-04-23',5689),
(67899,'Allan','pune',101,51,'650.505.2876',423568971,'2007-05-24',8971),
(10112,'Irene','Mumbai',102,52,'650.505.3876',423432253,'2008-01-04',12253),
(13145,'Kevin','delhi',103,53,'650.505.4876',423295535,'2006-01-24',15535),
(15167,'Julia','Mumbai',104,54,'650.501.1876',423158817,'2006-02-23',18817),
(18190,'Donald','delhi',105,55,'650.501.2876',423022099,'2007-06-21',22099),
(20210,'Christopher','Nagpur',106,56,'650.501.3876',422885381,'2008-02-03',25381),
(22230,'TJ','pune',107,57,'650.501.4876',422748663,'2004-01-27',28663),
(24250,'Lisa','Mumbai',108,58,'650.507.9811',422611945,'2005-02-20',31945),
(26270,'Karen','Nagpur',109,59,'650.507.9822',422475227,'2006-06-24',35227),
(28290,'Valli','pune',110,60,'650.507.9833',422338509,'2007-02-07',38509),
(30310,'Joshua','Mumbai',111,61,'650.507.9844',422201791,'2008-01-13',41791),
(32330,'Randall','delhi',112,62,'515.123.4444',422065073,'2003-09-17',45073),
(34350,'Hazel','Nagpur',113,63,'515.123.5555',421928355,'2004-02-17',48355),
(36370,'Luis','pune',114,64,'603.123.6666',421791637,'2005-08-17',51637),
(38390,'Trenna','Mumbai',115,65,'515.123.7777',421654919,'2002-06-07',54919),
(40410,'Den','Nagpur',116,66,'515.123.8888',421518201,'2002-06-07',58201),
(42430,'Michael','pune',117,67,'515.123.8080',421381483,'2002-06-07',61483),
(44450,'John','Mumbai',118,68,'011.44.1346.329268',421244765,'2002-06-07',64765),
(46470,'Nandita','delhi',119,69,'011.44.1346.529268',421108047,'2008-04-21',68047),
(48490,'Ismael','Pune',120,70,'011.44.1346.52',420971329,'2005-03-11',71329);




#query 1
select first_name, employee_id from employees where department_id in 
(select department_id from bank_details where employee_id = 52 and branch_name = 'icic_p') ;

select * from employees ;
select * from department ;
select * from customer ;

#query 2 
#Count the number of employees working in the loan department and show its opening dates and address.

SELECT COUNT(e.employee_id)as count,acc.opening_date,bd.address,e.First_name, e.department_id
from employees as e 
inner join account_type as acc on e.manager_id = acc.Manager_id
inner join bank_details as bd on e.department_id = bd.department_id
inner join department as d on e.department_id = d.department_id
where d.department_name = "loan"
group by acc.Opening_Date,bd.address,e.First_name,e.Department_id;


#query 3
# Find details department name, address, branch code, dept _id, city of 
# the account no 18190

select d.department_name,bd.address,c.branch_code,d.department_id,c.city 
from department as d
inner join bank_details as bd on bd.department_id = d.department_id
inner join customer as c on bd.branch_code = c.branch_code
where c.account_no = 18190;

#query 4
# Find department id, department name, job id whose only work in Loan, HR, admin.

use icic;
SELECT department.department_id, department.department_name, employees.job_id FROM department
JOIN employees ON department.department_id = employees.department_id
WHERE employees.job_id IN ('Loan', 'HR', 'Admin');


# query 5

SELECT A.TYPE_ACCOUNT, C.ATM_NO FROM ACCOUNT_TYPE AS A INNER JOIN CUSTOMER AS C ON A.ACCOUNT_NO = C.ACCOUNT_NO
 WHERE ATM_NO = 422748663;
 
 
 # query 6
 
 select bd.address ,bd.branch_name , d.department_name,c.phone_no from bank_details as bd , department as d,
customer as c;

# query 7

select c.city,d.department_name, acc.opening_date from customer as c ,department as d , account_type as acc
where acc.opening_date = "2004-05-24";


# query 8

select e.job_id from employees e; 


# query 9

SELECT * FROM CUSTOMER;
 UPDATE customer 
 set ATM_no = 42321992
 where Account_no = 13145;


# query 10
















UPDATE account_type
SET account = 'admin', type = 'saving'
WHERE account = 'sales';









