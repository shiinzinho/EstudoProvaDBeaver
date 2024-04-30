drop database if exists construtora;

create database construtora;

use construtora;

-- Tabela de projetos
create table projetos (
  id_projeto int not null auto_increment,
  nome varchar(45) not null,
  descricao varchar(2000) null,
  dt_inicio date not null,
  dt_fim date,
  valor_total decimal(15,2),
  status varchar(100),
  primary key (id_projeto)
);

-- Tabela de departamentos
create table departamentos (
  id_departamento int not null auto_increment,
  nome varchar(45) not null,
  primary key (id_departamento)
);

-- Tabela de funcionários
create table funcionarios (
  id_funcionario int not null auto_increment,
  nome varchar(255) not null,
  email varchar(255) not null unique,
  senha varchar(45) null,
  id_departamento int not null,
  valor_hora decimal(15,2) not null,
  primary key (id_funcionario),
  foreign key (id_departamento) references departamentos (id_departamento)
);


-- Tabela de funcionários em projetos
create table funcionarios_projetos (
  id_funcionario int not null,
  id_projeto int not null,
  horas_trabalhadas int not null,
  valor_hora decimal(15,2),
  primary key (id_funcionario, id_projeto),
  foreign key (id_funcionario) references funcionarios(id_funcionario),
  foreign key (id_projeto) references projetos (id_projeto)
);

-- Inserir dados na tabela de projetos
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 1', 'Descrição do Projeto 1', '2023-01-01', '2024-01-01', 50000.00,'Concluído');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 2', 'Descrição do Projeto 2', '2022-02-15', '2024-02-15', 75000.00,'Concluído');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 3', 'Descrição do Projeto 3', '2023-03-10', '2024-03-10', 100000.00,'Concluído');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 4', 'Descrição do Projeto 4', '2023-04-20', '2024-04-20', 80000.00,'Concluído');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 5', 'Descrição do Projeto 5', '2023-12-12', '2024-02-12', 60000.00,'Parado');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 6', 'Descrição do Projeto 6', '2024-01-01', '2024-06-30', 120000.00,'Em Andamento');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 7', 'Descrição do Projeto 7', '2024-02-15', '2024-08-15', 90000.00,'Em Andamento');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 8', 'Descrição do Projeto 8', '2024-03-10', '2024-09-10', 110000.00,'Em Andamento');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 9', 'Descrição do Projeto 9', '2024-04-20', '2024-10-20', 95000.00,'Em Andamento');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 10', 'Descrição do Projeto 10', '2024-10-05', '2025-05-05', 70000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 11', 'Descrição do Projeto 11', '2024-11-20', '2025-06-20', 85000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 12', 'Descrição do Projeto 12', '2024-12-15', '2025-07-15', 105000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 13', 'Descrição do Projeto 13', '2025-01-10', '2025-08-10', 125000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 14', 'Descrição do Projeto 14', '2025-02-28', '2025-09-28', 115000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 15', 'Descrição do Projeto 15', '2025-03-22', '2025-10-22', 95000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 16', 'Descrição do Projeto 16', '2025-04-10', '2025-11-10', 80000.00,'Aguardando Início');
insert into projetos (nome, descricao, dt_inicio, dt_fim, valor_total, status) values('Projeto 17', 'Descrição do Projeto 17', '2025-01-01', null,null, null);
insert into projetos (nome, descricao, dt_inicio) values ('Projeto 18', 'Descrição do Projeto 18', '2025-04-11');

-- Inserir dados na tabela de departamentos
insert into departamentos (nome) values
('TI'),
('Engenharia'),
('Mestre de Obras'),
('Pedreiros'),
('Ajudantes'),
('Eletricistas'),
('Encanadores'),
('Aprendiz');

