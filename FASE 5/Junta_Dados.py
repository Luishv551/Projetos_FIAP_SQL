import os
import csv

# Caminho para a pasta que contém os arquivos CSV
pasta_csv = 'C:/Users/luish/OneDrive/Área de Trabalho/FIAP Projetos/FASE 5/ASSETS_PBL_FIAP_ON_1TSC_FASE_5'

# Lista para armazenar as linhas de todos os arquivos CSV
linhas_combinadas = []

# Iterar sobre os arquivos na pasta
for arquivo in os.listdir(pasta_csv):
    if arquivo.endswith('.csv'):
        caminho_arquivo = os.path.join(pasta_csv, arquivo)
        with open(caminho_arquivo, 'r', newline='', encoding='latin1') as arquivo_csv:
            leitor_csv = csv.reader(arquivo_csv)
            linhas = list(leitor_csv)
            if linhas_combinadas:
                linhas_combinadas.extend(linhas[1:])
            else:
                linhas_combinadas.extend(linhas)

# Salvar as linhas combinadas em um novo arquivo CSV
caminho_saida = 'resultado_final.csv'
with open(caminho_saida, 'w', newline='', encoding='latin1') as arquivo_saida:
    escritor_csv = csv.writer(arquivo_saida)
    escritor_csv.writerows(linhas_combinadas)

print("Arquivo CSV final gerado com sucesso.")
