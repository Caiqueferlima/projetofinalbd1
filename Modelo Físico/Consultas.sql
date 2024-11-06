USE MercadinhoCuel;

-- Realizar a consulta de todos os dados das Tabelas.
SELECT * FROM Cliente;
SELECT * FROM Compra_Venda;
SELECT * FROM Produto;
SELECT * FROM Fornecedor;
SELECT * FROM Pedido;
SELECT * FROM Funcionario;
SELECT * FROM Func_Venda_Cliente;
SELECT * FROM Produto_venda;
SELECT * FROM Produto_fornecedor;
SELECT * FROM Pedido_Fornec_Func;

-- Tabela com os dados de compras com Nome_Cliente, Nome_Produto e Valor_total.
SELECT c.Nome AS Nome_Cliente, p.Nome AS Nome_Produto, p.Preco AS Preco_Unitario, pv.Quantidade AS Quantidade_Comprada, (p.Preco * pv.Quantidade) AS Valor_Total_Produto
FROM Cliente c 
INNER JOIN Func_Venda_Cliente fvc ON c.ID_cliente = fvc.ID_Cliente
INNER JOIN Compra_Venda v ON fvc.ID_Venda = v.ID_venda
INNER JOIN Produto_Venda pv ON v.ID_venda = pv.ID_Compra
INNER JOIN Produto p ON pv.ID_Produto = p.ID_Produto;

-- Tabela com o nome dos clientes ordenados e com o produto comprado.
SELECT c.Nome AS Nome_Cliente, p.Nome AS Nome_Produto
FROM Cliente c
INNER JOIN Func_Venda_Cliente fvc ON c.ID_cliente = fvc.ID_Cliente
INNER JOIN Compra_Venda v ON fvc.ID_Venda = v.ID_venda
INNER JOIN Produto_Venda pv ON v.ID_venda = pv.ID_Compra
INNER JOIN Produto p ON pv.ID_Produto = p.ID_Produto
ORDER BY c.Nome, p.Nome;

-- Tabela dos produtos e seus devidos valores e quantidade.
SELECT Nome AS Nome_Produto, Preco AS Valor_Produto, Quantidade_disponivel
FROM Produto
ORDER BY Nome;

-- Tabela que possui informações dos produtos em que o funcionario fez o pedido aos fornecedores.alter
SELECT f.ID_funcionario,f.Nome AS Nome_Funcionario,p.Nome AS Nome_Produto,cv.Valor_total, fn.Nome AS Nome_Fornecedor
FROM Funcionario f
JOIN Func_Venda_Cliente fvc ON f.ID_funcionario = fvc.ID_funcionario
JOIN Compra_Venda cv ON fvc.ID_venda = cv.ID_venda
JOIN Produto_Venda pv ON cv.ID_venda = pv.ID_Compra
JOIN Produto p ON pv.ID_Produto = p.ID_Produto
JOIN Pedido_Fornec_Func pff ON cv.ID_venda = pff.ID_pedido
JOIN Fornecedor fn ON pff.ID_fornecedor = fn.ID_fornecedor;

-- Tabela da media salarial dos funcionarios.
SELECT AVG (Salario) AS Média_Salarial_Funcionarios FROM funcionario;

-- Tabela 
SELECT 'Cliente' AS Tipo_Pessoa, COUNT(*) AS Total_Pessoas
FROM Cliente
GROUP BY Tipo_Pessoa ORDER BY Total_Pessoas ASC;

-- Tabela com nomes dos clientes, produtos e datas referentes ao mes 10.
SELECT c.Nome AS Nome_Cliente, p.Nome AS Produto, cv.Data_venda AS Data_Compra
FROM Cliente c
JOIN Func_Venda_Cliente fvc ON c.ID_cliente = fvc.ID_Cliente
JOIN Compra_Venda cv ON fvc.ID_venda = cv.ID_venda
JOIN Produto_Venda pv ON cv.ID_venda = pv.ID_Compra
JOIN Produto p ON pv.ID_Produto = p.ID_Produto
WHERE cv.Data_venda BETWEEN '2024-10-01' AND '2024-10-31';

-- Tabela das ordens dos produtos.
SELECT p.Nome AS Produto, SUM(pv.Quantidade) AS Total_Vendido
FROM Produto p
JOIN Produto_Venda pv ON p.ID_Produto = pv.ID_Produto
GROUP BY p.Nome
ORDER BY Total_Vendido DESC;

