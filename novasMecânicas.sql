drop database if exists escola;

create database escola;

use escola;

create table alunos (
id int auto_increment,
nome varchar(50),
idade int,
primary key(id)
);

insert into alunos (nome, idade) values
('joão', 20),
('maria',22),
('carlos', 19);

select * from alunos a;

-- ------------------------------------ VIEW -----------------------------------------------

-- view é uma representação virtual de uma tabela basesada em uma consulta sql.
-- ela permite simplificar consultas complexas e reutilizar a lógica de consulta
-- create view <nome> as <pesquisa>;

create view alunosMaioresDe20 as select a.nome, a.idade from alunos a where a.idade > 20;

select * from alunosmaioresde20;

-- -------------------------------------- --------------------------------------------------

alter view alunosMaioresDe20 as select a.nome, a.idade, (year(now()) - a.idade) as ano_nascimento from alunos a where idade > 20;

select * from alunosmaioresde20;

-- ------------------------------------ FUNCTION -----------------------------------------------

-- são blocos de código reutilizáveis que realizam uma tarefa específica.
-- pode-se usá-las para simplificar consultas, cálculos ou manipulação de dados.

delimiter //

create function calcularIdadeMedia()
returns decimal(5,2)
begin
	declare media decimal(5,2);
    select avg(idade) into media from alunos a; 
    return media; 
end //
delimiter 

select calcularIdadeMedia() as idadeMedia;

select a.id, a.nome, a.idade, calcularIdadeMedia() as IdadeMedia from alunos a;

-- --------------------------------------   ----------------------------------------------------

delimiter //
create function calcular_idade(data_nascimento date)
returns int
begin
	declare idade int;
    declare data_atual date;
    set data_atual = curdate();
    set idade = year(data_atual) - year(data_nascimento);
    if month(data_atual) < month(data_nascimento) or (
    month(data_atual) = month(data_nascimento) and
    day (data_atual) <= day(data_nascimento)
    ) then 
    set idade = idade - 1;
   end if;
    return idade;
end //
delimiter 

select calcular_idade('2007-04-09');

-- ------------------------------------ PROCEDURE -----------------------------------------------

-- procedimentos são conjuntos de instruções sql armazenados no banco de dados.
-- eles podem aceitar parâmetros e executar uma série de comandos.

delimiter //
create procedure adicionarAluno(x_nome varchar(50), x_idade int)
begin 
	insert into alunos (nome, idade) values (x_nome, x_idade);
end //
delimiter

call adicionarAluno('Ana', 30);

select * from alunos a;

-- ---------------------- Diferença entre FUNCTION e PROCEDURE ---------------------------------

-- FUNCTION -> retorna um valor. Pode ser usado em expressão sql. por exemplo: [  select calcularIdadeMedia();  ]
-- PROCEDURE -> não retorna um valor diretamente. pode ter efeitos colaterais, como modificar dados no
-- banco de dados. por exemplo: [ call adicionarAluno('Ana', 30); ]

-- -------------------------------------------     ---------------------------------------------









