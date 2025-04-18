-- bem vindos ao meu aprendizado

CREATE DATABASE DogHouse;
GO
USE DogHouse;
GO
--usei o modo simplificado, deixarei para usar o mais complexo em projetos posteriores
-- seguirei criando tabelas de acordo com meu dicion�rio de dados 
-- criarei tabelas sem FK�s primeiro para n�o ter problemas futuros

CREATE TABLE Cliente(
IDcliente INT PRIMARY KEY IDENTITY,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(100)NOT NULL
);

CREATE TABLE funcionario(
IDfuncionario INT PRIMARY KEY IDENTITY,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
Funcao VARCHAR(100),
DataAdmissao DATE,
Salario DECIMAL(10,2)
);

CREATE TABLE Servico(
IDservico INT PRIMARY KEY IDENTITY,
NomeServico VARCHAR(100)
);
ALTER TABLE Servico
ALTER COLUMN NomeServico VARCHAR(100) NOT NULL;

-- tabelas com FK
CREATE TABLE Atividade(
IDatividade INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL,
Descricao VARCHAR (200),
TipoEspaco VARCHAR(1),
IDfuncionario INT,
CONSTRAINT FK_atividade_funcionario FOREIGN KEY (IDfuncionario) REFERENCES Funcionario(IDfuncionario)
);

CREATE TABLE  TelefoneCliente(
IDtelefoneCliente INT PRIMARY KEY IDENTITY,
TelefoneCliente VARCHAR(15) NOT NULL,
TelefoneResidencial VARCHAR(15),
TelefoneOutro VARCHAR(15),
IDcliente INT,
CONSTRAINT FK_TelefoneCliente_Cliente FOREIGN KEY(IDcliente) REFERENCES Cliente(IDcliente)
);

CREATE TABLE EnderecoCliente(
IDenderecocliente INT PRIMARY KEY IDENTITY,
Logradouro VARCHAR(200) NOT NULL,
Numero VARCHAR(10) NOT NULL,
Complemento VARCHAR(100),
Bairro varchar (50),
Cidade VARCHAR(50),
Estado VARCHAR(2),
CEP CHAR(9),
IDcliente INT,
CONSTRAINT FK_EnderecoCliente_Cliente FOREIGN KEY (IDcliente) REFERENCES Cliente(IDcliente)
);

CREATE TABLE Cachorro(
IDcachorro INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL,
RAca VARCHAR (100),
Porte VARCHAR (20),
DataNascimento DATE,
Sexo CHAR(1),
IDcliente INT,
CONSTRAINT FK_Cachorro_Cliente FOREIGN KEY (IDcliente)REFERENCES Cliente(IDcliente)
);
ALTER TABLE Cachorro
ADD Apelido VARCHAR (100);
UPDATE Cachorro SET Apelido = 'Rexinho' 
WHERE Nome = 'Rex' And Raca = 'shih Tzu';
UPDATE Cachorro SET Apelido = 'Rexão' 
WHERE Nome = 'Rex' AND Raca = 'Pastor Alemão';

UPDATE Cachorro SET Apelido = 'Rexinho' 
WHERE Nome = 'Rex' AND Raca = 'Shih Tzu';
UPDATE Cachorro SET Apelido = 'Rexão' 
WHERE Nome = 'Rex' AND Raca = 'Pastor Alemão';

UPDATE Cachorro SET Apelido = 'Thorzinho'
WHERE Nome = 'Thor' AND Raca = 'Cocker Spaniel';
UPDATE Cachorro SET Apelido = 'Thorzão'
WHERE Nome = 'Thor' AND Raca = 'Golden Retriever';




CREATE TABLE Despesa(
IDdespesa INT PRIMARY KEY IDENTITY,
Datadespesa DATE,
Tipo VARCHAR(50),
Valor DECIMAL(10,2),
Observacao VARCHAR(200),
IDfuncionario INT,
CONSTRAINT FK_Despesa_funcionario FOREIGN KEY (IDfuncionario) REFERENCES Funcionario(IDfuncionario)
);

