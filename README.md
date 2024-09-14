# Predição de Inadimplência de Empréstimos com Árvores de Decisão

**Introdução**

Este projeto tem como objetivo desenvolver um modelo de predição para identificar o risco de inadimplência de clientes de crédito, utilizando a técnica de árvores de decisão. A predição precisa de inadimplência é fundamental para instituições financeiras, pois permite reduzir perdas e otimizar a tomada de decisão.

**Metodologia:**

1. **Coleta de Dados:** Os dados foram obtidos de kaggle.com. O conjunto de dados contém informações sobre renda, idade, histórico de crédito.
2. **Pré-processamento:** Os dados foram pré-processados para lidar com valores ausentes Média, Valoes Nulos e Padronização
3. **Modelagem:** Um modelo de árvore de decisão foi treinado utilizando o algoritmo CART
4. **Avaliação:** O modelo foi avaliado utilizando a técnica de cross-validation de 10 folds. As métricas de acurácia, precisão, recall e F1-score foram calculadas.

**Resultados:**

O modelo apresentou uma acurácia de 98% na previsão de inadimplência. As variáveis mais importantes para a classificação foram renda, idade e histórico de crédito. A figura abaixo mostra a matriz de confusão do modelo:

![image](https://github.com/user-attachments/assets/0844d520-ddbe-41b2-a32d-4cd8afe00b3e)


**Limitações:**

**Desbalanceamento de classes:** A taxa de inadimplência geralmente é baixa, o que pode levar a um viés em favor da classe majoritária.

**Generalização:** O modelo pode não generalizar bem para novos conjuntos de dados com características diferentes.

**Interpretabilidade:** Embora as árvores de decisão sejam geralmente interpretáveis, árvores muito complexas podem ser difíceis de entender.

**Futuras direções**

**Comparação com outros algoritmos:** Comparar a performance da árvore de decisão com outros algoritmos, como random forest e XGBoost.
**Balanceamento de classes:** Utilizar técnicas de balanceamento de classes para melhorar a performance do modelo em relação à classe minoritária.
**Feature engineering:** Criar novas features a partir das existentes para melhorar a capacidade preditiva do modelo.

**Tecnologias Utilizadas**

* Linguagem: R
* Bibliotecas: rpart, caret, catools
* Ambiente: RStudio

  # Uso:
  
- Carregar a base de dados com informações dos clientes e seus empréstimos.
- Dividir a base em conjuntos de treino e teste.
- Treinar o modelo SVM.
- Fazer previsões para novos clientes.
- Avaliar o desempenho do modelo com as métricas e a matriz de confusão.

**Autores**
Matheus Andrade Moreira
