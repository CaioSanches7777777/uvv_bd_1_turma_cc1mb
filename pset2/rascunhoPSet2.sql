
/* rascunho questão 6 */
select d.nome_departamento, funcionario.primeiro_nome as primeiro_nome_funcionario, funcionario.nome_meio as nome_meio_funcionario, funcionario.ultimo_nome as ultimo_nome_funcionario, depente.nome_dependente, funcionario.nome_meio as nome_meio_dependente, funcionario.ultimo_nome as ultimo_nome_dependente, dependente.sexo, year(curdate()) - year(dts.data_nascimento) as idade_dependente
from funcionario, departamento, dependente
inner join funcionario on departamento.numero_departamento=funcionario.numero_departamento
where dependente.cpf_funcionario = funcionario.cpf;
