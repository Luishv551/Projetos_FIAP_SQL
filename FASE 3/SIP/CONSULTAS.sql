-- EXEMPLO � GROUP BY 
SELECT NR_MATRICULA, 
       COUNT(CD_DEPENDENTE) "QTDE. DEPENDENTES"
  FROM T_SIP_DEPENDENTE
    GROUP BY NR_MATRICULA;
    
-- EXEMPLO � GROUP BY COM FUN��O DE GRUPO
  SELECT CD_DEPTO,
   COUNT(NR_MATRICULA) "QTDE. FUNCIONARIOS NO DEPTO",
   SUM(VL_SALARIO_MENSAL) "TOTAL SALARIO POR DEPTO",
   ROUND(AVG(VL_SALARIO_MENSAL),2) "MEDIA SALARIAL POR DEPTO"
    FROM T_SIP_FUNCIONARIO
GROUP BY CD_DEPTO
ORDER BY CD_DEPTO;

-- EXEMPLO � GROUP BY COM V�RIAS TABELAS
SELECT F.NM_FUNCIONARIO       "FUNCIONARIO" ,
       D.NR_MATRICULA         "MATRICULA"   , 
       COUNT(D.NR_MATRICULA)  "QTDE. DEPENDENTES"
  FROM T_SIP_FUNCIONARIO F INNER JOIN T_SIP_DEPENDENTE D
       ON (F.NR_MATRICULA = D.NR_MATRICULA)
    GROUP BY F.NM_FUNCIONARIO, D.NR_MATRICULA;

-- EXEMPLO � GROUP BY COM HAVING
  SELECT CD_DEPTO,
   COUNT(NR_MATRICULA) "QTDE. FUNCIONARIO NO DEPTO",
   SUM(VL_SALARIO_MENSAL) "TOTAL SALARIO POR DEPTO",
   ROUND(AVG(VL_SALARIO_MENSAL),2) "MEDIA SALARIAL POR DEPTO"
    FROM T_SIP_FUNCIONARIO
GROUP BY CD_DEPTO
HAVING   SUM(VL_SALARIO_MENSAL) > 10000;

-- EXEMPLO � SUBCONSULTA DE UMA �NICA LINHA,
-- COM FUN��ES DE GRUPO
SELECT F.NM_FUNCIONARIO,
    F.VL_SALARIO_MENSAL
  FROM T_SIP_FUNCIONARIO F
 WHERE F.VL_SALARIO_MENSAL > (
                        SELECT AVG(F.VL_SALARIO_MENSAL)
                        FROM T_SIP_FUNCIONARIO F
                      );
                      
-- EXEMPLO � SUBCONSULTA DE UMA �NICA LINHA,
 -- COM AGRUPAMENTO, FUN��ES DE GRUPO E HAVING
   SELECT CD_DEPTO,
          MIN(VL_SALARIO_MENSAL)
     FROM T_SIP_FUNCIONARIO 
 GROUP BY CD_DEPTO
   HAVING MIN(VL_SALARIO_MENSAL) > (
                                 SELECT MIN(VL_SALARIO_MENSAL)
                                   FROM T_SIP_FUNCIONARIO 
                                  WHERE CD_DEPTO = 3 
                        );

-- EXEMPLO � SUBCONSULTA DE UMA �NICA LINHA,
 -- COM CL�USULA FROM
   SELECT F.NR_MATRICULA ,
          F.NM_FUNCIONARIO , 
          F.DT_ADMISSAO  , 
          RESFUNC.QTDEALOCACAO
   FROM   T_SIP_FUNCIONARIO F , 
                         (
                          SELECT  NR_MATRICULA , 
                                    COUNT(NR_MATRICULA) QTDEALOCACAO
                              FROM  T_SIP_IMPLANTACAO  
                          GROUP BY  NR_MATRICULA                                  
                          ) RESFUNC
                               
  WHERE F.NR_MATRICULA = RESFUNC.NR_MATRICULA ;
  
  
  -- EXEMPLO � SUBCONSULTA CORRELACIONADA,
-- COM EXISTS
 SELECT F.NR_MATRICULA,
     F.NM_FUNCIONARIO
  FROM T_SIP_FUNCIONARIO F
 WHERE EXISTS
            (
              SELECT I.NR_MATRICULA
                FROM T_SIP_IMPLANTACAO I
               WHERE F.NR_MATRICULA=I.NR_MATRICULA
            );

-- EXEMPLO � FUN��O LENGTH ()
SELECT F.NM_FUNCIONARIO , 
       LENGTH(F.NM_FUNCIONARIO) as TAMANHO    
  FROM T_SIP_FUNCIONARIO F;

-- EXEMPLO � FUN��ES RPAD() e LPAD()
SELECT F.NM_FUNCIONARIO                ,
       F.VL_SALARIO_MENSAL                    ,
       RPAD(F.NM_FUNCIONARIO,60)       ,
       RPAD(F.NM_FUNCIONARIO,60,'.')   ,
       LPAD(F.VL_SALARIO_MENSAL,10,'*')   
  FROM T_SIP_FUNCIONARIO F;
  
-- EXEMPLO � FUN��ES RTRIM(), LTRIM() E TRIM()
SELECT D.NM_DEPTO        ,
       LTRIM(D.NM_DEPTO) ,
       TRIM(D.NM_DEPTO)
       FROM T_SIP_DEPARTAMENTO D;

-- EXEMPLO � FUN��ES RTRIM(), LTRIM() E TRIM()
SELECT F.NM_FUNCIONARIO                ,       
       LTRIM(F.NM_FUNCIONARIO, 'A')    ,       
       RTRIM(F.NM_FUNCIONARIO, 'O')    ,             
       TRIM('A' FROM F.NM_FUNCIONARIO)     
  FROM T_SIP_FUNCIONARIO F;
