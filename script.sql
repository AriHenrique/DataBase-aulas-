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


DESC CLIENTE;

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

DESC ENDERECO;

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int         | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int         | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

DESC TELEFONE;

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;
WHERE SEXO = 'M';

/* UPDATE 12, 13, 18, 19 */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 12
OR IDCLIENTE = 13
OR IDCLIENTE = 18
OR IDCLIENTE = 19;

+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789  |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763  |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+

/* OU */

SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (12,13,18,19);

+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789  |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763  |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+

UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE IN (12,13,18,19);

+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'; 

/* UPDATE 16 */

UPDATE CLIENTE SET SEXO = 'M'
WHERE IDCLIENTE = 16;

/* QUANTIDADE DE M E F */

SELECT COUNT(*) AS QUANTIDADE, SEXO
FROM CLIENTE
GROUP BY SEXO;

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE 
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO'
AND CIDADE = 'RIO DE JANEIRO'
AND (TIPO = 'RES' OR TIPO = 'COM');

+-----------+-------------------+---------+------+------+--------+----------------+
| IDCLIENTE | EMAIL             | NOME    | SEXO | TIPO | BAIRRO | CIDADE         |
+-----------+-------------------+---------+------+------+--------+----------------+
|        11 | NULL              | GIOVANA | F    | COM  | CENTRO | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RES  | CENTRO | RIO DE JANEIRO |
|        19 | CARMEM@IG.COM     | CARMEM  | F    | RES  | CENTRO | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    | COM  | CENTRO | RIO DE JANEIRO |
+-----------+-------------------+---------+------+------+--------+----------------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR 
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE TIPO = 'CEL'
AND ESTADO = 'RJ';

+---------+------------------+----------+
| NOME    | EMAIL            | CELULAR  |
+---------+------------------+----------+
| JOAO    | JOAO@GMAIL.COM   | 23134343 |
| CARLOS  | CARLOS@GMAIL.COM | 33787477 |
| GIOVANA | NULL             | 33567765 |
| GIOVANA | NULL             | 88668786 |
+---------+------------------+----------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR 
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP';

+--------+------------------+----------+
| NOME   | EMAIL            | CELULAR  |
+--------+------------------+----------+
| ANA    | ANA@GMAIL.COM    | 39784741 |
| ANA    | ANA@GMAIL.COM    | 97873423 |
| ELAINE | ELAINE@GLOBO.COM | 89955665 |
+--------+------------------+----------+

SELECT  C.NOME,
        IFNULL(C.EMAIL, '-------NAO TEM EMAIL'),
        E.ESTADO,
        T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-----------------------------------------+--------+----------+
| NOME    | IFNULL(C.EMAIL, '-------NAO TEM EMAIL') | ESTADO | NUMERO   |
+---------+-----------------------------------------+--------+----------+
| JORGE   | JORGE@GMAIL.COM                         | ES     | 64875362 |
| JORGE   | JORGE@GMAIL.COM                         | ES     | 87643493 |
| JOAO    | JOAO@GMAIL.COM                          | RJ     | 23134343 |
| CARLOS  | CARLOS@GMAIL.COM                        | RJ     | 78967545 |
| JOAO    | JOAO@GMAIL.COM                          | RJ     | 39434384 |
| ANA     | ANA@GMAIL.COM                           | SP     | 39784741 |
| ANA     | ANA@GMAIL.COM                           | SP     | 97873423 |
| JOAO    | JOAO@GMAIL.COM                          | RJ     | 12383488 |
| JORGE   | JORGE@GMAIL.COM                         | ES     | 78631278 |
| CARLOS  | CARLOS@GMAIL.COM                        | RJ     | 33787477 |
| FLAVIO  | FLAVIO@IG.COM                           | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM                           | MG     | 99656675 |
| GIOVANA | -------NAO TEM EMAIL                    | RJ     | 33567765 |
| GIOVANA | -------NAO TEM EMAIL                    | RJ     | 88668786 |
| GIOVANA | -------NAO TEM EMAIL                    | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM                         | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM                       | ES     | 88965676 |
| EDUARDO | -------NAO TEM EMAIL                    | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM                          | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM                         | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM                        | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM                           | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM                           | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM                       | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM                       | RJ     | 44522578 |
+---------+-----------------------------------------+--------+----------+

SELECT  C.NOME,
        IFNULL(C.EMAIL, '-------NAO TEM EMAIL') AS "E-MAIL",
        E.ESTADO,
        T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+----------------------+--------+----------+
