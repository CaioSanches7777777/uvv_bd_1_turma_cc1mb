/* AJUDA E REFERÊNCIAS
https://www.w3schools.com/sql/func_mysql_concat.asp
https://www.w3schools.com/sql/sql_ref_case.asp
https://www.w3schools.com/sql/func_mysql_replace.asp
*/

/*
use uvv;

-- 1)O comando a baixo seleciona a média dos salários respectivamente dos departamentos 1, 4 e 5.

create view relatorio_1 as
select numero_departamento, avg(salario) as media_salario_dep
from funcionario
where numero_departamento=1 or numero_departamento=4 or numero_departamento=5
group by numero_departamento;


-- 2)Os comandos a baixo selecionam as médias dos salarios respectivamente de homens e de mulheres.

create view relatorio_2 as
select avg(salario) as media_salario_M, sexo
from funcionario 
where sexo='M'
union
select avg(salario) as media_salario_F, sexo
from funcionario 
where sexo='F';



-- 3)O comando a baixo seleciona os nomes dos departamentos incluindo as informações sobre os funcionarios desses departamentos solicitadas no enunciado da questão 3.

create view relatorio_3 as
select departamento.nome_departamento, concat(primeiro_nome, " ",nome_meio, ". ",ultimo_nome) as nome_completo_funcionario, funcionario.data_nascimento, year(curdate()) - year(data_nascimento) as idade, funcionario.salario
from departamento 
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento;


-- 4)O comando a baixo seleciona as informações sobre os funcionarios solicitadas no enunciado da questão 4.

create view relatorio_4 as
select concat(primeiro_nome, " ",nome_meio, ". ",ultimo_nome) as nome_completo_funcionario, year(curdate()) - year(data_nascimento) as idade, salario as salario_atual, (salario+((salario div 10)*2)) as salario_com_reajuste
from funcionario
where salario<35000
union 
select concat(primeiro_nome, " ",nome_meio, ". ",ultimo_nome) data_nascimento, year(curdate()) - year(data_nascimento) as idade, salario as salario_atual, (salario+((salario div 100)*15)) as salario_com_reajuste
from funcionario
where salario>35000;


-- 5)O comando a baixo seleciona as informações sobre os funcionarios solicitadas no enunciado da questão 5.

create view relatorio_5 as
select * 
from (select concat("Gerente ", departamento.nome_departamento) as nome_departamento, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where cpf_gerente = cpf
order by nome_departamento asc) as gerente
union 
select *
from (select departamento.nome_departamento, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where not cpf_gerente = cpf
order by salario desc) as funcionario;



/*ESBOÇO ERRADO
select *
from (select d.nome_departamento, f.primeiro_nome as primeiro_nome, f.nome_meio as nome_meio, f.ultimo_nome as ultimo_nome
from funcionario as f, departamento as d
where f.cpf = d.cpf_gerente
order by nome_departamento asc)as gerentes
union 
select *
from (select d2.nome_departamento, f2.primeiro_nome as primeiro_nome_funcionario, f2.nome_meio as nome_meio_funcionario, f2.ultimo_nome as ultimo_nome_funcionario
from funcionario as f2, departamento as d2
where not f2.cpf = d2.cpf_gerente
order by salario desc) as funcionarios;
*/


/* ESBOÇO VÁLIDO DA PARTE DE GERENTES DA QUESTÃO 5
select departamento.nome_departamento, funcionario.primeiro_nome as primeiro_nome, funcionario.nome_meio as nome_meio, funcionario.ultimo_nome as ultimo_nome
from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where cpf_gerente = cpf
order by nome_departamento asc;
*/

/* ESBOÇO VÁLIDO DA PARTE DE NÃO GERENTES DA QUESTÃO 5
select departamento.nome_departamento, funcionario.primeiro_nome as primeiro_nome, funcionario.nome_meio as nome_meio, funcionario.ultimo_nome as ultimo_nome
from departamento
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where not cpf_gerente = cpf;
where not cpf_gerente = cpf
order by salario desc;
*/



-- 6)O comando a baixo seleciona as informações solicitaas no enunciado da questão 6 sobre os gerentes e os funcionarios em seus respectivos departamentos.

create view relatorio_6 as
select *
from (select d.nome_departamento, concat(f.primeiro_nome, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_funcionario, concat(dts.nome_dependente, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_dependente, year(curdate()) - year(dts.data_nascimento) as idade_dependente,
case dts.sexo
      when 'M' then 'Masculino'
      when 'F' then 'Feminino'
end as sexo_dependente
from funcionario as f, departamento as d, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento) as formulario;


-- 7)
*/


/* rascunho de "create view" assessado com o comando "select * from relatorio_1;"
create view relatorio_1 as
select numero_departamento, avg(salario) as media_salario_dep
from funcionario
where numero_departamento=1 or numero_departamento=4 or numero_departamento=5
group by numero_departamento;
*/

/* rascunho questão 6  assessado pela view "select * from relatorio_6;" 
create view relatorio_6 as
select *
from (select d.nome_departamento, f.primeiro_nome as primeiro_nome_funcionario, f.nome_meio as nome_meio_funcionario, f.ultimo_nome as ultimo_nome_funcionario, dts.nome_dependente, f.nome_meio as nome_meio_dependente, f.ultimo_nome as ultimo_nome_dependente, dts.sexo, year(curdate()) - year(dts.data_nascimento) as idade_dependente
from funcionario as f, departamento as d, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento) as formulario;
*/




/* rascunho questão 6 */
select *
from (select d.nome_departamento, concat(f.primeiro_nome, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_funcionario, concat(dts.nome_dependente, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_dependente, year(curdate()) - year(dts.data_nascimento) as idade_dependente,
case dts.sexo
      when 'M' then 'Masculino'
      when 'F' then 'Feminino'
end as sexo_dependente
from funcionario as f, departamento as d, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento) as formulario;








/*
select *
from (


select d.nome_departamento
     , concat(f.primeiro_nome, " ", f.nome_meio, " ", f.ultimo_nome) as nome
     , dep.nome_dependente
     , CASE dep.sexo
         when 'M' then 'Masculino'
         when 'F' then 'Feminino'
         else ''
       end sexo_dependente
from funcionario as f
inner join departamento d on (d.numero_departamento = f.numero_departamento)
left join dependente dep on (dep.cpf_funcionario = f.cpf)
where dep.nome_dependente is null
;

, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento




) as formulario
case 
when sexo = 'M' then 'Masculino'
end;
*/
