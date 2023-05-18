-- Exemplo com variaveis
CREATE TABLE tabela1
(col1 VARCHAR2(18));

INSERT INTO tabela1
  VALUES ('Campo com 18 bytes');

SET SERVEROUTPUT ON

DECLARE
  v_col1 VARCHAR2(18);
BEGIN
  SELECT col1 INTO v_col1
    FROM tabela1;
  DBMS_OUTPUT.PUT_LINE ('Valor = ' || v_col1);
END;
/


--Alterando o valor de tabela1 mas nao alteramos o valor da variavel que sera armazenada, desse modo ela vai nos retornar um erro que nao tem espaco suficiente.

TRUNCATE TABLE tabela1;

ALTER TABLE tabela1
MODIFY col1 VARCHAR2(30);

INSERT INTO tabela1
  VALUES ('Tamanho alterado para 30 bytes');

SET SERVEROUTPUT ON

DECLARE
  v_col1 VARCHAR2(18);
BEGIN
  SELECT col1 INTO v_col1
    FROM tabela1;
  DBMS_OUTPUT.PUT_LINE ('Valor = ' || v_col1);
END;
/

--Evitando esse problema utilizando o %TYPE
DECLARE
  v_col1 tabela1.col1%TYPE;
BEGIN
  SELECT col1 INTO v_col1
    FROM tabela1;
  DBMS_OUTPUT.PUT_LINE ('Valor = ' || v_col1);
END;
/

--Alguns exemplo usando o TYPE
v_nome emp.ename%type; -- declaração da variável com a mesma 
--estrutura da coluna ename da tabela emp.

v_balance number(7,2); 

v_min_balance v_balance%type; -- declaração da variável com a 
--mesma estrutura da variável declarada anteriormente.

--IF THEN
DECLARE
  v_col1    tabela1.col1%TYPE;   
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1), col1 INTO v_tamanho, v_col1     
    FROM tabela1;   
  IF v_tamanho > 25 THEN      
    DBMS_OUTPUT.PUT_LINE ('Texto = ' || v_col1);   
  END IF; 
END;
/

--IF ELSE
DECLARE
  v_col1    tabela1.col1%TYPE;   
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1), col1 INTO v_tamanho, v_col1     
    FROM tabela1;   
  IF v_tamanho > 25 THEN      
    DBMS_OUTPUT.PUT_LINE ('Texto = ' || v_col1);
  ELSE
     DBMS_OUTPUT.PUT_LINE ('Texto menor ou igual a 25');
  END IF; 
END;
/

--ELSIF
DECLARE
  v_col1    tabela1.col1%TYPE;   
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1), col1 INTO v_tamanho, v_col1     
    FROM tabela1;   
  IF v_tamanho > 25 THEN      
    DBMS_OUTPUT.PUT_LINE ('Texto = ' || v_col1);
  ELSIF v_tamanho > 20 THEN
     DBMS_OUTPUT.PUT_LINE ('Texto maior que 20');
  ELSIF v_tamanho > 15 THEN
     DBMS_OUTPUT.PUT_LINE ('Texto maior que 15');
  ELSE
     DBMS_OUTPUT.PUT_LINE ('Texto menor ou igual a 15');
  END IF; 
END;
/

--AND OR
DECLARE
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1) INTO v_tamanho     
    FROM tabela1;   
  IF v_tamanho > 25 AND
     TO_CHAR(SYSDATE, 'YYYY') > 1999 THEN  
     DBMS_OUTPUT.PUT_LINE ('Maior que 25 bytes e século XXI');
  END IF; 
END;
/

DECLARE
  v_tamanho NUMBER(3); 
BEGIN   
  SELECT LENGTH(col1) INTO v_tamanho     
    FROM tabela1;   
  IF v_tamanho > 25 OR
     TO_CHAR(SYSDATE, 'YYYY') > 1999 THEN
     DBMS_OUTPUT.PUT_LINE ('Maior que 25 bytes ou século XXI');
  END IF; 
END;
/

--Loop Simples
DECLARE
  v_contador NUMBER(2) := 1; 
BEGIN   
  LOOP
    INSERT INTO tabela1
    VALUES ('Inserindo texto numero ' || v_contador);
    v_contador := v_contador + 1;   
    EXIT WHEN v_contador > 10;   
  END LOOP;
END;
/

--FOR
BEGIN   
  FOR i IN 1..10 LOOP
    INSERT INTO tabela1
    VALUES ('Inserindo texto numero ' || i);
  END LOOP;
END;
/

--WHILE
DECLARE
  v_contador NUMBER(2) :=1; 
BEGIN   
  WHILE v_contador <= 10 LOOP
    INSERT INTO tabela1
    VALUES ('Inserindo texto numero ' || v_contador);
    v_contador := v_contador + 1;   
  END LOOP;
END;

--FOR ANINHADO
BEGIN   
  FOR i IN 1..3 LOOP
    FOR j IN 1..5 LOOP
        INSERT INTO tabela1
        VALUES ('Inserindo texto numero ' || i || j);
    END LOOP;
  END LOOP;
END;
/




