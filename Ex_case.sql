delimiter //
create procedure sp_listaEstoqueProd2(varCodProd int)
begin
	declare varQtdEstoque int;
    declare varMsg varchar(40);
    
    select unitsInStock into varQtdEstoque
    from products
    where productid = varCodProd;

    case
    when (varQtdEstoque >= 100) then
		set varMsg = concat('Estoque alto: ', varQtdEstoque);
	when (VarQtdEstoque <=99 and varQtdEstoque) then
		set varMsg = concat('Estoque ok: ', varQtdEstoque);
	else
		set varMsg = concat('Estoque Baixo: ', varQtdEstoque);
	end case;
	select varMsg;
end
//

drop procedure sp_listaEstoqueProd;

call sp_listaEstoqueProd2(1)