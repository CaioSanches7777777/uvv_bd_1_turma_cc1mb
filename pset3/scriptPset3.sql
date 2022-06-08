/*Modelo que finalmente deu certo*/


with recursive classificacao_P as (
	select codigo, concat(nome) as nome, codigo_pai
	from classificacao
	where codigo_pai is null
	union all
	select cls.codigo, concat(pr.nome, ' --> ', cls.nome), cls.codigo_pai
	from classificacao as cls
	inner join classificacao_P as pr on pr.codigo = cls.codigo_pai
	where cls.codigo_Pai is not null)
select *
from classificacao_P 
order by classificacao_P.nome
;