| NOME    | E-MAIL               | ESTADO | NUMERO   |
+---------+----------------------+--------+----------+
| JORGE   | JORGE@GMAIL.COM      | ES     | 64875362 |
| JORGE   | JORGE@GMAIL.COM      | ES     | 87643493 |
| JOAO    | JOAO@GMAIL.COM       | RJ     | 23134343 |
| CARLOS  | CARLOS@GMAIL.COM     | RJ     | 78967545 |
| JOAO    | JOAO@GMAIL.COM       | RJ     | 39434384 |
| ANA     | ANA@GMAIL.COM        | SP     | 39784741 |
| ANA     | ANA@GMAIL.COM        | SP     | 97873423 |
| JOAO    | JOAO@GMAIL.COM       | RJ     | 12383488 |
| JORGE   | JORGE@GMAIL.COM      | ES     | 78631278 |
| CARLOS  | CARLOS@GMAIL.COM     | RJ     | 33787477 |
| FLAVIO  | FLAVIO@IG.COM        | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM        | MG     | 99656675 |
| GIOVANA | -------NAO TEM EMAIL | RJ     | 33567765 |
| GIOVANA | -------NAO TEM EMAIL | RJ     | 88668786 |
| GIOVANA | -------NAO TEM EMAIL | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM      | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM    | ES     | 88965676 |
| EDUARDO | -------NAO TEM EMAIL | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM       | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM      | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM     | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM        | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM        | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM    | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM    | RJ     | 44522578 |
+---------+----------------------+--------+----------+

SELECT  C.NOME,
        C.SEXO,
        C.EMAIL,
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

+---------+------+-------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JORGE   | M    | JORGE@GMAIL.COM   | CEL  | 64875362 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@GMAIL.COM   | RES  | 87643493 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | JOAO@GMAIL.COM    | CEL  | 23134343 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@GMAIL.COM  | COM  | 78967545 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAO@GMAIL.COM    | RES  | 39434384 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 39784741 | JARDIM     | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 97873423 | JARDIM     | SAO PAULO      | SP     |
| JOAO    | M    | JOAO@GMAIL.COM    | COM  | 12383488 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@GMAIL.COM   | RES  | 78631278 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOS@GMAIL.COM  | CEL  | 33787477 | ESTACIO    | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | NULL              | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NULL              | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NULL              | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | NULL              | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM    | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

CREATE VIEW RELATORIO AS
SELECT  C.NOME,
        C.SEXO,
        C.EMAIL,
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

+---------+------+-------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JORGE   | M    | JORGE@GMAIL.COM   | CEL  | 64875362 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@GMAIL.COM   | RES  | 87643493 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | JOAO@GMAIL.COM    | CEL  | 23134343 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@GMAIL.COM  | COM  | 78967545 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAO@GMAIL.COM    | RES  | 39434384 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 39784741 | JARDIM     | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 97873423 | JARDIM     | SAO PAULO      | SP     |
| JOAO    | M    | JOAO@GMAIL.COM    | COM  | 12383488 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@GMAIL.COM   | RES  | 78631278 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOS@GMAIL.COM  | CEL  | 33787477 | ESTACIO    | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | NULL              | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NULL              | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | NULL              | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | NULL              | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM    | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

/* APAGAR VIEW */

DROP VIEW RELATORIO;

/* INSERINDO UM PREFIXO */

CREATE VIEW V_RELATORIO AS
SELECT  C.NOME,
        C.SEXO,
        IFNULL(C.EMAIL, 'CLIENTE SEM EMAIL') AS "E-MAIL",
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SHOW TABLES; /* AS VIEWS APARECEM NAS TABLES, NÃO EXISTE COMANDO "SHOW VIEWS;" */

+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| telefone           |
| v_relatorio        |
+--------------------+

SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;

