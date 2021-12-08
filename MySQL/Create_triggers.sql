create table personal_files_history #Таблица для записи истории
(
	id int primary key,
	type varchar(255) not null,
	employee_info varchar(255) not null,
	date_create timestamp null default(NOW())
);

DELIMITER //
create PROCEDURE fc_History_Insert_Employees(employ_id_in INT)#Функция для добавления данных в таблицу с историей
BEGIN
	begin
		insert into personal_files_history(personal_files_history.type, employee_info)
		values ('insert',
			  (select name||' '||surname||' '||secname from personal_files where id = employ_id_in));
	end;
END//

create PROCEDURE fc_History_Update_Employees(employ_id_in INT)#Функция для обновления таблицы с историей
BEGIN
	begin
		insert into personal_files_history(type, employee_info)
		values ('update',
			  (select name||' '||surname||' '||secname from personal_files where id = employ_id_in));
	end;
END//

create PROCEDURE fc_History_Delete_Employees(employ_id_in INT)#Функция для удаления данных в таблице с историей
BEGIN
	begin
		insert into personal_files_history(type, employee_info)
		values ('insert',
			  (select name||' '||surname||' '||secname from personal_files where id = employ_id_in));
	end;
END//

create trigger th_History_Insert_Employees #Триггер на добавление
after insert on personal_files
for each row
BEGIN
    CALL fc_History_Insert_Employees (
        NEW.id
    );
END//

create trigger th_History_Update_Employees #Триггер на апдейт
after update on personal_files
for each row
BEGIN
    CALL fc_History_Update_Employees (
        NEW.id
    );
END//

create trigger th_History_Delete_Employees # Триггер на удаление
after delete on personal_files
for each row
BEGIN
    CALL fc_History_Delete_Employees (
        OLD.id
    );
END//

DELIMITER ;