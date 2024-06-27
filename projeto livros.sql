#Para criar um novo banco de dados

CREATE DATABASE IF NOT EXISts db_MeusLivros;

#O elemento IF NOT EXISTS é opcional. Ele previne o erro de tentar criar um banco de dados que já existe no servidor

#Para utilizar banco de dados especifico

USE db_MeusLivros;

# Para Visualizar o Banco de Dados  selecionado no momento use: SELECT DATABASE ();

SELECT DATABASE ();

#COMECE SEMPRE CRIANDO AS TABELAS QUE NÃO TEM CHAVE ESTRANGEIRA

#CRIAR TABELA DO AUTOR

CREATE TABLE tbl_Autores (
IdAutor SMALLINT AUTO_INCREMENT,
NomeAutor VARCHAR(50) NOT NULL,
SobrenomeAutor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY (IdAutor)
);

#Verificar Campos da Tabela
DESCRIBE tbl_autores;

#Outro comando equivalente é o SHOW COLUMNS FROM:

SHOW COLUMNS FROM tbl_autores;

#Criar tabela de Editoras

CREATE TABLE tbl_Editoras (
IdEditora SMALLINT PRIMARY KEY
AUTO_INCREMENT,
NomeEditora VARCHAR(50) NOT NULL
);

#Criar tabela de Assuntos

CREATE TABLE tbl_Assuntos (
IdAssunto Tinyint AUTO_INCREMENT,
Assunto VARCHAR(25) NOT NULL,
CONSTRAINT pk_id_assunto PRIMARY KEY (IdAssunto)
);

#Criar tabela de Livros

CREATE TABLE IF NOT EXISTS tbl_Livros (
IDLivro SMALLINT NOT NULL AUTO_INCREMENT,
NomeLivro VARCHAR(70) NOT NULL,
ISBN13 VARCHAR(13) NOT NULL,
DataPub DATE,
PrecoLivro DECIMAL(10,2) NOT NULL,
NumeroPaginas SMALLINT NOT NULL,
IdEditora SMALLINT NOT NULL,
IdAssunto Tinyint NOT NULL,
CONSTRAINT pk_id_livro PRIMARY KEY (IDLivro),
CONSTRAINT fk_id_editora FOREIGN KEY (IdEditora) REFERENCES tbl_Editoras
(IdEditora) ON DELETE CASCADE,
CONSTRAINT fk_id_assunto FOREIGN KEY (IdAssunto) REFERENCES tbl_Assuntos
(IdAssunto) ON DELETE CASCADE
);

#Criar tabela LivrosAutores

CREATE TABLE tbl_LivrosAutores (
IdLivro SMALLINT NOT NULL,
IdAutor SMALLINT NOT NULL,
CONSTRAINT pk_id_livro_autor PRIMARY KEY (IdLivro, IdAutor),
CONSTRAINT fk_id_livros FOREIGN KEY (IdLivro) REFERENCES tbl_Livros
(IdLivro),
CONSTRAINT fk_id_autores FOREIGN KEY (IdAutor) REFERENCES tbl_Autores
(IdAutor)
);

SHOW TABLES

#INSERIR DADOS NAS PLANILHAS
#Inserir Dados – Tabela de Autores

INSERT INTO tbl_autores (NomeAutor, SobrenomeAutor)VALUES
('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'),
('William', 'Stanek'), ('Richard', 'Blum'), ('Christine', 'Bresnahan'),
('Richard', 'Silverman'), ('Robert', 'Byrnes'), ('Jay', 'Ts'),
('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield', 'Hill'),
('Joel', 'Murach'), ('Paul', 'Scherz'), ('Simon', 'Monk');


#Inserir Dados – Tabela de Editoras

INSERT INTO tbl_editoras (NomeEditora) VALUES
('Prentice Hall'), ('O´Reilly'),
('Microsoft Press'), ('Wiley'),
('Mc Graw Hill'), ('Bookman'),
('Novatec'), ('Apress'),
('Sybex'), ('Mike Murach and Associates');

#Inserir Dados – Tabela de Assuntos

INSERT INTO tbl_Assuntos (Assunto) VALUES
('Ficção'), ('Botânica'),
('Eletrônica'), ('Matemática'),
('Aventura'), ('Literatura'),
('Informática'), ('Suspense');

