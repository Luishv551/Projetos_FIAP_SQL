import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import warnings
import plotly.express as px

warnings.filterwarnings('ignore')
arquivo = "resultado_final.csv"

# Use o método read_csv diretamente com a codificação e o argumento error_bad_lines
try:
    df = pd.read_csv(arquivo, encoding='latin-1', error_bad_lines=False)
except pd.errors.ParserError as e:
    print(f"Erro na leitura do arquivo CSV: {e}")

# Agora você pode trabalhar com o DataFrame 'df' se a leitura for bem-sucedida
if 'df' in locals():
    df.info()