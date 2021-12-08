DELIMITER //
CREATE FUNCTION salary_for_period(employee_id integer, start_period TIMESTAMP, end_period TIMESTAMP) RETURNS integer -- Функция для расчета зарплаты

reads sql data 
BEGIN
	  IF(start_period>end_period) THEN
	  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Конечный период для расчёта меньше начального';
	  END IF;

	  IF(not exists(select 1 from staff where staff.staff_PK=employee_id)) THEN
	  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Данного сотрудника нет в базе';
	  END IF;

      RETURN
	  extract(day from end_period-start_period) *
	  (select positions.salary from  staff inner join positions on staff.FK_position = positions.position_PK) *
	  0.87;
END//

create function how_many_game_have_mech(FK_mechanics integer) returns int -- Функция на подсчет количества игр с указанной механикой
    
reads sql data
begin
    return (select count(*) from game_to_mechanics where game_to_mechanics.FK_mechanics = FK_mechanics);
end//
DELIMITER ;