CREATE TABLE Mochila(
IDmochila INT PRIMARY KEY IDENTITY,
PossuiRacao BIT,
PossuiGuia BIT,
IDcachorro INT,
CONSTRAINT FK_Mochila_cachorro FOREIGN KEY (IDcachorro) REFERENCES Cachorro(IDcachorro)
);

CREATE TABLE Ocorrencia(
IDocorrencia INT PRIMARY KEY IDENTITY,
Tipo VARCHAR(50) NOT NULL,
Dataocorrencia DATE,
Descricao VARCHAR(200),
Gravidade VARCHAR(20),
IDcachorro INT,
IDfuncionario INT,
CONSTRAINT FK_Ocorrencia_cachorro FOREIGN KEY (IDcachorro)REFERENCES Cachorro(IDcachorro),
CONSTRAINT FK_Ocorrencia_funcionario FOREIGN KEY (IDfuncionario)REFERENCES Funcionario(IDfuncionario)
);

CREATE TABLE Agendamento(
IDagendamento INT PRIMARY KEY IDENTITY,
DataAgendamento  DATE,
Horario TIME,
ValorFinal DECIMAL(10,2),
Status VARCHAR(20),
IDcachorro INT,
IDfuncionario INT,
CONSTRAINT FK_Agendamento_cachorro FOREIGN KEY (IDcachorro)REFERENCES Cachorro(IDcachorro),
CONSTRAINT FK_Agendamento_funcionario FOREIGN KEY (IDfuncionario) REFERENCES Funcionario(IDfuncionario)
);

CREATE TABLE Pagamento(
IDpagamento INT PRIMARY KEY IDENTITY,
DataPagamento DATE,
ValorPago DECIMAL(10,2),
FormaPagamento VARCHAR(20),
StatusPagamento VARCHAR(20),
IDagendamento INT,
IDcliente INT,
CONSTRAINT FK_Pagamento_agendamento FOREIGN KEY (IDagendamento)REFERENCES Agendamento(IDagendamento),
CONSTRAINT FK_Pagamento_cliente FOREIGN KEY (IDcliente) REFERENCES Cliente(IDcliente)
);

--tabelas associativas
CREATE TABLE Agendamento_Servico(
IDagendamento_servico INT PRIMARY KEY IDENTITY,
IDagendamento INT,
IDservico INT,
CONSTRAINT FK_Agendamento_Servico_agendamento FOREIGN KEY (IDagendamento) REFERENCES Agendamento(IDagendamento),
CONSTRAINT FK_Agendamento_Servico_servico FOREIGN KEY (IDservico) REFERENCES Servico(IDservico)
);

CREATE TABLE Cahorro_Atividade(
IDcachorro_atividade INT PRIMARY KEY IDENTITY,
IDcachorro INT,
IDatividade INT,
DataParticipacao DATE,
CONSTRAINT FK_Cachorro_atividade_cachorro FOREIGN KEY (IDcachorro) REFERENCES Cachorro(IDcachorro),
CONSTRAINT FK_Cachorro_Atividade_atividade FOREIGN KEY (IDatividade) REFERENCES Atividade(IDatividade)
);
EXEC sp_rename 'Cahorro_Atividade','Cachorro_Atividade';



-- Inserindo 30 clientes fictícios
INSERT INTO Cliente (Nome, Sobrenome)
VALUES 
('João', 'Silva'),('Maria', 'Oliveira'),('Carlos', 'Santos'),('Ana', 'Pereira'),('Pedro', 'Almeida'),
('Paula', 'Costa'),('Roberto', 'Martins'),('Lucas', 'Ferreira'),('Fernanda', 'Rodrigues'),('Juliana', 'Moura'),
('Rafael', 'Lima'),('Mariana', 'Gomes'),('Ricardo', 'Pinto'),('Tatiane', 'Rocha'),('Gustavo', 'Souza'),
('Isabela', 'Barros'),('Eduardo', 'Dantas'),('Larissa', 'Silveira'),('Adriana', 'Carvalho'),
('Fábio', 'Vieira'),('Carla', 'Dias'),('Maurício', 'Tavares'),('Tânia', 'Cavalcanti'),('Guilherme', 'Melo'),
('Sandra', 'Ribeiro'),('Cláudia', 'Martins'),('Bruno', 'Maciel'),('Aline', 'Batista'),('André', 'Simões'),
('Vanessa', 'Nogueira');

