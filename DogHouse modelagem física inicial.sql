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

