# Carregando nossa bibliotecas

# Nosso Modelo
library(rpart)
# Grafico da Arvore de decisão
library(rpart.plot)

# Seáração de nossa Base de dados
library(caTools)

# Vizualizção de nosos Modelo, como acuracia e matriz de confusão
library(caret)

# Carregando nossa base de dados 
base = read.csv('credit_data.csv')

# Apagando minha coluna ClientID, pois ela nao ira fazer diferença na hora de ultilizarmos nossos algoritimos
base$clientid <-  NULL

# Atualizando meu valores onnde são negativos para a media da coluna idade

base$age <-  ifelse(base$age < 0, 40.92, base$age)

# Aplicando a Media tambem em Valores NA
base$age <-  ifelse(is.na(base$age), 40.92, base$age)



# Ultilizando a funçãoo do Proprio R, para Padronização de nossos valores 

base[, 1:3] <-  scale(base[, 1:3])

# Para arvores de decisão precisamos rodar o factor que sera o enconder da classe,
# onde nossa coluna ira ficar com Levels
base$default <-  factor(base$default, levels = c(0,1))

# Vizualizando nosso resultado
str(base)

# Fazendo nossa divisão de dados

# 1500 --> para treinar
# 500 --> teste 

# Podemos verificar os valores TRUE E FALSE

# TRUE --> compor os 75% da base de dados
# FALSE --> não ira compor os 75% da base de dados

# Ultilziadando um setseed "semente aleatoria"
set.seed(10)


divisao <-  sample.split(base$default, SplitRatio = 0.75)
divisao

# Criando minha base de treinamento

# subset --> irar criar um subconjunto
# base, divisao == TRUE --> onde for os valores TRUE ira jogar na base de dados

base_treinamento <-  subset(base, divisao == TRUE) # # 1500 --> para treinar

# Criando minha base de dados de teste
base_teste <-  subset(base, divisao == FALSE) # # 500 --> teste 


# Criando nosso classificador, de arvore de decisão

classificador <-  rpart(formula = default ~ ., data = base_treinamento)

# Vizualizando nossa Arvore
print(classificador)

# Mostrando minha arvore de decisão, com o rplot em forma de Grafico
rpart.plot(classificador)

# Criando minha variavel de previsoes

# type = 'class' --> para trazer as classes em vez das probabilidades

previsoes <-  predict(classificador, newdata = base_teste[-4], type = 'class')

# Verificando minha variavel  previsora
previsoes

# Criando minha matriz de cofusão
matriz_confusao <-  table(base_teste[, 4], previsoes)

# Vizualizando minha matriz
print(matriz_confusao)

# Vizualizando nossa acuracia com a função
confusionMatrix(matriz_confusao)



# ultilziando Cross Validation, com nossa fução Traincontrol da propria Biblioteca
# Caret

# Criando nossa variavel de controle
controle <- trainControl(method = "cv", number = 10)

# Criando nossso Hiperparametros

grid <- expand.grid(.cp = seq(0.01, 0.5, 0.01))


# Treinando nosos Modelo com o cross-validation e nosso tunnin

modelo_cross <- train(default ~ ., data = base_treinamento,
                      method = "rpart", trControl = controle, tuneGrid = grid,
                      metric = "Accuracy")


# Melhor moddelo
modelo_cross

# Vizualizando meu Modelo
plot(modelo_cross)

# Criando minhas previsoes para o meu modelo
previsoes_modelo_cross <- predict(modelo_cross, newdata = base_teste)

# Criando minha matriz de confusão

matriz_confusao <-  table(base_teste[, 4], previsoes_modelo_cross)

# Vizualzando minha matriz de confusão
matriz_confusao

# Ultilizando minha biblioteca para vizualizar as metricas
confusionMatrix(matriz_confusao, mode = "everything")

# Importância das variáveis
varImp(modelo_cross)

# Visualizar a árvore final
rpart.plot(modelo_cross$finalModel)

