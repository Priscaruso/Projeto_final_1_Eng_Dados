# PROJETO FINAL 1 - FORMAÇÃO ENGENHEIRO DE DADOS - UDEMY

Este projeto consiste na construção de um Data Warehouse usando o Amazon Redshift para gerar análises sobre os dados que simulam a operação de uma pequena empresa.

### Tópicos do Projeto

:small_blue_diamond: [Enunciado do projeto](#enunciado-do-projeto)

:small_blue_diamond: [Etapas](#etapas)

:small_blue_diamond: [Pré-requisitos](#pré-requisitos)

:small_blue_diamond: [Criação do ambiente virtual](#criação-do-ambiente-virtual)

:small_blue_diamond: [Execução](#execução-do-projeto-1)

:small_blue_diamond: [Script para Criação das estruturas das Tabelas](#script-para-criação-das-estruturas-das-tabelas)


## Enunciado do projeto

A empresa northwind precisa obter melhores informações sobre o seu negócio para tomar decisões mais assertivas. Para isso, precisa de um Data Warehouse moderno no qual se possa gerar análises de forma mais rápida e por isso usamos o Amazon Redshift. A empresa northwind é uma empresa fictícia que gerencia dados sobre vendas, pedidos, produtos, simulando toda a operação de uma pequena empresa real. Todos os dados da operação da empresa estão armazenados no formato csv, do qual extrairemos os dados necessários para a realização do projeto.


## Etapas

O projeto consiste nos seguintes passos:

* Coletar dados das seguintes fontes: 
  * categories.csv - dados das categorias de produtos em arquivo CSV
  * customers.csv - dados dos clientes em arquivo CSV
  * employees.csv - dados dos funcionários em arquivo CSV
  * orderdetails.csv - dados de detalhes dos pedidos em arquivo CSV
  * orders.csv - dados dos pedidos em arquivo CSV
  * products.csv - dados dos produtos em arquivo CSV
  * shippers.csv - dados dos entregadores em arquivo CSV
  * suppliers.csv - dados dos fornecedores em arquivo CSV
* Criar um armazém de dados no Amazon s3 para os dados coletados
* Criar um cluster no Amazon Redshift 
* Copiar os dados do S3 para o Redshift 
* Gerar as análises desejadas no Redshift


## Pré Requisitos

Para executar esse projeto é necessário ter uma conta na nuvem AWS.
