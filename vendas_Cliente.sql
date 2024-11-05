CREATE VIEW vendas_por_funcionario AS
SELECT 
	primeiro_nome || ' ' || sobrenome AS func,
	SUM( preco_unitario * quantidade ) AS total
FROM funcionarios f
JOIN pedidos p ON f.funcionario_id = p.funcionario_id
JOIN detalhes_pedido dp ON dp.pedido_id = p.pedido_id
GROUP BY f.funcionario_id