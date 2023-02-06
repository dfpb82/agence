CREATE DEFINER=`root`@`localhost` PROCEDURE `agence`.`GananciasByConsultor`(in consultor varchar(50), 
																			in monthini int, 
																			in monthfin int, 
																			in yearini int, 
																			in yearfin int)
begin
declare recetaliquida float;
declare costofijo float;
declare comissao float;

/* obtener receta líquida*/

select 
	sum(cf.valor-(cf.valor * cf.total_imp_inc/100)) into recetaliquida
	
from cao_fatura cf,
	cao_os co,
	cao_usuario cu 
where 
	cf.co_os =co.co_os and 
	co.co_usuario=cu.co_usuario and 
	cu.no_usuario =consultor and 
	extract(month from cf.data_emissao)>=monthini and
	extract(month from cf.data_emissao)<=monthfin and
	extract(year from cf.data_emissao)>=yearini and
	extract(month from cf.data_emissao)<=yearfin;


/*obtener costo fijo*/
select 
	CS.brut_salario into costofijo  
from 
	cao_salario cs,
	cao_usuario cu 
where 
CS.co_usuario =CU.co_usuario and 
CU.no_usuario =consultor;

/* obtener comissao*/

select 
	sum(cf.valor-(cf.valor * cf.total_imp_inc/100)*cf.comissao_cn/100) into comissao
from cao_fatura cf,
	cao_os co,
	cao_usuario cu 
where 
	cf.co_os =co.co_os and 
	co.co_usuario=cu.co_usuario and 
	cu.no_usuario =consultor and 
	extract(month from cf.data_emissao)>=monthini and
	extract(month from cf.data_emissao)<=monthfin and
	extract(year from cf.data_emissao)>=yearini and
	extract(month from cf.data_emissao)<=yearfin;

select recetaliquida, costofijo, comissao;
END