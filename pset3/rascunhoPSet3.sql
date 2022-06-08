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