--CÃES  de pequeno e médio porte
INSERT INTO Cachorro (Nome, Raca, Porte, DataNascimento, Sexo, IDcliente)
VALUES 
('Rex', 'Shih Tzu', 'Pequeno', '2022-06-10', 'M', 1),
('Luna', 'Chihuahua', 'Pequeno', '2022-07-01', 'F', 2),
('Bella', 'Poodle', 'Médio', '2021-08-22', 'F', 3),
('Max', 'Bichon Frisé', 'Pequeno', '2022-09-30', 'M', 4),
('Mel', 'Lhasa Apso', 'Médio', '2021-11-14', 'F', 5),
('Thor', 'Cocker Spaniel', 'Médio', '2020-12-05', 'M', 6),
('Fifi', 'Yorkshire', 'Pequeno', '2022-03-10', 'F', 7),
('Toby', 'Poodle', 'Pequeno', '2023-01-01', 'M', 8),
('Nina', 'Pequinês', 'Pequeno', '2022-02-14', 'F', 9),
('Rocky', 'Maltês', 'Médio', '2021-05-30', 'M', 10),
('Lili', 'Shih Tzu', 'Pequeno', '2022-08-05', 'F', 11),
('Léo', 'Bichon Frisé', 'Médio', '2022-09-15', 'M', 12),
('Tina', 'Lhasa Apso', 'Pequeno', '2023-03-01', 'F', 13),
('Kiko', 'Cocker Spaniel', 'Médio', '2021-04-20', 'M', 14),
('Maggie', 'Pequinês', 'Pequeno', '2022-11-10', 'F', 15);

--médio e grande porte
INSERT INTO Cachorro (Nome, Raca, Porte, DataNascimento, Sexo, IDcliente)
VALUES 
('Duke', 'Labrador', 'Grande', '2021-02-10', 'M', 16),
('Bruno', 'Rottweiler', 'Grande', '2020-06-14', 'M', 17),
('Rex', 'Pastor Alemão', 'Grande', '2021-09-20', 'M', 18),
('Zara', 'Doberman', 'Médio', '2021-05-28', 'F', 19),
('Fury', 'Boxer', 'Médio', '2021-11-01', 'M', 20),
('Thor', 'Golden Retriever', 'Grande', '2020-08-12', 'M', 21),
('Bane', 'Pitbull', 'Médio', '2021-04-05', 'M', 22),
('Maya', 'Akita', 'Grande', '2021-03-15', 'F', 23),
('Bolt', 'Fila Brasileiro', 'Grande', '2020-07-09', 'M', 24),
('Rock', 'Pastor Alemão', 'Grande', '2022-02-20', 'M', 25),
('Puma', 'Labrador', 'Médio', '2022-01-10', 'F', 26),
('Sam', 'Husky Siberiano', 'Médio', '2021-10-17', 'M', 27),
('Ragnar', 'Doberman', 'Médio', '2021-04-30', 'M', 28),
('Athos', 'Boxer', 'Grande', '2020-09-25', 'M', 29),
('Bella', 'Golden Retriever', 'Grande', '2021-11-05', 'F', 30);

-- mochilas
INSERT INTO Mochila (PossuiRacao, PossuiGuia, IDcachorro)
VALUES 
(1, 1, 1), (1, 1, 2), (1, 1, 3), (1, 1, 4), (1, 1, 5), 
(1, 1, 6), (1, 1, 7), (1, 1, 8), (1, 1, 9), (1, 1, 10),
(1, 1, 11), (1, 1, 12), (1, 1, 13), (1, 1, 14), (1, 1, 15),
(1, 1, 16), (1, 1, 17), (1, 1, 18), (1, 1, 19), (1, 1, 20),
(1, 1, 21), (1, 1, 22), (1, 1, 23), (1, 1, 24), (1, 1, 25),
(1, 1, 26), (1, 1, 27), (1, 1, 28), (1, 1, 29), (1, 1, 30);

