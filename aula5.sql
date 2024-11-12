CREATE OR REPLACE FUNCTION calcular_idade(func_id INT)
RETURNS INTEGER AS $$
DECLARE
 nascimento DATE;
 idade INTEGER;
BEGIN
 -- Obtém a data de nascimento do funcionário pelo ID fornecido
 SELECT data_nascimento INTO nascimento
 FROM funcionarios
 WHERE funcionario_id = func_id;
 -- Retorna a idade do funcionário em anos
 idade := EXTRACT(YEAR FROM AGE(nascimento));
 RETURN idade;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_idade(2)



CREATE OR REPLACE FUNCTION verificar_estoque(prod_id INT, quant INT)
RETURNS TEXT AS $$
DECLARE
 unidades_estoque INT;
BEGIN
 SELECT unidades_em_estoque INTO unidades_estoque
 FROM produtos
 WHERE produto_id = prod_id;
 IF unidades_estoque >= quant THEN
 RETURN 'Estoque suficiente';
 ELSE
 RETURN 'Estoque insuficiente';
 END IF;
END;
$$ LANGUAGE plpgsql;

SELECT verificar_estoque(2, 15500)


CREATE OR REPLACE FUNCTION verificar_chefe(func_id INT)
RETURNS TEXT AS $$
DECLARE
	id_chefe INT;
BEGIN
	SELECT chefe_id INTO id_chefe
	FROM funcionarios
	WHERE funcionario_id = func_id;
	IF id_chefe IS NULL THEN
		RETURN 'Não tem chefe';
	ELSE
		RETURN 'Tem chefe';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT verificar_chefe(2)


CREATE OR REPLACE FUNCTION calcular_media_estoque()
RETURNS REAL AS $$
DECLARE
 estoque RECORD; -- RECORD é o tipo de retono de uma linha
 soma_estoque REAL := 0; -- Variável para somar os estoques
 contagem INT := 0; -- Contador para a quantidade de produtos
 media REAL;
BEGIN
 -- Loop para iterar sobre cada linha com a quantidade de estoque
 FOR estoque IN SELECT unidades_em_estoque FROM produtos LOOP
 soma_estoque := soma_estoque + estoque.unidades_em_estoque;
 contagem := contagem + 1;
 END LOOP;
 IF contagem = 0 THEN
 media := 0;
 ELSE
 media := soma_estoque / contagem;
 END IF;
 RETURN media;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_media_estoque()
