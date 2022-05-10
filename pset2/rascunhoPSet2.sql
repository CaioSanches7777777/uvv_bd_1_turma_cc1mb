/* AJUDA E REFERÊNCIAS
https://www.w3schools.com/sql/func_mysql_concat.asp
https://www.w3schools.com/sql/sql_ref_case.asp
https://www.w3schools.com/sql/func_mysql_replace.asp
*/
-- questão 10 = questão 1






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

/*novo rascunho da 9*/
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from relatorio_8
group by numero_e_nome_projeto;




















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
/*RASCUNHO ERRADO
select departamento.nome_departamento
, concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
, concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
, trabalha_em.horas
from (((funcionario 
inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
right join 
where funcionario.cpf = trabalha_em.cpf_funcionario
order by trabalha_em.numero_projeto;
*/

select concat(f.primeiro_nome, " ", f.nome_meio, ". ", f.ultimo_nome) as nome_completo_funcionario
, tm.cpf_funcionario
, concat('(Nº', tm.numero_projeto, ') ', pj.nome_projeto) as nome_e_numero_projeto
, tm.horas
from trabalha_em as tm
inner join funcionario as f on tm.cpf_funcionario=f.cpf
inner join projeto as pj on tm.numero_projeto=pj.numero_projeto
where tm.horas is null 
;





--13)
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






--14)
/*Válido
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

/*14 com union
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

/*14 sem union*/
select departamento.nome_departamento, count(funcionario.cpf) as numero_de_funcionarios
from funcionario 
inner join departamento on departamento.numero_departamento=funcionario.numero_departamento
group by departamento.nome_departamento;








select nome_departamento, count(numero_de_funcionarios)
from (select distinct departamento.nome_departamento, funcionario.cpf as numero_de_funcionarios
from departamento
inner join funcionario on funcionario.numero_departamento=departamento.numero_departamento) as relatorio;


select distinct departamento.nome_departamento, funcionario.cpf as numero_de_funcionarios
from departamento
inner join funcionario on funcionario.numero_departamento=departamento.numero_departamento;


select nome_departamento, numero_de_funcionarios
from (select distinct departamento.nome_departamento, funcionario.cpf as numero_de_funcionarios
from departamento
left join funcionario on funcionario.numero_departamento=departamento.numero_departamento
where funcionario.numero_departamento=departamento.numero_departamento) as relatorio;





--15)

/* rascunho errado
select concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
, departamento.nome_departamento
, concat('(Nº', trabalha_em.numero_projeto, ')   ', projeto.nome_projeto) as numero_e_nome_projeto
from (((funcionario 
inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
inner join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
inner join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
where funcionario.cpf = trabalha_em.cpf_funcionario
union
select concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
, departamento.nome_departamento
, concat('(Nº', trabalha_em.numero_projeto, ')   ', projeto.nome_projeto)
from (((funcionario 
inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
inner join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
inner join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
where funcionario.cpf = trabalha_em.cpf_funcionario 
and concat('(Nº', trabalha_em.numero_projeto, ')   ', projeto.nome_projeto) is null
order by nome_completo_funcionario;

*/





select 
case trabalha_em.cpf_funcionario
      when trabalha_em.cpf_funcionario then funcionario.primeiro_nome end as nome_funcionario
, departamento.nome_departamento
, case trabalha_em.numero_projeto
      when p.numero_projeto then p.nome_projeto end as nome_do_projeto
from departamento, trabalha_em, funcionario
left join departamento as d on (d.numero_departamento=funcionario.numero_departamento)
left join projeto as p on (funcionario.numero_departamento=p.numero_departamento)
right join trabalha_em as tm on (p.numero_projeto=tm.numero_projeto)
where funcionario.cpf = trabalha_em.cpf_funcionario
order by nome_funcionario;


/* codigo da 15*/
select 
case trabalha_em.cpf_funcionario
      when trabalha_em.cpf_funcionario then concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome)
      end as nome_funcionario