--funcionários

INSERT INTO Funcionario (Nome, Sobrenome, Funcao, DataAdmissao, Salario)
VALUES
('Carlos', 'Souza', 'Cuidador', '2021-02-01', 2500.00),
('Fernanda', 'Lima', 'Cuidador', '2020-10-15', 2700.00),
('Roberta', 'Oliveira', 'Administrativo', '2019-06-30', 3000.00),
('Rafael', 'Costa', 'Cuidador', '2021-05-10', 2500.00),
('André', 'Silva', 'Cuidador', '2021-08-20', 2600.00);

--serviços
INSERT INTO Servico (NomeServico)
VALUES
('Banho'),
('Tosa'),
('Hidratação');

--telefones
INSERT INTO TelefoneCliente (TelefoneCliente, TelefoneResidencial, TelefoneOutro, IDcliente)
VALUES
('11999999999', '1132222222', '11988888888', 1),
('11988888888', '1133333333', '11977777777', 2),
('11977777777', '1134444444', '11966666666', 3),
('11966666666', '1135555555', '11955555555', 4),
('11955555555', '1136666666', '11944444444', 5),
('11944444444', '1137777777', '11933333333', 6),
('11933333333', '1138888888', '11922222222', 7),
('11922222222', '1139999999', '11911111111', 8),
('11911111111', '1130000000', '11900000000', 9),
('11900000000', '1131111111', '11999999999', 10),
('11999999999', '1132222222', '11988888888', 11),
('11988888888', '1133333333', '11977777777', 12),
('11977777777', '1134444444', '11966666666', 13),
('11966666666', '1135555555', '11955555555', 14),
('11955555555', '1136666666', '11944444444', 15),
('11944444444', '1137777777', '11933333333', 16),
('11933333333', '1138888888', '11922222222', 17),
('11922222222', '1139999999', '11911111111', 18),
('11911111111', '1130000000', '11900000000', 19),
('11900000000', '1131111111', '11999999999', 20),
('11999999999', '1132222222', '11988888888', 21),
('11988888888', '1133333333', '11977777777', 22),
('11977777777', '1134444444', '11966666666', 23),
('11966666666', '1135555555', '11955555555', 24),
('11955555555', '1136666666', '11944444444', 25),
('11944444444', '1137777777', '11933333333', 26),
('11933333333', '1138888888', '11922222222', 27),
('11922222222', '1139999999', '11911111111', 28),
('11911111111', '1130000000', '11900000000', 29),
('11900000000', '1131111111', '11999999999', 30);

