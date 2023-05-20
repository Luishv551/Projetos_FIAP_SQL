-- 1.3 Desafio 1: Criar um bloco anônimo em Oracle PL/SQL para a empresa Melhores Compras

SET SERVEROUTPUT ON

DECLARE -- DECLARANDO O CURSOR
    C_SAC MC_SGV_OCORRENCIA_SAC%ROWTYPE; --AQUI ESTAMOS FALANDO QUE O CURSOR C_SAQ VAI RECEBER AS COLUNAS E TIPO DE DADOS DA TABELA MC_SGV_OCORRENCIA_SAC
    CURSOR TODOS IS
        SELECT *
        FROM MC_SGV_OCORRENCIA_SAC;
BEGIN --COMEÇANDO A INSTRUÇÃO DO CURSOR
    FOR C_SAC IN TODOS --PARA CADA LINHA DE C_SAC (INFOS DE MC_SGV_OCORRENCIA_SAC) INSERIMOS NO CURSOR TODOS
    LOOP --INICIANDO LOOP
        dbms_output.put_line 
        ('Numero da ocorrencia do SAC: ' || C_SAC.NR_OCORRENCIA_SAC);
         dbms_output.put_line 
        ('Data de abertura do SAC: ' || C_SAC.DT_ABERTURA_SAC);
         dbms_output.put_line 
        ('Hora de abertura do SAC: ' || C_SAC.HR_ABERTURA_SAC);
         dbms_output.put_line 
        ('Tipo do SAC: ' || C_SAC.DS_TIPO_CLASSIFICACAO_SAC);
         dbms_output.put_line 
        ('Codigo do produto: ' || C_SAC.CD_PRODUTO);
         dbms_output.put_line 
        ('Nome do produto: ' || C_SAC.DS_PRODUTO);
         dbms_output.put_line 
        ('Valor unitário do produto: ' || C_SAC.VL_UNITARIO_PRODUTO);
         dbms_output.put_line 
        ('Percentual do lucro unitário do produto: ' || C_SAC.VL_PERC_LUCRO);
        dbms_output.put_line 
        ('Numero do Cliente: ' || C_SAC.NR_CLIENTE);
        dbms_output.put_line 
        ('Nome do Cliente: ' || C_SAC.NM_CLIENTE);
        
        
    END LOOP; --FIM DO LOOP
END; --FIM DA INSTRUÇÃO DO CURSOR
/

SET SERVEROUTPUT ON


            
        
        