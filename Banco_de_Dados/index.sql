CREATE INDEX vendaIP on bd.itempedido (codigo_venda)
C/ index:
-> select * from bd.itempedido where codigo_venda = '00.0/0001' tempo medio: 65.8ms
-> SELECT c.nome FROM bd.cliente c INNER JOIN bd.venda v on (c.cpf = v.codigo_cliente) INNER JOIN bd.itempedido ip on (v.codigo = ip.codigo_venda) INNER JOIN bd.produto p on (p.codigo = ip.codigo_produto) GROUP BY c.nome tempo medio: 68.3ms

S/ index:
-> SELECT * FROM bd.itempedido WHERE codigo_venda = '00.0/0001' tempo medio:92.9ms
-> SELECT c.nome FROM bd.cliente c INNER JOIN bd.venda v on (c.cpf = v.codigo_cliente) INNER JOIN bd.itempedido ip on (v.codigo = ip.codigo_venda) INNER JOIN bd.produto p on (p.codigo = ip.codigo_produto) GROUP BY c.nome tempo medio: 112ms