-- Inserir dados na tabela de funcionários
insert into funcionarios (nome, email, senha, id_departamento, valor_hora) values
('Funcionario TI', 'funcionario_ti@empresa.com', 'senha123', 1, 50.00),
('Engenheiro 1', 'engenheiro1@empresa.com', 'senha123', 2, 70.00),
('Engenheiro 2', 'engenheiro2@empresa.com', 'senha123', 2, 70.00),
('Mestre de Obras 1', 'mestre_obras1@empresa.com', 'senha123', 3, 60.00),
('Mestre de Obras 2', 'mestre_obras2@empresa.com', 'senha123', 3, 60.00),
('Pedreiro 1', 'pedreiro1@empresa.com', 'senha123', 4, 55.00),
('Pedreiro 2', 'pedreiro2@empresa.com', 'senha123', 4, 55.00),
('Ajudante 1', 'ajudante1@empresa.com', 'senha123', 5, 40.00),
('Ajudante 2', 'ajudante2@empresa.com', 'senha123', 5, 40.00),
('Eletricista', 'eletricista@empresa.com', 'senha123', 6, 60.00),
('Encanador', 'encanador@empresa.com', 'senha123', 7, 60.00),
('Aprendiz 1', 'aprendiz1@empresa.com', 'senha123', 8, 30.00),
('Aprendiz 2', 'aprendiz2@empresa.com', 'senha123', 8, 30.00);

INSERT INTO funcionarios_projetos (id_funcionario,id_projeto,horas_trabalhadas,valor_hora) VALUES
	 (1,1,30,50.00),
	 (1,2,20,50.00),
	 (1,3,25,50.00),
	 (1,4,35,50.00),
	 (1,5,40,50.00),
	 (1,6,30,50.00),
	 (1,7,35,50.00),
	 (1,8,25,50.00),
	 (1,9,30,50.00),
	 (1,10,20,50.00),
	 (1,11,25,50.00),
	 (1,12,35,50.00),
	 (1,13,40,50.00),
	 (2,1,40,70.00),
	 (2,2,30,70.00),
	 (2,3,35,70.00),
	 (2,4,25,70.00),
	 (2,5,20,70.00),
	 (2,6,40,70.00),
	 (2,7,25,70.00),
	 (2,8,30,70.00),
	 (3,1,40,70.00),
	 (3,2,30,70.00),
	 (3,3,35,70.00),
	 (3,4,25,70.00),
	 (3,5,20,70.00),
	 (3,6,40,70.00),
	 (3,7,25,70.00),
	 (3,8,30,70.00),
	 (4,1,45,60.00),
	 (4,2,25,60.00),
	 (4,3,30,60.00),
	 (4,4,40,60.00),
	 (4,5,35,60.00),
	 (4,6,45,60.00),
	 (4,7,30,60.00),
	 (4,8,35,60.00),
	 (5,1,30,60.00),
	 (5,2,45,60.00),
	 (5,3,25,60.00),
	 (5,4,35,60.00),
	 (5,5,30,60.00),
	 (5,6,25,60.00),
	 (5,7,40,60.00),
	 (5,8,45,60.00),
	 (6,1,35,55.00),
	 (6,2,40,55.00),
	 (6,3,30,55.00),
	 (6,4,45,55.00),
	 (6,5,25,55.00),
	 (6,6,30,55.00),
	 (6,7,35,55.00),
	 (7,2,30,55.00),
	 (7,3,35,55.00),
	 (7,4,45,55.00),
	 (7,5,30,55.00),
	 (7,6,25,55.00),
	 (7,7,40,55.00),
	 (7,8,35,55.00),
	 (8,1,30,40.00),
	 (8,2,25,40.00),
	 (8,3,45,40.00),
	 (8,4,30,40.00),
	 (8,5,35,40.00),
	 (8,6,45,40.00),
	 (8,7,25,40.00),
	 (8,8,30,40.00),
	 (9,1,35,40.00),
	 (9,2,40,40.00),
	 (9,3,25,40.00),
	 (9,4,30,40.00),
	 (9,5,35,40.00),
	 (9,6,45,40.00),
	 (9,7,30,40.00),
	 (9,8,35,40.00),
	 (10,1,30,60.00),
	 (10,2,25,60.00),
	 (10,3,45,60.00),
	 (10,4,30,60.00),
	 (10,5,35,60.00),
	 (10,6,45,60.00),
	 (10,7,25,60.00),
	 (10,8,30,60.00),
	 (11,1,40,60.00),
	 (11,2,25,60.00),
	 (11,3,30,60.00),
	 (11,4,35,60.00),
	 (11,5,30,60.00),
	 (11,6,25,60.00),
	 (11,7,40,60.00),
	 (11,8,45,60.00),
	 (12,1,30,30.00),
	 (12,2,35,30.00),
	 (12,3,25,30.00),
	 (12,4,20,30.00),
	 (12,5,45,30.00),
	 (12,6,30,30.00),
	 (12,7,40,30.00),
	 (12,8,25,30.00),
	 (13,1,35,30.00),
	 (13,2,30,30.00),
	 (13,3,25,30.00),
	 (13,4,40,30.00),
	 (13,5,20,30.00),
	 (13,6,45,30.00),
	 (13,7,30,30.00),
	 (13,8,35,30.00);
	 
	
	
