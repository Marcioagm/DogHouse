Atributos iniciais  das entidades 
 
cliente
IDcliente (pk)
Nome
Sobrenome
Telefone
Endereço
Cão
IDcao(pk)
Nome
Raça
Porte
DataNascimento
Sexo
IDcliente (fk)

Funcionário
IDfuncionario
Nome
Sobrenome
Função
DataAdmissao
Salario

Serviço
IDservico(pk)
NomeServico

Agendamento
IDagendamento(pk)
Data
Horario
ValorFinal
Status
IDcao(fk)
IDfuncionario(fk)

Pagamento
IDpagamento(pk)
Data
ValorPago
FormaPagamento
StatusPagamento
IDagendamento(fk)
IDcliente(fk)

Despesa
IDdespesa(pk)
Data
Tipo
Valor
Observação
IDfuncionario(fk)

Mochila
IDmochila(pk)
PossuiRacao 
PossuiGuia
IDcao(fk)

Ocorrência
IDocorrencia (pk)
Tipo
Data
Descricao
Gravidade
IDcao(fk)
IDfuncionario(FK)
Observação: Restrição máxima de 3 brigas por cão

Atividade
IDatividade(pk)
Nome
Descricao
TipoEspaco g, m, p
IDfuncionario(fk)
IDcaofk 
