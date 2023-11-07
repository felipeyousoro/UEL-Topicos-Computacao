DROP TABLE IF EXISTS COT_HISTORICA;

CREATE TABLE COT_HISTORICA
(
    TIPREG  BIGINT,
    DATPREG DATE,
    CODBDI  CHAR(30),
    CODNEG  CHAR(30),
    TPMERC  BIGINT,
    NOMRES  CHAR(100),
    ESPECI  CHAR(30),
    PRAZOT  CHAR(30),
    MODREF  CHAR(30),
    PREABE  NUMERIC,
    PREMAX  NUMERIC,
    PREMIN  NUMERIC,
    PREMED  NUMERIC,
    PREULT  NUMERIC,
    PREOFC  NUMERIC,
    PREOFV  NUMERIC,
    TOTNEG  BIGINT,
    QUATOT  BIGINT,
    VOLTOT  NUMERIC,
    PREEXE  NUMERIC,
    INDOPC  BIGINT,
    DATVEN  DATE,
    FATCOT  BIGINT,
    PTOEXE  NUMERIC,
    CODISI  CHAR(30),
    DISMES  BIGINT
);

SELECT *
FROM COT_HISTORICA;

DROP TABLE IF EXISTS D_CALENDARIO;

SELECT * FROM D_CALENDARIO;

CREATE TABLE D_CALENDARIO
(
    ID                SERIAL PRIMARY KEY,
    COD               VARCHAR(30) NOT NULL,
    _DATA             DATE        NOT NULL UNIQUE,
    NUMERO_DIA_SEMANA INTEGER     NOT NULL,
    NUMERO_MES        INTEGER     NOT NULL,
    NUMERO_ANO        INTEGER     NOT NULL,
    NUMERO_TRIMESTRE  INTEGER     NOT NULL,
    NUMERO_SEMESTRE   INTEGER     NOT NULL,
    NOME_TRIMESTRE    VARCHAR(30) NOT NULL,
    NOME_SEMESTRE     VARCHAR(30) NOT NULL,
    NOME_MES          VARCHAR(30)
);

DROP TABLE IF EXISTS D_BDI;

CREATE TABLE D_BDI
(
    ID   SERIAL PRIMARY KEY,
    COD  VARCHAR(30) NOT NULL UNIQUE,
    NOME VARCHAR(60) NOT NULL
);

SELECT *
FROM D_BDI;

DROP TABLE IF EXISTS D_ESPECIFICACAO;

CREATE TABLE D_ESPECIFICACAO
(
    ID        SERIAL PRIMARY KEY,
    FIDC      VARCHAR(30)  NOT NULL UNIQUE,
    DESCRICAO VARCHAR(100) NOT NULL
);

SELECT *
FROM D_ESPECIFICACAO;

DROP TABLE IF EXISTS D_INDOPC;

CREATE TABLE D_INDOPC
(
    ID    SERIAL PRIMARY KEY,
    COD   INTEGER      NOT NULL UNIQUE,
    SIGLA VARCHAR(30)  NOT NULL,
    NOME  VARCHAR(100) NOT NULL
);

SELECT *
FROM D_INDOPC;

DROP TABLE IF EXISTS D_TPMERC;

CREATE TABLE D_TPMERC
(
    ID   SERIAL PRIMARY KEY,
    COD  INTEGER      NOT NULL UNIQUE,
    NOME VARCHAR(100) NOT NULL
);

SELECT *
FROM D_TPMERC;

DROP TABLE IF EXISTS D_NOMEACAO;

CREATE TABLE D_NOMEACAO
(
    ID   SERIAL PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL UNIQUE
);

SELECT *
FROM D_NOMEACAO;

DROP TABLE IF EXISTS F_B3;

CREATE TABLE F_B3
(
    TIPREG           BIGINT,
    ID_DATPREG       INTEGER,
    ID_BDI           INTEGER,
    CODNEG           CHAR(12),
    ID_TPMERC        INTEGER,
    ID_NOMEACAO      INTEGER,
    ID_ESPECIFICACAO INTEGER,
    PRAZOT           CHAR(3),
    MODREF           CHAR(4),
    PREABE           NUMERIC,
    PREMAX           NUMERIC,
    PREMIN           NUMERIC,
    PREMED           NUMERIC,
    PREULT           NUMERIC,
    PREOFC           NUMERIC,
    PREOFV           NUMERIC,
    TOTNEG           BIGINT,
    QUATOT           BIGINT,
    VOLTOT           NUMERIC,
    PREEXE           NUMERIC,
    ID_INDOPC        INTEGER,
    ID_DATVEN        DATE,
    FATCOT           BIGINT,
    PTOEXE           NUMERIC,
    CODISI           CHAR(12),
    DISMES           BIGINT,

    CONSTRAINT FK_BDI FOREIGN KEY (ID_BDI) REFERENCES D_BDI (ID),
    CONSTRAINT FK_TPMERC FOREIGN KEY (ID_TPMERC) REFERENCES D_TPMERC (ID),
    CONSTRAINT FK_NOMEACAO FOREIGN KEY (ID_NOMEACAO) REFERENCES D_NOMEACAO (ID),
    CONSTRAINT FK_ESPECIFICACAO FOREIGN KEY (ID_ESPECIFICACAO) REFERENCES D_ESPECIFICACAO (ID),
    CONSTRAINT FK_INDOPC FOREIGN KEY (ID_INDOPC) REFERENCES D_INDOPC (ID),
    CONSTRAINT FK_DATPREG FOREIGN KEY (ID_DATPREG) REFERENCES D_CALENDARIO (ID)
);

SELECT * FROM F_B3;

SELECT distinct ESPECI FROM COT_HISTORICA;

SELECT distinct FIDC FROM D_ESPECIFICACAO ORDER BY FIDC;

SELECT * FROM d_especificacao, cot_historica WHERE d_especificacao.fidc = 'ON' AND d_especificacao.fidc = cot_historica.especi;
SELECT * FROM D_BDI;
SELECT DISTINCT CODBDI FROM COT_HISTORICA;
DELETE FROM COT_HISTORICA WHERE CODBDI = '.2';

--print the ord of char 3 in codbdi
SELECT DISTINCT ASCII(SUBSTRING(CODBDI, 4, 1)) FROM COT_HISTORICA;
SELECT DISTINCT ASCII(SUBSTRING(cod, 4, 1)) FROM D_BDI;

