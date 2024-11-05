DROP DATABASE MercadinhoCuel;
CREATE DATABASE MercadinhoCuel;
USE MercadinhoCuel;

CREATE TABLE Cliente (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CPF CHAR(11),
    Endereco VARCHAR(100),
    Telefone CHAR(14)
);

CREATE TABLE Compra_Venda (
    ID_venda INT AUTO_INCREMENT PRIMARY KEY,
    Data_venda DATE,
    Valor_total FLOAT
);

CREATE TABLE Produto (
    ID_produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Preco FLOAT,
    Quantidade_disponivel INT,
    Data_validade DATE
);

CREATE TABLE Fornecedor (
    ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone CHAR(14),
    CNPJ CHAR(14)
);

CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Valor FLOAT,
    Data_pedido DATE
);

CREATE TABLE Funcionario (
    ID_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Cargo VARCHAR(50),
    Telefone CHAR(14),
    Salario FLOAT
);

CREATE TABLE Func_Venda_Cliente (
    ID_funcionario INT,
    ID_Venda INT,
    ID_Cliente INT,
    PRIMARY KEY (ID_funcionario, ID_Venda, ID_Cliente),
    CONSTRAINT fkFuncionario FOREIGN KEY (ID_funcionario) REFERENCES Funcionario (ID_funcionario),
    CONSTRAINT fkVenda FOREIGN KEY (ID_Venda) REFERENCES Compra_Venda (ID_venda),
    CONSTRAINT fkCliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_cliente)
);

CREATE TABLE Produto_Venda (
    ID_Compra INT,
    ID_Produto INT,
    Quantidade INT,
    PRIMARY KEY (ID_Compra, ID_Produto),
    CONSTRAINT fkCompra FOREIGN KEY (ID_Compra) REFERENCES Compra_Venda (ID_venda),
    CONSTRAINT fkProduto FOREIGN KEY (ID_Produto) REFERENCES Produto (ID_produto)
);

CREATE TABLE Produto_Fornecedor (
    ID_produto INT,
    ID_fornecedor INT,
    PRIMARY KEY (ID_produto, ID_fornecedor),
    CONSTRAINT fkProdutoFornecedor FOREIGN KEY (ID_produto) REFERENCES Produto (ID_produto),
    CONSTRAINT fkFornecedor FOREIGN KEY (ID_fornecedor) REFERENCES Fornecedor (ID_fornecedor)
);

CREATE TABLE Pedido_Fornec_Func (
    ID_pedido INT,
    ID_funcionario INT,
    ID_fornecedor INT,
    PRIMARY KEY (ID_pedido, ID_funcionario, ID_fornecedor),
    CONSTRAINT fkPedido FOREIGN KEY (ID_pedido) REFERENCES Pedido (ID_Pedido),
    CONSTRAINT fkFunc FOREIGN KEY (ID_funcionario) REFERENCES Funcionario (ID_funcionario),
    CONSTRAINT fkFornec FOREIGN KEY (ID_fornecedor) REFERENCES Fornecedor (ID_fornecedor)
);