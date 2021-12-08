CREATE OR REPLACE FUNCTION salary_for_period(employee_id integer, start_period TIMESTAMP, end_period TIMESTAMP) RETURNS integer -- Функция для расчета зарплаты
LANGUAGE plpgsql
AS $$
BEGIN
	  IF(start_period>end_period) THEN
	  	raise exception 'Конечный период для расчёта меньше начального';
	  END IF;

	  IF(not exists(select 1 from staff where staff."staff_PK"=employee_id)) THEN
	  	raise exception 'Данного сотрудника нет в базе';
	  END IF;

      RETURN
	  extract(day from end_period-start_period) *
	  (select positions.salary from  staff inner join positions on staff."FK_position" = positions."position_PK") *
	  0.87;
END
$$;

create or replace function how_many_game_has_mechanic(FK_mechanics integer) returns int -- Функция на подсчет количества игр с указанной механикой
    language plpgsql
as
$$
begin
    return (select count(*) from game_to_mechanics where game_to_mechanics."FK_mechanics" = FK_mechanics);
end;
$$;