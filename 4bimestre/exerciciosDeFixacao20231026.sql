-- EX01
CREATE TRIGGER trg_depois_inserir_clientes 
AFTER INSERT ON Clientes
FOR EACH ROW INSERT INTO Auditoria(mensagem)
VALUES("Novo cliente adicionado");

-- EX02
CREATE TRIGGER trg_antes_excluir_clientes 
BEFORE DELETE ON Clientes
FOR EACH ROW INSERT INTO Auditoria(mensagem)
VALUES("Cliente excluido");

-- EX03
CREATE TRIGGER trg_depois_nomes_clientes 
AFTER UPDATE ON Clientes
FOR EACH ROW INSERT INTO Auditoria(mensagem)
VALUES(CONCAT("Nome de cliente modificado. Nome antigo: ", OLD.nome, ", novo nome: ", New.nome));

-- EX04
DELIMITER //
CREATE TRIGGER trg_tentativa_add_nome
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.nome IS NULL OR NEW.nome = '' THEN
        INSERT INTO Auditoria (mensagem) VALUES ('Tentativa de atualização de nome inválida em Clientes');
    END IF;
END;
//
DELIMITER ;

-- EX05
DELIMITER //
CREATE TRIGGER trg_depois_atualiza_produtos
AFTER INSERT ON Pedidos
FOR EACH ROW 
BEGIN
UPDATE Produtos SET estoque = estoque - quantidade 
WHERE produto_id = Produtos(produto_id);
    IF estoque > 5 THEN
        INSERT INTO Auditoria(mensagem) VAlUES("Estoque acabando");
    END IF;
END;
//
DELIMITER ;
