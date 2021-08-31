>>invoke ABTEIL;
-- Definition of table \DACOS4.$DATA4.S350BAE.ABTEIL
-- Definition current at 11:33:06 - 09/14/20
  (
    ABTEILUNG_ID                   PIC 9(04) DEFAULT SYSTEM NOT NULL
	-- ID отдела (Primary key)
  , ABTEILUNG_NAME                 VARCHAR(100) DEFAULT SYSTEM NOT NULL
	-- Название отдела
  , PRAEMIE                        PIC 9(03) DEFAULT SYSTEM NOT NULL
	-- Процент премии, добавляемый к окладу каждому сотруднику отдела
  )

>> invoke ARBEITER;
-- Definition of table \DACOS4.$DATA4.S350BAE.ARBEITER
-- Definition current at 11:35:30 - 09/14/20
  (
    ARBEITER_ID                    PIC 9(06) DEFAULT SYSTEM NOT NULL
	-- ID сотрудника (Primary key)
  , ABTEILUNG_ID                   PIC 9(04) DEFAULT SYSTEM NOT NULL
	-- ID отдела, в котором работает сотрудник (foreign key)
  , CHIEF_ID                       PIC 9(06) DEFAULT SYSTEM NOT NULL
	-- ID непосредственного начальника сотрудника в этой же таблице.
	-- Если начальника нет, равен 0
  , FAMILIE                        VARCHAR(100) DEFAULT SYSTEM NOT NULL
	-- Фамилия сотрудника
  , NAME                           VARCHAR(100) DEFAULT SYSTEM NOT NULL
	-- Имя сотрудник
  , SALARY                         PIC 99999V9 DEFAULT SYSTEM NOT NULL
	-- Оклад
  , EINSTELL_DATUM                 DATETIME YEAR TO DAY DEFAULT SYSTEM NOT NULL
	-- Дата приема на работу
  )