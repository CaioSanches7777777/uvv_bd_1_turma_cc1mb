
create database uvv;
use uvv;

CREATE TABLE funcionario (
/*Esse bloco cria a tabela funcionario, suas colunas e chaves.*/

primeiro_nome varchar(15) NOT null, 
/*Essa linha cria a coluna primeiro_nome, e deve ser preenchida com o primeiro nome do funcionario.*/

nome_meio char, 
/*Essa linha cria a coluna nome_meio da tabela funcionario, e pode ser preenchida com o nome do meio do funcionario.*/

ultimo_nome varchar(15) NOT NULL, 
/*Essa linha cria a coluna ultimo_nome da tabela funcionario, e deve ser preenchida com o último nome do funcionario.*/

cpf char(11) NOT NULL, 
/*Essa linha cria a coluna cpf da tabela funcionario, e deve ser preenchida com o CPF do funcionario.*/

data_nascimento date, 
/*Essa linha cria a coluna data_nascimento da tabela funcionario, e pode ser preenchida com a data de nascimento do funcionario.*/

endereco varchar(40), 
/*Essa linha cria a coluna endereco da tabela funcionario, e pode ser preenchida com o endereço do funcionario.*/

sexo char, 
/*Essa linha cria a coluna sexo da tabela funcionario, e pode ser preenchida com o sexo do funcionario.*/

salario decimal(10,2), 
/*Essa linha cria a coluna salario da tabela funcionario, e deve ser preenchida com o salário do funcionario.*/

cpf_supervisor char(11),
/*Essa linha cria a coluna cpf_supervisor da tabela funcionario, e deve ser preenchida com o CPF do supervisor do funcionario.*/

numero_departamento int NOT NULL,
/*Essa linha cria a coluna  da tabela , e deve ser preenchida com o número do departamento do funcionario.*/

PRIMARY KEY (cpf)
/*Essa linha cria a chave primaria cpf da tabela funcionario.*/

);

CREATE TABLE departamento (
/*Esse bloco cria a tabela departamento, suas colunas e chaves.*/

nome_departamento varchar(15) NOT NULL,
/*Essa linha cria a coluna nome_departamento da tabela departamento, e deve ser preenchida com nome do departamento.*/

numero_departamento int NOT NULL,
/*Essa linha cria a coluna numero_departamento da tabela departamento, e deve ser preenchida com numero do departamento.*/

cpf_gerente char(11) NOT NULL,
/*Essa linha cria a coluna cpf_gerente da tabela departamento, e deve ser preenchida com o CPF do gerente do departamento.*/

data_inicio_gerente date,
/*Essa linha cria a coluna data_inicio_gerente da tabela departamento, e pode ser preenchida com a data que o gerente do departamento assumiu o cargo.*/

PRIMARY KEY (numero_departamento),
/*Essa linha cria a chave primaria da tabela departamento.*/

UNIQUE (nome_departamento),


FOREIGN KEY (cpf_gerente) REFERENCES funcionario(cpf)
/*Essa linha cria a chave estrangeira da tabela departamento, que referencia a chave primaria (cpf) da tabela funcionario.*/
);

CREATE TABLE localizacoes_departamento (
/*Esse bloco cria a tabela localizacoes_departamento, suas colunas e chaves.*/

numero_departamento int NOT NULL,
/*Essa linha cria a coluna numero_departamento da tabela localizacoes_departamento, e será uma chave primaria e a chave estrangeira da coluna que referencia a chave (numero_departamento) da tabela departamento.*/

local varchar(15) NOT NULL,
/*Essa linha cria a coluna local da tabela localizacoes_departamento, e será uma chave primaria que deve ser preenchida com o local do departamento.*/

PRIMARY KEY (numero_departamento, local),
/*Essa linha cria as chaves primarias da tabela localizacoes_departamento.*/

FOREIGN KEY (numero_departamento) references departamento(numero_departamento)
/*Essa linha cria a chave estrangeira da tabela localizacoes_departamentos, que referencia a chave primaria numero_departamento da tabela departamento.*/
);

