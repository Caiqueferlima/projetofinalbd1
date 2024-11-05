use MercadinhoCuel;

-- Tabela Cliente
INSERT INTO Cliente (ID_cliente, Nome, CPF, Endereco, Telefone) 
VALUES 
    (1, 'João Silva', '12345678901', 'Rua das Flores, 126', '88912345678'),
    (2, 'Maria Santos', '98765432100', 'Avenida Central, 456', '88998765432'),
    (3, 'Zé Maria', '45676523399', 'Rua das Flores, 124', '88994546325'),
    (4, 'Ana Costa', '11233455678', 'Avenida Brasil, 200', '88991234567'),
	(5, 'Carlos Pereira', '22334455667', 'Rua das Acácias, 50', '88998765432');

-- Tabela Compra_Venda
INSERT INTO Compra_Venda (ID_venda, Data, Valor_total, Produtos, Forma_pagamento) 
VALUES 
    (1, '2024-10-20', 150.75, 'Arroz', 'Dinheiro'),
    (2, '2024-10-21', 200.50, 'Feijão', 'Cartão de Crédito'),
    (3, '2024-10-22', 320.00, 'Óleo', 'Cartão de Débito'),
	(4, '2024-10-23', 150.25, 'Shampoo', 'Dinheiro'),
	(5, '2024-10-24', 250.75, 'Manteiga', 'PIX');

-- Tabela Produto
INSERT INTO Produto (ID_Produto, Nome, Preco, Quantidade_disponivel, Data_validade) 
VALUES 
    (1, 'Arroz', 5.50, 100, '2025-01-01'),
    (2, 'Feijão', 7.25, 80, '2025-01-01'),
    (3, 'Óleo', 4.75, 50, '2024-12-31'),
    (4, 'Shampoo', 8.75, 25, '2024-11-02'),
    (5, 'Manteiga', 1.75, 100, '2024-12-30');
    

-- Tabela Fornecedor
INSERT INTO Fornecedor (ID_fornecedor, Nome, CNPJ, Telefone) 
VALUES 
    (1, 'Distribuidora Alimentos Ltda', '12345678000101', '88999887766'),
    (2, 'Alimentos Brasil S.A.', '98765432000101', '88988776655'),
    (3, 'Comercial Norte Ltda', '11223344000102', '88923456789'),
    (4, 'Atacado Sul S.A.', '99887766000103', '88934567890'),
    (5, 'Distribuidora Central ME', '55443322000104', '88945678901');

-- Tabela Pedido
INSERT INTO Pedido (ID_Pedido, Valor, Data) 
VALUES 
    (1, 500.00, '2024-10-15'),
    (2, 300.00, '2024-10-18'),
    (3, 650.00, '2024-11-14'),
    (4, 250.00, '2024-09-13'),
    (5, 100.00, '2024-12-09');
    
-- Tabela Funcionario
INSERT INTO Funcionario (ID_funcionario, Nome, Cargo, Telefone, Salario) 
VALUES 
    (1,'Carlos Souza', 'Caixa', '88900001111', 2000.00),
    (2, 'Ana Lima', 'Gerente', '88988882222', 3500.00),
    (3, 'Beatriz Almeida', 'Assistente', '88999993333', 1800.00),
	(4, 'Pedro Santos', 'Supervisor', '88977774444', 2800.00),
	(5, 'Luciana Melo', 'Atendente', '88966665555', 1900.00);

-- Tabela Func_Venda_Cliente
INSERT INTO Func_Venda_Cliente (ID_funcionario, ID_Venda, ID_Cliente, Data_vinculo, Observacoes) 
VALUES 
    (1, 1, 1, '2024-10-20', 'Cliente regular'),
    (2, 2, 2, '2024-10-21', 'Primeira compra do cliente'),
    (2, 5, 5, '2024-10-24', 'Cliente novo'),
	(2, 3, 3, '2024-10-22', 'Compra com desconto'),
	(1, 4, 4, '2024-10-23', 'Cliente frequente');


-- Tabela Produto_Venda
INSERT INTO Produto_Venda (ID_Compra, ID_Produto, Quantidade, Preco_unitario) 
VALUES 
    (1, 1, 2, 5.50),
    (1, 2, 3, 7.25),
    (2, 3, 1, 4.75),
    (2, 4, 2, 8.75),
    (3, 5, 5, 1.75);

-- Tabela Produto_Fornecedor
INSERT INTO Produto_Fornecedor (ID_produto, ID_fornecedor, Tempo_entrega) 
VALUES 
    (1, 1, 'Entrega em 4 dias'),
    (2, 2, 'Entrega em 5 dias'),
    (3, 3, 'Entrega em 3 dias'),
    (4, 4, 'Entrega em 2 dias'),
    (5, 5, 'Entrega em 6 dias');

-- Tabela Pedido_Fornec_Func
INSERT INTO Pedido_Fornec_Func (ID_pedido, ID_funcionario, ID_fornecedor, Valor, Prazo_entrega) 
VALUES 
    (1, 1, 1, 500.00, '2024-10-25'),
    (2, 2, 2, 300.00, '2024-10-28'),
    (3, 3, 3, 450.00, '2024-11-01'),
    (4, 4, 4, 700.00, '2024-11-05'),
    (5, 5, 5, 600.00, '2024-11-10');


