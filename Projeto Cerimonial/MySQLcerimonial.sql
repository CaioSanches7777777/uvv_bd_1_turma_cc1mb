create database cerimonial; 
CREATE TABLE enderecos (
                codigo_endereco VARCHAR(50) NOT NULL,
                logradouro VARCHAR(100) NOT NULL,
                numero INT NOT NULL,
                complemento VARCHAR(100),
                bairro VARCHAR(100) NOT NULL,
                cidade VARCHAR(50) NOT NULL,
                uf VARCHAR(2) NOT NULL,
                cep INT NOT NULL,
                PRIMARY KEY (codigo_endereco)
);

ALTER TABLE enderecos COMMENT 'Tabela que armazena os endereços.';

ALTER TABLE enderecos MODIFY COLUMN codigo_endereco VARCHAR(50) COMMENT 'Codigo do endereço';

ALTER TABLE enderecos MODIFY COLUMN logradouro VARCHAR(100) COMMENT 'Logradouro do endereço.';

ALTER TABLE enderecos MODIFY COLUMN numero INTEGER COMMENT 'Número do endereço.';

ALTER TABLE enderecos MODIFY COLUMN complemento VARCHAR(100) COMMENT 'Complemento do endereço.';

ALTER TABLE enderecos MODIFY COLUMN bairro VARCHAR(100) COMMENT 'Bairro do enereço.';

ALTER TABLE enderecos MODIFY COLUMN cidade VARCHAR(50) COMMENT 'Cidade do endereço.';

ALTER TABLE enderecos MODIFY COLUMN uf VARCHAR(2) COMMENT 'UF(Únidade Federetiva) do endereço.';

ALTER TABLE enderecos MODIFY COLUMN cep INTEGER COMMENT 'CEP do endereço.';


CREATE TABLE garcons (
                codigo_profissional VARCHAR(50) NOT NULL,
                tempo_experiencia VARCHAR(100) NOT NULL,
                PRIMARY KEY (codigo_profissional)
);

ALTER TABLE garcons COMMENT 'Tabela que armazena dados sobre os garçons.';

ALTER TABLE garcons MODIFY COLUMN codigo_profissional VARCHAR(50) COMMENT 'Código do profissional que trabalha no evento.';

ALTER TABLE garcons MODIFY COLUMN tempo_experiencia VARCHAR(100) COMMENT 'Tempo de experiência do profissional atuando na profissão.';


CREATE TABLE musicos (
                codigo_profissional VARCHAR(50) NOT NULL,
                desc_habilidades VARCHAR(300) NOT NULL,
                formacao VARCHAR(200) NOT NULL,
                PRIMARY KEY (codigo_profissional)
);

ALTER TABLE musicos COMMENT 'Tabela que armazena dados sobre os músicos.';

ALTER TABLE musicos MODIFY COLUMN codigo_profissional VARCHAR(50) COMMENT 'Código do profissional que trabalha no evento.';

ALTER TABLE musicos MODIFY COLUMN desc_habilidades VARCHAR(300) COMMENT 'Descrição das habilidades do profissional.';

ALTER TABLE musicos MODIFY COLUMN formacao VARCHAR(200) COMMENT 'Tipo de formação do profissional.';


CREATE TABLE cozinheiros (
                codigo_profissional VARCHAR(50) NOT NULL,
                formacao VARCHAR(200) NOT NULL,
                desc_habilidades VARCHAR(300) NOT NULL,
                PRIMARY KEY (codigo_profissional)
);

ALTER TABLE cozinheiros COMMENT 'Tabela que armazena dados sobre os cozinheiros.';

ALTER TABLE cozinheiros MODIFY COLUMN codigo_profissional VARCHAR(50) COMMENT 'Código do profissional que trabalha no evento.';

ALTER TABLE cozinheiros MODIFY COLUMN formacao VARCHAR(200) COMMENT 'Tipo de formação do profissional.';

ALTER TABLE cozinheiros MODIFY COLUMN desc_habilidades VARCHAR(300) COMMENT 'Descrição das habilidades do profissional.';


CREATE TABLE convidados (
                codigo_convidado VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                data_nascimento DATE NOT NULL,
                sexo CHAR(1) NOT NULL,
                telefones NUMERIC(9) NOT NULL,
                PRIMARY KEY (codigo_convidado)
);

