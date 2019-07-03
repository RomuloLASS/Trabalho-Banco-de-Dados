CREATE OR REPLACE FUNCTION bd.inserirproduto() RETURNS trigger AS $$
DECLARE
   num_rows integer;
Begin

IF(TG_OP = 'UPDATE') THEN

	SELECT 1 INTO num_rows FROM bd.produto WHERE codigo = new.codigo;
	IF(num_rows > 0) THEN
		UPDATE bd.produto set nome = old.nome, data_validade = new.data_validade, data = now() WHERE codigo = codigo = new.codigo ;
    nome varchar(100) NOT NULL,
    data_validade timestamp NOT NULL,
    codigo varchar(30) NOT NULL
	ELSE
		INSERT INTO bd.produto values(new.nome, new.data_validade, new.codigo, now());
	END IF;
ELSE
	INSERT INTO bd.produto values(new.nome, new.data_validade, new.codigo, now());
END IF;
return new;

end;
$$ LANGUAGE plpgsql;

-------------------------------------
CREATE TRIGGER novoproduto
	AFTER INSERT OR UPDATE ON bd.preco
	FOR EACH ROW
	EXECUTE PROCEDURE bd.inserirproduto();