, departamento.nome_departamento
, case trabalha_em.numero_projeto
      when trabalha_em.numero_projeto then concat('(Nº', trabalha_em.numero_projeto, ')   ', projeto.nome_projeto) 
      else ''
      end as numero_e_nome_projeto
from (((trabalha_em
inner join funcionario on (trabalha_em.cpf_funcionario=funcionario.cpf))
left join projeto on (trabalha_em.numero_projeto=projeto.numero_projeto))
inner join departamento on (projeto.numero_departamento=departamento.numero_departamento))
union 
select
case trabalha_em.cpf_funcionario
      when trabalha_em.cpf_funcionario then concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome)
      end as nome_funcionario
, departamento.nome_departamento
, case trabalha_em.numero_projeto
      when trabalha_em.numero_projeto then concat('(Nº', trabalha_em.numero_projeto, ')   ', projeto.nome_projeto) 
      else ''
      end as numero_e_nome_projeto
from (((trabalha_em
inner join funcionario on (trabalha_em.cpf_funcionario=funcionario.cpf))
left join projeto on (trabalha_em.numero_projeto=projeto.numero_projeto))
inner join departamento on (projeto.numero_departamento=departamento.numero_departamento))
where concat('(Nº', trabalha_em.numero_projeto, ')   ', projeto.nome_projeto) is null
order by nome_funcionario;







/* variação da 9 sem o relatorio_8

select nome_departamento, numero_e_nome_projeto, SUM(horas)
from (select departamento.nome_departamento
      , concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
      , concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
      , trabalha_em.horas
      from (((funcionario 
      inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
      left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
      left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
      where funcionario.cpf = trabalha_em.cpf_funcionario
      order by trabalha_em.numero_projeto) as produto1
where numero_e_nome_projeto = '(Nº1)ProdutoX'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from (select departamento.nome_departamento
      , concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
      , concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
      , trabalha_em.horas
      from (((funcionario 
      inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
      left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
      left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
      where funcionario.cpf = trabalha_em.cpf_funcionario
      order by trabalha_em.numero_projeto) as produto2
where numero_e_nome_projeto = '(Nº2)ProdutoY'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from (select departamento.nome_departamento
      , concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
      , concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
      , trabalha_em.horas
      from (((funcionario 
      inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
      left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
      left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
      where funcionario.cpf = trabalha_em.cpf_funcionario
      order by trabalha_em.numero_projeto) as produto3
where numero_e_nome_projeto = '(Nº3)ProdutoZ'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from (select departamento.nome_departamento
      , concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
      , concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
      , trabalha_em.horas
      from (((funcionario 
      inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
      left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
      left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
      where funcionario.cpf = trabalha_em.cpf_funcionario
      order by trabalha_em.numero_projeto) as produto10
where numero_e_nome_projeto = '(Nº10)Informatização'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from (select departamento.nome_departamento
      , concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
      , concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
      , trabalha_em.horas
      from (((funcionario 
      inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
      left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
      left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
      where funcionario.cpf = trabalha_em.cpf_funcionario
      order by trabalha_em.numero_projeto) as produto20
where numero_e_nome_projeto = '(Nº20)Reorganização'
union
select nome_departamento, numero_e_nome_projeto, SUM(horas)
from (select departamento.nome_departamento
      , concat('(Nº', trabalha_em.numero_projeto, ')', projeto.nome_projeto) as numero_e_nome_projeto
      , concat(funcionario.primeiro_nome, " ",funcionario.nome_meio, ". ",funcionario.ultimo_nome) as nome_completo_funcionario
      , trabalha_em.horas
      from (((funcionario 
      inner join departamento on (departamento.numero_departamento=funcionario.numero_departamento))
      left join projeto on (funcionario.numero_departamento=projeto.numero_departamento))
      left join trabalha_em on (projeto.numero_projeto=trabalha_em.numero_projeto))
      where funcionario.cpf = trabalha_em.cpf_funcionario
      order by trabalha_em.numero_projeto) as produto30
where numero_e_nome_projeto = '(Nº30)Novosbenefícios';
*/










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