+---------+----------+--------+
| NOME    | NUMERO   | ESTADO |
+---------+----------+--------+
| JORGE   | 64875362 | ES     |
| JORGE   | 87643493 | ES     |
| JOAO    | 23134343 | RJ     |
| CARLOS  | 78967545 | RJ     |
| JOAO    | 39434384 | RJ     |
| ANA     | 39784741 | SP     |
| ANA     | 97873423 | SP     |
| JOAO    | 12383488 | RJ     |
| JORGE   | 78631278 | ES     |
| CARLOS  | 33787477 | RJ     |
| FLAVIO  | 68976565 | MG     |
| FLAVIO  | 99656675 | MG     |
| GIOVANA | 33567765 | RJ     |
| GIOVANA | 88668786 | RJ     |
| GIOVANA | 55689654 | RJ     |
| KARLA   | 88687979 | RJ     |
| DANIELE | 88965676 | ES     |
| EDUARDO | 89966809 | PR     |
| ANTONIO | 88679978 | SP     |
| ANTONIO | 99655768 | PR     |
| ELAINE  | 89955665 | SP     |
| CARMEM  | 77455786 | RJ     |
| CARMEM  | 89766554 | RJ     |
| ADRIANA | 77755785 | RJ     |
| ADRIANA | 44522578 | RJ     |
+---------+----------+--------+

/* UPDATE, INSERT E DELETE - DML */

INSERT INTO V_RELATORIO VALUES(
    'ANDREIA','F','ANDREIA@GMAIL.COM','CEL','89138431','CENTRO','VITORIA','ES'
);

/* DELETE E INSERT NAO FUNCIONAM EM VIEWS COM "JOIN", APENAS UPDATE */
ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list

CREATE TABLE JOGADORES(
    IDJOGADOR INT,
    NOME VARCHAR(30),
    ESTADO CHAR(2)
);

INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS'),
                            (2,'GABIGOL','RJ'),
                            (3,'GANSO','RJ'),
                            (4,'NENE','RJ'),
                            (5,'LOVE','SP');

+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         1 | GUERRERO | RS     |
|         2 | GABIGOL  | RJ     |
|         3 | GANSO    | RJ     |
|         4 | NENE     | RJ     |
|         5 | LOVE     | SP     |
+-----------+----------+--------+

CREATE VIEW V_JOGADORES AS 
SELECT NOME, ESTADO
FROM JOGADORES;

+----------+--------+
| NOME     | ESTADO |
+----------+--------+
| GUERRERO | RS     |
| GABIGOL  | RJ     |
| GANSO    | RJ     |
| NENE     | RJ     |
| LOVE     | SP     |
+----------+--------+

DELETE FROM V_JOGADORES
WHERE NOME = 'GUERRERO';

SELECT * FROM V_JOGADORES;

+---------+--------+
| NOME    | ESTADO |
+---------+--------+
| GABIGOL | RJ     |
| GANSO   | RJ     |
| NENE    | RJ     |
| LOVE    | SP     |
+---------+--------+

INSERT INTO V_JOGADORES VALUES(
    'GUERREO',
    'RS'
);

+---------+--------+
| NOME    | ESTADO |
+---------+--------+
| GABIGOL | RJ     |
| GANSO   | RJ     |
| NENE    | RJ     |
| LOVE    | SP     |
| GUERREO | RS     |
+---------+--------+

SELECT * FROM JOGADORES;

+-----------+---------+--------+
| IDJOGADOR | NOME    | ESTADO |
+-----------+---------+--------+
|         2 | GABIGOL | RJ     |
|         3 | GANSO   | RJ     |
|         4 | NENE    | RJ     |
|         5 | LOVE    | SP     |
|      NULL | GUERREO | RS     |
+-----------+---------+--------+

SELECT * FROM V_RELATORIO
WHERE SEXO = 'F';

+---------+------+-------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL            | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 39784741 | JARDIM     | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 97873423 | JARDIM     | SAO PAULO      | SP     |
| GIOVANA | F    | CLIENTE SEM EMAIL | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM EMAIL | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM EMAIL | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

/* ORDER BY */

CREATE TABLE ALUNOS(
    NUMERO INT,
    NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1, 'JOAO'),
                         (1, 'MARIA'),
                         (2, 'ZOE'),
                         (2, 'ANDRE'),
                         (3, 'CLARA'),
                         (1, 'CLARA'),
                         (4, 'MAFRA'),
                         (1, 'JANAINA'),
                         (5, 'JANAINA'),
                         (3, 'MARCELO'),
                         (4, 'GIOVANE'),
                         (5, 'ANTONIO'),
                         (6, 'ANA'),
                         (6, 'VIVIANE');

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | MAFRA   |
|      1 | JANAINA |
|      5 | JANAINA |
|      3 | MARCELO |
|      4 | GIOVANE |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY NUMERO; /* ORDENA PELO NOME DA COLUNA */

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

