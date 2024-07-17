# O FAXINEIRO IMPLACÁVEL

## AVISO
> Todos os scripts abaixo devem ser usados e testados no banco que você vai usar para essa atividade. 
>
> Você vai precisar utilizar `ALTER TABLE`, `DROP`, `IF EXISTS`, `IF NOT EXISTS` e tudo o mais que vimos em aula. 

- Crie um banco de dados chamado Biblioteca.

```mysql
drop database if exists Biblioteca;
create database if not exists Biblioteca;
```

Abaixo estamos criando uma pequena biblioteca com livros. 
A criação da nossa estante é este Script abaixo, que possui erros que impedem renderização completa. 

Você consegue encontrá-los?

### Código Dado:

```mysql
CREATE TABLE Livros (
    livros_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(13),
);

INSERT INTO Livros (id, titulo, autor, editora, ano_publicacao, isbn) VALUES 
(1, 'A Culpa é das Estrelas', 'John Green', 'Intrínseca', 2012, '978-85-8057-346-6'),
(2, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, '9788532511010'),
(3, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Martins Fontes', 1954, '9788533603149'),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9780316769488'),
(5, '1984', 'George Orwell', 'Companhia Editora Nacional', 1949, '978-85-221-0616-9'),
(6, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 2005, '9788598078355');
```

### Código Corrijido:

```mysql
CREATE TABLE Livros (
    livros_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(255)
);

INSERT INTO Livros
  (livros_id, titulo, autor, editora, ano_publicacao, isbn)
VALUES 
  (1, 'A Culpa é das Estrelas', 'John Green', 'Intrínseca', 2012, '9788580573466'),
  (2, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, '9788532511010'),
  (3, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Martins Fontes', 1954, '9788533603149'),
  (4, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9780316769488'),
  (5, '1984', 'George Orwell', 'Companhia Editora Nacional', 1949, '978-85-221-0616-9'),
  (6, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 2005, '9788598078355');
```

## Retirando o pó
> Ainda trabalhando com código acima:

- Adicione a regra AUTO_INCREMENT para a chave primária remova os dados referentes ao ID dos livros do script de inserção.
- Crie uma tabela para 'Autores' e outra para 'Editoras', para separar essas informações. Elas devem conter chaves primárias para gerar relacionamentos.
- Utilizando ALTER TABLE, elimine as colunas 'autor' e 'editora' da tabela 'Livros' e adicione as colunas 'autor_id' e 'editora_id' para fazer a referências como chave estrangeiras das referidas tabelas.
- Retire os valores para autores e para as editoras do script inicial e insira-os nas novas tabelas.

### Script SQL Completo: 

```mysql
drop database if exists Biblioteca;
create database if not exists Biblioteca;

use Biblioteca;

create table if not exists Autores (
	id int primary key auto_increment,
    nome varchar(255) not null
);

create table if not exists Editores (
	id int primary key auto_increment,
    nome varchar(255) not null
);

create table if not exists Livros (
    livros_id INT PRIMARY KEY auto_increment not null,
    titulo VARCHAR(255) not null,
    autor VARCHAR(255) not null,
    editora VARCHAR(255) not null,
    ano_publicacao INT not null,
    isbn VARCHAR(255) not null
);

alter table Livros
drop column autor;

alter table Livros
drop column editora;

alter table Livros
add column autor_id int not null;

alter table Livros
add foreign key (autor_id)
references Autores(id);

alter table Livros
add column editor_id int not null;

alter table Livros
add foreign key (editor_id)
references Editores(id);

insert into Autores
	(id, nome)
values
	(1, "John Green"),
    (2, "J.K. Rowling"),
    (3, "J.R.R. Tolkien"),
    (4, "J.D. Salinger"),
    (5, "George Orwell"),
    (6, "Rick Riordan");
    
insert into Editores
	(id, nome)
values
	(1, "Intrínseca"),
    (2, "Rocco"),
    (3, "Martins Fontes"),
    (4, "Little, Brown and Company"),
    (5, "Companhia Editora Nacional");

INSERT INTO Livros 
	(livros_id, titulo, ano_publicacao, isbn, autor_id, editor_id) 
VALUES 
	(1, 'A Culpa é das Estrelas', 2012, '9788580573466', 1, 1),
	(2, 'Harry Potter e a Pedra Filosofal', 1997, '9788532511010', 2, 2),
	(3, 'O Senhor dos Anéis: A Sociedade do Anel', 1954, '9788533603149', 3, 3),
	(4, 'The Catcher in the Rye', '1951', '9780316769488', 4, 4),
	(5, '1984', 1949, '978-85-221-0616-9', 5, 5),
	(6, 'Percy Jackson e o Ladrão de Raios', 2005, '9788598078355', 6, 1);
```
