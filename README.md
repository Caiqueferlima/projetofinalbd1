# Mercadinho do Cuel

O seguinte projeto faz parte da avaliação final da disciplina de BDI (Banco de Dados I)

## Índice
- [Minimundo](#minimundo)
- [Tecnologias utilizadas](#tecnologias-utilizadas)
- [Arquitetura de pastas](#arquitetura-de-pastas)
- [Desenvolvimento](#desenvolvimento)
- [Modelo Entidade Relacionamento (MER)](#modelo-entidade-relacionamento-mer)
- [Modelo Relacional (MR)](#modelo-relacional-mr)
- [Consultas](#consultas)
- [Equipe](#equipe)

---

## Minimundo
No mercado do Cuel, uma rotina organizada é fundamental para garantir que produtos variados estejam sempre disponíveis e frescos para os clientes. O estoque é controlado com atenção, monitorando cada produto com informações detalhadas como ID, nome, preço, quantidade disponível e data de validade. Os fornecedores são essenciais para o abastecimento constante de itens necessários para reposição, com quem o mercado mantém uma relação regular para garantir a entrega pontual dos produtos, destes, é necessário ID, nome, telefone e CNPJ. Dos pedidos, é necessário o ID, valor e data. Os funcionários, incluindo atendentes e gerentes, cuidam das operações diárias, auxiliando no atendimento ao cliente e organizando o ambiente de compras e fazendo pedido aos fornecedores. Dos funcionários há a necessidade de armazenar ID, nome, cargo, telefone e salário. Dos clientes, o banco armazena o ID, nome, CPF, endereço e telefone. Todas as vendas realizadas são registradas, detalhando os produtos adquiridos, as quantidades e o valor total da compra.

## Tecnologias utilizadas
- brModelo para modelagem
- MySQL como SGBD

## Arquitetura de pastas

```
projetofinalbd1/
│
├── Modelo Físico/
│   ├── Inserts.sql               # Script SQL para inserir dados nas tabelas do banco de dados
│   ├── ModeloFisico.sql          # Script SQL para criar as tabelas do banco de dados
│   └── Consultas.sql             # Script SQL com as consultas SQL para o projeto
│
├── assets/
│   ├── MER.png                   # Diagrama do Modelo Entidade-Relacionamento (MER)
│   └── MR.png                    # Diagrama do Modelo Relacional (MR)
│
├── MR.brM3                       # Arquivo do modelo relacional no formato brModelo
├── MER.brM3                      # Arquivo do modelo MER no formato brModelo
├── README.md                     # Arquivo README com instruções do projeto
└── descrição da atividade.pdf    # Documento PDF com a descrição da atividade
```

## Desenvolvimento

A equipe organizou as atividades de maneira dinâmica, dividindo as tasks de acordo com a especialidade e interesse de cada integrante. As decisões sobre a alocação das tasks foram tomadas em conjunto, mantendo uma comunicação constante para apoiar qualquer dificuldade em cada etapa.

### Divisão de Tarefas

- **Emilly**: Modelagem Entidade-Relacionamento (MER)
- **Maria Clara**: Modelagem Relacional (MR)
- **Guilherme**: Criação do Modelo Físico
- **Raquel**: Inserção de dados e consultas no Modelo Físico
- **Caíque**: Organização geral e correção de erros

A contribuição de cada integrante pode ser observada nos commits do repositório. Vale ressaltar que, embora as tasks tenham sido divididas para fins de organização, todos participaram de cada fase do projeto, pois cada task dependia da subsequente.


## Modelo Entidade Relacionamento MER
![Modelo entidade relacionamento](./assets/MER.png) 

## Modelo Relacional MR
![Modelo relacional](./assets/MR.png) 

## Consultas
Todas as consultas podem ser visualizadas e testadas a partir do arquivo ```Consultas.sql``` facilmente encontrado no repositório. Foram feitas consultas usando os comandos SELECT, WHERE, BETWEEN, JOIN, GROUP BY, ORDER BY, AVG, SUM e COUNT.

Segue abaixo o registro dos testes das consultas feitos pela equipe a partir do banco:

### Tabela de Compras de Clientes
#### Código SQL:
```
SELECT c.Nome AS Nome_Cliente, p.Nome AS Nome_Produto, p.Preco AS Preco_Unitario, pv.Quantidade AS Quantidade_Comprada, (p.Preco * pv.Quantidade) AS Valor_Total_Produto
FROM Cliente c 
INNER JOIN Func_Venda_Cliente fvc ON c.ID_cliente = fvc.ID_Cliente
INNER JOIN Compra_Venda v ON fvc.ID_Venda = v.ID_venda
INNER JOIN Produto_Venda pv ON v.ID_venda = pv.ID_Compra
INNER JOIN Produto p ON pv.ID_Produto = p.ID_Produto;
```

#### Resultado:
| Nome_Cliente   | Nome_Produto | Preco_Unitario | Quantidade_Comprada | Valor_Total_Produto |
|----------------|--------------|----------------|----------------------|----------------------|
| João Silva     | Arroz        | 5.5            | 2                    | 11                   |
| Maria Santos   | Feijão       | 7.25           | 3                    | 21.75                |
| Zé Maria       | Óleo         | 4.75           | 1                    | 4.75                 |
| Ana Costa      | Shampoo      | 8.75           | 2                    | 17.5                 |
| Carlos Pereira | Manteiga     | 1.75           | 5                    | 8.75                 |

### Tabela que possui informações dos produtos em que o funcionario fez o pedido aos fornecedores.alter
#### Código SQL:
```
SELECT f.ID_funcionario,f.Nome AS Nome_Funcionario,p.Nome AS Nome_Produto,cv.Valor_total, fn.Nome AS Nome_Fornecedor
FROM Funcionario f
JOIN Func_Venda_Cliente fvc ON f.ID_funcionario = fvc.ID_funcionario
JOIN Compra_Venda cv ON fvc.ID_venda = cv.ID_venda
JOIN Produto_Venda pv ON cv.ID_venda = pv.ID_Compra
JOIN Produto p ON pv.ID_Produto = p.ID_Produto
JOIN Pedido_Fornec_Func pff ON cv.ID_venda = pff.ID_pedido
JOIN Fornecedor fn ON pff.ID_fornecedor = fn.ID_fornecedor;
```

#### Resultado:
| ID_Funcionario | Nome_Funcionario | Nome_Produto | Valor_Total | Nome_Fornecedor             |
|----------------|-------------------|--------------|-------------|-----------------------------|
| 1              | Carlos Souza      | Arroz        | 150.75      | Distribuidora Alimentos Ltda |
| 2              | Ana Lima          | Feijão       | 200.5       | Alimentos Brasil S.A.        |
| 3              | Beatriz Almeida   | Óleo         | 320         | Comercial Norte Ltda         |
| 4              | Pedro Santos      | Shampoo      | 150.25      | Atacado Sul S.A.             |
| 5              | Luciana Melo      | Manteiga     | 250.75      | Distribuidora Central ME     |

### Tabela dos produtos e seus devidos valores e quantidade
#### Código SQL:
```
SELECT Nome AS Nome_Produto, Preco AS Valor_Produto, Quantidade_disponivel
FROM Produto
ORDER BY Nome;
```

#### Resultado:
| Nome_Produto | Valor_Produto | Quantidade_Disponivel |
|--------------|---------------|------------------------|
| Arroz        | 5.5           | 100                    |
| Feijão       | 7.25          | 80                     |
| Manteiga     | 1.75          | 100                    |
| Óleo         | 4.75          | 50                     |
| Shampoo      | 8.75          | 25                     |

### Tabela das ordens dos produtos.
#### Código SQL:
```
SELECT p.Nome AS Produto, SUM(pv.Quantidade) AS Total_Vendido
FROM Produto p
JOIN Produto_Venda pv ON p.ID_Produto = pv.ID_Produto
GROUP BY p.Nome
ORDER BY Total_Vendido DESC;
```

#### Resultado:
| Produto  | Total_Vendido |
|----------|---------------|
| Manteiga | 5             |
| Feijão   | 3             |
| Arroz    | 2             |
| Shampoo  | 2             |
| Óleo     | 1             |


### Tabela com nomes dos clientes, produtos e datas referentes ao mes 10
#### Código SQL:
```
SELECT c.Nome AS Nome_Cliente, p.Nome AS Produto, cv.Data_venda AS Data_Compra
FROM Cliente c
JOIN Func_Venda_Cliente fvc ON c.ID_cliente = fvc.ID_Cliente
JOIN Compra_Venda cv ON fvc.ID_venda = cv.ID_venda
JOIN Produto_Venda pv ON cv.ID_venda = pv.ID_Compra
JOIN Produto p ON pv.ID_Produto = p.ID_Produto
WHERE cv.Data_venda BETWEEN '2024-10-01' AND '2024-10-31';
```

#### Resultado:
| Nome_Cliente | Produto | Data_Compra |
|--------------|---------|-------------|
| Maria Santos | Feijão  | 2024-10-21  |
| Ana Costa    | Shampoo | 2024-10-23  |

### Tabela com o nome dos clientes ordenados e com o produto comprado
#### Código SQL:
```
SELECT c.Nome AS Nome_Cliente, p.Nome AS Nome_Produto
FROM Cliente c
INNER JOIN Func_Venda_Cliente fvc ON c.ID_cliente = fvc.ID_Cliente
INNER JOIN Compra_Venda v ON fvc.ID_Venda = v.ID_venda
INNER JOIN Produto_Venda pv ON v.ID_venda = pv.ID_Compra
INNER JOIN Produto p ON pv.ID_Produto = p.ID_Produto
ORDER BY c.Nome, p.Nome;
```

#### Resultado:
| Nome_Cliente   | Nome_Produto |
|----------------|--------------|
| Ana Costa      | Shampoo      |
| Carlos Pereira | Manteiga     |
| João Silva     | Arroz        |
| Maria Santos   | Feijão       |
| Zé Maria       | Óleo         |

### Tabela da media salarial dos funcionarios.
#### Código SQL:
```
SELECT AVG (Salario) AS Média_Salarial_Funcionarios FROM funcionario;
```

#### Resultado:
| Media_Salarial_Funcionarios   |
|----------------|
| 2400      | 

## Equipe
<table align="center">
  <tr align="center">
  <td>
      <a href="https://github.com/Caiqueferlima">
        <img src="https://avatars.githubusercontent.com/u/130234796?v=4" width=100 />
        <p>Caíque <br/>Fernandes</p>
      </a>
    </td>
    <td>
      <a href="https://github.com/emillyjullyane">
        <img src="https://avatars.githubusercontent.com/emillyjullyane" width=100 />
        <p>Emilly <br/>Jullyane</p>
      </a>
    </td>
    <td>
      <a href="https://github.com/Guilhermeleandro-N">
        <img src="https://avatars.githubusercontent.com/Guilhermeleandro-N" width=100 />
        <p>Guilherme <br/>Leandro</p>
      </a>
    <td>
      <a href="https://github.com/mcclara18">
        <img src="https://avatars.githubusercontent.com/mcclara18" width=100 />
        <p>Maria <br/>Clara</p>
      </a>
    </td>
    <td>
      <a href="https://github.com/Rachelee18">
        <img src="https://avatars.githubusercontent.com/Rachelee18" width=100 />
        <p>Raquel <br/>Medeiros</p>
      </a>
  </tr>
