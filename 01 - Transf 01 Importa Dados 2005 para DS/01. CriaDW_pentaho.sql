--
-- exclusão de chaves estrangeiras
--

ALTER TABLE IF EXISTS D_Pais
   DROP CONSTRAINT 
   IF EXISTS FK_D_GrupoGeografico;

ALTER TABLE IF EXISTS D_RegiaoVendas
   DROP CONSTRAINT 
   IF EXISTS FK_D_Pais;

ALTER TABLE IF EXISTS D_Pais 
	DROP CONSTRAINT 
	IF EXISTS FK_D_Pais_D_GrupoGeografico;


ALTER TABLE IF EXISTS D_RegiaoVendas 
	DROP CONSTRAINT 
	IF EXISTS FK_D_RegiaoVendas_D_Pais;


ALTER TABLE IF EXISTS F_Venda 
	DROP CONSTRAINT 
	IF EXISTS FK_F_Venda_D_Cliente;


ALTER TABLE IF EXISTS F_Venda 
	DROP CONSTRAINT 
	IF EXISTS FK_F_Venda_D_Data;


ALTER TABLE IF EXISTS F_Venda 
	DROP CONSTRAINT 
	IF EXISTS FK_F_Venda_D_Funcionario;


ALTER TABLE IF EXISTS F_Venda 
	DROP  CONSTRAINT 
	IF EXISTS FK_F_Venda_D_RegiaoVendas;


ALTER TABLE IF EXISTS F_VendaDetalhe 
	DROP  CONSTRAINT 
	IF EXISTS FK_F_VendaDetalhe_D_Produto;


ALTER TABLE IF EXISTS F_VendaDetalhe 
DROP CONSTRAINT 
IF EXISTS FK_F_VendaDetalhe_F_Venda;

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


--
-- criação de tabelas

--

-- tabela D_Data -----------------

CREATE TABLE D_Data(
	Id_Data int  NOT NULL default 0,
	Data date NOT NULL,
	Dia char(2) NOT NULL,
	Mes char(2) NOT NULL,
	Ano char(4) NOT NULL,
 CONSTRAINT PK_D_Data PRIMARY KEY  
(
	Data 
)
);

--CREATE INDEX IX_Data ON D_Data (Data);

-- tabela D_Cliente -----------------

CREATE TABLE D_Cliente(
	Id_Cliente int  NOT NULL default 0,
	Cod_Cliente varchar(10) NOT NULL,
	Nome varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_D_Cliente PRIMARY KEY 
(
	Id_Cliente 
)
); 

 CREATE INDEX IX_Cod_Cliente ON D_Cliente (Cod_Cliente);

-- tabela D_GrupoGeografico -----------------

CREATE TABLE D_GrupoGeografico(
	Id_GrupoGeo int  NOT NULL default 0,
	Nome varchar(50) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_D_GrupoGeografico PRIMARY KEY  
(
	Id_GrupoGeo 
)
); 

CREATE INDEX IX_D_GrupoGeografico_nome ON D_GrupoGeografico (Nome);

-- tabela D_Pais -----------------