--Endereços
INSERT INTO EnderecoCliente (Logradouro, Numero, Complemento, Bairro, Cidade, Estado, CEP, IDcliente)
VALUES
('Rua A', '101', 'Apartamento 1', 'Centro', 'São Paulo', 'SP', '01001000', 1),
('Rua B', '102', 'Casa', 'Jardim Paulista', 'São Paulo', 'SP', '01002000', 2),
('Rua C', '103', 'Apartamento 2', 'Itaim Bibi', 'São Paulo', 'SP', '01003000', 3),
('Rua D', '104', 'Casa', 'Vila Progredior', 'São Paulo', 'SP', '01004000', 4),
('Rua E', '105', 'Apartamento 3', 'Vila Maria', 'São Paulo', 'SP', '01005000', 5),
('Rua F', '106', 'Casa', 'Vila Andrade', 'São Paulo', 'SP', '01006000', 6),
('Rua G', '107', 'Apartamento 4', 'Jardim Europa', 'São Paulo', 'SP', '01007000', 7),
('Rua H', '108', 'Casa', 'Vila Dom Pedro', 'São Paulo', 'SP', '01008000', 8),
('Rua I', '109', 'Apartamento 5', 'Itaim Bibi', 'São Paulo', 'SP', '01009000', 9),
('Rua J', '110', 'Casa', 'Vila Progredior', 'São Paulo', 'SP', '01010000', 10),
('Rua K', '111', 'Apartamento 6', 'Centro', 'São Paulo', 'SP', '01011000', 11),
('Rua L', '112', 'Casa', 'Vila Andrade', 'São Paulo', 'SP', '01012000', 12),
('Rua M', '113', 'Apartamento 7', 'Jardim Paulista', 'São Paulo', 'SP', '01013000', 13),
('Rua N', '114', 'Casa', 'Vila Maria', 'São Paulo', 'SP', '01014000', 14),
('Rua O', '115', 'Apartamento 8', 'Jardim Europa', 'São Paulo', 'SP', '01015000', 15),
('Rua P', '116', 'Casa', 'Vila Dom Pedro', 'São Paulo', 'SP', '01016000', 16),
('Rua Q', '117', 'Apartamento 9', 'Itaim Bibi', 'São Paulo', 'SP', '01017000', 17),
('Rua R', '118', 'Casa', 'Vila Progredior', 'São Paulo', 'SP', '01018000', 18),
('Rua S', '119', 'Apartamento 10', 'Vila Andrade', 'São Paulo', 'SP', '01019000', 19),
('Rua T', '120', 'Casa', 'Jardim Paulista', 'São Paulo', 'SP', '01020000', 20),
('Rua U', '121', 'Apartamento 11', 'Vila Maria', 'São Paulo', 'SP', '01021000', 21),
('Rua V', '122', 'Casa', 'Jardim Europa', 'São Paulo', 'SP', '01022000', 22),
('Rua W', '123', 'Apartamento 12', 'Vila Dom Pedro', 'São Paulo', 'SP', '01023000', 23),
('Rua X', '124', 'Casa', 'Itaim Bibi', 'São Paulo', 'SP', '01024000', 24),
('Rua Y', '125', 'Apartamento 13', 'Vila Progredior', 'São Paulo', 'SP', '01025000', 25),
('Rua Z', '126', 'Casa', 'Vila Andrade', 'São Paulo', 'SP', '01026000', 26),
('Rua AA', '127', 'Apartamento 14', 'Centro', 'São Paulo', 'SP', '01027000', 27),
('Rua AB', '128', 'Casa', 'Jardim Paulista', 'São Paulo', 'SP', '01028000', 28),
('Rua AC', '129', 'Apartamento 15', 'Itaim Bibi', 'São Paulo', 'SP', '01029000', 29),
('Rua AD', '130', 'Casa', 'Vila Progredior', 'São Paulo', 'SP', '01030000', 30);

--atividades
INSERT INTO Atividade (Nome, Descricao, TipoEspaco, IDfuncionario)
VALUES
('Meditação', 'Atividade relaxante para os cães', 'P', 1),
('Corrida com bolinhas', 'Atividade física para os cães', 'M', 2),
('Pausa para almoço', 'Cães têm um intervalo para descanso', 'P', 3),
('Brincadeira com água', 'Atividade refrescante para cães no calor', 'M', 4),
('Brincadeira com mordedores', 'Brincadeiras com mordedores e brinquedos', 'P', 5);

--Ocorrências
INSERT INTO Ocorrencia (Tipo, Dataocorrencia, Descricao, Gravidade, IDcachorro, IDfuncionario)
VALUES
('Briga', '2023-04-01', 'Briga entre cães na área de recreação', 'Alta', 1, 1),
('Briga', '2023-04-02', 'Briga com outro cão enquanto jogavam bolinhas', 'Média', 2, 2),
('Briga', '2023-04-03', 'Briga por um brinquedo', 'Baixa', 3, 3),
('Briga', '2023-04-04', 'Briga enquanto descansavam durante a soneca', 'Média', 4, 4),
('Briga', '2023-04-05', 'Briga com outro cão durante recreação livre', 'Alta', 5, 5);

--Agendamentos
INSERT INTO Agendamento (DataAgendamento, Horario, ValorFinal, Status, IDcachorro, IDfuncionario)
VALUES
('2023-04-06', '10:00:00', 80.00, 'Realizado', 1, 1),
('2023-04-06', '11:00:00', 90.00, 'Realizado', 2, 2),
('2023-04-06', '12:00:00', 85.00, 'Realizado', 3, 3),
('2023-04-06', '14:00:00', 75.00, 'Realizado', 4, 4),
('2023-04-06', '15:00:00', 100.00, 'Pendente', 5, 5);

