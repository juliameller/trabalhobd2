-- Perguntas de negócio:

--1. Qual o ticket médio do dia 19/06/2024 a 23/06/2024 ? 

SELECT dbo.calcular_ticket_medio('2024-06-19', '2024-06-23') AS TicketMedioJunho;

--2. Quais foram os dias e a quantidade de produtos do mês de junho 2024 que tiveram sobra na produção? 

WITH vendas_por_dia AS (
    SELECT
        pi.id_produto,
		nome_produto,
        p.dt_pedido,
        SUM(pi.quantidade) AS total_vendido
    FROM pedido_item pi
    JOIN pedido p ON pi.id_pedido = p.id_pedido
	INNER JOIN produto pr ON pi.id_produto = pr.id_produto
    GROUP BY pi.id_produto, p.dt_pedido, nome_produto
),
sobra_produtos AS (
    SELECT
        p.id_produto,
		pr.nome_produto,
        p.data,
        p.quantidade AS quantidade_produzida,
        COALESCE(vpd.total_vendido, 0) AS quantidade_vendida,
        (p.quantidade - COALESCE(vpd.total_vendido, 0)) AS sobra
    FROM produzido p
    LEFT JOIN vendas_por_dia vpd ON p.id_produto = vpd.id_produto AND p.data = vpd.dt_pedido
	INNER JOIN produto pr ON p.id_produto = pr.id_produto
)
SELECT 
    data, 
    id_produto,
	nome_produto,
	quantidade_produzida,
    sobra 
FROM sobra_produtos
WHERE sobra > 0
ORDER BY id_produto;

--3. Qual foi o produto mais consumido? e o menos consumido?
WITH soma AS (
	SELECT 
		id_produto,
		SUM(quantidade) AS qt
	FROM pedido_item 
	GROUP BY id_produto
), ranqueado AS(
	SELECT 
		id_produto,
		qt,
		DENSE_RANK() OVER(ORDER BY qt) as rank_menos,
		DENSE_RANK() OVER(ORDER BY qt desc) as rank_mais
	FROM soma
)
SELECT 
	ra.id_produto,
	pr.nome_produto,
	ra.qt AS quantidade_vendida,
	CASE
		WHEN ra.rank_mais = 1 THEN 'Mais vendida'
		WHEN ra.rank_menos = 1 THEN 'Menos vendida'
	END AS tipo
FROM 
	ranqueado ra
INNER JOIN produto pr ON pr.id_produto = ra.id_produto 
WHERE rank_menos = 1 or rank_mais = 1;

--4. Qual a forma de pagamento mais utilizada? quantidade de pedidos que usaram essa forma, valor total?
WITH total AS (
    SELECT 
        pa.id_forma_pagamento,
        (
            SELECT tp_pagamento 
            FROM forma_de_pagamento 
            WHERE id_forma_pagamento = pa.id_forma_pagamento
        ) AS tp_forma_pagamento,
        COUNT(*) AS qtde_pedidos,
        SUM(pa.total) AS valor_total,
        DENSE_RANK() OVER(ORDER BY COUNT(*) desc) as rank
    FROM 
        pagamento pa
    GROUP BY id_forma_pagamento
)
SELECT 
	id_forma_pagamento,
	tp_forma_pagamento,
	qtde_pedidos,
	valor_total
FROM total
WHERE rank = 1;