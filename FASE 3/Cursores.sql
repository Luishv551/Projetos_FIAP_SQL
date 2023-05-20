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

--Realizando a mesma tarefa
SET SERVEROUTPUT ON

DECLARE
  emprec emp%rowtype;

BEGIN
SELECT *
  INTO emprec
  FROM emp
 WHERE empno = 7839;
 dbms_output.put_line('Codigo   = ' || emprec.empno);
 dbms_output.put_line('Nome     = ' || emprec.ename);
 dbms_output.put_line('Cargo    = ' || emprec.job);
 dbms_output.put_line('Gerente  = ' || emprec.mgr);
 dbms_output.put_line('Data     = ' || emprec.hiredate);
 dbms_output.put_line('Sala     = ' || emprec.sal);
 dbms_output.put_line('Comissao = ' || emprec.comm);
 dbms_output.put_line('Depart.  = ' || emprec.deptno);  
END;
/

BEGIN
   DELETE FROM emp
   WHERE deptno = 10;
   dbms_output.put_line('Linhas apagadas = ' || SQL%ROWCOUNT);
   ROLLBACK;
END;
/

--Utilização de Cursor Explicito
DECLARE   
  CURSOR cursor_emp IS 
         SELECT deptno, SUM(sal)             
         FROM emp        
      GROUP BY deptno;
BEGIN
   OPEN cursor_emp;
END;
/

--Exemplo de cursor explicito com FETCH

DECLARE
  emprec emp%rowtype; --Aqui ele vai pegar todos os nomes das colunas e tipos na tabela emp  
  CURSOR cursor_emp IS --declarando o cursor
         SELECT deptno, SUM(sal)             
          FROM emp        
        GROUP BY deptno;
BEGIN
   OPEN cursor_emp; --chamando o cursor
   LOOP --Iniciando um loop simples, caso contrario so vai apresentar uma linha
      FETCH cursor_emp INTO emprec.deptno, emprec.sal; --usando o FETCH para inserir os dados que o cursor retorna, dentron das variaveis.
      EXIT WHEN cursor_emp%notfound;
      dbms_output.put_line
        ('Departamento: ' || emprec.deptno);
      dbms_output.put_line
        ('Salario     : ' || emprec.sal);
   END LOOP;
END;
/

--Mesmo exemplo mas agora com fechamento de cursor.
DECLARE
  emprec emp%rowtype;   
  CURSOR cursor_emp IS 
         SELECT deptno, SUM(sal)             
          FROM emp        
        GROUP BY deptno;
BEGIN
   OPEN cursor_emp;
   LOOP
      FETCH cursor_emp INTO emprec.deptno, emprec.sal;
      EXIT WHEN cursor_emp%notfound;
      dbms_output.put_line
        ('Departamento: ' || emprec.deptno);
      dbms_output.put_line
        ('Salario     : ' || emprec.sal);
   END LOOP;
   CLOSE cursor_emp;
END;
/




