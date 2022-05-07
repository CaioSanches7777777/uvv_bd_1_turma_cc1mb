use uvv;

-- 1)O comando a baixo seleciona a média dos salários dos funcionarios, respectivamente, dos departamentos 1, 4 e 5.

select numero_departamento, concat('$', avg(salario)) as media_salario_dep
from funcionario
where numero_departamento=1 or numero_departamento=4 or numero_departamento=5
group by numero_departamento;


-- 2)Os comandos a baixo selecionam as médias dos salarios respectivamente de homens e de mulheres.

select concat('$', avg(salario)) as media_salario, sexo
from funcionario 
where sexo='M'
union
select concat('$', avg(salario)) as media_salario, sexo
from funcionario 
where sexo='F';



-- 3)O comando a baixo seleciona os nomes dos departamentos incluindo as informações sobre os funcionarios desses departamentos solicitadas no enunciado da questão 3.

select departamento.nome_departamento, concat(primeiro_nome, " ",nome_meio, ". ",ultimo_nome) as nome_completo_funcionario, funcionario.data_nascimento, year(curdate()) - year(data_nascimento) as idade, concat('$', funcionario.salario) as salario
from departamento 
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento;


-- 4)O comando a baixo seleciona as informações sobre os funcionarios solicitadas no enunciado da questão 4.

select concat(primeiro_nome, " ",nome_meio, ". ",ultimo_nome) as nome_completo_funcionario, year(curdate()) - year(data_nascimento) as idade, concat('$', salario) as salario_atual, concat('$', (salario+((salario div 10)*2))) as salario_com_reajuste
from funcionario
where salario<35000
union 
select concat(primeiro_nome, " ",nome_meio, ". ",ultimo_nome) data_nascimento, year(curdate()) - year(data_nascimento) as idade, concat('$', salario) as salario_atual, concat('$', (salario+((salario div 100)*15))) as salario_com_reajuste
from funcionario
where salario>35000;


-- 5)O comando a baixo seleciona as informações sobre os funcionarios solicitadas no enunciado da questão 5.

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



-- 6)O comando a baixo seleciona as informações solicitadas no enunciado da questão 6 sobre e os funcionarios em seus respectivos dependentes.
 
select *
from (select d.nome_departamento, concat(f.primeiro_nome, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_funcionario, concat(dts.nome_dependente, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_dependente, year(curdate()) - year(dts.data_nascimento) as idade_dependente,
case dts.sexo
      when 'M' then 'Masculino'
      when 'F' then 'Feminino'
end as sexo_dependente
from funcionario as f, departamento as d, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento) as formulario;


-- 7)O comando a baixo seleciona as informações solicitadas no enunciado da questão 7 sobre e os funcionarios sem dependentes.

select departamento.nome_departamento, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",ultimo_nome) as nome_completo_funcionario, concat('$', funcionario.salario) as salario
from funcionario
inner join departamento on (departamento.numero_departamento = funcionario.numero_departamento)
left join dependente on (dependente.cpf_funcionario = funcionario.cpf)
where dependente.nome_dependente is null;



-- 8)O comando a baixo seleciona as informações solicitadas no enunciado da questão 8 sobre os projetos de cada departamento e numero de horas e os funcionarios associados a cada projeto.

