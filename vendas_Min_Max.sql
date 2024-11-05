CREATE VIEW vendas_min_e_max AS
SELECT 
	primeiro_nome || ' ' || sobrenome AS func,
	MIN( preco_unitario * quantidade ) AS minimo,
	MAX( preco_unitario * quantidade ) AS maximo
FROM funcionarios f
JOIN pedidos p ON f.funcionario_id = p.funcionario_id
JOIN detalhes_pedido dp ON dp.pedido_id = p.pedido_id
GROUP BY f.funcionario_id