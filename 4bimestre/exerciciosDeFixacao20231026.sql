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

-- EX05
