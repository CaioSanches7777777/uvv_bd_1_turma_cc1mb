/* AJUDA E REFERÊNCIAS
https://www.w3schools.com/sql/func_mysql_concat.asp
https://www.w3schools.com/sql/sql_ref_case.asp
https://www.w3schools.com/sql/func_mysql_replace.asp
*/
-- questão 10 = questão 1



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

select d.nome_departamento, concat(f.primeiro_nome, " ",f.nome_meio, ". ",f.ultimo_nome) as nome_completo_funcionario, f.salario
from funcionario as f, departamento as d
inner join funcionario on (d.numero_departamento=funcionario.numero_departamento)
where d.numero_departamento=f.numero_departamento;




/* NÃO USAR, APENAS ESTUDAR (ADAPTAÇÃO DO CODIGO DO ABRANTES PARA QUESTÃO 7)
select d.nome_departamento, concat(f.primeiro_nome, " ", f.nome_meio, " ", f.ultimo_nome) as nome, f.salario
from funcionario as f
inner join departamento d on (d.numero_departamento = f.numero_departamento)
left join dependente dep on (dep.cpf_funcionario = f.cpf)
where dep.nome_dependente is null;
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





--8)

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





select nome_departamento
, numero_e_nome_projeto
, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº1)ProdutoX'
union
select nome_departamento
, numero_e_nome_projeto
, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº2)ProdutoY'
union
select nome_departamento
, numero_e_nome_projeto
, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº3)ProdutoZ'
union
select nome_departamento
, numero_e_nome_projeto
, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº10)Informatização'
union
select nome_departamento
, numero_e_nome_projeto
, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº20)Reorganização'
union
select nome_departamento
, numero_e_nome_projeto
, SUM(horas)
from relatorio_8
where numero_e_nome_projeto = '(Nº30)Novosbenefícios';






/* Rascunho da 9
select departamento.nome_departamento
, trabalha_em.numero_projeto
, projeto.nome_projeto
, sum(trabalha_em.horas)
from (projeto
inner join departamento on (projeto.numero_departamento=departamento.numero_departamento)
inner join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
where trabalha_em.numero_projeto = projeto.numero_projeto and projeto.numero_projeto = projeto.numero_projeto;
*/



--10)


select concat(departamento.nome_departamento, ' Nº', funcionario.numero_departamento) as nome_e_numero_departamento, avg(funcionario.salario) as media_salario_dep
from funcionario, departamento
where funcionario.numero_departamento=1 or funcionario.numero_departamento=4 or funcionario.numero_departamento=5
group by funcionario.numero_departamento;




--11)

select concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
, trabalha_em.horas
, trabalha_em.horas * 50 as valor_em_horas_trabalhadas
from (((funcionario 
inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
where funcionario.cpf = trabalha_em.cpf_funcionario
order by trabalha_em.numero_projeto;





--12)











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
