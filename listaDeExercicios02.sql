--EX01
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
	SELECT nome, sobrenome FROM Autor;
END
//

CALL sp_ListarAutores();
