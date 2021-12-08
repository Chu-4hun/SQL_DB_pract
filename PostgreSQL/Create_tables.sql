CREATE TABLE personal_files -- Таблица с персональными данными
(
    "id"          serial       NOT NULL
        constraint "personal_files_PK" PRIMARY KEY,
    "name"        varchar(30)  NOT NULL,
    "secname"     varchar(40)  NOT NULL,
    "surname"     varchar(40)  DEFAULT '-',
    "pass_num"    integer      NOT NULL check ("pass_num" < 4),
    "pass_ser"    integer      NOT NULL check ("pass_ser" < 4),
    "tel_num"     varchar(50)  NOT NULL check ("tel_num" similar to '+7(___)___-__-__'), --провекрка корректности телефона
    "email"       varchar(255) NOT NULL check
        (email similar to '%@%.%') default ('@.'),
    date_of_birth TIMESTAMP    NOT NULL
);

CREATE TABLE positions ( -- Таблица с должностями
	"position_PK" serial NOT NULL,
	"salary" integer NOT NULL,
	"pos_name" varchar NOT NULL,
	CONSTRAINT "positions_pk" PRIMARY KEY ("position_PK")
);

CREATE TABLE staff -- Таблица отношения positions к personal_files
(
    "staff_PK"          serial  NOT NULL,
    "FK_personal_files" integer NOT NULL references "personal_files" ("id"),
    "FK_position"       integer NOT NULL references "positions" ("position_PK"),
    CONSTRAINT "staff_pk" PRIMARY KEY ("staff_PK")
);

CREATE TABLE mechanics -- Таблица с механиками
(
    "mechanics_PK"      serial    NOT NULL,
    "FK_staff"          integer   NOT NULL references "staff" ("staff_PK"),
    "mec_description"   varchar   default '-',
    "mec_creation_date" TIMESTAMP NOT NULL,
    CONSTRAINT "mechanics_pk" PRIMARY KEY ("mechanics_PK")
);



CREATE TABLE levels -- Таблица с уровнями
(
    "level_PK"            serial    NOT NULL,
    "FK_staff"            integer   NOT NULL references "staff" ("staff_PK"),
    "level_description"   varchar   NOT NULL,
    "level_creation_date" TIMESTAMP NOT NULL,
    CONSTRAINT "levels_pk" PRIMARY KEY ("level_PK")
);



CREATE TABLE Games -- Таблица играми
(
    "game_PK"      serial    NOT NULL,
    "game_name"    varchar   NOT NULL,
    "genre"        varchar   NOT NULL,
    "age_limit"    varchar   NOT NULL,
    "release_date" TIMESTAMP NOT NULL,
    "budget"       integer   NOT NULL,
    CONSTRAINT "Games_pk" PRIMARY KEY ("game_PK")
);



CREATE TABLE game_to_mechanics -- Таблица отношения игры к механикам
(
    "FK_mechanics" integer NOT NULL references "mechanics" ("mechanics_PK"),
    "FK_game"      integer NOT NULL references "games" ("game_PK")
);



CREATE TABLE game_to_levels -- Таблица отношения игры к уровням
(
    "FK_level" integer NOT NULL references "levels" ("level_PK"),
    "FK_game"  integer NOT NULL references "games" ("game_PK")
);



