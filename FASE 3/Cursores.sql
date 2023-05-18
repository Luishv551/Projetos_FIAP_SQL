--Consultando todas as colunas da tabela para o funcionario 7839

SET SERVEROUTPUT ON

DECLARE
  v_empno    emp.empno%TYPE;
  v_ename    emp.ename%TYPE;
  v_job      emp.job%TYPE;
  v_mgr      emp.mgr%TYPE;
  v_hiredate emp.hiredate%TYPE;
  v_sal      emp.sal%TYPE;
  v_comm     emp.comm%TYPE;
  v_deptno   emp.deptno%TYPE;

BEGIN
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
  INTO v_empno, v_ename, v_job, v_mgr, v_hiredate, v_sal, v_comm, v_deptno
  FROM emp
 WHERE empno = 7839;
 dbms_output.put_line('Codigo   = ' || v_empno);
 dbms_output.put_line('Nome     = ' || v_ename);
 dbms_output.put_line('Cargo    = ' || v_job);
 dbms_output.put_line('Gerente  = ' || v_mgr);
 dbms_output.put_line('Data     = ' || v_hiredate);
 dbms_output.put_line('Sala     = ' || v_sal);
 dbms_output.put_line('Comissao = ' || v_comm);
 dbms_output.put_line('Depart.  = ' || v_deptno);  
END;
/




