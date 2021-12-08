create procedure insert_personal_files(name varchar(30), secname varchar(40), surname varchar(40), -- Процедура для добавления добавления данных в personal_files
                                       pass_num integer, pass_ser integer, tel_num varchar(50),
                                       email varchar(255), date_of_birth TIMESTAMP)
    LANGUAGE plpgsql
as
$$
begin
    IF (tel_num similar to '+7(___)___-__-__') THEN
        INSERT INTO personal_files("name", "surname", "secname", "tel_num", "pass_num", "pass_ser", "email",
                                   "date_of_birth")
        VALUES (name, surname, secname, tel_num, pass_num, pass_ser, email, date_of_birth);
    ELSE
        raise warning 'телефон(%) имеет неверный формат', tel_num;
    END IF;
end;
$$;

-- СОТРУДНИКИ
create procedure insert_staff(FK_personal_files integer, FK_position integer) -- Процедура для добавления добавления данных в staff
    language plpgsql
as
$$
begin
    insert into staff("FK_personal_files", "FK_position") values (FK_personal_files, FK_position);
end;
$$;

-- МЕХАНИКИ
create procedure insert_mechanic(FK_staff integer, mec_description varchar) -- Процедура для добавления добавления данных в mechanic
    language plpgsql
as
$$
begin
    insert into mechanics("FK_staff", "mec_description", "mec_creation_date")
    values (FK_staff, mec_description, now()::timestamp);
end;
$$;

-- Уровни
create procedure insert_level(FK_staff integer,
                              level_description varchar) -- Процедура для добавления добавления данных в level
    language plpgsql
as
$$
begin
    insert into levels("FK_staff", "level_description", "level_creation_date")
    values (FK_staff, level_description, now()::timestamp);
end;
$$;

-- Игра
create procedure insert_game(game_name varchar, -- Процедура для добавления добавления данных в game
                             genre varchar,
                             age_limit varchar,
                             release_date TIMESTAMP,
                             budget integer)
    language plpgsql
as
$$
begin
    insert into games("game_name", "genre", "age_limit", "release_date", "budget")
    values (game_name, genre, age_limit, release_date, budget);
end;
$$;

-- game_to_mechanics
create procedure insert_game_to_mechanics(FK_mechanics integer, -- Процедура для добавления добавления данных в game_to_mechanics
                                          FK_game integer)
    language plpgsql
as
$$
begin
    insert into game_to_mechanics("FK_mechanics", "FK_game") values (FK_mechanics, "FK_game");
end;
$$;

-- game_to_levels
create procedure insert_game_to_levels(FK_level integer, -- Процедура для добавления добавления данных в game_to_levels
                                          FK_game integer)
    language plpgsql
as
$$
begin
    insert into game_to_levels("FK_level", "FK_game") values (FK_level, "FK_game");
end;
$$;