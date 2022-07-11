CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M','F') NOT NULL,
    EMAIL VARCHAR(50) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
    IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE,
    FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(IDCLIENTE) 
);

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM ('RES','COM','CEL') NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE)
    REFERENCES CLIENTE(IDCLIENTE)

);

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@GMAIL.COM','86465468');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOS@GMAIL.COM','38452964');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GMAIL.COM','7897243');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'39455869');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@GMAIL.COM','12384568');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','CELIA@GMAIL.COM','97843873');

+-----------+--------+------+------------------+----------+
| IDCLIENTE | NOME   | SEXO | EMAIL            | CPF      |
+-----------+--------+------+------------------+----------+
|         1 | JOAO   | M    | JOAO@GMAIL.COM   | 86465468 |
|         2 | CARLOS | M    | CARLOS@GMAIL.COM | 38452964 |
|         3 | ANA    | F    | ANA@GMAIL.COM    | 7897243  |
|         4 | CLARA  | F    | NULL             | 39455869 |
|         5 | JORGE  | M    | JORGE@GMAIL.COM  | 12384568 |
|         6 | CELIA  | F    | CELIA@GMAIL.COM  | 97843873 |
+-----------+--------+------+------------------+----------+

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','BELO HORIZONTE', 'MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO', 'RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRESIDENTE VARGAS','JARDIM','SAO PAULO', 'SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO', 'RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO', 'RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA', 'ES',5);

+------------+-----------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                   | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+-----------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA        | CENTRO   | BELO HORIZONTE | MG     |          4 |
|          2 | RUA CAPITAO HERMES    | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRESIDENTE VARGAS | JARDIM   | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA         | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR        | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA        | CENTRO   | VITORIA        | ES     |          5 |
+------------+-----------------------+----------+----------------+--------+------------+

INSERT INTO TELEFONE VALUES (NULL, 'CEL','64875362',5);
INSERT INTO TELEFONE VALUES (NULL, 'RES','87643493',5);
INSERT INTO TELEFONE VALUES (NULL, 'CEL','23134343',1);
INSERT INTO TELEFONE VALUES (NULL, 'COM','78967545',2);
INSERT INTO TELEFONE VALUES (NULL, 'RES','39434384',1);
INSERT INTO TELEFONE VALUES (NULL, 'CEL','39784741',3);
INSERT INTO TELEFONE VALUES (NULL, 'CEL','97873423',3);
INSERT INTO TELEFONE VALUES (NULL, 'COM','12383488',1);
INSERT INTO TELEFONE VALUES (NULL, 'RES','78631278',5);
INSERT INTO TELEFONE VALUES (NULL, 'CEL','33787477',2);

/* SELECAO, PROJECAO E JUNCAO
PROJECAO -> E TUDO QUE VOCE QUER VER NA TELA */

SELECT * FROM TELEFONE;

SELECT TIPO, NUMERO FROM TELEFONE;

SELECT NOW();

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/* SELECAO -> E UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSA DE SELECAO E O 'WHERE'
*/

SELECT NOME, SEXO, EMAIL /* PROJECAO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELECAO */

SELECT NUMERO
FROM TELEFONE
WHERE TIPO = 'CEL';

/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

/* NOME. SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDIM   | SAO PAULO      |
| CLARA  | F    | CENTRO   | BELO HORIZONTE |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* WHERE -> SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDIM   | SAO PAULO      |
| CLARA | F    | CENTRO   | BELO HORIZONTE |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; -> TABELA VERDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDIM   | SAO PAULO      |
| CLARA  | F    | CENTRO   | BELO HORIZONTE |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE 
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE 
WHERE SEXO = 'F'; 

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDIM   | SAO PAULO      |
| CLARA | F    | CENTRO   | BELO HORIZONTE |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE /* ORIGEM */
    INNER JOIN ENDERECO /* JUNCAO */
    ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */


/* NOME, SEXO, EMAIL, TIPO, NUMERO */
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

+--------+------+------------------+------+----------+
| NOME   | SEXO | EMAIL            | TIPO | NUMERO   |
+--------+------+------------------+------+----------+
| JORGE  | M    | JORGE@GMAIL.COM  | CEL  | 64875362 |
| JORGE  | M    | JORGE@GMAIL.COM  | RES  | 87643493 |
| JOAO   | M    | JOAO@GMAIL.COM   | CEL  | 23134343 |
| CARLOS | M    | CARLOS@GMAIL.COM | COM  | 78967545 |
| JOAO   | M    | JOAO@GMAIL.COM   | RES  | 39434384 |
| ANA    | F    | ANA@GMAIL.COM    | CEL  | 39784741 |
| ANA    | F    | ANA@GMAIL.COM    | CEL  | 97873423 |
| JOAO   | M    | JOAO@GMAIL.COM   | COM  | 12383488 |
| JORGE  | M    | JORGE@GMAIL.COM  | RES  | 78631278 |
| CARLOS | M    | CARLOS@GMAIL.COM | CEL  | 33787477 |
+--------+------+------------------+------+----------+

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO 
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 23134343 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 39434384 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 12383488 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 78967545 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 33787477 |
| ANA    | F    | JARDIM  | SAO PAULO      | CEL  | 39784741 |
| ANA    | F    | JARDIM  | SAO PAULO      | CEL  | 97873423 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 64875362 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 87643493 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 78631278 |
+--------+------+---------+----------------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 23134343 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 39434384 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 12383488 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 78967545 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 33787477 |
| ANA    | F    | JARDIM  | SAO PAULO      | CEL  | 39784741 |
| ANA    | F    | JARDIM  | SAO PAULO      | CEL  | 97873423 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 64875362 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 87643493 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 78631278 |
+--------+------+---------+----------------+------+----------+

/*

DML - DATA MANIPULATION LANGUAGE
DDL - DATA DEFINITION LANGUAGE
DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT */

INSERT INTO CLIENTE VALUES (NULL,'PAULA','M', NULL,'98765481');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE
WHERE IDCLIENTE = 8

/* DDL - DATA DEFINITION LANGUAGE */

CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PRODUTO VARCHAR(30) NOT NULL,
    PRECO INT,
    PRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| PRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+