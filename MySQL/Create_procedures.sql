DELIMITER //
create procedure insert_personal_files(name_in varchar(30), secname_in varchar(40),
                                       surname_in varchar(40), # Процедура для добавления добавления данных в personal_files
                                       pass_num_in integer, pass_ser_in integer,
                                       tel_num_in varchar(50),
                                       email_in varchar(255), date_of_birth_in TIMESTAMP)
begin
    IF (tel_num_in like '+7(___)___-__-__') THEN
        INSERT INTO personal_files(personal_files.name, personal_files.surname, personal_files.secname,
                                   personal_files.tel_num, personal_files.pass_num, personal_files.pass_ser,
                                   personal_files.email,
                                   personal_files.date_of_birth)
        VALUES (name_in, surname_in, secname_in, tel_num_in, pass_num_in, pass_ser_in, email_in, date_of_birth_in);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'телефон имеет неверный формат';
    END IF;
end//

# СОТРУДНИКИ
create procedure insert_staff(FK_personal_file_in integer, FK_pos_in integer) # Процедура для добавления добавления данных в staff


begin
    insert into staff(staff.FK_personal_files, staff.FK_position) values (FK_personal_file_in, FK_pos_in);
end;
//

# МЕХАНИКИ
create procedure insert_mechanic(FK_staff_in integer, mec_description_in varchar(255)) # Процедура для добавления добавления данных в mechanic


begin
    insert into mechanics(mechanics.FK_staff, mechanics.mec_description, mechanics.mec_creation_date)
    values (FK_staff_in, mec_description_in, NOW());
end//

# Уровни
create procedure insert_level(FK_staff_in integer,
                              level_description_in varchar(255)) # Процедура для добавления добавления данных в level
begin
    insert into levels(levels.FK_staff, levels.level_description, levels.level_creation_date)
    values (FK_staff_in, level_description_in, NOW());
end//



# Игра
create procedure insert_game(game_name_in varchar(255),
                             genre_in varchar(255),
                             age_limit_in varchar(255),
                             release_date_in TIMESTAMP,
                             budget_in integer)# Процедура для добавления добавления данных в game
begin
    insert into games(games.game_name, games.genre, games.age_limit, games.release_date, games.budget)
    values (game_name_in, genre_in, age_limit_in, release_date_in, budget_in);
end//



# game_to_mechanics
create procedure insert_game_to_mechanics(FK_mechanics_in integer, # Процедура для добавления добавления данных в game_to_mechanics
                                          FK_game_in integer)
begin
    insert into game_to_mechanics(game_to_mechanics.FK_mechanics, game_to_mechanics.FK_game) values (FK_mechanics_in, FK_game_in);
end//



# game_to_levels
create procedure insert_game_to_levels(FK_level_in integer, # Процедура для добавления добавления данных в game_to_levels
                                       FK_game_in integer)
begin
    insert into game_to_levels(game_to_levels.FK_level, game_to_levels.FK_game) values (FK_level_in, FK_game_in);
end//
DELIMITER ;