/* ORDENA PELO NUMERO DA COLUNA */

SELECT * FROM ALUNOS
ORDER BY 1;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 2;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIOVANE |
|      1 | JANAINA |
|      5 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANE |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

/* MESCLANDO ORDER BY COM PROJECAO */

SELECT NOME FROM ALUNOS
ORDER BY 1, 2;

ERROR 1054 (42S22): Unknown column '2' in 'order clause'

SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;

+---------+
| NOME    |
+---------+
| CLARA   |
| JANAINA |
| JOAO    |
| MARIA   |
| ANDRE   |
| ZOE     |
| CLARA   |
| MARCELO |
| GIOVANE |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANA     |
| VIVIANE |
+---------+

/* ORDER BY DESC / ASC */

SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 1 ASC; /* DO MENOR PRO MAIOR (POR PADRAO) */

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 1 DESC; /* DO MAIOR PRO MENOR*/

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      6 | VIVIANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIOVANE |
|      3 | CLARA   |
|      3 | MARCELO |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | MARIA   |
|      1 | JOAO    |
|      1 | JANAINA |
|      1 | CLARA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | MARCELO |
|      3 | CLARA   |
|      4 | MAFRA   |
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | VIVIANE |
|      6 | ANA     |
+--------+---------+

SELECT  C.NOME,
        C.SEXO,
        IFNULL(C.EMAIL, 'CLIENTE SEM EMAIL') AS "E-MAIL",
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

+---------+------+-------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL            | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 39784741 | JARDIM     | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 97873423 | JARDIM     | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@IG.COM    | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| CARLOS  | M    | CARLOS@GMAIL.COM  | COM  | 78967545 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@GMAIL.COM  | CEL  | 33787477 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | CLIENTE SEM EMAIL | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| FLAVIO  | M    | FLAVIO@IG.COM     | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | CLIENTE SEM EMAIL | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM EMAIL | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM EMAIL | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAO@GMAIL.COM    | CEL  | 23134343 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAO@GMAIL.COM    | RES  | 39434384 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAO@GMAIL.COM    | COM  | 12383488 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@GMAIL.COM   | CEL  | 64875362 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@GMAIL.COM   | RES  | 87643493 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@GMAIL.COM   | RES  | 78631278 | CENTRO     | VITORIA        | ES     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

DELIMITER $

/* STORED PROCEDURES */

CREATE PROCEDURE NOME()
BEGIN

    QUALQUER PROGRAMA;

END
$

CREATE PROCEDURE NOME_EMPRESA()
BEGIN
    SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

/* CHAMANDO UMA PROCEDURE */

CALL NOME_EMPRESA()$

/* PROCEDURES COM PARAMETROS */

SELECT 10 + 10 AS CONTA$

CREATE PROCEDURE CONTA()
BEGIN
    SELECT 10 + 10 AS CONTA;
END
$

CALL CONTA()$

DROP PROCEDURE CONTA$

CREATE PROCEDURE CONTA(NUMERO_1 INT, NUMERO_2 INT)
BEGIN
    SELECT NUMERO_1 + NUMERO_2 AS CONTA;
END
$

CALL CONTA(100,50)$

+-------+
| CONTA |
+-------+
|   150 |
+-------+

DELIMITER ;

CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE CURSOS(
    IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    HORAS INT(3) NOT NULL,
    VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'JAVA',30,500.00),
                         (NULL,'FUNDAMENTO DE BANCO DE DADOS',40,700.00);

SELECT * FROM CURSOS;

DELIMITER #
STATUS

CREATE PROCEDURE CAD_CURSO(
    P_NOME VARCHAR(30),
    P_HORAS INT(3),
    P_PRECO FLOAT(10,2)
)

BEGIN
    INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);
END
#

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER',35,3000.00);
CALL CAD_CURSO('POWER BI',20,1000.00);
CALL CAD_CURSO('TABLEAU',30,1200.00);

SELECT * FROM CURSOS;

/* CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS*/

DELIMITER #

CREATE PROCEDURE CONSULTA_CURSOS()
BEGIN
   SELECT * FROM CURSOS; 
END
#

DELIMITER ;

CALL CONSULTA_CURSOS;

