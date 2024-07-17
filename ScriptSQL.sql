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