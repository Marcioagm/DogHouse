Dicionário de dados atualizado


Cliente 
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDcliente	      INT	        PK	NN
Nome	              VARCHAR(100)		NN
Sobrenome	      VARCHAR(100)		NN

Telefone_Cliente
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDtelefone_Cliente    INT	        PK	NN
Telefone_redicencial  VARCHAR(15)		
Telefone_celular      VARCHAR(15)		NN
Telefone_outro	      VARCHAR(15)		
IDcliente	      INT	        FK	NN

Endereco_Cliente
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDendereco_cliente    INT	        PK	NN
Logradouro	      VARCHAR(200)		NN
Número	              VARCHAR(10)		NN
Complemento	      VARCHAR(100)		NN
Bairro	              VARCHAR(50)		NN
Cidade	              VARCHAR(50)		NN
Estado	              VARCHAR(2)		NN
CEP	              Char(9)		        NN
IDcliente	      INT	        FK	NN

CÃO
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDcao	              INT	        PK	NN
Nome	              VARCHAR(100)		NN
Raça	              VARCHAR(100)		NN
Porte	              VARCHAR(50)		NN
DataNascimeto	      DATE		
Sexo	              CHAR(1)		
IDcliente	      INT	        FK	NN






FUNCIONÁRIO
ATRIBUTO	      TIPO DE  DADO	CHAVE	NULIDADE
IDfuncionario	      INT	        PK	NN
Nome	              VARCHAR(100)		NN
Sobrenome	      VARCHAR(100)		NN
Função	              VARCHAR(100)		NN
DataAdmissão	      DATE		
Salário	              DECIMAL(10,2)		NN

SERVIÇO
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDservico	      INT	        PK	NN
NomeServico	      VARCHAR(100)		

AGENDAMENTO
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDagendamento	      INT	        PK	NN
Data	              DATE		        NN
Horario	              TIME		        NN
ValorFinal	      DECIMAL(10,2)		NN
Status	              VARCHAR(20)		NN
IDcao	              INT	        FK	NN
IDfuncionario	      INT	        FK	NN

PAGAMENTO
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDpagamento	      INT	        PK	NN
Data	              DATE		        NN
ValorPago	      DECIMAL(10,2)		NN
FormaPagamento	      VARCHAR(20)		NN
StatusPagamento	      VARCHAR(20)		NN
IDagendamento	      INT	        FK	NN
IDcliente	      INT	        FK	NN

DESPESA
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDdespesa	      INT	        PK	NN
Data	              DATE		        NN
Tipo	              VARCHAR(50)		NN
Valor	              DECIMAL(10,2)		NN
Observacao	      VARCHAR(200)		NN
IDfuncionario	      INT	        FK	NN
     
MOCHILA
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDmochila	      INT	        PK	NN
PossuiRacao	      BIT		
Possuiguia	      BIT		
IDcao	              INT	        FK	NN

OCORRENCIA
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDocorrencia	      INT	        PK	NN
Tipo	              VARCHAR(50)		NN
Data	              DATE		        NN
Descricao	      VARCHAR(200)		NN
Gravidade	      VARCHAR(50)		NN
IDcao	              INT	        FK	NN
IDfuncionario	      INT	        FK	NN
  
ATIVIDADE
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDatividade	      INT	        PK	NN
Nome	              VARCHAR(100)		
Descricao	      VARCHAR(200)		
TipoEspaco	      VARCHAR(1)		
IDfuncionario	      INT	        FK	NN

Cao_Atividade
ATRIBUTO	      TIPO DE DADO	CHAVE	NULIDADE
IDCao_Atividade       INT	        PK	NN
IDcao	              INT	        FK	NN
IDatividade	      INT	        FK	NN
DataParticipacao      DATE		

Agendamento_Servico
ATRIBUTO	        TIPO DE DADO	CHAVE	NULIDADE
IDagendamento_Servico	INT	        PK	NN
IDagendamento	        INT	        FK	NN
IDservico	        INT	        FK	NN