CREATE TABLE VENDEDORES(
    IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    SEXO CHAR(1),
    JANEIRO FLOAT (10,2),
    FEVEREIRO FLOAT (10,2),
    MARCO FLOAT (10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',5467567.10,876543.20,68767545.98),
                                (NULL,'MARIA','F',756879.10,32351.20,86321324.98),
                                (NULL,'ANTONIO','M',8865532.10,467567.20,547568.98),
                                (NULL,'CLARA','F',472342.10,345356.20,8679845.98),
                                (NULL,'ANDERSON','M',2356547.10,76889.20,4689689.98),
                                (NULL,'IVONE','F',145345.10,897894.20,98765.98),
                                (NULL,'JOAO','M',5667567.10,211242.20,324352.98),
                                (NULL,'CELIA','F',757843.10,464575.20,131242.98);

/* MAX -TRAZ O VALOR MAXIMO DE UMA COLUNA*/                                

SELECT MAX(FEVEREIRO) AS MAIOR
FROM VENDEDORES;

/* MIN -TRAZ O VALOR MINIMO DE UMA COLUNA*/  

SELECT MIN(FEVEREIRO) AS MENOR
FROM VENDEDORES;

/* AVG - TRAZ O VALOR MEDIO DE UMA COLUNA*/

SELECT AVG(FEVEREIRO) AS MEDIA
FROM VENDEDORES;

/* VARIAS FUNCOES */

SELECT MAX(JANEIRO) AS MAX_JAN,
        MIN(JANEIRO) AS MIN_JAN,
        AVG(JANEIRO) AS MEDIA_JAN
        FROM VENDEDORES;

/*TRUNCATE*/

SELECT MAX(JANEIRO) AS MAX_JAN,
        MIN(JANEIRO) AS MIN_JAN,
        TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
        FROM VENDEDORES;

/* AGREGANDO COM SUM() */

SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

SELECT SUM(JANEIRO) AS TOTAL_JAN,
        SUM(FEVEREIRO) AS TOTAL_FEV,
        SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

/*VENDAS POR SEXO*/

SELECT SEXO, SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES
GROUP BY SEXO;

/*VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME*/

SELECT MARCO, NOME
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

/*NOME E O VALOR QUE VENDEU MAIS EM MARCO*/

SELECT MARCO, NOME
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

/*QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV */

SELECT MARCO, NOME
FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

/*OPERACOES EM LINHA*/

SELECT NOME, JANEIRO, FEVEREIRO, MARCO, (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
         TRUNCATE(JANEIRO+FEVEREIRO+MARCO/3,2) AS "MEDIA"
FROM VENDEDORES;

/*ALTERANDO TABELAS*/

CREATE TABLE TABELA(
    COLUNA1 VARCHAR(30),
    COLUNA2 VARCHAR(30),
    COLUNA3 VARCHAR(30)
);

/*ADICIONANDO PRIMARY KEY*/
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

/*ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO*/

ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

ALTER TABLE TABELA 
ADD COLUNA100 INT;

--ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE TABELA 
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

--MODIFICANDO O TIPO DE UM CAMPO
ALTER TABLE TABELA
 MODIFY COLUNA2 DATE NOT NULL;

 --RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA 
RENAME PESSOA;

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

--Foreign key
ALTER TABLE TIME 
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE TIME;

/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;

/* A35 - ORGANIZANDO CHAVES
 */

SHOW TABLES;

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;

/* DICIONARIO DE DADOS */

SHOW DATABASES;

USE INFORMATION_SCHEMA;

STATUS

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/* APAGANDO CONSTRAINTS */

USE COMERCIO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/*EXERCICIO - SISTEMA DO SEU JOSÉ

1- CRIE UM BANCO DE DADOS CHAMADO PROJETO E CONECTE-SE AO BANCO.

2- FAÇA A SEUINTE MODELAGEM

SR JOSE QUER MODERNIZAR A SUA OFICINA, E POR ENQUANTO, CADASTRAR OS CARROS QUE ENTRAM
PARA REALIZAR SERVIÇOS E OS SEUS RESPECTIVOS DONOS. SR JOSE MENCIONOU QUE CADA CLIENTE
POSSUI APENAS UM CARRO. UM CARRO POSSIU UMA MARCA. SR JOSE TAMBÉM QUER SABER AS CORES
DOS CARROS PARA TER IDEIA DE QUAL TINTA COMPRAR, E INFORMAR QUE UM CARRO PODE TER MAIS
DE UMA COR.SR JOSE NECESSITA ARMAZENAR OS TELEFONES DOS CLIENTES, MAS NAO QUER QUE ELES
SEJAM OBRIGATORIOS.

*/

CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	ID_CARRO INT UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('CEL','RES','COM') NOT NULL,
	NUMERO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT 
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(30) NOT NULL,
	PLACA VARCHAR(30) NOT NULL UNIQUE,
	ID_MARCA INT
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO,ID_COR)
);

/* CONSTRAINTS */

ALTER TABLE TELEFONE 
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

/* PREENCHER O BANCO COM NO MINIMO 10 CLIENTES */

INSERT INTO CARRO VALUES(NULL,'')

/*ESTRUTURA DE UMA TRIGGER*/

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)

