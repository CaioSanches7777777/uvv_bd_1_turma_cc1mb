
/* rascunho questão 6 */
select *
from (select d.nome_departamento, f.primeiro_nome as primeiro_nome_funcionario, f.nome_meio as nome_meio_funcionario, f.ultimo_nome as ultimo_nome_funcionario, dts.nome_dependente, f.nome_meio as nome_meio_dependente, f.ultimo_nome as ultimo_nome_dependente, dts.sexo, year(curdate()) - year(dts.data_nascimento) as idade_dependente
from funcionario as f, departamento as d, dependente as dts
where dts.cpf_funcionario = f.cpf and d.numero_departamento = f.numero_departamento) as formulario
case 
when dts.sexo = 'M' then 'Masculino'
when dts.sexo = 'F' then 'Feminino';