#Inserir Dados – Tabela de Livros
INSERT INTO tbl_Livros (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto,
IdEditora) VALUES
('Linux Command Line and Shell Scripting','9781118983843', '20150109', 165.55, 816, 7, 4),
('SSH, the Secure Shell','9780596008956', '20050517', 295.41, 672, 7, 2),
('Using Samba','9780596002565', '20031221', 158.76, 449, 7, 2),
('A Arte da Eletrônica', '9788582604342', '20170308', 176.71, 1160, 7, 6),
('Windows Server 2012 Inside Out','9780735666313', '20130125', 179.51, 1584, 7, 3),
('Murach´s MySQL','9781943872367', '20190501', 227.64, 650, 7, 10),
('Practical Electronics for Inventors', '9781259587542', '20160711', 119.58, 1056, 3, 5);


#Inserir Dados – Tabela LivrosAutores

INSERT INTO tbl_LivrosAutores (IdLivro, IdAutor) VALUES 
(1,5), (1,6), (2,1), (2,7), (2,8), (2,2), (3,9),
(3,10),(4,11), (4,12), (5,4), (6,13), (7,14), (7,15);


SELECT * FROM tbl_Autores;
SELECT * FROM tbl_Editoras;
SELECT * FROM tbl_Assuntos;
SELECT * FROM tbl_Livros;
SELECT * FROM tbl_LivrosAutores;

SELECT * FROM tbl_livros
# Modificar registros em uma tabela - comando UPDATE
UPDATE tbl_Livros
SET NomeLivro = 'SSH, o Shell Seguro'
WHERE IdLivro = 2;

UPDATE tbl_Livros
SET PrecoLivro = PrecoLivro + 10
WHERE IdLivro = 6;

UPDATE tbl_Assuntos
SET Assunto = 'Biologia'
WHERE IdAssunto = 2;

SELECT * FROM tbl_assuntos

# Excluir registros de uma tabela - comando DELETE

DELETE FROM
WHERE coluna = valor

# exemplo add uma nova editora

SELECT *FROM tbl_Editoras

INSERT INTO TBL_Editoras (NomeEditora)
VALUES  ( 'Bossón editora');
# Para Excluir

DELETE FROM tbl_editoras
WHERE IdEditora = 11;


# CONSULTAS SIMPLES 

SELECT * FROM tbl_Autores

SELECT NomeAutor FROM tbl_autores;

SELECT NomeLivro
FROM tbl_Livros;



#Consulta com Múltiplas colunas

SELECT NomeLivro, PrecoLivro FROM tbl_livros;

SELECT NomeAutor, SobrenomeAutor
FROM tbl_Autores;


SELECT NomeLivro, ISBN13, DataPub
FROM tbl_Livros;

# Consultas com ordenação - cláusula ORDER BY

SELECT * FROM tbl_Livros ORDER BY NomeLivro ASC;

SELECT NomeLivro, IdEditora FROM tbl_Livros 
ORDER BY IdEditora;

SELECT NomeLivro, PrecoLivro FROM tbl_Livros
ORDER BY PrecoLivro DESC;

SELECT NomeLivro, DataPub, idAssunto
FROM tbl_Livros ORDER BY idAssunto, NomeLivro;

# Limitar resultados de consultas com LIMIT

# Retornar os dois livros mais baratos da tabela de livros:

SELECT NomeLivro, PrecoLivro
FROM tbl_Livros
ORDER BY PrecoLivro
LIMIT 2;

#Retornar os três livros mais caros da tabela de livros:

SELECT NomeLivro, PrecoLivro
FROM tbl_Livros
ORDER BY PrecoLivro DESC
LIMIT 3;

#Retornar o 3º, 4º e 5º livros com maior número de páginas da tabela de livros:

SELECT NomeLivro, NumeroPaginas
FROM tbl_Livros
ORDER BY NumeroPaginas DESC
LIMIT 2, 3;

# Aqui, 2 significa que a contagem se inicia no 3º item (contado a partir de 0), e serão retornados os próximos 3 itens.



#Filtrar consultas com cláusula WHERE

#Sintaxe:
SELECT colunas
FROM tabela
WHERE coluna = valor

SELECT NomeLivro, DataPub FROM tbl_Livros WHERE
IdEditora = 2;

SELECT IdAutor, NomeAutor FROM tbl_Autores WHERE
SobrenomeAutor = 'Stanek';

SELECT IdAssunto FROM tbl_Assuntos
WHERE Assunto = 'Terror';

# PODE-SE USAR TAMBEM OUTROS OPERADORES
# > MAIOR QUE
# < MENOR QUE
# >= MAIOR OU IGUAL
# <= MENOR OU IGUAL

# Aumentar a performance de consultas com Índices



# Filtrar resultados de consultas - operadores AND, OR e NOT
# Exemplos – AND, OR e NOT

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 2 AND IdEditora < 4;

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 2 OR IdEditora < 4;

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE NOT IdEditora = 10;

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 2 AND NOT IdEditora <= 4;



