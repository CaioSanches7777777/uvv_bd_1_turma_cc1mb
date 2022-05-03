use uvv;

-- 1)O comando a baixo seleciona a média dos salários respectivamente dos departamentos 1, 4 e 5.

select avg(salario) as media_salario_dep1_4_e_5
from funcionario
where numero_departamento=1 or numero_departamento=4 or numero_departamento=5
group by numero_departamento;


-- 2)Os comandos a baixo selecionam as médias dos salarios respectivamente de homens e de mulheres.

select avg(salario) as media_salario_M_e_F
from funcionario 
where sexo='M' or sexo='F'
group by sexo;


-- 3)O comando a baixo seleciona os nomes dos departamentos incluindo as informações sobre os funcionarios desses departamentos solicitadas no enunciado da questão 3.

select departamento.nome_departamento, funcionario.primeiro_nome, funcionario.nome_meio, funcionario.ultimo_nome, funcionario.data_nascimento, year(curdate()) - year(data_nascimento) as idade, funcionario.salario
from departamento 
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento;


-- 4)O comando a baixo seleciona as informações sobre os funcionarios solicitadas no enunciado da questão 4.

select primeiro_nome, nome_meio, ultimo_nome, data_nascimento, year(curdate()) - year(data_nascimento) as idade, salario as salario_atual, (salario+((salario div 10)*2)) as salario_com_reajuste
from funcionario
where salario<35000
union 
select primeiro_nome, nome_meio, ultimo_nome, data_nascimento, year(curdate()) - year(data_nascimento) as idade, salario as salario_atual, (salario+((salario div 100)*15)) as salario_com_reajuste
from funcionario
where salario>35000;


-- 5)O comando a baixo seleciona as informações sobre os funcionarios solicitadas no enunciado da questão 5.

select departamento.nome_departamento, funcionario.primeiro_nome as primeiro_nome, funcionario.nome_meio as nome_meio, funcionario.ultimo_nome as ultimo_nome
from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where cpf_gerente = cpf
union
select departamento.nome_departamento, funcionario.primeiro_nome as primeiro_nome, funcionario.nome_meio as nome_meio, funcionario.ultimo_nome as ultimo_nome
from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where not cpf_gerente = cpf
order by nome_departamento asc, salario desc;



-- 6)O comando a baixo seleciona as informações solicitaas no enunciado da questão 6 sobre os gerentes e os funcionarios em seus respectivos departamentos.

select *
from (select d.nome_departamento, f.primeiro_nome as primeiro_nome_gerente, f.nome_meio as nome_meio_gerente, f.ultimo_nome as ultimo_nome_gerente
from funcionario as f, departamento as d
where f.cpf = d.cpf_gerente
order by nome_departamento asc)as gerentes
union 
select *
from (select d2.nome_departamento, f2.primeiro_nome as primeiro_nome_funcionario, f2.nome_meio as nome_meio_funcionario, f2.ultimo_nome as ultimo_nome_funcionario
from funcionario as f2, departamento as d2
where f2.numero_departamento=d2.numero_departamento and not f2.cpf = d2.cpf_gerente
order by salario desc) as funcionarios;




-- 7)





-- 8)





-- 9)




-- 10)





-- 11)




-- 12)





-- 13)





-- 14)





-- 15)