create view relatorio_8 as
select departamento.nome_departamento
, concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
, trabalha_em.horas
from (((funcionario 
inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
where funcionario.cpf = trabalha_em.cpf_funcionario
order by trabalha_em.numero_projeto;
--favor ignorar o erro (que ocorre quando a view relatorio_8 já foi criada) acima, essa view será usada na questão 9  

select * from relatorio_8;





-- 9)O comando a baixo seleciona o nome dos departamentos, o nome e o numero de cada projeto de cada departamento e a soma do numero de horas investidas em cada projeto.


/*ESBOÇO VÁLIDO DA QUESTÃO 9

CREATE VIEW relatorio_9 as
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº1)ProdutoX'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº2)ProdutoY'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº3)ProdutoZ'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº10)Informatização'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº20)Reorganização'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº30)Novosbenefícios';
/*Favor ignorar o erro (que ocorre quando a view relatorio_9 já foi criada) acima, essa view será usada como abreviação da questão 9*/

select * from relatorio_9;
*/



/*RACUNHO INCOMPLETO DA 9
select trabalha_em.horas
, projeto.nome_projeto
, departamento.nome_departamento
from (projeto
inner join departamento on (departamento.numero_departamento=projeto.numero_departamento)
inner join trabalha_em on (trabalha_em.numero_projeto=projeto.numero_projeto))
where projeto.numero_projeto = trabalha_em.numero_projeto
and projeto.numero_departamento=departamento.numero_departamento;
*/




-- 10)O comando a baixo seleciona a média dos salários dos funcionarios, respectivamente, dos departamentos 1, 4 e 5.

select concat(departamento.nome_departamento, ' Nº', funcionario.numero_departamento) as nome_e_numero_departamento, concat('$', avg(funcionario.salario)) as media_salario_dep
from funcionario, departamento
where funcionario.numero_departamento=1 or funcionario.numero_departamento=4 or funcionario.numero_departamento=5
group by funcionario.numero_departamento;



-- 11)O comando a baixo seleciona o nome dos projetos e dos funcionarios associados ao respectivos projetos e o valor que o funcionario receberá referente às horas trabalhadas.

select concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
, concat('$', trabalha_em.horas * 50) as valor_em_horas_trabalhadas
from (((funcionario 
inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
where funcionario.cpf = trabalha_em.cpf_funcionario
order by trabalha_em.numero_projeto;



-- 12)O comando a baixo seleciona o nome dos projetos e dos funcionarios associados ao respectivos projetos que não registraram horas trabalhadas.




/*RASCUNHO 12

select concat(f.primeiro_nome, " ", f.nome_meio, ". ", f.ultimo_nome) as nome_completo_funcionario
, tm.cpf_funcionario
, concat('(Nº', tm.numero_projeto, ') ', pj.nome_projeto) as nome_e_numero_projeto
, tm.horas
from trabalha_em as tm
inner join funcionario as f on tm.cpf_funcionario=f.cpf
inner join projeto as pj on tm.numero_projeto=pj.numero_projeto
where tm.horas is null 
;


*/




-- 13)O comando a baixo seleciona os dados dos funcionarios e seus dependentes, especificando-os como funcionarios ou dependentes.

select *
from (select concat(f.primeiro_nome, " ",f.nome_meio, ". ",f.ultimo_nome, " (funcionario)") as nome_completo
      , year(curdate()) - year(f.data_nascimento) as idade
      , case f.sexo
            when 'M' then 'Masculino'
            when 'F' then 'Feminino'
      end as sexo
      from funcionario as f, departamento as d
      union
      select concat(dts.nome_dependente, " ",f.nome_meio, ". ",f.ultimo_nome, " (dependente)") as nome_completo
      , year(curdate()) - year(dts.data_nascimento) as idade
      , case dts.sexo
            when 'M' then 'Masculino'
            when 'F' then 'Feminino'
      end as sexo     
from funcionario as f, departamento as d, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento) as presenteados
order by idade desc;




-- 14)O comando a baixo seleciona o nome dos departamentos e a soma do numero de funcionarios em cada departamento

/*ESBOÇO VÁLIDO DA 14

select departamento.nome_departamento, count(funcionario.cpf) as numero_de_funcionarios
from funcionario 
inner join departamento on departamento.numero_departamento=funcionario.numero_departamento
where nome_departamento='Pesquisa'
union
select departamento.nome_departamento, count(funcionario.cpf) as numero_de_funcionarios
from funcionario 
inner join departamento on departamento.numero_departamento=funcionario.numero_departamento
where nome_departamento='Administração'
union 
select departamento.nome_departamento, count(funcionario.cpf) as numero_de_funcionarios
from funcionario 
inner join departamento on departamento.numero_departamento=funcionario.numero_departamento
where nome_departamento='Matriz';
*/



-- 15)
