>>invoke ABTEIL;
-- Definition of table \DACOS4.$DATA4.S350BAE.ABTEIL
-- Definition current at 11:33:06 - 09/14/20
  (
    ABTEILUNG_ID                   PIC 9(04) DEFAULT SYSTEM NOT NULL
	-- ID ������ (Primary key)
  , ABTEILUNG_NAME                 VARCHAR(100) DEFAULT SYSTEM NOT NULL
	-- �������� ������
  , PRAEMIE                        PIC 9(03) DEFAULT SYSTEM NOT NULL
	-- ������� ������, ����������� � ������ ������� ���������� ������
  )

>> invoke ARBEITER;
-- Definition of table \DACOS4.$DATA4.S350BAE.ARBEITER
-- Definition current at 11:35:30 - 09/14/20
  (
    ARBEITER_ID                    PIC 9(06) DEFAULT SYSTEM NOT NULL
	-- ID ���������� (Primary key)
  , ABTEILUNG_ID                   PIC 9(04) DEFAULT SYSTEM NOT NULL
	-- ID ������, � ������� �������� ��������� (foreign key)
  , CHIEF_ID                       PIC 9(06) DEFAULT SYSTEM NOT NULL
	-- ID ����������������� ���������� ���������� � ���� �� �������.
	-- ���� ���������� ���, ����� 0
  , FAMILIE                        VARCHAR(100) DEFAULT SYSTEM NOT NULL
	-- ������� ����������
  , NAME                           VARCHAR(100) DEFAULT SYSTEM NOT NULL
	-- ��� ���������
  , SALARY                         PIC 99999V9 DEFAULT SYSTEM NOT NULL
	-- �����
  , EINSTELL_DATUM                 DATETIME YEAR TO DAY DEFAULT SYSTEM NOT NULL
	-- ���� ������ �� ������
  )