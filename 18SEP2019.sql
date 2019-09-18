SELECT P.TEAM_ID, P.BACK_NO, P.PLAYER_NAME, T.TEAM_NAME
FROM PLAYER P, TEAM T
WHERE P.TEAM_ID LIKE T.TEAM_ID
    AND P.POSITION LIKE 'GK'
ORDER BY P.TEAM_ID, P.BACK_NO
;

SELECT P.TEAM_ID, P.BACK_NO, P.PLAYER_NAME, T.TEAM_NAME
FROM PLAYER P JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE P.POSITION LIKE 'GK'
ORDER BY P.TEAM_ID, P.BACK_NO
;

--29. ���� ���̺�� �� ���̺��� ���� �̸��� �Ҽӵ� ���� �̸��� ����Ͻÿ�.
--�� 282P
SELECT P.PLAYER_NAME, T.TEAM_NAME
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
;

--30. �������� �����(GK)�� �����鿡 ���� �����͸� ��ѹ� ������ ����Ͻÿ�.
--�� 286P
SELECT P.BACK_NO, P.POSITION, P.PLAYER_NAME
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
WHERE P.POSITION LIKE 'GK'
ORDER BY P.BACK_NO
;

--31. ���� ���� ���̺��� �̿��� REGION_NAME ������, TEAM_NAME ����, STADUIM_NAME �����, SEAT_COUNT �¼����� ����Ͻÿ�. �� 289P
SELECT T.REGION_NAME ������, T.TEAM_NAME ����, S.STADIUM_NAME �����, S.SEAT_COUNT �¼���
FROM STADIUM S JOIN TEAM T
ON S.STADIUM_ID LIKE T.STADIUM_ID
;

--32. ������ ���� ���� ���̺��� �̿��Ͽ� ������, ������, ������, ����, ������� ����Ͻÿ�. 
--�� 293P
SELECT P.PLAYER_NAME ������, P.POSITION ������, 
    T.REGION_NAME ������, T.TEAM_NAME ����, S.STADIUM_NAME �����
FROM PLAYER P NATURAL JOIN TEAM T 
    NATURAL JOIN STADIUM S
;

SELECT P.PLAYER_NAME ������, P.POSITION ������, 
    T.REGION_NAME ������, T.TEAM_NAME ����, S.STADIUM_NAME �����
FROM PLAYER JOIN TEAM T
    USING(TEAM_ID)
    JOIN STADIUM S
    USING(STADIUM_ID)
;

--33 ������ ���� ���� ���̺��� �̿��Ͽ� ������, ������, ������, ������ ����Ͻÿ�
--��, NATURAL JOIN �� ����Ͻÿ�.

SELECT P.PLAYER_NAME ������, P.POSITION ������, 
        T.REGION_NAME ������, T.TEAM_NAME ����
FROM PLAYER P NATURAL JOIN TEAM T
    NATURAL JOIN STADIUM S
;

--34.  ������ ���� ���� ���̺��� �̿��Ͽ� ������, ������, ������, ����, ������� ����Ͻÿ�. 
--��, USING �� ����Ͻÿ�. 
SELECT P.PLAYER_NAME ������, P.POSITION ������, 
        T.REGION_NAME ������, T.TEAM_NAME ����
FROM PLAYER P JOIN TEAM T
    USING(TEAM_ID)
    JOIN STADIUM S
    USING (STADIUM_ID)
;


--35. ��Ÿ��� ���̺��� Ȩ���� ���� ����嵵 �ִ�. STADIUM ��  TEAM �� JOIN �ϵ�,
--Ȩ���� ���� ������� ������ ���� ����Ͻÿ�.
SELECT S.STADIUM_NAME, S.DDD, S.HOMETEAM_ID
FROM STADIUM S LEFT JOIN TEAM T
    ON S.HOMETEAM_ID LIKE T.TEAM_ID
ORDER BY HOMETEAM_ID;

