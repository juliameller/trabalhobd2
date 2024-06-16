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

--4. Qual a forma de pagamento mais utilizada? quantidade de pedidos que usaram essa forma, valor total?

--5. Qual a média de cada produto vendido desde o primeiro dia? 

WITH vendas_diarias AS (
    SELECT
        pi.id_produto,
        SUM(pi.quantidade) AS quantidade_vendida,
        dt_pedido
    FROM
        pedido_item pi
    INNER JOIN
        pedido p ON pi.id_pedido = p.id_pedido
    GROUP BY
        pi.id_produto,
        p.dt_pedido
)
SELECT
    vd.id_produto,
    pr.nome_produto,
    AVG(vd.quantidade_vendida) AS media_vendas
FROM
    vendas_diarias vd
INNER JOIN
    produto pr ON vd.id_produto = pr.id_produto
GROUP BY
    vd.id_produto,
    pr.nome_produto
ORDER BY
    vd.id_produto;



