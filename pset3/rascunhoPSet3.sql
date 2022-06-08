--rascunho

/*Modelo simples baseado nos links no arquivo de texto no PSet3*/

with recursive classificacao_P as (
	select codigo, nome, codigo_pai
	from classificacao
	where codigo_pai is null
	union
	select cls.codigo, cls.nome, cls.codigo_pai
	from classificacao as cls
	inner join classificacao_P on classificacao_P.codigo = cls.codigo_pai
	where cls.codigo_pai is not null)
select *
from classificacao_P 
;


--Tentativas

with classificacoes as (
	select codigo, nome, codigo_pai
	from classificacao
	where codigo_Pai is null)
	, meio_termo as (
	select cl.codigo, cl.nome, cl.codigo_pai
	from classificacao as cl)
	, produtos as (	
	select cls.codigo, cls.nome, cls.codigo_pai
	from classificacao as cls
	where cls.codigo_pai is not null)
select classificacoes.codigo, classificacoes.nome, classificacoes.codigo_Pai
from classificacoes
union 
select produtos.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome), produtos.codigo_Pai
from produtos 
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
union 
select produtos.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome , ' --> ', produtos.nome), produtos.codigo_Pai
from produtos
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
order by nome
;

/*
with classificacoes as (
	select codigo, nome, codigo_pai
	from classificacao
	where codigo_Pai is null)
	, meio_termo as (
	select cl.codigo, cl.nome, cl.codigo_pai
	from classificacao as cl)
	, produtos as (	
	select cls.codigo, cls.nome, cls.codigo_pai
	from classificacao as cls
	where cls.codigo_pai is not null)
select produtos.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome , ' --> ', produtos.nome), produtos.codigo_Pai
from produtos
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
order by classificacoes.nome
;*/

--Meio Proximo
with classificacoes as (
	select codigo, nome, codigo_pai
	from classificacao
	where codigo_Pai is null)
	, meio_termo as (
	select cl.codigo, cl.nome, cl.codigo_pai
	from classificacao as cl)
	, produtos as (	
	select cls.codigo, cls.nome, cls.codigo_pai
	from classificacao as cls
	where cls.codigo_pai is not null)
select classificacoes.codigo, classificacoes.nome, classificacoes.codigo_Pai
from classificacoes
union 
select produtos.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome), produtos.codigo_Pai
from produtos 
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
union 
select produtos.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome , ' --> ', produtos.nome), produtos.codigo_Pai
from produtos
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
order by nome
;




--Muito Proximo mas errado
with classificacoes as (
	select codigo, nome, codigo_pai
	from classificacao
	where codigo_Pai is null)
	
	, meio_termo as (
	select cl.codigo, cl.nome, cl.codigo_pai
	from classificacao as cl)
	
	, produtos as (	
	select cls.codigo, cls.nome, cls.codigo_pai
	from classificacao as cls
	where cls.codigo_pai is not null)
	
select classificacoes.codigo, classificacoes.nome, classificacoes.codigo_Pai
from classificacoes
union 

select mt.codigo, concat(classificacoes.nome, ' --> ', mt.nome), mt.codigo_Pai
from produtos
inner join meio_termo mt on mt.codigo_pai = produtos.codigo 
inner join classificacoes on classificacoes.codigo = mt.codigo_pai
union

select meio_termo.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome), meio_termo.codigo_Pai
from produtos 
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
inner join meio_termo mt on mt.codigo = meio_termo.codigo_Pai
union 

select produtos.codigo, concat(classificacoes.nome, ' --> ', meio_termo.nome , ' --> ', produtos.nome), produtos.codigo_Pai
from produtos
inner join meio_termo on meio_termo.codigo = produtos.codigo_pai
inner join classificacoes on classificacoes.codigo = meio_termo.codigo_pai
order by nome
;

--Mais Proximo

with recursive classificacao_P as (
	select codigo,
	nome,
	codigo_pai
	from classificacao
	where codigo_pai is null
		union
	select cls.codigo,
	cls.nome,
	cls.codigo_pai
	from classificacao as cls
	inner join classificacao_P on classificacao_P.codigo = cls.codigo_pai
	where cls.codigo_pai is not null)
select classificacao_P.codigo, 
classificacao_P.nome, 
classificacao_P.codigo_Pai
from classificacao_P
where codigo_Pai is null
	union
select cls.codigo, 
case cls.nome
	when cls.nome then concat(classificacao_P.nome, concat(' --> ', cls.nome, ' --> ',classificacao.nome))
	end as nome,
cls.codigo_Pai
from classificacao_P
inner join classificacao cls on cls.codigo_Pai = classificacao_P.codigo
inner join classificacao on classificacao.codigo_Pai = cls.codigo
left join classificacao clss on clss.codigo_Pai = classificacao.codigo
order by nome
;


/* Mesmo output

with recursive classificacao_P as (
	select codigo,
	nome,
	codigo_pai
	from classificacao
	where codigo_pai is null
		union
	select cls.codigo,
	cls.nome,
	cls.codigo_pai
	from classificacao as cls
	where cls.codigo_pai is not null
	union
	select clss.codigo,
	clss.nome,
	clss.codigo_pai
	from classificacao as clss
	inner join classificacao as cls on cls.codigo = cls.codigo_pai
	inner join classificacao_P on classificacao_P.codigo = cls.codigo_pai
	where cls.codigo_pai is not null)
select cls.codigo, 
case cls.nome
	when cls.nome then concat(classificacao_P.nome, case classificacao_P.nome when classificacao_P.nome then concat(' --> ', cls.nome, case cls.nome when cls.nome then concat(' --> ',classificacao.nome) else '' end) else '' end)
	end as nome,
cls.codigo_Pai
from classificacao_P
inner join classificacao cls on cls.codigo_Pai = classificacao_P.codigo
inner join classificacao on classificacao.codigo_Pai = cls.codigo
left join classificacao clss on clss.codigo_Pai = classificacao.codigo
order by nome
;

--

select cls.codigo,
concat(clss.nome, case when clss.codigo = cls.codigo_Pai then concat(' --> ', cls.nome, case when cls.codigo = cla.codigo_Pai then concat(' --> ', cla.nome) else '' end)end),
cls.codigo_Pai
from classificacao as clss
inner join classificacao as cls on cls.codigo_Pai = clss.codigo
inner join classificacao as cla on cla.codigo_Pai = cls.codigo
where cls.codigo_Pai = clss.codigo
and clss.codigo_Pai is null
and cla.codigo_Pai = cls.codigo
order by clss.nome;
*/