--36. K���� ������ �߿��� �Ҽ��� �Ｚ�����������(K02) �� �����巡����(K07) ���� ��������
--��� ���� �ʹ�. 
--��) ���տ����ڸ� ����Ͻÿ�.
--�� 333P
SELECT PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
UNION
SELECT PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID LIKE 'K07'
ORDER BY 1;


--37. K���� ������ �߿��� �Ҽ��� �Ｚ�����������(K02) �� �����巡����(K07) ���� ��������
--��� ���� �ʹ�. 
--��) IN �̳� OR �� ����Ͻÿ�.
--�� 333P
SELECT PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID LIKE 'K02' OR TEAM_ID LIKE 'K07';

SELECT PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID IN ('K02','K07');
--38. K ���� �Ҽ� ���� �� �Ｚ������� ���̸鼭 �������� MF�� �ƴ� �������� ����Ͻÿ�
--��) ���տ����ڸ� ����Ͻÿ�.
--�� 339P 
SELECT PLAYER_NAME, POSITION
FROM PLAYER
WHERE TEAM_ID = 'K02'
MINUS
SELECT PLAYER_NAME, POSITION
FROM PLAYER
WHERE POSITION = 'MF'
ORDER BY 2,1;


--39. K ���� �Ҽ� ���� �� �Ｚ������� ���̸鼭 �������� MF�� �ƴ� �������� ����Ͻÿ�
--��) ���տ����ڸ� ������� ���ÿ�.
--�� 339P 
SELECT POSITION, PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
AND POSITION <>'MF'
ORDER BY 1,2;

--40. K ���� �Ҽ� ���� �� �Ｚ������� ���̸鼭 �������� GK��  �������� ����Ͻÿ�
--��) ���տ����ڸ� ����Ͻÿ� 
--�� 341
SELECT POSITION, PLAYER_NAME
FROM PLAYER 
WHERE TEAM_ID LIKE 'K02'
INTERSECT  
SELECT POSITION, PLAYER_NAME
FROM PLAYER
WHERE POSITION LIKE 'GK'
;

--41. K ���� �Ҽ� ���� �� �Ｚ������� ���̸鼭 �������� GK��  �������� ����Ͻÿ�
--��) INNER JOIN�� ����Ͻÿ� 
--�� 341 
SELECT P.POSITION, P.PLAYER_NAME
FROM PLAYER P JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
WHERE P.POSITION LIKE 'GK'
AND T.TEAM_NAME LIKE '�Ｚ%'
ORDER BY 1;

--42. K ���� �Ҽ� ���� �� �Ｚ������� ���̸鼭 �������� GK��  �������� ����Ͻÿ�
--��) IN �� ����Ͻÿ�
--�� 341 
SELECT POSITION, PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
AND POSITION IN ('GK')
ORDER BY 1,2;

--43. K ���� �Ҽ� ���� �� �Ｚ������� ���̸鼭 �������� GK��  �������� ����Ͻÿ�
--��) SUBQUERY �� ����Ͻÿ�
--�� 342
SELECT POSITION, PLAYER_NAME
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
AND PLAYER_ID IN (SELECT PLAYER_ID
                    FROM PLAYER
                    WHERE POSITION LIKE 'GK')
ORDER BY 1,2;

--46. ������ ������ �Ҽӵ� ���� �������� ������, ������, ��ѹ��� ����Ͻÿ�. ( �������� ��� )
--�� 357P
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
WHERE TEAM_ID LIKE (SELECT TEAM_ID
                FROM PLAYER
                WHERE PLAYER_NAME LIKE '������');

--47. �������� ���Ű���� ���� �������� ������, ������, ��ѹ��� ����Ͻÿ�. ( �������� ��� )
--�� 359P
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
        WHERE HEIGHT <= (SELECT AVG(HEIGHT)
        FROM PLAYER)
ORDER BY PLAYER_NAME;

