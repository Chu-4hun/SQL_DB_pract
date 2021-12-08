create or replace view otch_gamedev #Виртуальная таблица с отчетом геймдизайнера
as
select (pf.name || ' ' || pf.surname || ' ' || pf.secname ) as FIO ,
       mc.mec_description as Mechacic,
       game_name as Game_name
from mechanics mc
         inner join (staff inner join personal_files pf on pf.id = staff.FK_personal_files)
                    on staff.staff_PK = mc.FK_staff
         inner join (game_to_mechanics inner join games game on game_to_mechanics.FK_game = game.game_PK)
                    on game_to_mechanics.FK_mechanics = mc.mechanics_PK;


create or replace view otch_leveldesign #Виртуальная таблица с отчетом левелдизайнера
as
select (pf.name || ' ' || pf.surname || ' ' || lvl.level_description) as FIO,
       lvl.level_description as Mechacic
       , game_name as Game_name
from levels lvl
         inner join (staff inner join personal_files pf on pf.id = staff.FK_personal_files)
                    on staff.staff_PK = lvl.FK_staff
         inner join (game_to_levels inner join games game on game_to_levels.FK_game = game.game_PK)
                    on game_to_levels.FK_level = lvl.level_PK;
