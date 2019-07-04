CREATE VIEW fornecedorInfo as SELECT f.nome as fornecedor, p.nome as produto, e.quantidade FROM bd.fornecedores f LEFT JOIN bd.itemfornecido i on (i.codigo_fornecedor = f.cnpj) LEFT JOIN bd.produto p on (p.codigo = i.codigo_produto) LEFT JOIN bd.estoque e on (p.codigo = e.codigo_produto)

CREATE VIEW depositoInfo as (SELECT d.numero as deposito, e.id as estoque, p.nome as produto, e.quantidade FROM bd.deposito d INNER JOIN bd.estoque e on (d.codigo_estoque = e.id) INNER JOIN bd.produto p on (p.codigo = e.codigo_produto))