--48. �Ҽ������� Ű�� ���� ���� ������� �����̵�, ������, ������, ��ѹ�, Ű �� ����Ͻÿ� ( �������� ���)
--�� 361P
SELECT PLAYER_NAME, POSITION, BACK_NO, HEIGHT
FROM PLAYER
    WHERE (TEAM_ID, HEIGHT) IN
    (SELECT TEAM_ID, MIN(HEIGHT)
    FROM PLAYER
    GROUP BY TEAM_ID)
ORDER BY TEAM_ID,PLAYER_NAME;

--49. ���� �ڽ��� ���� ���� ��� Ű���� ���� �������� 
--����, ������, ������, ��ѹ�, Ű �� ����Ͻÿ�. ( �������� )
--�� 362P
SELECT T.TEAM_NAME ����, M.PLAYER_NAME ������, M.POSITION ������, 
       M.BACK_NO ��ѹ�, M.HEIGHT Ű
FROM PLAYER M JOIN TEAM T
    ON M.TEAM_ID LIKE T.TEAM_ID
WHERE M.HEIGHT < (SELECT AVG(S.HEIGHT)
                  FROM PLAYER S
                  WHERE S.TEAM_ID LIKE M.TEAM_ID
                    AND S.HEIGHT IS NOT NULL
                  GROUP BY S.TEAM_ID)
ORDER BY 2;

--��Ÿ
SELECT T.TEAM_NAME ���̸� , ROUND(AVG(S.HEIGHT),2)���Ű
FROM PLAYER S JOIN TEAM T
    ON S.TEAM_ID LIKE T.TEAM_ID
WHERE S.HEIGHT IS NOT NULL
GROUP BY S.TEAM_ID, T.TEAM_NAME;
                  
--50. ������ �Ҽ����� ���Ű�� ����Ͻÿ�. ( ��Į�� ��� )
--�� 364P
SELECT PLAYER_NAME ������, HEIGHT Ű,
      ROUND((SELECT AVG(HEIGHT)
               FROM PLAYER X
               WHERE X.TEAM_ID LIKE P.TEAM_ID),2)�����Ű 
FROM PLAYER P;

--51. ������ �� �������� �̵��ʴ� (MF) �� �������� 
--�Ҽ� ����, ������, ��ѹ��� ����Ͻÿ� ( �ζ��κ� ��� )
--�� 364P
SELECT T.TEAM_NAME ����, P.PLAYER_NAME ������, P.BACK_NO ��ѹ�
FROM(SELECT TEAM_ID, PLAYER_NAME, BACK_NO 
    FROM PLAYER 
    WHERE POSITION LIKE 'MF')P,
    TEAM T
WHERE P.TEAM_ID LIKE T.TEAM_ID
ORDER BY ������;

--52. ��ü ������ �߿��� Ű�� NULL �� �ƴ� ������ Ű������ ������ ��, 
--���� Ű�� ū ���� 5���� ������, ������, ��ѹ�, Ű�� ����Ͻÿ�. ( �ζ��κ� ��� )
--�� 365P
SELECT PLAYER_NAME, POSITION, BACK_NO, HEIGHT
FROM (SELECT PLAYER_NAME, POSITION, BACK_NO, HEIGHT
        FROM PLAYER
        WHERE HEIGHT IS NOT NULL
        ORDER BY HEIGHT DESC)
WHERE ROWNUM <=5;


--53. ���Ű�� �Ｚ �������(K02) ���� ���Ű���� ���� ���� 
--�����̵�� ���̸��� �ش� ���� ���Ű�� ����Ͻÿ�.
--�� 366P
SELECT T.TEAM_ID, T.TEAM_NAME, AVG(P.HEIGHT)
FROM TEAM T JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
GROUP BY P.TEAM_ID, T.TEAM_NAME
HAVING AVG(P.HEIGHT) < (SELECT AVG(HEIGHT)
                            FROM PLAYER
                            WHERE TEAM_ID LIKE 'K02');