BEGIN -> INICIO

    QUALQUER COMANDO SQL

END -> FIM

CREATE DATABASE AULA40;

USE AULA40;

CREATE TABLE USUARIO(
    IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30),
    SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
    IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDUSUARIO INT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30)
);

/* CRIANDO A TRIGGER*/

DELIMITER $

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW

BEGIN

    INSERT INTO BKP_USUARIO VALUES(
        NULL,
        OLD.IDUSUARIO,
        OLD.NOME,
        OLD.LOGIN
    );

END $

DELIMITER ;

INSERT INTO USUARIO VALUES(NULL,'ANDRADE','ANDRADE2009','HEXACAMPEAO');

SELECT * FROM USUARIO;

DELETE FROM USUARIO
WHERE IDUSUARIO = 1;

SELECT * FROM BKP_USUARIO;

/*COMUNICACAO ENTRE BANCOS*/


CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
    IDBKP INT PRIMARY KEY AUTO_INCREMENT,
    PRODUTO INT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

USE LOJA;

INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP.BKP_PRODUTO VALUES(
        NULL,
        NEW.IDPRODUTO,
        NEW.NOME,
        NEW.VALOR
        );
END$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00),
                            (NULL,'LIVRO BI',80.00),
                            (NULL,'LIVRO ORACLE',70.00),
                            (NULL,'LIVRO SQL SERVER',100.00);

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP.BKP_PRODUTO VALUES(
        NULL,
        OLD.IDPRODUTO,
        OLD.NOME,
        OLD.VALOR
        );
END$

DELIMITER ;

DELETE FROM PRODUTO
WHERE IDPRODUTO = 2;

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP.BKP_PRODUTO VALUES(
        NULL,
        NEW.IDPRODUTO,
        NEW.NOME,
        NEW.VALOR
        );
END$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO DE C#',100.00);

SELECT * FROM BACKUP.BKP_PRODUTO;

ALTER TABLE BACKUP.BKP_PRODUTO 
ADD EVENTO CHAR(1);

DROP TRIGGER BACKUP_PRODUTO_DELETE;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP.BKP_PRODUTO VALUES(
        NULL,
        OLD.IDPRODUTO,
        OLD.NOME,
        OLD.VALOR,
        'D'
        );
END$

DELIMITER ;

DELETE FROM PRODUTO
WHERE IDPRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP.BKP_PRODUTO VALUES(
        NULL,
        NEW.IDPRODUTO,
        NEW.NOME,
        NEW.VALOR,
        'I'
        );
END$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO DE JAVA',90.00);

SELECT * FROM BACKUP.BKP_PRODUTO; 

/*TRIGGER DE AUDITORIA*/

DROP DATABASE LOJA;

DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    VALOR FLOAT(10,2)
);

/*QUANTO*/
SELECT NOW();

/*QUEM*/
SELECT CURRENT_USER();

CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
    IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO INT,
    NOME VARCHAR(30),
    VALOR_ORIGINAL FLOAT(10,2),
    VALOR_ALTERADO FLOAT(10,2),
    DATA DATETIME,
    USUARIO VARCHAR(30),
    EVENTO CHAR(1)
);

USE LOJA;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00),
                            (NULL,'LIVRO BI',80.00),
                            (NULL,'LIVRO ORACLE',70.00),
                            (NULL,'LIVRO SQL SERVER',100.00);

DELIMITER $

CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

    INSERT INTO BACKUP.BKP_PRODUTO VALUES(
        NULL,
        OLD.IDPRODUTO,
        OLD.NOME,
        OLD.VALOR,
        NEW.VALOR,
        NOW(),
        CURRENT_USER(),
        'U'
    );

END
$

DELIMITER ;

UPDATE PRODUTO SET VALOR = 110.00
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;
