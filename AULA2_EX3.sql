USE northwind

Delimiter //
CREATE PROCEDURE sp_listProdMultParam(
varCodProd int,
varPrecoUnit dec(10,4)
)
BEGIN
	IF (varCodProd IS NOT NULL AND varPrecoUnit  IS NOT NULL) THEN
	SELECT * FROM products
    WHERE ProductID= varCodProd AND
    UnitPrice = varPrecoUnit;
    ELSE
		IF (varCodProd IS NULL AND varPrecoUnit IS NULL ) THEN
			SELECT * FROM PRODUCTS;
		ELSE
			IF (varCodProd IS NOT NULL AND varPrecoUnit IS NULL ) THEN
					SELECT * FROM products p
					WHERE P.ProductID = varCodProd;
			ELSE
					SELECT * FROM products p
					WHERE P.UnitPrice = varPrecoUnit;
				END IF;
		END IF;
	END IF;
END;
//

DROP PROCEDURE sp_listProdMultParam;

CALL sp_listProdMultParam(1,18);

CALL sp_listProdMultParam(NULL);