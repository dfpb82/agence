CREATE DEFINER=`root`@`localhost` PROCEDURE `agence`.`Get_Consultores`()
begin
	select cu.no_usuario from cao_usuario cu,
				permissao_sistema ps 
where 
	cu.co_usuario =ps.co_usuario and 
	ps.co_sistema =1 and 
	ps.in_ativo ='S' and 
	ps.co_tipo_usuario in (0, 1, 2);
END