ALTER TABLE convidados COMMENT 'Tabela que armazena dados sobre os convidados.';

ALTER TABLE convidados MODIFY COLUMN codigo_convidado VARCHAR(50) COMMENT 'Código do convidado.';

ALTER TABLE convidados MODIFY COLUMN nome VARCHAR(50) COMMENT 'Nome do convidado.';

ALTER TABLE convidados MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do convidado.';

ALTER TABLE convidados MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do convidado.';

ALTER TABLE convidados MODIFY COLUMN telefones NUMERIC(9) COMMENT 'Telefones do convidado.';


CREATE TABLE telefones (
                codigo_dono VARCHAR(50) NOT NULL,
                telefone NUMERIC(9) NOT NULL,
                PRIMARY KEY (codigo_dono)
);

ALTER TABLE telefones COMMENT 'Tabela que armazena os telefones dos envolvidos(clientes, convidados, profissionais) no evento.';

ALTER TABLE telefones MODIFY COLUMN codigo_dono VARCHAR(50) COMMENT 'Código do dono do telefone.';

ALTER TABLE telefones MODIFY COLUMN telefone NUMERIC(9) COMMENT 'Telefone.';


CREATE TABLE clientes (
                codigo_cliente VARCHAR(50) NOT NULL,
                codigo_endereco VARCHAR(50) NOT NULL,
                nome_cliente VARCHAR(100) NOT NULL,
                telefones NUMERIC(9) NOT NULL,
                email VARCHAR(30) NOT NULL,
                PRIMARY KEY (codigo_cliente)
);

ALTER TABLE clientes COMMENT 'Tabela que armazena dados sobre os clientes que contrataram/alugaram o cerimonial.';

ALTER TABLE clientes MODIFY COLUMN codigo_cliente VARCHAR(50) COMMENT 'Código do cliente.';

ALTER TABLE clientes MODIFY COLUMN codigo_endereco VARCHAR(50) COMMENT 'Código do endereço do cliente.';

ALTER TABLE clientes MODIFY COLUMN nome_cliente VARCHAR(100) COMMENT 'Nome do cliente.';

ALTER TABLE clientes MODIFY COLUMN telefones NUMERIC(9) COMMENT 'Telefones do cliente.';

ALTER TABLE clientes MODIFY COLUMN email VARCHAR(30) COMMENT 'E-mail do cliente.';


CREATE TABLE eventos (
                codigo_evento VARCHAR(50) NOT NULL,
                codigo_cliente VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                motivo VARCHAR(200) NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                valor DECIMAL(10,2) NOT NULL,
                forma_pagamento VARCHAR(20) NOT NULL,
                PRIMARY KEY (codigo_evento)
);

ALTER TABLE eventos COMMENT 'Tabela que armazena dados sobre os eventos realizados no cerimonial.';

ALTER TABLE eventos MODIFY COLUMN codigo_evento VARCHAR(50) COMMENT 'Código do evento.';

ALTER TABLE eventos MODIFY COLUMN codigo_cliente VARCHAR(50) COMMENT 'Código do cliente(contratante).';

ALTER TABLE eventos MODIFY COLUMN nome VARCHAR(50) COMMENT 'Nome do evento';

ALTER TABLE eventos MODIFY COLUMN motivo VARCHAR(200) COMMENT 'Motivo do evento.';

ALTER TABLE eventos MODIFY COLUMN data_inicio DATE COMMENT 'Data de início do evento.';

ALTER TABLE eventos MODIFY COLUMN data_fim DATE COMMENT 'Data do fim do evento.';

ALTER TABLE eventos MODIFY COLUMN hora_inicio TIME COMMENT 'Hora de início do evento.';

ALTER TABLE eventos MODIFY COLUMN hora_fim TIME COMMENT 'Hora do fim do evento.';

ALTER TABLE eventos MODIFY COLUMN valor DECIMAL(10, 2) COMMENT 'Valor do evento.';

ALTER TABLE eventos MODIFY COLUMN forma_pagamento VARCHAR(20) COMMENT 'Forma de pagamento pelo evento.';


