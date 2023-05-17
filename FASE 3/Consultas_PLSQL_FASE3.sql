SET SERVEROUTPUT ON
DECLARE
  v_nome    VARCHAR2(30);
  v_cargo   VARCHAR2(30);
BEGIN
  SELECT ename, job
  INTO v_nome, v_cargo
  FROM emp
  WHERE empno = 7934;
DBMS_OUTPUT.PUT_LINE(v_nome);
DBMS_OUTPUT.PUT_LINE(v_cargo);
END;
/

SET SERVEOUTPUT ON
DECLARE    
  v_soma_sal   NUMBER; 
  v_deptno	 NUMBER NOT NULL := 10;           
BEGIN
  SELECT	SUM(sal)  
  INTO		v_soma_sal
  FROM		emp
  WHERE	deptno = v_deptno;
DBMS_OUTPUT.PUT_LINE('A soma dos sal�rios do departamento ' || v_deptno || ' � ' || v_soma_sal);
END;
/

DECLARE
v_empno NUMBER := 11;
v_ename VARCHAR2(13) := 'SANDRA';
v_job VARCHAR2(13) := 'GERENTE';
v_deptno NUMBER := 10;
BEGIN
   INSERT INTO emp(empno, ename, job, deptno)
          VALUES (v_empno, v_ename, v_job, v_deptno);
END;
/

DECLARE
  v_sal_increase   NUMBER := 2000;
BEGIN
  UPDATE	emp
  SET		sal = sal + v_sal_increase
  WHERE	job = 'ANALYST';
END;
/

DECLARE
  v_deptno   NUMBER := 10;               
BEGIN							
  DELETE FROM   emp
  WHERE         deptno = v_deptno;
END;
/