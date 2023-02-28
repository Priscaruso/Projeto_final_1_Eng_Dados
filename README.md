# PROJETO FINAL 1 - FORMAÇÃO ENGENHEIRO DE DADOS - UDEMY

Este projeto consiste na construção de um Data Warehouse usando o Amazon Redshift para gerar análises sobre os dados que simulam a operação de uma pequena empresa.

### Tópicos do Projeto

:small_blue_diamond: [Enunciado do projeto](#enunciado-do-projeto)

:small_blue_diamond: [Etapas](#etapas)

:small_blue_diamond: [Pré-requisitos](#pré-requisitos)

:small_blue_diamond: [Execução](#execução)


## Enunciado do projeto

A empresa northwind precisa obter melhores informações sobre o seu negócio para tomar decisões mais assertivas. Para isso, precisa de um Data Warehouse moderno no qual se possa gerar análises de forma mais rápida e por isso usamos o Amazon Redshift. A empresa northwind é uma empresa fictícia que gerencia dados sobre vendas, pedidos, produtos, simulando toda a operação de uma pequena empresa real. Todos os dados da operação da empresa estão armazenados no formato csv, do qual extrairemos os dados necessários para a realização do projeto.


## Etapas

O projeto consiste nos seguintes passos:

* Criar um armazém de dados no Amazon s3 para os dados da empresa:
  * categories.csv - dados das categorias de produtos em arquivo CSV
  * customers.csv - dados dos clientes em arquivo CSV
  * employees.csv - dados dos funcionários em arquivo CSV
  * orderdetails.csv - dados de detalhes dos pedidos em arquivo CSV
  * orders.csv - dados dos pedidos em arquivo CSV
  * products.csv - dados dos produtos em arquivo CSV
  * shippers.csv - dados dos entregadores em arquivo CSV
  * suppliers.csv - dados dos fornecedores em arquivo CSV
* Criar um cluster no Amazon Redshift 
* Criar estrutura de tabelas no Redshift
* Copiar os dados do S3 para as tabelas do Redshift 
* Gerar as análises desejadas no Redshift


## Pré Requisitos

Para executar esse projeto é necessário ter uma conta na nuvem AWS.

## Execução

### Criar um armazém de dados no Amazon S3
O primeiro passo consiste em acessar o serviço S3 na console da AWS. Em seguida, criar um bucket chamado 'projeto1-eng-dados-udemy' e uma pasta chamada 'input' dentro desse bucket. 

![bucket do projeto 1 com a pasta input](https://user-images.githubusercontent.com/83982164/221923493-601a30e8-72e4-47bf-a559-96e4939e26b8.jpg)

Após isso, é feito o upload de todos os arquivos csv da empresa para dentro da pasta 'input'. Esses arquivos podem ser baixados da pasta [dataset](https://github.com/Priscaruso/Projeto_final_1_Eng_Dados/tree/main/dataset) desse repositório.

![pasta input com todos os arquivos usados no projeto](https://user-images.githubusercontent.com/83982164/221923683-9b4c7ef7-64f2-423c-88a5-e28e9524c541.jpg)

### Criar um cluster no Amazon Redshift
O segundo passo é acessar o serviço Redshift no console da AWS e criar um cluster usando as configurações de avaliação gratuita. Ao criar o cluster, na seção 'Configurações de banco de dados', criar um usuário e uma senha para acesso ao banco. Na seção 'Funções do IAM associadas', adicionar uma role para esse cluster que tenha a política AmazonRedshiftAllCommandsFullAccess. 

### Criar estruturas de tabelas no Redshift
O terceiro passo é acessar o editor de consultas do Redshift e rodar o código do script [northwind_ddl.sql](https://github.com/Priscaruso/Projeto_final_1_Eng_Dados/blob/main/scripts/northwind_ddl.sql) dentro do banco de dados criado no passo anterior, para gerar as estruturas das tabelas CATEGORIES, CUSTOMERS, EMPLOYEES, ORDERDETAILS, ORDERS, PRODUCTS, SHIPPERS E SUPPLIERS.

### Copiar os dados do S3 para as tabelas do Redshift
O quarto passo é rodar o código do script [copy_script.sql](https://github.com/Priscaruso/Projeto_final_1_Eng_Dados/blob/main/scripts/copy_script.sql) dentro do editor de consultas do Redshift editando apenas os campos FROM passando a URI do seu arquivo no bucket,; 'aws_access_key_id, 'aws_secret_access_key' com as suas chaves de acesso geradas na conta da AWS e 'region' com a região onde o seu bucket S3 foi criado.

A figura abaixo mostra um exemplo do uso do comando COPY para copiar os dados do s3 para a tabela CATEGORIES.

![copy dos dados do s3 para as tabelas no redshift](https://user-images.githubusercontent.com/83982164/221963242-e5c6f9b0-9c29-448b-80c5-2f1ad1be9b09.jpg)

### Gerar as análises desejadas no Redshift
Esse último passo consiste em responder as seguintes perguntas de negócios por meio de consultas com SQL no editor do Redshift:
 1 — Qual é o pedido, o nome do produto, o preço do produto, o preço do pedido, a diferença do preço do produto e do pedido?
 2 — Qual é o primeiro nome do vendedor, o total de vendas (quantidade) e o total de vendas em dolars?
 3 — Quais são os 10 produtos mais caros?
 4 — Qual é a diferença das vendas de 2021 e 2020 por fornecedor?
 5 — Quais são as cinco categorias de produtos mais vendidos por ano? 
 
 Para responder essas perguntas foi gerado o script [consultas.sql](https://github.com/Priscaruso/Projeto_final_1_Eng_Dados/blob/main/scripts/consultas.sql) que contém os códigos SQL, executados no editor do Redshift para obter as informações desejadas que ajudem na tomada de decisões do negócio.
 
 A figura abaixo mostra a query executada no Redshift que responde a terceira pergunta:
 
 ![atividade3](https://user-images.githubusercontent.com/83982164/221970507-863945b2-50a5-49dd-88af-776d3f7ca6a2.jpg)
 
 A figura a seguir mostra o resultado da query SQL no Redshift que responde a quarta pergunta:
 
 ![atividade4](https://user-images.githubusercontent.com/83982164/221976378-4d456364-cb46-4edd-91c4-107fb965f6d6.jpg)

A próxima figura mostra o resultado da query SQL no Redshift que responde a quinta pergunta:

![atividade5](https://user-images.githubusercontent.com/83982164/221976957-077c9eca-0e5d-4f75-954a-cf7ce858d7c1.jpg)

