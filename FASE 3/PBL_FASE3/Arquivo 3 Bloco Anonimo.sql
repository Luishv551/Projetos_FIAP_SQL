--PRIMEIRO � NECESS�RIO CRIAR O SEQUENCE UTILIZADO NO BLOCO
/*
CREATE SEQUENCE SQ_MC_SGV_OCORRENCIA_SAC1
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

*/


--UTILIZADO SOMENTE PARA TESTES
--SET SERVEROUTPUT ON


DECLARE 

--DECLARA��O DO CURSOR DE REGISTRO PARA INSERIR OS DADOS NA TABELA MC_SGV_OCORRENCIA_SAC
    REGISTRO MC_SGV_OCORRENCIA_SAC%ROWTYPE;
    
--DECLARA��O DO CURSOR NOMEADO QUE RECEBERA OS DADOS DAS TABELAS MC_SGV_SAC, MC_PRODUTO E MC_CLIENTE    
    CURSOR C_SAC IS          
        SELECT S.NR_SAC,S.DT_ABERTURA_SAC,S.HR_ABERTURA_SAC,S.TP_SAC,S.NR_INDICE_SATISFACAO,P.CD_PRODUTO,P.DS_PRODUTO,P.VL_UNITARIO,P.VL_PERC_LUCRO,C.NR_CLIENTE,C.NM_CLIENTE          
        FROM MC_SGV_SAC S
        INNER JOIN MC_PRODUTO P ON P.CD_PRODUTO = S.CD_PRODUTO
        INNER JOIN MC_CLIENTE C ON C.NR_CLIENTE = S.NR_CLIENTE;
BEGIN 

--ABERTURA DO CURSOR NOMEADO
    OPEN C_SAC;
    
--INICIO DO LOOP PARA EXTRA��O DOS DADOS DO CURSOR NOMEADO PARA O CURSOR DE REGISTRO LINHA POR LINHA    
    LOOP  
        
--EXTRA��O DOS DADOS PARA O CURSOR DE REGISTRO ATRAVES DO COMANDO FETCH
--E A FALTA DE RETORNO DE INFORMA��O DO CURSOR NOMEADO COMO CONDI��O PARA SAIDA DO COMANDO FETCH (POSS�VEL OBSERVAR ATRAVES DO "EXIT WHEN C_SAC%NOTFOUND")       
        FETCH C_SAC 
        INTO REGISTRO.NR_OCORRENCIA_SAC, REGISTRO.DT_ABERTURA_SAC,REGISTRO.HR_ABERTURA_SAC, REGISTRO.DS_TIPO_CLASSIFICACAO_SAC,REGISTRO.DS_INDICE_SATISFACAO_ATD_SAC, REGISTRO.CD_PRODUTO
        ,REGISTRO.DS_PRODUTO,REGISTRO.VL_UNITARIO_PRODUTO,REGISTRO.VL_PERC_LUCRO,REGISTRO.NR_CLIENTE,REGISTRO.NM_CLIENTE;
        EXIT WHEN C_SAC%NOTFOUND;
        
        
--ESTRUTURA CONDICIONAL PARA ATRIBUI��O COMPLETA DOS VALORES DO CAMPO "DS_TIPO_CLASSIFICACAO_SAC"
--COM BASE NO CONTEUDO EXTRAIDO DO CAMPO "TP_SAC" DA TABELA "MC_SGV_SAC"
        IF REGISTRO.DS_TIPO_CLASSIFICACAO_SAC = 'E' THEN
            REGISTRO.DS_TIPO_CLASSIFICACAO_SAC := 'ELOGIO';
            
        ELSIF REGISTRO.DS_TIPO_CLASSIFICACAO_SAC = 'D' THEN
            REGISTRO.DS_TIPO_CLASSIFICACAO_SAC := 'D�VIDA';
        
        ELSE 
            REGISTRO.DS_TIPO_CLASSIFICACAO_SAC := 'SUGEST�O';
        END IF;
        
            
        
-- UTILIZA��O DO COMANDO "SELECT INTO" PARA ATRIBUI��O DE VALORES DOS CAMPOS "SG_ESTADO" E "NM_ESTADO" UTILIZANDO COMO CONDI��O (WHERE) O NR_CLIENTE RECUPERADO DA MC_CLIENTE
--SENDO POSSIVEL SOMENTE DEVIDO AOS COMANDOS DE JUN��O DE TABELAS (INNER JOIN)
        SELECT E.SG_ESTADO, E.NM_ESTADO
        
        INTO REGISTRO.SG_ESTADO, REGISTRO.NM_ESTADO
        
        FROM MC_ESTADO E
        INNER JOIN MC_CIDADE C ON C.SG_ESTADO = E.SG_ESTADO
        INNER JOIN MC_BAIRRO B ON B.CD_CIDADE = C.CD_CIDADE
        INNER JOIN MC_LOGRADOURO L ON L.CD_BAIRRO = B.CD_BAIRRO
        INNER JOIN MC_END_CLI A ON A.CD_LOGRADOURO_CLI = L.CD_LOGRADOURO
        INNER JOIN MC_CLIENTE X ON X.NR_CLIENTE = A.NR_CLIENTE
        
        WHERE X.NR_CLIENTE = REGISTRO.NR_CLIENTE;
        


