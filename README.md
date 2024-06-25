## Projeto Sistema de Atividades Especiais - GRUPO C (Atendimento doceria)
### Integrantes
Ana Beatriz Meller - @AnaBea07 <br>
Daniela Cardoso - @DanielaMF <br>
Emely Pickler - @emelypickler <br>
Julia Meller – @juliameller <br>
Thiago Larangeira - @thiagolarangeiras <br>
Weslaine Santana - @weslainesantana <br>


### Modelo Físico
Utilizamos a ferramenta de modelagem de dados [dbdiagram.io](https://dbdiagram.io/) para criação do modelo físico do banco de dados, para posterior exportação dos scripts DDL das tabelas e relacionamentos.<br>
Arquivo fonte: [Modelo Fisico](https://dbdiagram.io/d/Atividade_BD-650a4ab602bd1c4a5ee4e54a)<br>

![image](https://github.com/juliameller/trabalhobd2/blob/main/modelo_fisico/modelo_er.png)
  
### Dicionário de Dados
As informações sobre as tabelas e índices foram documentados na planilha [dicionario_dados.xlsx](Dicionario/dicionario_dados.xlsx)

### Scripts SQL
Para este projeto foi utilizado o banco de dados [Azure SQL](https://azure.microsoft.com/pt-br/products/azure-sql/database) <br>

Abaixo, segue os scripts SQL separados por tipo:
+ DDL [ddl.sql](scripts_sql/ddl.sql)
+ Índices [indices.sql](scripts_sql/indice.sql)
+ DML [dml.sql](scripts_sql/dml.sql)
+ Triggers [triggers.sql](scripts_sql/triggers.sql)
+ Stored Procedures [stored_procedures.sql](scripts_sql/stored_procedures.sql)
+ Functions [functions.sql](scripts_sql/functions.sql)
+ Pergunas/consultas [perguntas](scripts_sql/perguntas.sql)

### Código Fonte do CRUD
* Linguagem de Programação: Java jdk 21
* Framework: Spring 3.3.0
* Projeto: API backend
* Biblioteca extras: jakarta, lombok, jpa, hibernate, jdbc-mssql (driver)


### Relatório Final
O relatório final está disponível no arquivo [Relatorio_BD2.pdf](relatorio/Relatorio_BD2.pdf).