-- Exercício 1 --
select count( distinct fp.id_projeto) as Eletricistas from departamentos d 
inner join funcionarios f on d.id_departamento = f.id_departamento
inner join funcionarios_projetos fp on f.id_funcionario = fp.id_funcionario
where d.nome = 'Eletricistas';
	
-- Exercício 2 --
select p.nome as projeto, d.nome as departamento, p.valor_total from projetos p 
inner join funcionarios_projetos fp on p.id_projeto = fp.id_projeto
inner join funcionarios f on fp.id_funcionario = f.id_funcionario
inner join departamentos d on f.id_departamento = d.id_departamento;
	
-- Exercício 3 --
select f.nome as funcionario, avg(fp.horas_trabalhadas) as media_h from funcionarios f  
inner join funcionarios_projetos fp on f.id_funcionario = fp.id_funcionario
group by f.nome;
	
-- Exercício 4 --	
select f.nome as funcionario, sum(fp.horas_trabalhadas) as total_horas from funcionarios f 
inner join funcionarios_projetos fp on f.id_funcionario = fp.id_funcionario
group by f.nome
order by total_horas desc
limit 1;
	
-- Exercício 5 --
select p.nome, p.dt_inicio
from projetos p;

-- Exercício 6 --
update projetos set valor_total = 55000.00 where id_projeto = 1;

-- Exercício 7 --
select p.nome from projetos p where dt_fim is null;

-- Exercício 8 --
select avg(p.valor_total) as media from projetos p 
where p.status = 'Em Andamento';

select * from projetos p where p.status  = 'Em Andamento';

-- Exercício 9 --
select f.nome as funcionario
from funcionarios f 
where f.nome like '%1%';

-- Exercício 10 --
select p.nome as projeto, p.valor_total
from projetos p 
order by p.valor_total desc
limit 1;

-- Exercício 11 --
select p.nome as projeto, p.dt_inicio
from projetos p 
order by p.dt_inicio 
limit 1;

-- Exercício 12 --
select p.nome as projeto, f.nome as funcionario, sum(fp.horas_trabalhadas)
from projetos p 
inner join funcionarios_projetos fp on p.id_projeto = fp.id_projeto 
inner join funcionarios f on fp.id_funcionario = f.id_funcionario
group by p.nome, f.nome
limit 5;

-- Exercício 13 --
select f.nome as funcionario, sum(fp.horas_trabalhadas) as total_horas
from funcionarios f 
inner join funcionarios_projetos fp on f.id_funcionario = fp.id_funcionario
group by f.nome
order by total_horas desc;

-- Exercício 14 --
select p.nome as projeto, count(f.nome) as funcionarios
from projetos p 
left join funcionarios_projetos fp on p.id_projeto = fp.id_projeto
left join funcionarios f on fp.id_funcionario = f.id_funcionario
group by p.nome
order by funcionarios desc;

-- Exercício 15 --
select p.nome as projeto, f.nome as funcionarios, sum(f.valor_hora * fp.horas_trabalhadas) as total
from projetos p 
inner join funcionarios_projetos fp on p.id_projeto = fp.id_projeto
inner join funcionarios f on fp.id_funcionario = f.id_funcionario
group by p.nome, f.nome 
order by total desc;

-- Exercício 16 --
delete from funcionarios_projetos where valor_hora < 50;







































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	