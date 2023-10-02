--
-- exclusão de tabelas
--

DROP TABLE IF EXISTS D_Data;
DROP TABLE IF EXISTS D_Cliente;
DROP TABLE IF EXISTS D_GrupoGeografico;
DROP TABLE IF EXISTS D_Pais;
DROP TABLE IF EXISTS D_RegiaoVendas;
DROP TABLE IF EXISTS D_Funcionario;
DROP TABLE IF EXISTS D_Produto;
DROP TABLE IF EXISTS F_Venda;
DROP TABLE IF EXISTS F_VendaDetalhe;
DROP TABLE IF EXISTS Tbimp_vendas;

--
-- criação de tabelas

--

-- tabela D_Data -----------------

CREATE TABLE D_Data(
	Data date  PRIMARY KEY NOT NULL,
	Dia char(2) NOT NULL,
	Mes char(2) NOT NULL,
	Ano char(4) NOT NULL
	);
	

-- tabela D_Cliente -----------------

CREATE TABLE D_Cliente(
	Cod_Cliente varchar(10) NOT NULL,
	Nome varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
 );
 
 CREATE INDEX IX_Cod_Cliente ON D_Cliente (Cod_Cliente);


-- tabela D_GrupoGeografico -----------------

CREATE TABLE D_GrupoGeografico
	(
	Nome varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
	);

CREATE INDEX IX_D_GrupoGeografico_nome ON D_GrupoGeografico (Nome);


-- tabela D_Pais -----------------

CREATE TABLE D_Pais
	(
	Id_GrupoGeo int NOT NULL,
	Sigla char(2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
	);

CREATE INDEX IX_D_PaisIdGrupo ON D_Pais (Id_GrupoGeo);
CREATE INDEX IX_D_PaisSigla	  ON D_Pais (Sigla);


-- tabela D_RegiaoVendas -----------------

CREATE TABLE D_RegiaoVendas (
	Id_Pais int NOT NULL,
	Nome varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
);

CREATE INDEX IX_D_RegiaoIdPais ON D_RegiaoVendas (Id_Pais);
CREATE INDEX IX_D_RegiaoNome   ON D_RegiaoVendas (Nome);


-- tabela D_Funcionario -----------------

CREATE TABLE D_Funcionario(
	Nome varchar(50) NOT NULL,
	Login varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
	);

CREATE INDEX IX_FuncionarioLogin ON D_Funcionario(Login);


-- tabela D_Produto -----------------

CREATE TABLE D_Produto(
	Cod_Produto varchar(20) NOT NULL default 0,
	Nome varchar(50) NOT NULL,
	Tamanho varchar(5) NOT NULL,
	Cor varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL
	);

CREATE INDEX IX_ProdutoNM ON D_Produto (nome);

CREATE INDEX IX_ProdutoCod ON D_Produto (Cod_Produto);


-- tabela F_Venda -----------------

CREATE TABLE F_Venda(
	Data date NOT NULL,
	Nr_NF varchar(10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Vlr_Imposto decimal(18, 2) NOT NULL,
	Vlr_Frete decimal(18, 2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_F_Venda PRIMARY KEY  
		(
		Data,
		Nr_NF,
		Id_Cliente,
		Id_Funcionario,
		Id_RegiaoVendas
		)
);


-- tabela F_VendaDetalhe -----------------

CREATE TABLE F_VendaDetalhe(
	Data date NOT NULL,
	Nr_NF varchar(10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Id_Produto int NOT NULL,
	Vlr_Unitario decimal(18, 2) NOT NULL,
	Qtd_Vendida int NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_F_VendaDetalhe PRIMARY KEY  
	(
		Data ,
		Nr_NF ,
		Id_Cliente ,
		Id_Funcionario ,
		Id_RegiaoVendas ,
		Id_Produto 
	)
);


-- tabela Tbimp_vendas -----------------

CREATE TABLE Tbimp_vendas
(
    nrnf character varying(15) ,
    datavenda character varying(15) ,
    codcliente character varying(15) ,
    nomecliente character varying(50) ,
    emailcliente character varying(50) ,
    regiaovendas character varying(15) ,
    pais character varying(2) ,
    grupogeografico character varying(15) ,
    vendedorlogin character varying(24) ,
    vendedornome character varying(50) ,
    vendedorchefenome character varying(50) ,
    cod_produto character varying(30) ,
    produto character varying(50) ,
    tamanho character varying(6) ,
    linha character varying(6) ,
    cor character varying(15) ,
    subtotal character varying(15) ,
    imptotal bigint,
    frete bigint,
    precounitario bigint,
    qtd bigint
);
