NORMALIZAÇÃO


NORMAIZAÇÃO 1-FN
Cliente (sem 1-FN)
ATRIBUTO	TIPO DE DADO	CHAVE	NULIDADE
IDcliente	INT	         PK	NN
Nome	        VARCHAR(100)		NN
Sobrenome	VARCHAR(100)		NN
Telefone	VARCHAR(15)		NN
Endereço	VARCHAR(200)		NN



Cliente (com 1-FN)
ATRIBUTO	        TIPO DE DADO	 CHAVE	NULIDADE
IDcliente	        INT	         PK	NN
Nome	                VARCHAR(100)		NN
Sobrenome	        VARCHAR(100)		NN
Telefone_redicencial	VARCHAR(15)		NN
Telefone_celular	VARCHAR(15)		NN
Logradouro	        VARCHAR(200)		NN
Número	                VARCHAR(10)		NN
Complemento	        VARCHAR(100)		NN
Bairro	                VARCHAR(50)		NN
Cidade	                VARCHAR(50)		NN
Estado	                VARCHAR(2)		NN
CEP	                Char(9)		        NN

NORMALIZAÇÃO 2-FN

Cliente (com 2-FN)
Adicionado nova tabela para telefones e para endereço retirando as informações da tabela cliente.
ATRIBUTO	        TIPO DE DADO	CHAVE	NULIDADE
IDcliente	        INT	        PK	NN
Nome	                VARCHAR(100)		NN
Sobrenome	        VARCHAR(100)		NN


Telefone_Cliente
ATRIBUTO	        TIPO DE DADO	CHAVE	NULIDADE
IDtelefone_Cliente	INT	        PK	NN
Telefone_redicencial	VARCHAR(15)		
Telefone_celular	VARCHAR(15)		NN
Telefone_outro	        VARCHAR(15)		
IDcliente	        INT	        FK	NN

Endereco_Cliente
ATRIBUTO	        TIPO DE DADO	CHAVE	NULL E NOT NULL
IDendereco_cliente	INT	        PK	NN
Logradouro	        VARCHAR(200)		NN
Número	                VARCHAR(10)		NN
Complemento	        VARCHAR(100)		NN
Bairro	                VARCHAR(50)		NN
Cidade	                VARCHAR(50)		NN
Estado	                VARCHAR(2)		NN
CEP	                Char(9)		        NN
IDcliente	        INT	        FK	NN


NORMALIZAÇÃO 3-FN (campos não chave que dependam de outros não chave)
--Sem campos encontrados