-- Pagamentos existentes
INSERT INTO Pagamento (DataPagamento, ValorPago, FormaPagamento, StatusPagamento, IDagendamento, IDcliente)
VALUES
('2023-04-06', 80.00, 'Pix', 'Pago', 1, 1),
('2023-04-06', 90.00, 'Pix', 'Pago', 2, 2),
('2023-04-06', 85.00, 'Pix', 'Pago', 3, 3),
('2023-04-06', 75.00, 'Pix', 'Pendente', 4, 4),
('2023-04-06', 100.00, 'Pix', 'Pago', 5, 5);

-- Novos pagamentos
INSERT INTO Pagamento (DataPagamento, ValorPago, FormaPagamento, StatusPagamento, IDagendamento, IDcliente)
VALUES
('2023-04-07', 120.00, 'Cartão de Crédito', 'Pago', 3, 3),
('2023-04-08', 75.00, 'Dinheiro', 'Pago', 4, 4),
('2023-04-09', 80.00, 'Cartão de Débito', 'Pago', 5, 5);

-- +Pagamentos
INSERT INTO Pagamento (DataPagamento, ValorPago, FormaPagamento, StatusPagamento, IDagendamento, IDcliente)
VALUES
('2023-04-06', 80.00, 'Pix', 'Pago', 1, 1),
('2023-04-06', 90.00, 'Pix', 'Pago', 2, 2),
('2023-04-06', 85.00, 'Pix', 'Pago', 3, 3),
('2023-04-06', 75.00, 'Pix', 'Pendente', 4, 4),
('2023-04-06', 100.00, 'Pix', 'Pago', 5, 5);

--Despesas
INSERT INTO Despesa (Datadespesa, Tipo, Valor, Observacao, IDfuncionario)
VALUES
('2023-04-01', 'Fixas', 2000.00, 'Pagamento de salários', 3),
('2023-04-02', 'Variáveis', 500.00, 'Compra de ração', 2),
('2023-04-03', 'Fixas', 1500.00, 'Manutenção da estrutura', 4),
('2023-04-04', 'Variáveis', 300.00, 'Compra de brinquedos', 5),
('2023-04-05', 'Fixas', 800.00, 'Água e energia', 1);
--cachorros e atividades

INSERT INTO Cachorro_Atividade (IDcachorro, IDatividade, DataParticipacao)
VALUES
(1, 1, '2025-04-10'), -- Cachorro 1 fez Meditação
(2, 2, '2025-04-10'), -- Cachorro 2 fez Corrida com bolinhas
(3, 3, '2025-04-10'), -- Cachorro 3 teve Pausa para almoço
(4, 4, '2025-04-10'), -- Cachorro 4 brincou com água
(5, 5, '2025-04-10'), -- Cachorro 5 brincou com mordedores
(1, 2, '2025-04-11'), -- Cachorro 1 também fez Corrida
(2, 5, '2025-04-11');

--agendamento_Serviço


-- Agendamento 1: Banho
INSERT INTO Agendamento_Servico (IDagendamento, IDservico)
VALUES (1, 1);

-- Agendamento 2: Tosa
INSERT INTO Agendamento_Servico (IDagendamento, IDservico)
VALUES (2, 2);

-- Agendamento 3: Banho + Tosa
INSERT INTO Agendamento_Servico (IDagendamento, IDservico)
VALUES (3, 1),
       (3, 2);

-- Agendamento 4: Hidratação
INSERT INTO Agendamento_Servico (IDagendamento, IDservico)
VALUES (4, 3);

-- Agendamento 5: Banho + Hidratação
INSERT INTO Agendamento_Servico (IDagendamento, IDservico)
VALUES (5, 1),
       (5, 3);


SELECT * 
FROM Cliente;


SELECT * 
FROM Cachorro;

SELECT * 
FROM Servico;

