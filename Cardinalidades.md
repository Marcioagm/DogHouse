
Cardinalidades:

ENTIDADE A	 ENTIDADEE B	 RELACIONAMENTO	 CARDINALIDADE
Cliente 	   Cão	             Possui	  (1,1) - (1,N)       ok
Cão	          Mochila	     Possui	  (1,1) - (1,1)       ok
Cão 	          Ocorrência 	      Gera	  (1,1) - (0,N)       ok
Funcionário	  Ocorrência	   Registra	  (1,1) - (0,N)       ok
Cão	          Agendamento	    Participa	  (1,1) - (0,N)       ok
Agendamento	   Serviço	   Utiliza	  (1,N) - (1,N)       ok (N,M)
Agendamento	  Funcionário	    Realiza	  (1,1) - (0,N)       ok
Agendamento	    Pagamento	    Gera	  (0,1) - (1,1)       ok
Cliente	           Pagamento	    Efetua	  (1,1) - (0,N)       ok
Funcionário	    Despesa	    Cadastra	  (1,1) - (0,N)       ok
Cão	            Atividade	     Participa    (0,N) - (0,N)       ok (N,M)
Funcionário	    Atividade	    Conduz	  (1,1) - (0,N)
Agendamento	Agendamento_Servico	utiliza	  (1,1) - (0,N) E.A   OK
Servico	        Agendamento_Servico	utiliza	  (1,1) - (0,N) E.A   OK
Cao 	        Cao_Atividade	   Participa	  (1,1) - (0,N) E.A   OK
Atividade	Cao_Atividade	   Participa	  (1,1) - (0,N) E.A   OK
