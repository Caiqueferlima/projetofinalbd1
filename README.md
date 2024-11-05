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
├── assets/
│   ├── MER.png                  # Diagrama do Modelo Entidade-Relacionamento (MER)
│   └── MR.png                   # Diagrama do Modelo Relacional (MR)
│
├── Modelo Físico/
│   ├── Inserts.sql              # Script SQL para inserir dados nas tabelas do banco de dados
│   ├── ModeloFisico.sql         # Script SQL para criar as tabelas do banco de dados
│   └── Consultas.sql            # Script SQL com as consultas SQL para o projeto
│
├── descrição da atividade.pdf    # Documento PDF com a descrição da atividade
├── MER.brM3                      # Arquivo do modelo MER no formato brModelo
├── MR.brM3                       # Arquivo do modelo relacional no formato brModelo
└── README.md                     # Arquivo README com instruções do projeto
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
