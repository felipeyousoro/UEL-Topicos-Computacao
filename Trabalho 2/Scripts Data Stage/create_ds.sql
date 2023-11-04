DROP TABLE IF EXISTS COT_HISTORICA;

CREATE TABLE COT_HISTORICA
(
    TIPREG  BIGINT,
    DATPREG DATE,
    CODBDI  CHAR(2),
    CODNEG  CHAR(12),
    TPMERC  BIGINT,
    NOMRES  CHAR(12),
    ESPECI  CHAR(10),
    PRAZOT  CHAR(3),
    MODREF  CHAR(4),
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
    CODISI  CHAR(12),
    DISMES  BIGINT
);

DROP TABLE IF EXISTS D_DATA;

CREATE TABLE D_DATA (
    ID SERIAL PRIMARY KEY,
    COD VARCHAR(30) NOT NULL,
    DATA DATE NOT NULL UNIQUE,
    NUMERO_DIA_SEMANA INTEGER NOT NULL,
    NUMERO_MES INTEGER NOT NULL,
    NUMERO_ANO INTEGER NOT NULL,
    NUMERO_TRIMESTRE INTEGER NOT NULL,
    NUMERO_SEMESTRE INTEGER NOT NULL,
    NOME_TRIMESTRE VARCHAR(30) NOT NULL,
    NOME_SEMESTRE VARCHAR(30) NOT NULL,
    NOME_MES VARCHAR(30)
);

DROP TABLE IF EXISTS D_BDI;

CREATE TABLE D_BDI (
    ID SERIAL PRIMARY KEY,
    COD VARCHAR(10) NOT NULL UNIQUE,
    NOME VARCHAR(60) NOT NULL
);

SELECT * FROM D_BDI;

DROP TABLE IF EXISTS D_ESPECIFICACAO;

CREATE TABLE D_ESPECIFICACAO (
    ID SERIAL PRIMARY KEY,
    FIDC VARCHAR(30) NOT NULL UNIQUE,
    DESCRICAO VARCHAR(100) NOT NULL
);

SELECT * FROM D_ESPECIFICACAO;

DROP TABLE IF EXISTS D_INDOPC;

CREATE TABLE D_INDOPC (
    ID SERIAL PRIMARY KEY,
    COD INTEGER NOT NULL UNIQUE,
    SIGLA VARCHAR(30) NOT NULL,
    NOME VARCHAR(100) NOT NULL
);

SELECT * FROM D_INDOPC;

DROP TABLE IF EXISTS D_TPMERC;

CREATE TABLE D_TPMERC (
    ID SERIAL PRIMARY KEY,
    COD VARCHAR(30) NOT NULL UNIQUE,
    NOME VARCHAR(100) NOT NULL
);

SELECT * FROM D_TPMERC;