/*create database P50_6_59_Employee_base;
*/

use P50_6_59_Employee_base;

create table Employee
(
	ID_Employee int not null auto_increment primary key,
    First_name varchar(30) not null,
    Name_Employee varchar(30) not null,
    Middle_name varchar(30) null default '-',
    Employee_Number varchar(16) not null unique check (Employee_Number like '+7(___)___-__-__'),
    Employee_Email varchar (250) null default '@.' check (Employee_Email like '%@%.%')
);

use P50_6_59_Employee_base;
DELIMITER // /* команда начала работы с хранимыми процедурами*/
/**/
create or replace procedure Employee_Update(in p_ID_Employee int, in p_First_Name varchar (30), in p_Name_Employee varchar (30),
in p_Middle_Name varchar (30), in p_Employee_Number varchar (16), in p_Employee_E_Mail varchar (250))
begin
  DECLARE have_record int;
    select count(*) into have_record from Employee
    where First_Name = p_First_Name and Name_Employee = p_Name_Employee and Middle_Name = p_Middle_Name and Employee_Number = p_Employee_Number;
    /* Для присваивания в переиенную значению значения используется конструкция SELECT <присваиваемое значение> INTO <Название переменной> FROM*/
    if have_record>0 then
    select 'Сотрудник с указанными данными уже есть в таблице' as "Error Message";
    else
    update Employee set
    First_Name = p_First_Name,
        Name_Employee = p_Name_Employee,
        Middle_Name = p_Middle_Name,
        Employee_Number = p_Employee_Number
      where
            ID_Employee = p_ID_Employee;
    end if;
end;

use P50_6_59_Employee_base;
DELIMITER //
create or replace procedure Employee_Insert(in p_First_Name varchar (30), in p_Name_Employee varchar (30),
in p_Middle_Name varchar (30), in p_Employee_Number varchar (16), in p_Employee_E_Mail varchar (250))
begin
  DECLARE have_record int;
    select count(*) into have_record from Employee
    where First_Name = p_First_Name and Name_Employee = p_Name_Employee and Middle_Name = p_Middle_Name and Employee_Number = p_Employee_Number;
        if have_record>0 then
    select 'Сотрудник с указанными данными уже есть в таблице' as "Error Message";
    else
    insert into Employee(First_Name, Name_Employe, Middle_Name, Employee_Numbe, Employee_E_Mai)
        values (p_First_Name, p_Name_Employe, p_Middle_Name, p_Employee_Numbe, p_Employee_E_Mai);
    end if;
end;

use P50_6_59_Employee_base;
DELIMITER //
create or replace procedure Employee_Delete(in p_ID_Employee int)
begin
  DECLARE have_record int;
    select count(*) into have_record from Combination
    where Employee_ID = p_ID_Employee;
    if have_record>0 then
    select 'Данного сотрудника нельзя удалить так как он есть в "совместительстве"' as "Error Message";
    else
    delete  from Employee
      where
            ID_Employee = p_ID_Employee;
    end if;
end;


insert into Employee(First_name,Name_Employee,Middle_name,Employee_Number,Employee_Email)
values
('Вова','Афанасьев','Иванович','+7(903)610-11-17','jdjdj@mmm.ru'),
('Денис','Крамышев','Абобов','+7(903)610-11-11','Karam@gg.com'),
('РВРВР','вово','Жижиж','+7(903)610-11-20','Jija@dd.com');
insert into Employee(First_name,Name_Employee,Middle_name,Employee_Number)
values
('Заки','Картов','Глобусов','+7(903)610-11-00'),
('ООО','Моя','Оборона','+7(903)610-11-91'),
('Солнечный','Зайчик','Нечзрячего','+7(903)610-11-44');
insert into Employee(First_name,Name_Employee,Middle_name)
values
('Глаза','ООО','Моя'),
('Оборонааа','Наталья','Генадьевна'),
('Пластмассовый','Мир','Победил');

select * from Employee;


create table Post
(
	ID_Post int not null auto_increment primary key,
    Name_Post varchar(50) not null unique,
    Post_Price decimal(38,2) null default 0.0 check (Post_Price >= 0.0)
);


insert into Post(Name_Post, Post_Price)
values
('Работяга',1111.0),
('Бухгалтер',1001.0),
('Охраник',44411.0);
insert into Post(Name_Post)
values
('Jija');

select * from Post;


