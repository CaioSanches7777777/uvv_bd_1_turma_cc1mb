

CREATE TABLE funcionario (
/*Esse bloco cria a tabela funcionario, suas colunas e chaves.*/

primeiro_nome varchar(15) NOT NULL, 
/*Essa linha cria a coluna primeiro_nome, e deve ser preenchida com o primeiro nome do funcionario.*/

nome_meio char, 
/*Essa linha cria a coluna nome_meio da tabela funcionario, e pode ser preenchida com o nome do meio do funcionario.*/

ultimo_nome varchar(15) NOT NULL, 
/*Essa linha cria a coluna ultimo_nome da tabela funcionario, e deve ser preenchida com o último nome do funcionario.*/

cpf char(11) NOT NULL, 
/*Essa linha cria a coluna cpf da tabela funcionario, e deve ser preenchida com o CPF do funcionario.*/

data_nascimento date, 
/*Essa linha cria a coluna data_nascimento da tabela funcionario, e pode ser preenchida com a data de nascimento do funcionario.*/

endereco varchar(30), 
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

horas decimal(3,1) NOT NULL,
/*Essa linha cria a coluna horas da tabela trabalha_em, e deve ser preenchida com o número de horas invastidas no projeto.*/

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

comment on table funcionario is 'Tabela com os dados do funcionario.';
comment on table departamento  is 'Tabela com os dados do departamento.';
comment on table dependente  is 'Tabela com os dados do dependente de um funcionario.';
comment on table localizacoes_departamento is 'Tabela com os dados da localização do departamento.';
comment on table trabalha_em  is 'Tabela com os dados do trabalho.';
comment on table projeto  is 'Tabela com os dados do projeto.';
