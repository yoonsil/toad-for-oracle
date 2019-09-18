--1
SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, 
POSITION, HEIGHT, WEIGHT, BACK_NO
FROM PLAYER
;
--2
SELECT DISTINCT POSITION FROM PLAYER;
--3
SELECT * FROM PLAYER;
--4
SELECT PLAYER_NAME ����, POSITION ��ġ,HEIGHT Ű, WEIGHT ������
FROM PLAYER;
--5
SELECT PLAYER_NAME "���� �̸�", POSITION "�׶��� ������",HEIGHT Ű, WEIGHT ������
FROM PLAYER;
--6
SELECT PLAYER_NAME �����̸�, HEIGHT-WEIGHT "Ű-������"
FROM PLAYER;
--7
SELECT PLAYER_NAME �����̸�, ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),2)
"BMI ������"
FROM PLAYER;
--8
SELECT PLAYER_NAME||'����,'|| HEIGHT||'cm,'||WEIGHT||'kg' ü������
FROM PLAYER;
--9
SELECT PLAYER_NAME 
FROM PLAYER
WHERE POSITION LIKE 'MF' AND HEIGHT BETWEEN 170 AND 180;

--10
SELECT PLAYER_NAME, POSITION, BACK_NO, HEIGHT
FROM PLAYER
WHERE PLAYER_NAME LIKE '��%'
;

--11
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
WHERE POSITION IS NULL
;

--12
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
WHERE TEAM_ID = 'K02'
AND POSITION <> 'MF'
AND HEIGHT NOT BETWEEN 170 AND 180;

--13 ������ �ܱ����� �������� �����̸�, ������ ����Ͻÿ�
SELECT PLAYER_NAME, NATION
FROM PLAYER
WHERE NATION IS NOT NULL;

--14  PLAYER_ID �� �������� ����Ͻÿ�. (�� CONCAT �Լ��� ����Ͻÿ�) 
SELECT CONCAT (PLAYER_ID, PLAYER_NAME)
FROM PLAYER; 

--15. ������� ������ȣ�� ��ȭ��ȣ�� ��ģ ��ȣ�� TEL�̶�� �÷������� , STADIUM_ID �� �Բ� ����Ͻÿ�.
SELECT STADIUM_ID, DDD||'-'||TEL AS TEL
FROM STADIUM;
;
--16. ���� ��¥�� 2019-09-17 ȭ���� �� ����Ͻÿ�.
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD DAY')���ó�¥
FROM DUAL;
;
--17. �����̺��� ZIP �ڵ�1 �� ZIP �ڵ�2 �� ���ڷ� ��ȯ�� ��, �� �׸��� ���� ���ڸ� �����ȣ�� �÷������� ����Ͻÿ�.

SELECT * 
FROM STADIUM
ORDER BY STADIUM_NAME;
--18 ������ �� 180�̻��̸� ���, ���ϸ� �ܽ����� �ؼ�, �̸��� ���� ����Ͻÿ�.
SELECT PLAYER_NAME �̸�,
    CASE WHEN HEIGHT >=180
    THEN ('���')
    ELSE ('�ܽ�')
    END Ű
FROM PLAYER;

--19. ���� ������� ������ �� �������� ������ �������� ������ �������� ǥ���� �� ������� �Բ� ����Ͻÿ�.
SELECT PLAYER_NAME ������,
    CASE WHEN POSITION IS NOT NULL
    THEN ('����')
    ELSE ('����')
    END POSITION
FROM PLAYER;

--20 ��Ÿ��� �̸��� ���������Ͽ� ������ ���� �� ���� 10 ����常 ����Ͻÿ�.
SELECT ROWNUM, T.*
   FROM(SELECT *
    FROM STADIUM
    ORDER BY STADIUM_NAME)T
 WHERE ROWNUM <=10
    ;
--21 k���׿��� �ٴ� �������� �� ���� "��ü �����ο�" , �ִ�Ű, �ּ�Ű, ���Ű�� ����Ͻÿ�.
SELECT COUNT(*) "��ü �����ο�",
    MAX(HEIGHT) �ִ�Ű,
    MIN(HEIGHT) �ּ�Ű,
    ROUND(AVG(HEIGHT),2)���Ű
    FROM PLAYER;

--22. �����Ǻ� �ο���, �ִ�Ű, �ּұ�, ���Ű�� ����Ͻÿ�

SELECT POSITION ������, COUNT(*) �ο���,
    MAX(HEIGHT),
    MIN(HEIGHT),
    ROUND(AVG(HEIGHT),2) ���Ű
FROM PLAYER
GROUP BY POSITION
;

--23. ������ �߿��� ���Ű�� 180 �̻��� �����ǰ� ���Ű�� ����Ͻÿ�.
SELECT POSITION ������, 
ROUND(AVG(HEIGHT),2) ���Ű
FROM PLAYER
GROUP BY POSITION
HAVING AVG (HEIGHT)>=180;

--24. K���� ������ �� �Ｚ �������(K02) �� FC����(K09)�� �ο����� ���ΰ�?
SELECT TEAM_ID ��ID, COUNT(*) �ο���
FROM PLAYER
WHERE TEAM_ID IN ('K02','K09')
GROUP BY TEAM_ID;
;
--25. �����Ǻ� ���Ű�� ����ϴµ�, �ִ�Ű�� 190cm �̻��� ������ ������ �ִ� �����ǰ� ���Ű�� ����Ͻÿ�.
SELECT POSITION, ROUND(AVG(HEIGHT),2) ���Ű
FROM PLAYER
GROUP BY POSITION
HAVING MAX(HEIGHT)>=190;

--26. ���� �����Ǻ� FW, MF, DF, GK �������� �ο����� ���� ��ü �ο����� ����Ͻÿ�.
SELECT TEAM_ID,
NVL(SUM(CASE POSITION WHEN 'FW' THEN '1' END),0) FW,
NVL(SUM(CASE POSITION WHEN 'MF' THEN '1' END),0) MF,
NVL(SUM(CASE POSITION WHEN 'DF' THEN '1' END),0) DF,
NVL(SUM(CASE POSITION WHEN 'GK' THEN '1' END),0) GK,
COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY TEAM_ID;

--27. �������̺��� �������� �̸�, ������, ��ѹ��� ��� �̸� ������������ �����Ͽ� ����Ͻÿ�.
--�� 269P
SELECT PLAYER_NAME �̸�, POSITION ������, BACK_NO
FROM PLAYER
ORDER BY PLAYER_NAME DESC;

--28. �������̺��� �������� �̸�, ������, ��ѹ��� ����ϴµ� �������� ��ѹ� ��������, 
--��ѹ��� ���� ��� ������, �����Ǳ��� ���� ��� ������ ������ ����Ѵ�. 
--��ѹ��� NULL �� ���� �����Ѵ�. 
--�� 272P
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
WHERE BACK_NO IS NOT NULL
ORDER BY BACK_NO DESC, POSITION,PLAYER_NAME;

--29. ���� ���̺�� �� ���̺��� ���� �̸��� �Ҽӵ� ���� �̸��� ����Ͻÿ�.
--�� 282P



--30. �������� �����(GK)�� �����鿡 ���� �����͸� ��ѹ� ������ ����Ͻÿ�.
--�� 286P