use P50_6_59_Employee_base;
DELIMITER // /* команда начала работы с хранимыми процедурами*/
/**/
create or replace procedure Employee_Update(in p_ID_Employee int, in p_First_Name varchar (30), in p_Name_Employee varchar (30),
in p_Middle_Name varchar (30), in p_Employee_Number varchar (16), in p_Employee_E_Mail varchar (250))
begin
  DECLARE have_record int;
    select count(*) into have_record from Employee
    where First_Name = p_First_Name and Name_Employee = p_Name_Employee and Middle_Name = p_Middle_Name and Employee_Number = p_Employee_Number;
    /* Для присваивания в переиенную значению значения используется конструкция SELECT <присваиваемое значение> INTO <Название переменной> FROM*/
    if have_record>0 then
    select 'Сотрудник с указанными данными уже есть в таблице' as "Error Message";
    else
    update Employee set
    First_Name = p_First_Name,
        Name_Employee = p_Name_Employee,
        Middle_Name = p_Middle_Name,
        Employee_Number = p_Employee_Number
      where
            ID_Employee = p_ID_Employee;
    end if;
end;

use P50_6_59_Employee_base;
DELIMITER //
create or replace procedure Employee_Insert(in p_First_Name varchar (30), in p_Name_Employee varchar (30),
in p_Middle_Name varchar (30), in p_Employee_Number varchar (16), in p_Employee_E_Mail varchar (250))
begin
  DECLARE have_record int;
    select count(*) into have_record from Employee
    where First_Name = p_First_Name and Name_Employee = p_Name_Employee and Middle_Name = p_Middle_Name and Employee_Number = p_Employee_Number;
        if have_record>0 then
    select 'Сотрудник с указанными данными уже есть в таблице' as "Error Message";
    else
    insert into Employee(First_Name, Name_Employe, Middle_Name, Employee_Numbe, Employee_E_Mai)
        values (p_First_Name, p_Name_Employe, p_Middle_Name, p_Employee_Numbe, p_Employee_E_Mai);
    end if;
end;

use P50_6_59_Employee_base;
DELIMITER //
create or replace procedure Employee_Delete(in p_ID_Employee int)
begin
  DECLARE have_record int;
    select count(*) into have_record from Combination
    where Employee_ID = p_ID_Employee;
    if have_record>0 then
    select 'Данного сотрудника нельзя удалить так как он есть в "совместительстве"' as "Error Message";
    else
    delete  from Employee
      where
            ID_Employee = p_ID_Employee;
    end if;
end;



create table Combination
(
	ID_Combination int not null auto_increment primary key,
    Employee_ID int not null,
    Post_ID int not null,
    Post_Part decimal(38,1) null default 0.1 check (Post_Part >0.0),
    foreign key(Employee_ID) references Employee(ID_Employee),
    foreign key(Post_ID) references Post (ID_Post)
);
insert into Combination(Employee_ID, Post_ID, Post_Part)
values
(1,2,1.1),
(2,1,1.1),
(1,3,1.1);

select * from Combination

inner join Employee on Employee_ID = ID_Employee inner join Post on Post_ID = ID_Post;


use P50_6_59_Employee_base;
create or replace view Empliyee_Combination
as
select
/*для конкатенации полей используется функция concat([<>,])*/
/*для вывода подстроки используется substring(<string>,<start>,<lenght>)*/
concat(First_Name, ' ', substring(Name_Employee,1,1), '.', substring(Middle_name,1,1),'.') as "Данные сотрудника",
concat('Mобильный телефон', Employee_Number, 'Email', Employee_Email) as "Контактная информация",
concat('Занимаемая должнотсть',Name_Post, 'с окладом: ', cast(Post_Price as varchar(100)),
', Доход состовляет: - Без НДФЛ =',
cast(round(Post_Part * Post_Price ,2) as varchar(100)), 'Руб., с НДФЛ = ',
cast(round(Post_Part * Post_Price*0.87 ,2) as varchar(100)), '.руб' ) as "Данные по должности"


from Combination
inner join Employee on Employee_ID = ID_Employee inner join Post on Post_ID = ID_Post;
select * from Empliyee_Combination

create or replace view Post_statistic
as
select
Name_Post as "Должность",
count(Employee_ID) as "Количество сотрудников"
from Combination inner join Post on Post_ID = ID_Post
group by Name_Post;
select * from Post_statistic;
