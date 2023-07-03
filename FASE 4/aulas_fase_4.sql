SELECT object_type, object_name
  FROM user_objects
 WHERE status = 'INVALID'
 ORDER BY object_type, object_name
/

SELECT object_type, object_name
  FROM user_objects
 WHERE status = 'INVALID'
 ORDER BY object_type, object_name
/

SELECT object_type, object_name, 
       last_ddl_time
  FROM user_objects
 WHERE last_ddl_time >= TRUNC (SYSDATE)
 ORDER BY object_type, object_name
/

SELECT name, line, text
  FROM user_source
 WHERE UPPER (text) 
  LIKE '%DEPT%'
 ORDER BY name, line
/

SELECT   object_name, procedure_name,authid
FROM     user_procedures
ORDER BY object_name, procedure_name
/

SELECT *
  FROM user_triggers 
 WHERE triggering_event LIKE '%UPDATE%'
/

"Secelionadno todos os TRIGGERS quando uma operação UPDATE é feita"

CREATE [ OR REPLACE] nome_procedimento
[parâmetro [{in, out, in out}] tipo_parâmetro,
  ...
{IS ou AS}

BEGIN
corpo_do_procedimento
		
END [nome_procedimento];

--EXEMPLO DE PROCEDURE PARA FAZER UM NUMERO AO QUADRADO
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE quadrado
(p_num IN NUMBER :=0)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE (p_num*p_num );
END quadrado;
/

EXECUTE quadrado(5);

CREATE [ OR REPLACE] nome_procedimento
[parâmetro [{in, out, in out}] tipo_parâmetro,
  ...
{IS ou AS}

BEGIN
corpo_do_procedimento
		
END [nome_procedimento];

--EXEMPLO DE PROCEDURE PARA FAZER UM NUMERO AO QUADRADO
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE quadrado
(p_num IN NUMBER :=0)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE (p_num*p_num );
END quadrado;
/

EXECUTE quadrado(5);

CREATE OR REPLACE PROCEDURE reajuste
 (v_codigo_emp IN emp.empno%type,
v_porcentagem IN number)
IS
BEGIN
UPDATE emp
     SET sal = sal + (sal *( v_porcentagem / 100 ) )
WHEREempno = v_codigo_emp;
  COMMIT;
END reajuste;
/

SELECT empno, sal
  FROM emp
 WHERE empno = 7839;

EXECUTE reajuste(7839, 10);

SELECT empno, sal
  FROM emp
 WHERE empno = 7839;
 
 --Exemplo função para descobrir salários

CREATE OR REPLACE FUNCTION descobrir_salario (
   p_id   IN emp.empno%TYPE
) RETURN NUMBER IS
   v_salario   emp.sal%TYPE := 0;
BEGIN
   SELECT  sal
   INTO    v_salario
   FROM    emp
   WHERE   empno = p_id;

   RETURN v_salario;
   
END descobrir_salario;
/

--EXECUTANDO A FUNÇÃO

SELECT empno, descobrir_salario(empno)
FROM   emp;

--EXECUTANDO A FUNÇÃO DENTRO DE UM BLOCO ANONIMO

SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line(descobrir_salario(7900) );
END;
/

--Exemplo função para descobrir salários

CREATE OR REPLACE FUNCTION descobrir_salario (
   p_id   IN emp.empno%TYPE
) RETURN NUMBER IS
   v_salario   emp.sal%TYPE := 0;
BEGIN
   SELECT  sal
   INTO    v_salario
   FROM    emp
   WHERE   empno = p_id;

   RETURN v_salario;
   
END descobrir_salario;
/

--EXECUTANDO A FUNÇÃO

SELECT empno, descobrir_salario(empno)
FROM   emp;

--EXECUTANDO A FUNÇÃO DENTRO DE UM BLOCO ANONIMO

SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line(descobrir_salario(7900) );
END;
/

SET SERVEROUTPUT ON

DECLARE
    conta   NUMBER(7);
BEGIN
    conta := contadept ();
    dbms_output.put_line
       ('Quantidade de Departamentos: ' || conta);
END;
/

CREATE OR REPLACE FUNCTION sal_anual (
   p_sal NUMBER,
   p_comm NUMBER
) RETURN NUMBER
   IS
BEGIN
   RETURN ( p_sal + nvl(p_comm,0) ) * 12;
END sal_anual;
/

--RODANDO
SELECT sal, comm, sal_anual(sal, comm)
FROM emp;

SET SERVEROUTPUT ON

DECLARE
    total   NUMBER(7);
BEGIN
    total := sal_anual(900,100); --ESSES SAO OS PARAMETROS DE ENTRADA
    dbms_output.put_line('Salario anual: ' || total);
END;
/

CREATE OR REPLACE PACKAGE faculdade AS
cnome CONSTANT VARCHAR2(4) := 'FIAP';
cfone CONSTANT VARCHAR2(13) := '(11)3385-8010';
cnota CONSTANT NUMBER(2) := 10;
END faculdade;
/

--UTILIZANDO O PACKAGE FACULDADE:
SET SERVEROUTPUT ON

DECLARE
 melhor VARCHAR2(30);
BEGIN
  melhor := faculdade.cnome || ', a melhor faculdade';
  dbms_output.put_line(melhor);
END;
/

CREATE OR REPLACE PACKAGE faculdade AS
cnome CONSTANT VARCHAR2(4) := 'FIAP';
cfone CONSTANT VARCHAR2(13) := '(11)3385-8010';
cnota CONSTANT NUMBER(2) := 10;
END faculdade;
/

--UTILIZANDO O PACKAGE FACULDADE:
SET SERVEROUTPUT ON

DECLARE
 melhor VARCHAR2(30);
BEGIN
  melhor := faculdade.cnome || ', a melhor faculdade';
  dbms_output.put_line(melhor);
END;
/

CREATE OR REPLACE PACKAGE faculdade AS
cnome CONSTANT VARCHAR2(4) := 'FIAP';
cfone CONSTANT VARCHAR2(13) := '(11)3385-8010';
cnota CONSTANT NUMBER(2) := 10;
END faculdade;
/

--UTILIZANDO O PACKAGE FACULDADE:
SET SERVEROUTPUT ON

DECLARE
 melhor VARCHAR2(30);
BEGIN
  melhor := faculdade.cnome || ', a melhor faculdade';
  dbms_output.put_line(melhor);
END;
/

SET SERVEROUTPUT ON

DECLARE
    v_sal   NUMBER(8,2);
BEGIN
    v_sal := rh.descobrir_salario(7900);
    dbms_output.put_line('Salario atual - ' || v_sal);
    rh.reajuste(7900,faculdade.cnota);
    v_sal := rh.descobrir_salario(7900);
    dbms_output.put_line('Salario atualizado - ' || v_sal);
END;
/

CREATE OR REPLACE PACKAGE BODY rh AS
    CURSOR c_sal RETURN regemp IS 
       SELECT   empno, sal
       FROM      emp
       ORDER BY sal DESC;

    FUNCTION contrata_func (
        v_ename    emp.ename%TYPE,
        v_job      emp.job%TYPE,
        v_mgr      emp.mgr%TYPE,
        v_sal      emp.sal%TYPE,
        v_comm     emp.comm%TYPE,
        v_deptno   emp.deptno%TYPE
    ) RETURN INT IS
        cod_novo_emp   INT;
    BEGIN
        SELECT MAX(empno) + 1
        INTO   cod_novo_emp
        FROM   emp;

        INSERT INTO emp ( empno, ename, job, mgr, hiredate, sal, comm, deptno) 
        VALUES (cod_novo_emp, v_ename, v_job, v_mgr, SYSDATE, v_sal, v_comm, v_deptno
        );

        RETURN cod_novo_emp;
    END contrata_func;

    PROCEDURE demite_func (
        v_empno emp.empno%TYPE
    )
        IS
    BEGIN
        DELETE FROM emp
        WHERE empno = v_empno;

    END demite_func;

    FUNCTION sal_ok (
        v_sal emp.sal%TYPE
    ) RETURN BOOLEAN IS
        min_sal   emp.sal%TYPE;
        max_sal   emp.sal%TYPE;
    BEGIN
        SELECT  MIN(sal), MAX(sal)
        INTO    min_sal, max_sal
        FROM    emp;

        RETURN ( v_sal >= min_sal ) AND ( v_sal <= max_sal );
    END sal_ok;

    PROCEDURE reajuste (
        v_codigo_emp    IN emp.empno%TYPE,
        v_porcentagem   IN NUMBER DEFAULT 25
    ) IS
        v_sal   emp.sal%TYPE;
    BEGIN
        SELECT sal
        INTO   v_sal
        FROM   emp
        WHERE  empno = v_codigo_emp;

        IF sal_ok(v_sal + (v_sal * (v_porcentagem / 100) ) ) THEN
            UPDATE emp
            SET    sal = v_sal + ( v_sal * ( v_porcentagem / 100 ) )
            WHERE  empno = v_codigo_emp;
        ELSE
            RAISE salario_invalido;
        END IF;

    END reajuste;

    FUNCTION maiores_salarios (
        n INT
    ) RETURN regemp IS
        emp_rec   regemp;
    BEGIN
        OPEN c_sal;
        FOR i IN 1..n LOOP
            FETCH c_sal INTO emp_rec;
        END LOOP;
        CLOSE c_sal;
        RETURN emp_rec;
    END maiores_salarios;

END rh;
/

SET SERVEROUTPUT ON

DECLARE
    v_sal   NUMBER(8,2);
BEGIN
    v_sal := rh.descobrir_salario(7900);
    dbms_output.put_line('Salario atual - ' || v_sal);
    rh.reajuste(7900,faculdade.cnota);
    v_sal := rh.descobrir_salario(7900);
    dbms_output.put_line('Salario atualizado - ' || v_sal);
END;
/

SET SERVEROUTPUT ON

DECLARE
    novo_cod   emp.empno%TYPE;
BEGIN
    novo_cod := rh.contrata_func('Rita','Gerente',7839,9000,NULL,10);

    dbms_output.put_line('Funcionario '
                           || novo_cod
                           || ' cadastrado');
END;
/

BEGIN
rh.demite_func (7935);
END;
/

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER mudancas_salariais BEFORE
    UPDATE ON emp
    FOR EACH ROW
DECLARE
    saldo   NUMBER;
BEGIN
    saldo :=:new.sal -:old.sal;
    dbms_output.put_line('Salario Anterior: ' ||:old.sal);
    dbms_output.put_line('Salario Novo: ' ||:new.sal);
    dbms_output.put_line('Diferenca Salarial: ' || saldo);
END;

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER mudancas_salariais 
BEFORE INSERT OR UPDATE OR DELETE ON emp 
FOR EACH ROW 
DECLARE 
   saldo number; 
BEGIN 

   CASE
     WHEN INSERTING THEN
          DBMS_OUTPUT.PUT_LINE('    Novo : ' || :NEW.sal); 
     WHEN UPDATING THEN
          saldo := :NEW.sal  - :OLD.sal; 
          DBMS_OUTPUT.PUT_LINE('Anterior : ' || :OLD.sal); 
          DBMS_OUTPUT.PUT_LINE('    Novo : ' || :NEW.sal); 
          DBMS_OUTPUT.PUT_LINE('Diferenca: ' || saldo); 
     WHEN DELETING THEN
          DBMS_OUTPUT.PUT_LINE('Anterior : ' || :OLD.sal); 
  END CASE;

END; 
/