CREATE TABLE D_Pais(
	Id_Pais int  NOT NULL default 0,
	Id_GrupoGeo int NOT NULL,
	Sigla char(2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_D_Pais PRIMARY KEY  
(
	Id_Pais 
),
 CONSTRAINT FK_D_GrupoGeografico FOREIGN KEY  
(
	Id_GrupoGeo 
)
 REFERENCES D_GrupoGeografico
 ON DELETE CASCADE
 
); 

CREATE INDEX IX_D_PaisIdGrupoGeo ON D_Pais (Id_GrupoGeo);
CREATE INDEX IX_D_PaisSigla	ON D_Pais (Sigla);

-- tabela D_RegiaoVendas -----------------

CREATE TABLE D_RegiaoVendas(
	Id_RegiaoVendas int  NOT NULL default 0,
	Id_Pais int NOT NULL,
	Nome varchar(20) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_D_RegiaoVendas PRIMARY KEY  
(
	Id_RegiaoVendas 
),
 CONSTRAINT FK_D_Pais FOREIGN KEY  
(
	Id_Pais 
)
 REFERENCES D_Pais
 ON DELETE CASCADE

); 

CREATE INDEX IX_D_RegiaoIdPais ON D_RegiaoVendas (Id_Pais);
CREATE INDEX IX_D_RegiaoNome   ON D_RegiaoVendas (Nome);

-- tabela D_Funcionario -----------------

CREATE TABLE D_Funcionario(
	Id_Funcionario int  NOT NULL default 0,
	Nome varchar(50) NOT NULL,
	Login varchar(50) NOT NULL,
	Id_Chefe int NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_D_Funcionario PRIMARY KEY  
(
	Id_Funcionario 
)
);

CREATE INDEX IX_FuncionarioLogin ON D_Funcionario(Login);

-- tabela D_Produto -----------------

CREATE TABLE D_Produto(
	Id_Produto int NOT NULL default 0,
	Cod_Produto varchar(20) NOT NULL default 0,
	Nome varchar(50) NULL,
	Tamanho varchar(5) NULL,
	Cor varchar(20) NULL,
	LinData date NULL,
	LinOrig varchar(50) NULL,
	version int NULL,
	date_from timestamp NULL,
	date_to timestamp NULL,
 CONSTRAINT PK_D_Produto PRIMARY KEY  
(
	Id_Produto 
)
);

CREATE INDEX IX_ProdutoNM ON D_Produto (nome);

CREATE INDEX IX_ProdutoCod ON D_Produto (Cod_Produto);


-- tabela F_Venda -----------------

CREATE TABLE F_Venda(
	Id_Fato int  NOT NULL,
	Data date NOT NULL,
	Nr_NF varchar (10) NOT NULL,
	Id_Cliente int NOT NULL,
	Id_Funcionario int NOT NULL,
	Id_RegiaoVendas int NOT NULL,
	Vlr_Imposto decimal(18, 2) NOT NULL,
	Vlr_Frete decimal(18, 2) NOT NULL,
	LinData date NOT NULL,
	LinOrig varchar(50) NOT NULL,
 CONSTRAINT PK_F_Venda PRIMARY KEY  
(
	Data ,
	Nr_NF ,
	Id_Cliente ,
	Id_Funcionario ,
	Id_RegiaoVendas 
)
);


-- tabela F_VendaDetalhe -----------------

CREATE TABLE F_VendaDetalhe(
	Id_FatoDetalhe int  NOT NULL,
	Data date NOT NULL,
	Nr_NF varchar (10) NOT NULL,
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


ALTER TABLE D_Pais ADD CONSTRAINT FK_D_Pais_D_GrupoGeografico 
	FOREIGN KEY(Id_GrupoGeo)
	REFERENCES D_GrupoGeografico (Id_GrupoGeo)
	ON DELETE CASCADE;


ALTER TABLE D_RegiaoVendas ADD CONSTRAINT FK_D_RegiaoVendas_D_Pais 
	FOREIGN KEY(Id_Pais)
	REFERENCES D_Pais (Id_Pais)
	ON DELETE CASCADE;


ALTER TABLE F_Venda ADD  CONSTRAINT FK_F_Venda_D_Cliente 
	FOREIGN KEY(Id_Cliente)
	REFERENCES D_Cliente (Id_Cliente)
	ON DELETE CASCADE;


ALTER TABLE F_Venda ADD  CONSTRAINT FK_F_Venda_D_Data 
	FOREIGN KEY(Data)
	REFERENCES D_Data (Data)
	ON DELETE CASCADE;


ALTER TABLE F_Venda ADD CONSTRAINT FK_F_Venda_D_Funcionario 
	FOREIGN KEY(Id_Funcionario)
	REFERENCES D_Funcionario (Id_Funcionario)
	ON DELETE CASCADE;


ALTER TABLE F_Venda ADD  CONSTRAINT FK_F_Venda_D_RegiaoVendas 
	FOREIGN KEY(Id_RegiaoVendas)
	REFERENCES D_RegiaoVendas (Id_RegiaoVendas)
	ON DELETE CASCADE;


ALTER TABLE F_VendaDetalhe ADD  CONSTRAINT FK_F_VendaDetalhe_D_Produto 
	FOREIGN KEY(Id_Produto)
	REFERENCES D_Produto (Id_Produto)
	ON DELETE CASCADE;


ALTER TABLE F_VendaDetalhe ADD CONSTRAINT FK_F_VendaDetalhe_F_Venda 
	FOREIGN KEY(Data, Nr_NF,Id_Cliente, Id_Funcionario, Id_RegiaoVendas)
	REFERENCES F_Venda (Data, Nr_NF,Id_Cliente, Id_Funcionario, Id_RegiaoVendas)
	ON DELETE CASCADE;

