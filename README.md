# challenge-delphi-checkout

## Pré-requisitos

- Delphi Community 10.4.1
- MySQL Server configurado na porta 3306 e ter livre o nome CHECKOUT para o banco de dados
- Executar os scripts de criação do banco de dados https://github.com/mauriciobelusso/challenge-delphi-checkout/blob/main/database.sql
- Executar os scripts de inserção dos dados https://github.com/mauriciobelusso/challenge-delphi-checkout/blob/main/import.sql

## Execução

O projeto é do tipo portátil, está pré configurado para acessar a database conforme os pré-requisitos, para uso, basta informar os dados do cliente, do produto e inserir, a grid é editável e no canto inferior direito podemos salvar o pedido

## Projeto

O projeto foi concebido no modelo MVC utilizando técnicas de programação funcional, também utilizando design patterns como FACADE para reduzir o acoplamento, também é utilizado DataSet e Objetos para realizar um mix de técnicas.
