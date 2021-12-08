create or replace view otch_gamedev ("ФИО", "механика", "Название игры") --Виртуальная таблица с отчетом геймдизайнера
as
select pf.name || ' ' || pf.surname || ' ' || pf.secname as FIO,
       mc.mec_description,
       game_name
from mechanics mc
         inner join (staff inner join personal_files pf on pf.id = staff."FK_personal_files")
                    on staff."staff_PK" = mc."FK_staff"
         inner join (game_to_mechanics inner join games game on game_to_mechanics."FK_game" = game."game_PK")
                    on game_to_mechanics."FK_mechanics" = mc."mechanics_PK";


create or replace view otch_leveldesign ("ФИО", "Уровень", "Название игры") --Виртуальная таблица с отчетом левелдизайнера
as
select pf.name || ' ' || pf.surname || ' ' || lvl.level_description, lvl.level_description, game_name
from levels lvl
         inner join (staff inner join personal_files pf on pf.id = staff."FK_personal_files")
                    on staff."staff_PK" = lvl."FK_staff"
         inner join (game_to_levels inner join games game on game_to_levels."FK_game" = game."game_PK")
                    on game_to_levels."FK_level" = lvl."level_PK";