CREATE TABLE profissionais (
                codigo_profissional VARCHAR(50) NOT NULL,
                nome_profissional VARCHAR(100) NOT NULL,
                codigo_endereco VARCHAR(50) NOT NULL,
                telefones NUMERIC(9) NOT NULL,
                PRIMARY KEY (codigo_profissional)
);

ALTER TABLE profissionais COMMENT 'Tabela que armazena dados sobre os proficionais que trabalham nos eventos.';

ALTER TABLE profissionais MODIFY COLUMN codigo_profissional VARCHAR(50) COMMENT 'Código do profissional que trabalha no evento.';

ALTER TABLE profissionais MODIFY COLUMN nome_profissional VARCHAR(100) COMMENT 'Nome do profissional.';

ALTER TABLE profissionais MODIFY COLUMN codigo_endereco VARCHAR(50) COMMENT 'Código do endereço do profissional.';

ALTER TABLE profissionais MODIFY COLUMN telefones NUMERIC(9) COMMENT 'Telefones do profissional.';


CREATE TABLE equipes (
                codigo_profissional VARCHAR(50) NOT NULL,
                data_inicio DATE NOT NULL,
                codigo_evento VARCHAR(50) NOT NULL,
                data_fim DATE,
                PRIMARY KEY (codigo_profissional, data_inicio)
);

ALTER TABLE equipes COMMENT 'Tabela que armazena dados sobre as equipes que atuam no evento.';

ALTER TABLE equipes MODIFY COLUMN codigo_profissional VARCHAR(50) COMMENT 'Código do profissional que trabalha no evento.';

ALTER TABLE equipes MODIFY COLUMN data_inicio DATE COMMENT 'Data de contratação das equipes para determinado evento.';

ALTER TABLE equipes MODIFY COLUMN codigo_evento VARCHAR(50) COMMENT 'Código do evento.';

ALTER TABLE equipes MODIFY COLUMN data_fim DATE COMMENT 'Data do término da atuação das equipes no evento.';


CREATE TABLE servicos (
                codigo_servico VARCHAR(50) NOT NULL,
                descricao VARCHAR(400) NOT NULL,
                nome_servico VARCHAR(200) NOT NULL,
                valor DECIMAL(9,2) NOT NULL,
                codigo_evento VARCHAR(50) NOT NULL,
                PRIMARY KEY (codigo_servico)
);

ALTER TABLE servicos COMMENT 'Tabela que armazena dados sobre os serviços.';

ALTER TABLE servicos MODIFY COLUMN codigo_servico VARCHAR(50) COMMENT 'Código dos serviços do evento (alimentícios).';

ALTER TABLE servicos MODIFY COLUMN descricao VARCHAR(400) COMMENT 'Descrição dos serviços oferecidos nos eventos.';

ALTER TABLE servicos MODIFY COLUMN nome_servico VARCHAR(200) COMMENT 'Nome do serviço do evento.';

ALTER TABLE servicos MODIFY COLUMN valor DECIMAL(9, 2) COMMENT 'Valor de determinado serviço.';

ALTER TABLE servicos MODIFY COLUMN codigo_evento VARCHAR(50) COMMENT 'Código do evento.';


CREATE TABLE consumos (
                codigo_evento VARCHAR(50) NOT NULL,
                quant_contratada INT NOT NULL,
                quant_consumida INT,
                codigo_servico VARCHAR(50) NOT NULL,
                PRIMARY KEY (codigo_evento)
);

ALTER TABLE consumos COMMENT 'Tabela que armazena dados sobre os consumos do evento.';

ALTER TABLE consumos MODIFY COLUMN codigo_evento VARCHAR(50) COMMENT 'Código do evento.';

ALTER TABLE consumos MODIFY COLUMN quant_contratada INTEGER COMMENT 'Quantidade de consumos contratados para o evento.';

ALTER TABLE consumos MODIFY COLUMN quant_consumida INTEGER COMMENT 'Quantidade consumida dos consumos contratados.';

ALTER TABLE consumos MODIFY COLUMN codigo_servico VARCHAR(50) COMMENT 'Código dos serviços do evento (alimentícios).';


CREATE TABLE bebidas (
                codigo_servico VARCHAR(50) NOT NULL,
                nome_bebida VARCHAR(50) NOT NULL,
                teor_alcoolico DECIMAL(3,3) NOT NULL,
                PRIMARY KEY (codigo_servico)
);