SELECT * 
FROM Agendamento;

SELECT * 
FROM TelefoneCliente;

SELECT * 
FROM EnderecoCliente;

SELECT * 
FROM Ocorrencia;

SELECT * 
FROM Mochila;

SELECT*
FROM Pagamento; 
SELECT * 
FROM Cachorro_Atividade;

SELECT * 
FROM Agendamento_Servico;

SELECT * 
FROM Despesa;

--algumas consultas
--Selecionando todos os cachorros de um cliente específico
SELECT *
FROM Cachorro
WHERE IDcliente =1;

--Contando quantos cães de cada porte existem:
SELECT Porte, COUNT(*) AS Quantidade
FROM Cachorro
GROUP BY Porte;

--Selecionando os funcionários com um salário superior a um valor específico (exemplo: 2500):
SELECT * FROM Funcionario WHERE Salario > 2500;

--lista de clientes com os respectivos cachorros:
SELECT Cliente.Nome, Cliente.Sobrenome,Cachorro.Nome AS NomeCachorro
FROM Cliente
JOIN Cachorro ON Cliente.IDcliente = Cachorro.IDcliente;
 --funcionários que realizaram atividades com cães, juntamente com a descrição da atividade:
 SELECT funcionario.Nome, funcionario.Sobrenome, Atividade.Nome AS Atividade, Atividade.Descricao
FROM funcionario
JOIN Atividade ON funcionario.IDfuncionario = Atividade.IDfuncionario;

--clientes que possuem cachorros e também os números de telefone associados:
SELECT Cliente.Nome, Cliente.Sobrenome, Cachorro.Nome AS NomeCachorro, TelefoneCliente.TelefoneCliente
FROM Cliente
JOIN Cachorro ON Cliente.IDcliente = Cachorro.IDcliente
JOin TelefoneCliente ON Cliente.IDcliente = TelefoneCliente.IDcliente;

--todos os pagamentos de um agendamento específico (exemplo: IDagendamento = 1):
SELECT Pagamento.DataPagamento, Pagamento.ValorPago, Pagamento.FormaPagamento
FROM Pagamento
JOIN Agendamento ON Pagamento.IDagendamento = Agendamento.IDagendamento
WHERE Agendamento.IDagendamento = 1;

--consultas com WITH 
--média salarial dos funcionários em cada função:
WITH MediaSalarial AS (
    SELECT Funcao, AVG(Salario) AS MediaSalario
    FROM Funcionario
    GROUP BY Funcao
)
SELECT * FROM MediaSalarial;
--quantidade de agendamentos realizados por cachorro, juntamente com o nome do cachorro:
WITH QuantidadeAgendamentos AS (
    SELECT IDcachorro, COUNT(*) AS Quantidade
    FROM Agendamento
    GROUP BY IDcachorro
)
SELECT Cachorro.Nome, QuantidadeAgendamentos.Quantidade
FROM QuantidadeAgendamentos
JOIN Cachorro ON QuantidadeAgendamentos.IDcachorro = Cachorro.IDcachorro;

--quantidade de ocorrências registradas por cachorro e a gravidade da ocorrência:
WITH QuantidadeOcorrencias AS (
    SELECT IDcachorro, Gravidade, COUNT(*) AS Quantidade
    FROM Ocorrencia
    GROUP BY IDcachorro, Gravidade
)
SELECT Cachorro.Nome, QuantidadeOcorrencias.Gravidade, QuantidadeOcorrencias.Quantidade
FROM QuantidadeOcorrencias
JOIN Cachorro ON QuantidadeOcorrencias.IDcachorro = Cachorro.IDcachorro;

--clientes com o valor total de pagamentos realizados (considerando múltiplos pagamentos):
WITH TotalPagamentos AS (
    SELECT IDcliente, SUM(ValorPago) AS TotalPago
    FROM Pagamento
    GROUP BY IDcliente
)
SELECT Cliente.Nome, Cliente.Sobrenome, TotalPagamentos.TotalPago
FROM TotalPagamentos
JOIN Cliente ON TotalPagamentos.IDcliente = Cliente.IDcliente;

--