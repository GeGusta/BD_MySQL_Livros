/* Criando o banco club_do_livro */
CREATE DATABASE clube_do_livro;

/* Acessando o banco */
USE clube_do_livro;

/* Criando tabela de Livros */
CREATE TABLE LIVROS(
	ID_livro INT PRIMARY KEY AUTO_INCREMENT,
	nome_livro varchar(100),
	autoria varchar(45),
	editora varchar(30),
	categoria varchar(45),
	preco float(10,2)
);

/* Criando tabela de estoque */
CREATE TABLE ESTOQUE(
	ID_estoque INT PRIMARY KEY AUTO_INCREMENT,
	ID_livro INT UNIQUE,
	qtd_estoque int,
	FOREIGN KEY(ID_livro) REFERENCES LIVROS(ID_livro)
);

/* Criando tabela de vendedores */
CREATE TABLE VENDEDORES(
	ID_vendedor INT PRIMARY KEY AUTO_INCREMENT,
	nome_vendedor varchar(50)
);

/* Criando tabela de vendas */
CREATE TABLE VENDAS(
	ID_pedido INT PRIMARY KEY AUTO_INCREMENT,
	ID_vendedor INT,
	ID_livro INT,
	qtd_vendida int,
	data_venda date,
	FOREIGN KEY(ID_vendedor) REFERENCES VENDEDORES(ID_vendedor),
	FOREIGN KEY(ID_livro) REFERENCES LIVROS(ID_livro)
);

/* Inserindo Dados nas Tabelas*/

/* Tabela Livros */

INSERT INTO LIVROS 
VALUES
(NULL,'A Volta ao Mundo em 80 Dias', 'Júlio Verne','Principis','Aventura',21.99),
(NULL,'O Cortiço','Aluísio de Azevedo','Panda Books','Romance',47.8),
(NULL,'Dom Casmurro','Machado de Assis','Via Leitura','Romance',19.90),
(NULL,'Memórias Póstumas de Brás Cubas','Machado de Assis','Antofágica','Romance',45),
(NULL,'Quincas Borba','Machado de Assis','L&PM Editores','Romance',48.5),
(NULL,'Ícaro','Gabriel Pedrosa','Ateliê','Poesia',36),
(NULL,'Os Lusíadas','Luís Vaz de Camões','Montecristo','Poesia',18.79),
(NULL,'Outros Jeitos de Usar a Boca','Rupi Kaur','Planeta','Poesia',34.8)
(NULL, "A mão e a Luva", NULL,'Antofágica','Romance',40);

/* Tabela Vendedores */

INSERT INTO VENDEDORES 
VALUES
(1,'Paula Rabelo'),
(2,'Juliana Macedo'),
(3,'Roberto Barros'),
(4,'Barbara Jales');

/* Tabela Vendas */
INSERT INTO VENDAS 
VALUES 
(NULL, 3, 7, 1, '2020-11-02'),
(NULL, 4, 8, 2, '2020-11-02'),
(NULL, 4, 4, 3, '2020-11-02'),
(NULL, 1, 7, 1, '2020-11-03'),
(NULL, 1, 6, 3, '2020-11-03'),
(NULL, 1, 8, 2, '2020-11-04'),
(NULL, 4, 1, 3, '2020-11-04'),
(NULL, 1, 5, 2, '2020-11-05'),
(NULL, 1, 2, 1, '2020-11-05'),
(NULL, 3, 8, 2, '2020-11-11'),
(NULL, 1, 1, 4, '2020-11-11'),
(NULL, 2, 1, 10, '2020-11-11'),
(NULL, 1, 1, 5, '2020-11-18'),
(NULL, 2, 4, 1, '2020-11-25'),
(NULL, 3, 3, 2,'2021-01-05'),
(NULL, 4, 3, 1, '2021-01-05'),
(NULL, 4, 4, 3, '2021-01-06'),
(NULL, 2, 2, 2, '2021-01-06');

/* Tabela Estoque */
INSERT INTO ESTOQUE 
VALUES
(null, 1,  7),
(null,2,  10),
(null,3,  2),
(null,4,  4),
(null,5, 5),
(null,6, 3),
(null,8, 3),
(null,7, 3);

/* Visualizando os Livros */
SELECT *
FROM LIVROS;

/* Visualizando as Vendas */
SELECT *
FROM VENDAS;

/* Visualizando o estoque */
SELECT *
FROM ESTOQUE;

/* Quantidade de vendas por livro */
SELECT l.nome_livro, SUM(v.qtd_vendida)
FROM VENDAS as v
LEFT JOIN LIVROS as l
ON v.ID_livro = l.ID_livro
GROUP BY 1
ORDER BY 2 DESC;

/* Quantidade de vendas por vendedor */
SELECT ve.nome_vendedor, SUM(v.qtd_vendida)
FROM VENDAS as v
LEFT JOIN VENDEDORES as ve
ON v.ID_vendedor = ve.ID_vendedor
GROUP BY 1
ORDER BY 2 DESC;

/* Adicionando a informação de autoria na tabela livros */
UPDATE LIVROS SET autoria = "Machado de Assis" WHERE ID_livro = 9;