ALTER TABLE bebidas COMMENT 'Tabela que armazena dados sobre as bebidas oferecidas nos eventos.';

ALTER TABLE bebidas MODIFY COLUMN codigo_servico VARCHAR(50) COMMENT 'Código dos serviços de bebidas.';

ALTER TABLE bebidas MODIFY COLUMN nome_bebida VARCHAR(50) COMMENT 'Nome da bebida oferecida nos eventos.';

ALTER TABLE bebidas MODIFY COLUMN teor_alcoolico DECIMAL(3, 3) COMMENT 's.';


CREATE TABLE comidas (
                codigo_servico VARCHAR(50) NOT NULL,
                nome_comida VARCHAR(50) NOT NULL,
                teor_calorico DECIMAL(3,3) NOT NULL,
                PRIMARY KEY (codigo_servico)
);

ALTER TABLE comidas COMMENT 'Tabela que armazena dados sobre as comidas oferecidas nos eventos.';

ALTER TABLE comidas MODIFY COLUMN codigo_servico VARCHAR(50) COMMENT 'Código dos serviços de comidas.';

ALTER TABLE comidas MODIFY COLUMN nome_comida VARCHAR(50) COMMENT 'Nome das comidas oferecidas nos eventos.';

ALTER TABLE comidas MODIFY COLUMN teor_calorico DECIMAL(3, 3) COMMENT 'Teor calórico das respectivas comidas.';


ALTER TABLE profissionais ADD CONSTRAINT enderecos_profissionais_fk
FOREIGN KEY (codigo_endereco)
REFERENCES enderecos (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE clientes ADD CONSTRAINT enderecos_clientes_fk
FOREIGN KEY (codigo_endereco)
REFERENCES enderecos (codigo_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE profissionais ADD CONSTRAINT garcons_profissionais_fk
FOREIGN KEY (codigo_profissional)
REFERENCES garcons (codigo_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE profissionais ADD CONSTRAINT musicos_profissionais_fk
FOREIGN KEY (codigo_profissional)
REFERENCES musicos (codigo_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE profissionais ADD CONSTRAINT cozinheiros_profissionais_fk
FOREIGN KEY (codigo_profissional)
REFERENCES cozinheiros (codigo_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefones ADD CONSTRAINT convidados_telefones_fk
FOREIGN KEY (codigo_dono)
REFERENCES convidados (codigo_convidado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE convidados ADD CONSTRAINT telefones_convidados_fk
FOREIGN KEY (codigo_convidado)
REFERENCES telefones (codigo_dono)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE profissionais ADD CONSTRAINT telefones_profissionais_fk
FOREIGN KEY (codigo_profissional)
REFERENCES telefones (codigo_dono)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE clientes ADD CONSTRAINT telefones_clientes_fk
FOREIGN KEY (codigo_cliente)
REFERENCES telefones (codigo_dono)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE eventos ADD CONSTRAINT clientes_eventos_fk
FOREIGN KEY (codigo_cliente)
REFERENCES clientes (codigo_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefones ADD CONSTRAINT clientes_telefones_fk
FOREIGN KEY (codigo_dono)
REFERENCES clientes (codigo_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE consumos ADD CONSTRAINT eventos_consumos_fk
FOREIGN KEY (codigo_evento)
REFERENCES eventos (codigo_evento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE equipes ADD CONSTRAINT eventos_equipes_fk
FOREIGN KEY (codigo_evento)
REFERENCES eventos (codigo_evento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE equipes ADD CONSTRAINT profissionais_equipes_fk
FOREIGN KEY (codigo_profissional)
REFERENCES profissionais (codigo_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefones ADD CONSTRAINT profissionais_telefones_fk
FOREIGN KEY (codigo_dono)
REFERENCES profissionais (codigo_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comidas ADD CONSTRAINT servicos_comidas_fk
FOREIGN KEY (codigo_servico)
REFERENCES servicos (codigo_servico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE bebidas ADD CONSTRAINT servicos_bebidas_fk
FOREIGN KEY (codigo_servico)
REFERENCES servicos (codigo_servico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE consumos ADD CONSTRAINT servicos_consumos_fk
FOREIGN KEY (codigo_servico)
REFERENCES servicos (codigo_servico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