--ATRIBUI��O DE VALOR DO CAMPO "VL_UNITARIO_LUCRO_PRODUTO" ATRAVES DE UMA CONTA DE MULTIPLICA��O E DIVIS�O COM OS VALORES DOS CAMPOS:
--"VL_PERC_LUCRO" DA TABELA "MC_PRODUTO" E "VL_UNITARIO_PRODUTO" TAMBEM DA TABELA "MC_PRODUTO"
        REGISTRO.VL_UNITARIO_LUCRO_PRODUTO := (REGISTRO.VL_PERC_LUCRO / 100) * REGISTRO.VL_UNITARIO_PRODUTO;
        
--ATRIBUI��O DE VALOR DO CAMPO "VL_ICMS_PRODUTO" UTILIZANDO UMA FUN��O INTERNA DO SGBD ORCL E O VALOR DO CAMPO (SG_ESTADO) COMO PAR�METRO   
          SELECT pf0110. fun_mc_gera_aliquota_media_icms_estado(REGISTRO.SG_ESTADO) Aliquota_ICMS_Estado 
          
          INTO REGISTRO.VL_ICMS_PRODUTO
          
          FROM dual;
        
        
--ATRIBUI��O DE VALOR DO CAMPO "DS_PRODUTO" ATRAVES DO COMANDO "SELECT INTO" COM CAMPO "CD_PRODUTO" COMO CONDI��O (WHERE)
        SELECT DS_PRODUTO 
        
        INTO REGISTRO.DS_PRODUTO
        
        FROM MC_PRODUTO
        WHERE CD_PRODUTO = REGISTRO.CD_PRODUTO;
         

         
--ATRIBUI��O DE VALOR DO CAMPO "NM_CLIENTE" ATRAVES DO COMANDO "SELECT INTO" COM CAMPO "NR_CLIENTE" COMO CONDI��O (WHERE)       
        SELECT NM_CLIENTE 
        
        INTO REGISTRO.NM_CLIENTE
        
        FROM MC_CLIENTE
        WHERE NR_CLIENTE = REGISTRO.NR_CLIENTE;
         
        
        
--INSER��O DOS DADOS DO CURSOR DE REGISTRO PARA A TABELA "MC_SGV_OCORRENCIA_SAC"
        INSERT INTO MC_SGV_OCORRENCIA_SAC
        (NR_OCORRENCIA_SAC,DT_ABERTURA_SAC,HR_ABERTURA_SAC,DS_TIPO_CLASSIFICACAO_SAC,
        CD_PRODUTO,DS_PRODUTO,VL_UNITARIO_PRODUTO,VL_PERC_LUCRO,VL_UNITARIO_LUCRO_PRODUTO,SG_ESTADO,NM_ESTADO,NR_CLIENTE,NM_CLIENTE,VL_ICMS_PRODUTO,DS_INDICE_SATISFACAO_ATD_SAC)
        VALUES(SQ_MC_SGV_OCORRENCIA_SAC1.NEXTVAL,REGISTRO.DT_ABERTURA_SAC,REGISTRO.HR_ABERTURA_SAC,REGISTRO.DS_TIPO_CLASSIFICACAO_SAC,
        REGISTRO.CD_PRODUTO,REGISTRO.DS_PRODUTO,REGISTRO.VL_UNITARIO_PRODUTO,REGISTRO.VL_PERC_LUCRO,REGISTRO.VL_UNITARIO_LUCRO_PRODUTO,REGISTRO.SG_ESTADO,
        REGISTRO.NM_ESTADO,REGISTRO.NR_CLIENTE,REGISTRO.NM_CLIENTE,REGISTRO.VL_ICMS_PRODUTO,REGISTRO.DS_INDICE_SATISFACAO_ATD_SAC);
        
        
   
   
     
  
--ENCERRAMENTO DO LOOP      
    END LOOP;
--FECHAMENTO DO CURSOR
    CLOSE C_SAC;
--FECHAMENTO DO BLOCO ANONIMO    
END; 
/

COMMIT;


--CONSULTA NA TABELA DE OCORRENCIA
--SELECT * FROM MC_SGV_OCORRENCIA_SAC;



--COMANDOS UTILIZADOS A CADA TESTE
--DELETE FROM MC_SGV_OCORRENCIA_SAC;
--ALTER SEQUENCE SQ_MC_SGV_OCORRENCIA_SAC1 RESTART START WITH 1;