# Pode-se dar um nome diferente a uma coluna ou tabela no retorno de uma consulta usando um Alias. Sintaxe:
SELECT coluna1 AS alias_coluna1,
coluna2 AS alias_coluna2,
colunaN alias_colunaN
FROM tabela AS alias_tabela;

#EXEMPLOS

SELECT NomeLivro AS Livro
FROM tbl_Livros
WHERE IdLivro > 2;

SELECT NomeAutor AS Nome,
SobrenomeAutor Sobrenome
FROM tbl_Autores AS Autores;

SELECT NomeLivro AS Livro, PrecoLivro AS 'Preço do Livro'
FROM tbl_Livros AS Livros
ORDER BY 'Preço do Livro' DESC;

	
#Sintaxe básica: SELECT Função (ALL | DISTINCT expressão)
  
#Funções de Agregação
# MIN = Valor Mínimo
# MAX = Valor Máximo
# AVG = Média Aritmética
# SUM = Totalizar (Soma)
# COUNT = Contar quantidade de itens

# Exemplos

SELECT COUNT(*) AS Total FROM tbl_Autores;

SELECT COUNT(DISTINCT idEditora)
FROM tbl_Livros;

SELECT MAX(PrecoLivro) AS 'Mais caro' FROM tbl_Livros;

SELECT MIN(PrecoLivro) FROM tbl_Livros;

SELECT AVG(PrecoLivro) AS Média FROM tbl_Livros;

SELECT SUM(PrecoLivro) AS 'Preço Total' FROM tbl_Livros;

SELECT SUM(PrecoLivro) / COUNT(*)
AS 'Preço Médio' FROM tbl_Livros;
SELECT COUNT(*) AS 'Quant Livros', SUM(NumeroPaginas) AS 'Páginas Totais',
AVG(NumeroPaginas) 'Média de Págs.'
FROM tbl_Livros;

# Selecionar intervalos em consultas - cláusula BETWEEN (ENTRE)

#A palavra BETWEEN (ENTRE) permite estabelecer um intervalo de filtragem em uma cláusula WHERE.
#Sintaxe: 

SELECT colunas FROM tabela
WHERE coluna BETWEEN valor1 AND valor2;
# BETWEEN - Exemplos

SELECT * FROM tbl_Livros
WHERE DataPub BETWEEN '20040517' AND '20110517';

SELECT NomeLivro AS Livro, PrecoLivro AS Preço 
FROM tbl_Livros 
WHERE PrecoLivro BETWEEN 150.00 AND 200.00;

SELECT NomeLivro, PrecoLivro FROM tbl_Livros
WHERE PrecoLivro BETWEEN 170.00 AND 180.00
OR PrecoLivro BETWEEN 220.00 AND 300.00
ORDER BY PrecoLivro;


#Padrões de caracteres em consultas - cláusulas LIKE e NOT LIKE
#Metacaracteres: '%' Qualquer cadeia de 0 ou mais caracteres, '_' Sublinhado: qualquer caractere único.

SELECT * FROM tbl_Livros
WHERE NomeLivro LIKE 'A%';

SELECT * FROM tbl_Livros
WHERE NomeLivro NOT LIKE 'S%';

SELECT NomeLivro FROM tbl_Livros
WHERE NomeLivro LIKE '_i%';

SELECT NomeLivro AS Livro, PrecoLivro AS Valor
FROM tbl_Livros
WHERE NomeLivro NOT LIKE 'A%' AND PrecoLivro <= 190.00;

#  Agrupar Registros em consultas - cláusula GROUP BY
# Usamos a declaração GROUP BY para agrupar registros em subgrupos baseados em colunas ou valores retornados por uma expressão

# Sintaxe básica:
SELECT colunas, função_agregação()
FROM tabela
WHERE filtro
GROUP BY colunas
ORDER BY colunas

# GROUP BY - Exemplos

SELECT IdAssunto, SUM(NumeroPaginas) FROM tbl_Livros
GROUP BY IdAssunto;

SELECT IdEditora, SUM(PrecoLivro) FROM tbl_livros
GROUP BY IdEditora;

SELECT IdEditora, AVG (NumeroPaginas), IdAssunto 
FROM tbl_livros
GROUP BY IdEditora, IdAssunto;


SELECT IdEditora, SUM(PrecoLivro) FROM tbl_livros
WHERE NumeroPaginas >= 1000
GROUP BY IdEditora, NumeroPaginas
ORDER BY NumeroPaginas;


SELECT IdEditora, SUM(PrecoLivro)
FROM tbl_Livros
WHERE NumeroPaginas >= 1000
GROUP BY IdEditora, NumeroPaginas
ORDER BY NumeroPaginas;

select * from tbl_Livros

SELECT * FROM tbl_livros;