CREATE TABLE projeto (
/*Esse bloco cria a tabela projeto, suas colunas e chaves.*/

nome_projeto varchar(15) NOT NULL,
/*Essa linha cria a coluna nome_projeto da tabela projeto, e deve ser preenchida com o nome do projeto.*/

numero_projeto int NOT NULL,
/*Essa linha cria a coluna numero_projeto da tabela projeto, e deve ser preenchida com o número do projeto.*/

local_projeto varchar(15),
/*Essa linha cria a coluna local_projeto da tabela projeto, e pode ser preenchida com o local do projeto.*/

numero_departamento int NOT NULL,
/*Essa linha cria a coluna numero_departamento da tabela projeto, e deve ser preenchida com o número do departamento.*/

PRIMARY KEY (numero_projeto),
/*Essa linha cria a chave primaria da tabela projeto.*/

UNIQUE (nome_projeto),


FOREIGN KEY (numero_departamento) REFERENCES departamento(numero_departamento)
/*Essa linha cria a chave estrangeira da tabela projeto, que referencia a chave primaria numero_departamento da tabela departamento.*/
);

CREATE TABLE trabalha_em (
/*Esse bloco cria a tabela trabalha_em, suas colunas e chaves.*/

cpf_funcionario char(11) NOT NULL,
/*Essa linha cria a coluna cpf_funcionario da tabela trabalha_em, e deve ser preenchida com o CPF do funcionario.*/

numero_projeto int NOT NULL,
/*Essa linha cria a coluna numero_projeto da tabela trabalha_em, e deve ser preenchida com o número do projeto no qual o funcionario está trabalhando.*/

horas decimal(3,1),
/*Essa linha cria a coluna horas da tabela trabalha_em, e deve ser preenchida com o número de horas e trabalho.*/

PRIMARY KEY (cpf_funcionario, numero_projeto),
/*Essa linha cria a chave primaria da tabela trabalha_em.*/

FOREIGN KEY (cpf_funcionario) REFERENCES funcionario(cpf),
/*Essa linha cria uma das chaves estrangeiras da tabela trabalha_em, que referencia a chave primaria cpf da tabela funcionario.*/

FOREIGN KEY (numero_projeto) REFERENCES projeto(numero_projeto)
/*Essa linha cria uma das chaves estrangeiras da tabela trabalha_em, que referencia a chave primaria numero_projeto da tabela projeto.*/
);

CREATE TABLE dependente (
/*Esse bloco cria a tabela dependente, suas colunas e chaves.*/

cpf_funcionario char(11) NOT NULL,
/*Essa linha cria a coluna cpf_funcionario da tabela dependente, e deve ser preenchida com o CPF do funcionario.*/

nome_dependente varchar(15) NOT NULL,
/*Essa linha cria a coluna nome_dependente da tabela dependente, e deve ser preenchida com o nome do dependente do funcionario.*/

sexo char,
/*Essa linha cria a coluna sexo da tabela dependente, e pode ser preenchida com o sexo do dependente.*/

data_nascimento date,
/*Essa linha cria a coluna data_nascimento da tabela dependente, e pode ser preenchida com a data de nacimento do dependente.*/

parentesco varchar(8),
/*Essa linha cria a coluna parentesco da tabela dependente, e pode ser preenchida com o parentesco entre o dependente e o funcionario.*/

PRIMARY KEY (cpf_funcionario, nome_dependente),
/*Essa linha cria as chaves primarias da tabela dependente.*/

FOREIGN KEY (cpf_funcionario) REFERENCES funcionario(cpf)
/*Essa linha cria a chave estrangeira cpf_funcionario da tabela dependente, que referencia a chave primaria cpf da tabela funcionario.*/
);

