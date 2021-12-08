create table personal_files_history --Таблица для записи истории
(
	"id" SERIAL not null constraint PK_Employee_History primary key,
	"type" varchar not null,
	"employee_info" varchar not null,
	date_create timestamp null default(now()::timestamp)
);

create or replace function fc_History_Insert_Employees() --Функция для добавления данных в таблицу с историей
returns trigger
as $$
	begin
		insert into personal_files_history("type", "employee_info")
		values ('insert',
			  (select personal_files.name ||' '||personal_files.surname||' '||personal_files.secname from personal_files where id = NEW.id));
		return new;
	end;
$$
language plpgsql;

create or replace function fc_History_Update_Employees()--Функция для обновления таблицы с историей
returns trigger
as $$
	begin
		insert into personal_files_history("type", "employee_info")
		values ('update',
			  (select personal_files.name ||' '||personal_files.surname||' '||personal_files.secname from personal_files where id = NEW.id));
		return new;
	end;
$$
language plpgsql;

create or replace function fc_History_Delete_Employees()--Функция для удаления данных в таблице с историей
returns trigger
as $$
	begin
		insert into personal_files_history("type", "employee_info")
		values ('delete',
			  (select personal_files.name ||' '||personal_files.surname||' '||personal_files.secname from personal_files where id = OLD.id));
		return new;
	end;
$$
language plpgsql;

create trigger th_History_Insert_personal_files --Триггер на добавление
after insert on personal_files
for each row
execute procedure fc_History_Insert_Employees();

create trigger th_History_Update_personal_files --Триггер на апдейт
after update on personal_files
for each row
execute procedure fc_History_Update_Employees();

create trigger th_History_Delete_personal_files -- Триггер на удаление
after insert on personal_files
for each row
execute procedure fc_History_Delete_Employees();