alter table funcionario comment = "Tabela com os dados do funcionario.";
alter table departamento comment = "Tabela com os dados do departamento.";
alter table dependente comment = "Tabela com os dados do dependente de um funcionario.";
alter table localizacoes_departamento comment = "Tabela com os dados da localização do departamento.";
alter table trabalha_em comment = "Tabela com os dados do trabalho.";
alter table projeto comment = "Tabela com os dados do projeto.";


/*Todos os comandos insert a seguir são utilizados para inserir os dados nas suas respectivas tabelas e colunas.*/
insert into funcionario values(
"João", "B", "Silva", "12345678966", "1965-01-09", "Rua das Flores, 751, São Paulo, SP", "M", "30000", "33344555587", "5"),
("Fernando", "T", "Wong", "33344555587", "1955-12-08", "Rua da Lapa, 34, São Paulo, SP", "M", "40000", "88866555576", "5"),
("Alice", "J", "Zelaya", "99988777767", "1968-01-19", "Rua Souza Lima, 35, Curitiba, PR", "F", "25000", "98765432168", "4"),
("Jennifer", "S", "Souza", "98765432168", "1941-06-20", "Av. Arthur de Lima, 35, Santo André, SP", "F", "43000", "88866555576", "4"),
("Ronaldo", "K", "Lima", "66688444476", "1962-09-15", "Rua Rebouças, 65, Piraciba,, SP", "M", "38000", "33344555587", "5"),
("Joice", "A", "Leite", "45345345376", "1972-07-31", "Av. Lucas Obes, 74, São Paulo, SP", "F", "25000", "33344555587", "5"),
("André", "V", "Pereira", "98798798733", "1969-03-29", "Rua Timbira, 35, São Paulo, SP", "M", "25000", "98765432168", "4"),
("Jorge", "E", "Brito", "88866555576", "1937-11-10", "Rua do Horto, 35, São Paulo, SP", "M", "55000", null, "1");

insert into departamento values(
"Pesquisa", "5", "33344555587", "1988-05-22"),
("Administração", "4", "98765432168", "1995-01-01"),
("Matriz", "1", "88866555576", "1981-06-19");

insert into localizacoes_departamento values(
"1", "São Paulo"),
("4", "Mauá"),
("5", "Santo André"),
("5", "Itu"),
("5", "São Paulo");

insert into projeto values(
"ProdutoX", "1", "Santo André", "5"),
("ProdutoY", "2", "Itu", "5"),
("ProdutoZ", "3", "São Paulo", "5"),
("Informatização", "10", "Mauá", "4"),
("Reorganização", "20", "São Paulo", "1"),
("Novosbenefícios", "30", "Mauá", "4");

insert into dependente values(
"33344555587", "Alicia", "F", "1986-04-05", "Filha"),
("33344555587", "Tiago", "M", "1983-10-25", "Filho"),
("33344555587", "Janaína", "F", "1958-05-03", "Esposa"),
("98765432168", "Antonio", "M", "1942-02-28", "Marido"),
("12345678966", "Michael", "M", "1988-01-04", "Filho"),
("12345678966", "Alicia", "F", "1988-12-30", "Filha"),
("12345678966", "Elizabeth", "F", "1967-05-05", "Esposa");

insert into trabalha_em values(
"12345678966", "1", "32.5"),
("12345678966", "2", "7.5"),
("66688444476", "3", "40.0"),
("45345345376", "1", "20.0"),
("45345345376", "2", "20.0"),
("33344555587", "2", "10.0"),
("33344555587", "3", "10.0"),
("33344555587", "10", "10.0"),
("33344555587", "20", "10.0"),
("99988777767", "30", "30.0"),
("99988777767", "10", "10.0"),
("98798798733", "10", "35.0"),
("98798798733", "30", "5.0"),
("98765432168", "30", "20.0"),
("98765432168", "20", "15.0"),
("88866555576", "20", null);
