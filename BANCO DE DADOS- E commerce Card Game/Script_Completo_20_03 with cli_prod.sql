
DROP TABLE XYZS CASCADE CONSTRAINTS PURGE;
DROP TABLE NML_MONSTROS CASCADE CONSTRAINTS PURGE;
DROP TABLE PENDULOS CASCADE CONSTRAINTS PURGE;
DROP TABLE MONSTROS CASCADE CONSTRAINTS PURGE;
DROP TABLE MAGICAS CASCADE CONSTRAINTS PURGE;
DROP TABLE CARTAS CASCADE CONSTRAINTS PURGE;
DROP TABLE COLECOES CASCADE CONSTRAINTS PURGE;
DROP TABLE SLEEVES CASCADE CONSTRAINTS PURGE;
DROP TABLE PLAYMATCHS CASCADE CONSTRAINTS PURGE;
DROP TABLE PRODUTOS_CLIENTES CASCADE CONSTRAINTS PURGE;
DROP TABLE PRODUTOS CASCADE CONSTRAINTS PURGE;
DROP TABLE CLIENTES CASCADE CONSTRAINTS PURGE;


/*************************** 
  NOTE - CREATE TABLES E COMENTARIOS
****************************/

CREATE TABLE CARTAS 
    ( 
     car_nome VARCHAR2 (100)  NOT NULL , 
     car_atributo VARCHAR2 (30)  NOT NULL , 
     car_tipo VARCHAR2 (30)  NOT NULL , 
     car_desc VARCHAR2 (500)  NOT NULL , 
     car_col_fk NUMBER (6)  NOT NULL , 
     car_id NUMBER (6)  NOT NULL 
    ) 
;

COMMENT ON TABLE CARTAS IS 'Tabela com todas as informaÃƒÂ§ÃƒÂµes que serÃƒÂ£o usadas pelas variantes de cartas';
    COMMENT ON COLUMN CARTAS.car_nome IS 'Nome das cartas da loja';
    COMMENT ON COLUMN CARTAS. car_atributo IS 'Atributo da carta ex: trevas, vento etc';
    COMMENT ON COLUMN CARTAS.car_tipo IS 'Tipo da carta ARRUMAR';
    COMMENT ON COLUMN CARTAS.car_desc IS 'DescriÃƒÂ§ÃƒÂ£o das cartas, efeitos ou historias';



CREATE TABLE CLIENTES 
    ( 
     cli_id NUMBER (6)  NOT NULL , 
     cli_nome VARCHAR2 (30)  NOT NULL , 
     cli_nome_meio VARCHAR2 (30) , 
     cli_ultimo_nome VARCHAR2 (15)  NOT NULL , 
     cli_email VARCHAR2 (60)  NOT NULL , 
     cli_cpf VARCHAR2 (11)  NOT NULL , 
     cli_cep VARCHAR2 (30)  NOT NULL , 
     cli_municipio VARCHAR2 (30) , 
     cli_bairro VARCHAR2 (30) , 
     cli_contato NUMBER (12)  NOT NULL 
    ) 
;
COMMENT ON TABLE CLIENTES IS 'Tabela para armazenar dados de contado do cliente, endereÃƒÂ§o, telefone etc';
    COMMENT ON COLUMN CLIENTES.cli_id IS 'Chave primaria da tabela CLIENTES';
    COMMENT ON COLUMN CLIENTES.cli_nome IS 'Primeiro do cliente';
    COMMENT ON COLUMN CLIENTES.cli_nome_meio IS 'Nome do meio do cliente';
    COMMENT ON COLUMN CLIENTES.cli_ultimo_nome IS 'Ultimo nome do cliente';
    COMMENT ON COLUMN CLIENTES.cli_email IS 'Email de contado do cliente';
    COMMENT ON COLUMN CLIENTES.cli_cpf IS 'Cpf de identificaÃƒÂ§ÃƒÂ£o do cliente';
    COMMENT ON COLUMN CLIENTES.cli_municipio IS 'Municipio do cliente para efetuar a entrega dos produtos';
    COMMENT ON COLUMN CLIENTES.cli_bairro IS 'Bairro do cliente para efetuar a entrega';
    COMMENT ON COLUMN CLIENTES.cli_contato IS 'Numero de contado do cliente';



CREATE TABLE COLECOES 
    ( 
     col_tema VARCHAR2 (200)  NOT NULL , 
     col_pdt_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE COLECOES IS 'Tabela para armazenar os temas das coleÃƒÂ§oes que forem lanÃƒÂ§adas';
    COMMENT ON COLUMN COLECOES.col_tema IS 'Tema da coleÃƒÂ§ÃƒÂ£o que for lanÃƒÂ§ada';
    COMMENT ON COLUMN colecoes.col_pdt_id IS 'Chave primaria da tabela colecoes';


CREATE TABLE MAGICAS 
    ( 
     mag_efeito VARCHAR2 (30)  NOT NULL , 
     mag_velocidade NUMBER (6)  NOT NULL , 
     mag_car_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE MAGICAS IS 'Tabela para armazenar as cartas magicas da loja e suas particularidade';
    COMMENT ON COLUMN MAGICAS.mag_efeito IS 'Tipos de efeitos das cartas ex: equipamento, continuas, campo etc ';
    COMMENT ON COLUMN MAGICAS.MAG_velocidade IS 'Velocidade da carta ex: 1,2,3. Dependendo do numero a carta pode ou nao ser ativada em determinado momento';
    COMMENT ON COLUMN MAGICAS.mag_car_id IS 'Chave primaria da tabela magicas';


CREATE TABLE MONSTROS 
    ( 
     mon_atk NUMBER (30) , 
     mon_def NUMBER (30) , 
     mon_car_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE MONSTROS IS 'Tabela para armazenar ataque e defesa dos monstros jÃƒÂ¡ que ÃƒÂ© um atributo comum a todos';
    COMMENT ON COLUMN MONSTROS.mon_atk IS 'Valor do ataque do monstro';
    COMMENT ON COLUMN MONSTROS.mon_def IS 'Valor da defesa do monstro';

CREATE TABLE NML_MONSTROS 
    ( 
     nml_estrelas NUMBER (30)  NOT NULL , 
     nml_mon_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE NML_MONSTROS IS 'Tabela para armazenas os monstros que possuem estrelas que sÃƒÂ£o os normais, efeitos, ';
    COMMENT ON COLUMN NML_MONSTROS.nml_estrelas IS 'Estrelas sÃƒÂ£o necessarias para as condiÃƒÂ§oes de invocaÃƒÂ§oes dos monstros';
    COMMENT ON COLUMN NML_MONSTROS.nml_mon_id IS 'Chave primaria da tabela nml monstros';

CREATE TABLE PENDULOS 
    ( 
     pen_escala NUMBER (30)  NOT NULL , 
     pen_efeito VARCHAR2 (450) , 
     pen_car_mon_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE PENDULOS IS 'Tabela para armazenar as particularidades dos monstros pendulo';
    COMMENT ON COLUMN PENDULOS.pen_escala IS 'escala pendulo ÃƒÂ© um numero que ÃƒÂ© necessarios para eventuais condiÃƒÂ§oes de invocaÃƒÂ§ÃƒÂ£o especial';
    COMMENT ON COLUMN PENDULOS.pen_efeito IS 'Efeito extra que somente monstros pendulo possuem';
    COMMENT ON COLUMN PENDULOS.pen_car_mon_id IS 'Chave primaria da tabela pendulos';


CREATE TABLE PLAYMATCHS 
    ( 
     plt_tamanho VARCHAR2 (20) , 
     plt_cor VARCHAR2 (30) , 
     plt_pdt_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE PLAYMATCHS IS 'Tabela para armazenar os tipos de campos personalizados da loja';
    COMMENT ON COLUMN PLAYMATCHS.plt_tamanho IS 'Largura do campo';
    COMMENT ON COLUMN PLAYMATCHS.plt_cor IS 'Cor do campo';
    COMMENT ON COLUMN PLAYMATCHS.plt_pdt_id IS 'Chave primaria da tabela playmatchs';



CREATE TABLE PRODUTOS 
    ( 
     pdt_id NUMBER (6)  NOT NULL , 
     pdt_nome VARCHAR2 (60)  NOT NULL , 
     pdt_descricao VARCHAR2 (255)  NOT NULL , 
     pdt_preco NUMBER (8,2)  NOT NULL , 
     pdt_data_aquisicao DATE  NOT NULL 
    ) 
;
COMMENT ON TABLE PRODUTOS IS 'Tabela para armazenar informaÃƒÂ§oes gerais dos produtos da loja';
    COMMENT ON COLUMN PRODUTOS.pdt_id IS 'Chave primaria da tabela produtos';
    COMMENT ON COLUMN PRODUTOS.pdt_nome IS 'Nome dos produtos da loja';
    COMMENT ON COLUMN PRODUTOS.pdt_descricao IS 'DescriÃƒÂ§ÃƒÂ£o geral do que se trata o produto';
    COMMENT ON COLUMN PRODUTOS.pdt_preco IS 'Valor do produto';
    COMMENT ON COLUMN PRODUTOS.pdt_data_aquisicao IS 'Data de registro do produto';
    


CREATE TABLE PRODUTOS_CLIENTES 
    ( 
     cps_cli_id NUMBER (6)  NOT NULL , 
     cps_pdt_id NUMBER (6)  NOT NULL , 
     cps_data_compra DATE  NOT NULL 
    ) 
;

CREATE TABLE SLEEVES 
    ( 
     slv_marca VARCHAR2 (60)  NOT NULL , 
     slv_pdt_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE SLEEVES IS 'Tabela para armazenar dados referentes ao produto sleeve que ÃƒÂ© um protetor de cartas';
    COMMENT ON COLUMN SLEEVES.slv_marca IS 'Marca do sleeve';
    COMMENT ON COLUMN SLEEVES.slv_pdt_id IS 'Chave primaria da tabela sleeves';
    

CREATE TABLE XYZS 
    ( 
     xyz_rank NUMBER (30)  NOT NULL , 
     xyz_mon_id NUMBER (6)  NOT NULL 
    ) 
;
COMMENT ON TABLE XYZS IS 'Tabela para armazenar as peculiaridades das cartas tipo xyz';
    COMMENT ON COLUMN XYZS.xyz_rank IS 'Rank ÃƒÂ© um numero exclusivo de invocaÃƒÂ§oes xyz que ÃƒÂ© necessario para eventuais condiÃƒÂ§oes de invocaÃƒÂ§ÃƒÂ£o especial';
    COMMENT ON COLUMN XYZS.xyz_mon_id IS 'Chave primaria da tabela xyzs';

/*************************** 
  NOTE - ALTER TABLES
****************************/

ALTER TABLE CARTAS 
    ADD CONSTRAINT PK_car PRIMARY KEY ( car_id ) ;


ALTER TABLE CLIENTES 
    ADD CONSTRAINT PK_cli PRIMARY KEY ( cli_id ) ;

ALTER TABLE COLECOES 
    ADD CONSTRAINT PK_col PRIMARY KEY ( col_pdt_id ) ;

ALTER TABLE MAGICAS 
    ADD CONSTRAINT PK_mag PRIMARY KEY ( mag_car_id ) ;

ALTER TABLE MONSTROS 
    ADD CONSTRAINT PK_mon PRIMARY KEY ( mon_car_id ) ;

ALTER TABLE NML_MONSTROS 
    ADD CONSTRAINT PK_nml PRIMARY KEY ( nml_mon_id ) ;

ALTER TABLE PENDULOS 
    ADD CONSTRAINT PK_pen PRIMARY KEY ( pen_car_mon_id ) ;

ALTER TABLE PLAYMATCHS 
    ADD CONSTRAINT PK_plt PRIMARY KEY ( plt_pdt_id ) ;

ALTER TABLE PRODUTOS 
    ADD CONSTRAINT PK_pdt PRIMARY KEY ( pdt_id ) ;


ALTER TABLE PRODUTOS_CLIENTES 
    ADD CONSTRAINT PK_cps PRIMARY KEY ( cps_cli_id, cps_pdt_id, cps_data_compra ) ;

ALTER TABLE SLEEVES 
    ADD CONSTRAINT slv_pdt_PK PRIMARY KEY ( slv_pdt_id ) ;

ALTER TABLE XYZS 
    ADD CONSTRAINT PK_xyz PRIMARY KEY ( xyz_mon_id ) ;





ALTER TABLE CARTAS 
    ADD CONSTRAINT FK_car_col FOREIGN KEY 
    ( 
     car_col_fk
    ) 
    REFERENCES COLECOES 
    ( 
     col_pdt_id
    ) 
;


ALTER TABLE COLECOES 
    ADD CONSTRAINT FK_pdt_col FOREIGN KEY 
    ( 
     col_pdt_id
    ) 
    REFERENCES PRODUTOS 
    ( 
     pdt_id
    ) 
;


ALTER TABLE MAGICAS 
    ADD CONSTRAINT FK_mag_car FOREIGN KEY 
    ( 
     mag_car_id
    ) 
    REFERENCES CARTAS 
    ( 
     car_id
    ) 
;


ALTER TABLE MONSTROS 
    ADD CONSTRAINT FK_mon_car FOREIGN KEY 
    ( 
     mon_car_id
    ) 
    REFERENCES CARTAS 
    ( 
     car_id
    ) 
;


ALTER TABLE NML_MONSTROS 
    ADD CONSTRAINT FK_nml_mon FOREIGN KEY 
    ( 
     nml_mon_id
    ) 
    REFERENCES MONSTROS 
    ( 
     mon_car_id
    ) 
;


ALTER TABLE PENDULOS 
    ADD CONSTRAINT FK_pen_mon FOREIGN KEY 
    ( 
     pen_car_mon_id
    ) 
    REFERENCES MONSTROS 
    ( 
     mon_car_id
    ) 
;


ALTER TABLE PLAYMATCHS 
    ADD CONSTRAINT FK_plt_pdt FOREIGN KEY 
    ( 
     plt_pdt_id
    ) 
    REFERENCES PRODUTOS 
    ( 
     pdt_id
    ) 
;


ALTER TABLE PRODUTOS_CLIENTES 
    ADD CONSTRAINT "FK_cps_cli " FOREIGN KEY 
    ( 
     cps_cli_id
    ) 
    REFERENCES CLIENTES 
    ( 
     cli_id
    ) 
;


ALTER TABLE PRODUTOS_CLIENTES 
    ADD CONSTRAINT FK_cps_pdt FOREIGN KEY 
    ( 
     cps_pdt_id
    ) 
    REFERENCES PRODUTOS 
    ( 
     pdt_id
    ) 
;


ALTER TABLE SLEEVES 
    ADD CONSTRAINT FK_slv_pdt FOREIGN KEY 
    ( 
     slv_pdt_id
    ) 
    REFERENCES PRODUTOS 
    ( 
     pdt_id
    ) 
;


ALTER TABLE XYZS 
    ADD CONSTRAINT FK_xyz_mon FOREIGN KEY 
    ( 
     xyz_mon_id
    ) 
    REFERENCES MONSTROS 
    ( 
     mon_car_id
    ) 
;




/*************************** 
  NOTE - INSERT NAS TABELAS
****************************/
-- TB CLIENTES===============================
/*************************** 
  TODO - Insert tabela clientes
****************************/

INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 1 , 'Marcio' , 'Thomaz' , 'Souza' , 'Macio@hotmail.com '  , ' 123456 ' , ' 80020 ' , 'SÃƒÂ£o Paulo' , 'Conj Res Cocuera' , ' 47961457 ');				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 2	,	 'Gabriel'	,	'Victor'	,	'Souza'	,	 'GabrielVictor@hotmail.com' 	,	 ' 123458 ' 	,	 ' 80022 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961459 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 3	,	 'Felpe'	,	'Henrique'	,	'Souza'	,	   'FelpeHenrique@hotmail.com ' 	,	 ' 123459 ' 	,	 ' 80023 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961460 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 4	,	 'Henrique'	,	'Vicco'	,	'Souza'	,	 'HenriqueVicco@hotmail.com'	,	 ' 123460 ' 	,	 ' 80024 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961461 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 5	,	 'Mathues'	,	'Fernandes'	,	'Souza'	,	 'MathuesFernandes@hotmail.com'	,	 ' 123461 ' 	,	 ' 80025 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961462 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 6	,	 'Guilherme'	,	'Prestes'	,	'Souza'	,	 'GuilhermePrestes@hotmail.com'	,	 ' 123462 ' 	,	 ' 80026 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961463 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 7	,	 'Leila'	,	'N sei kk'	,	'Souza'	,	 'LeilaN sei kk@hotmail.com'	,	 ' 123463 ' 	,	 ' 80027 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961464 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 8	,	 'Hamilton'	,	'Da Silva'	,	'Souza'	,	 'HamiltonDasilva@hotmail.com'	,	 ' 123464 ' 	,	 ' 80028 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961465 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 9	,	 'Cintia'	,	'Ramos'	,	'Souza'	,	'CintiaRamos@hotmail.com'	,	 ' 123465 ' 	,	 ' 80029 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961466 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	( 10	,	'Rosalina'	,	'Ramos'	,	'Souza'	,	'RosalinaRamos@hotmail.com'	,	 ' 123466 ' 	,	 ' 80030 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961467 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	11	,	'Janaina'	,	'Ramos'	,	'Souza'	,	'JanainaRamos@hotmail.com'	,	 ' 123467 ' 	,	 ' 80031 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961468 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	12	,	'Helena'	,	'Oliveira'	,	'Souza'	,	'HelenaOliveira@hotmail.com'	,	 ' 123468 ' 	,	 ' 80032 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961469 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	13	,	'Amanda'	,	'Prestes'	,	'Souza'	,	'AmandaPrestes@hotmail.com'	,	 ' 123469 ' 	,	 ' 80033 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961470 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	14	,	'Joao'	,	'Key'	,	'Souza'	,	'JoÃƒÂ£oKey@hotmail.com'	,	 ' 123470 ' 	,	 ' 80034 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961471 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	15	,	'Joao'	,	'Vitoria'	,	'Souza'	,	'JoÃƒÂ£oVitoria@hotmail.com'	,	 ' 123471 ' 	,	 ' 80035 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961472 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	16	,	'Joaoo'	,	'Derrota'	,	'Souza'	,	'JoÃƒÂ£oDerrota@hotmail.com'	,	 ' 123472 ' 	,	 ' 80036 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961473 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	17	,	'Joaoo'	,	'Miguel'	,	'Souza'	,	'JoÃƒÂ£oMiguel@hotmail.com'	,	 ' 123473 ' 	,	 ' 80037 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961474 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	18	,	'Jorge'	,	'Matheus'	,	'Souza'	,	'JorgeMatheus@hotmail.com'	,	 ' 123474 ' 	,	 ' 80038 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961475 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	19	,	'Jorge'	,	'Thomaz'	,	'Souza'	,	'JorgeThomaz@hotmail.com'	,	 ' 123475 ' 	,	 ' 80039 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961476 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	20	,	'Jorge'	,	'Fla'	,	'Souza'	,	'JorgeFla@hotmail.com'	,	 ' 123476 ' 	,	 ' 80040 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961477 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	21	,	'Jorge'	,	'Thomaz'	,	'Souza'	,	'JorgeThomaz@hotmail.com'	,	 ' 123477 ' 	,	 ' 80041 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961478 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	22	,	'Joao'	,	'Biblico'	,	'Souza'	,	'JosÃƒÂ©Biblico@hotmail.com'	,	 ' 123478 ' 	,	 ' 80042 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961479 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	23	,	'Joao'	,	'Evangelista'	,	'Souza'	,	'JosÃƒÂ©Evangelista@hotmail.com'	,	 ' 123479 ' 	,	 ' 80043 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961480 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	24	,	'Joao'	,	'Vitor'	,	'Souza'	,	'JosÃƒÂ©Vitor@hotmail.com'	,	 ' 123480 ' 	,	 ' 80044 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961481 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	25	,	'Joao'	,	'Massa'	,	'Souza'	,	'JosÃƒÂ©Massa@hotmail.com'	,	 ' 123481 ' 	,	 ' 80045 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961482 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	26	,	'Joao'	,	'Baila'	,	'Souza'	,	'JosÃƒÂ©Baila@hotmail.com'	,	 ' 123482 ' 	,	 ' 80046 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961483 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	27	,	'Julio'	,	'Faria'	,	'Souza'	,	'JulioFaria@hotmail.com'	,	 ' 123483 ' 	,	 ' 80047 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961484 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	28	,	'Lorenzo' , 'Thomaz'	,	'Souza'	,	'LorenzoThomaz@hotmail.com'	,	 ' 123484 ' 	,	 ' 80048 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961485 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	29	,	'Lorenzo'	,	'Latino'	,	'Souza'	,	'LorenzoLatino@hotmail.com'	,	 ' 123485 ' 	,	 ' 80049 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961486 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	30	,	'Lucas'	,	'Chris'	,	'Souza'	,	'LucasChris@hotmail.com'	,	 ' 123486 ' 	,	 ' 80050 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961487 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	31	,	'Luis'	,	'Henrique'	,	'Souza'	,	'LuisHenrique@hotmail.com'	,	 ' 123487 ' 	,	 ' 80051 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961488 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	32	,	'Luis'	,	'Thomaz'	,	'Souza'	,	'LuisThomaz@hotmail.com'	,	 ' 123488 ' 	,	 ' 80052 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961489 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	33	,	'Luis'	,	'Prado'	,	'Souza'	,	'LuisPrado@hotmail.com'	,	 ' 123489 ' 	,	 ' 80053 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961490 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	34	,	'Luis'	,	'Donizeti'	,	'Souza'	,	'LuisDonizeti@hotmail.com'	,	 ' 123490 ' 	,	 ' 80054 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961491 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	35	,	'Luis'	,	'Dahora'	,	'Souza'	,	'LuisDahora@hotmail.com'	,	 ' 123491 ' 	,	 ' 80055 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961492 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	36	,	'Luis'	,	'Bendro'	,	'Souza'	,	'LuisBendro@hotmail.com'	,	 ' 123492 ' 	,	 ' 80056 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961493 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	37	,	'Luis'	,	'pome'	,	'Souza'	,	'Luispome@hotmail.com'	,	 ' 123493 ' 	,	 ' 80057 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961494 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	38	,	'Luis'	,	'Moreno'	,	'Souza'	,	'LuisMoreno@hotmail.com'	,	 ' 123494 ' 	,	 ' 80058 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961495 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	39	,	'Luis'	,	'Ney'	,	'Souza'	,	'LuisNey@hotmail.com'	,	 ' 123495 ' 	,	 ' 80059 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961496 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	40	,	'Luis'	,	'SZ'	,	'Souza'	,	'LuisSZ@hotmail.com'	,	 ' 123496 ' 	,	 ' 80060 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961497 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	41	,	'Luis'	,	'Camargo'	,	'Souza'	,	'LuisCamargo@hotmail.com'	,	 ' 123497 ' 	,	 ' 80061 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961498 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	42	,	'Luis'	,	'Luciano'	,	'Souza'	,	'LuisLuciano@hotmail.com'	,	 ' 123498 ' 	,	 ' 80062 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961499 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	43	,	'Marco'	,	'Polo'	,	'Souza'	,	'MarcoPolo@hotmail.com'	,	 ' 123499 ' 	,	 ' 80063 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961500 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	44	,	'Marco'	,	'da Paz'	,	'Souza'	,	'Marcodadaz@hotmail.com'	,	 ' 123500 ' 	,	 ' 80064 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961501 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	45	,	'Marcos'	,	'Mineiro'	,	'Souza'	,	'MarcosMineiro@hotmail.com'	,	 ' 123501 ' 	,	 ' 80065 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961502 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	46	,	'Joao'	,	'Howk'	,	'Souza'	,	'MÃƒÂ¡rioHowk@hotmail.com'	,	 ' 123502 ' 	,	 ' 80066 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961503 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	47	,	'Mateus'	,	'Prado'	,	'Souza'	,	'MateusPrado@hotmail.com'	,	 ' 123503 ' 	,	 ' 80067 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961504 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	48	,	'Murilo'	,	'Pires'	,	'Souza'	,	'MuriloPires@hotmail.com'	,	 ' 123504 ' 	,	 ' 80068 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961505 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	49	,	'Murilo'	,	'Osorio'	,	'Souza'	,	'MuriloOsorio@hotmail.com'	,	 ' 123505 ' 	,	 ' 80069 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961506 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	50	,	'Alana'	,	'Cecilia'	,	'Souza'	,	'AlanaCecilia@hotmail.com'	,	 ' 123506 ' 	,	 ' 80070 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961507 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	51	,	'Ana' 	,	'Alice'	,	'Souza'	,	'Ana Alice@hotmail.com'	,	 ' 123507 ' 	,	 ' 80071 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961508 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	52	,	'Ana'	,	'Amelia'	,	'Souza'	,	'AnaAmelia@hotmail.com'	,	 ' 123508 ' 	,	 ' 80072 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961509 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	53	,	'Ana'	,	'Beatriz'	,	'Souza'	,	'AnaBeatriz@hotmail.com'	,	 ' 123509 ' 	,	 ' 80073 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961510 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	54	,	'Ana'	,	'Bela'	,	'Souza'	,	'AnaBela@hotmail.com'	,	 ' 123510 ' 	,	 ' 80074 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961511 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	55	,	'Ana'	,	'Carolina'	,	'Souza'	,	'AnaCarolina@hotmail.com'	,	 ' 123511 ' 	,	 ' 80075 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961512 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	56	,	'Ana'	,	'Cecilia'	,	'Souza'	,	'AnaCecilia@hotmail.com'	,	 ' 123512 ' 	,	 ' 80076 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961513 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	57	,	'Ana'	,	'Clara'	,	'Souza'	,	'AnaClara@hotmail.com'	,	 ' 123513 ' 	,	 ' 80077 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961514 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	58	,	'Ana'	,	'Elisa'	,	'Souza'	,	'AnaElisa@hotmail.com'	,	 ' 123514 ' 	,	 ' 80078 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961515 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	59	,	'Ana'	,	'Flavia'	,	'Souza'	,	'AnaFlavia@hotmail.com'	,	 ' 123515 ' 	,	 ' 80079 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961516 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	60	,	'Ana'	,	'Helena'	,	'Souza'	,	'AnaHelena@hotmail.com'	,	 ' 123516 ' 	,	 ' 80080 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961517 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	61	,	'Ana'	,	'Julia'	,	'Souza'	,	'AnaJulia@hotmail.com'	,	 ' 123517 ' 	,	 ' 80081 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961518 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	62	,	'Ana'	,	'Lara'	,	'Souza'	,	'AnaLara@hotmail.com'	,	 ' 123518 ' 	,	 ' 80082 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961519 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	63	,	'Ana'	,	'Laura'	,	'Souza'	,	'AnaLaura@hotmail.com'	,	 ' 123519 ' 	,	 ' 80083 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961520 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	64	,	'Ana'	,	'Leticia'	,	'Souza'	,	'AnaLeticia@hotmail.com'	,	 ' 123520 ' 	,	 ' 80084 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961521 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	65	,	'Ana'	,	'Lis'	,	'Souza'	,	'AnaLis@hotmail.com'	,	 ' 123521 ' 	,	 ' 80085 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961522 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	66	,	'Ana'	,	'Livia'	,	'Souza'	,	'AnaLivia@hotmail.com'	,	 ' 123522 ' 	,	 ' 80086 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961523 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	67	,	'Ana'	,	'LÃƒÂºcia'	,	'Souza'	,	'AnaLÃƒÂºcia@hotmail.com'	,	 ' 123523 ' 	,	 ' 80087 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961524 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	68	,	'Ana'	,	'Luisa'	,	'Souza'	,	'AnaLuisa@hotmail.com'	,	 ' 123524 ' 	,	 ' 80088 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961525 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	69	,	'Ana'	,	'Mara'	,	'Souza'	,	'AnaMara@hotmail.com'	,	 ' 123525 ' 	,	 ' 80089 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961526 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	70	,	'Ana'	,	'Maria'	,	'Souza'	,	'AnaMaria@hotmail.com'	,	 ' 123526 ' 	,	 ' 80090 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961527 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	71	,	'Ana'	,	'Paula'	,	'Souza'	,	'AnaPaula@hotmail.com'	,	 ' 123527 ' 	,	 ' 80091 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961528 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	72	,	'Ana'	,	'Patricia'	,	'Souza'	,	'AnaPatricia@hotmail.com'	,	 ' 123528 ' 	,	 ' 80092 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961529 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	73	,	'Ana'	,	'Sofia'	,	'Souza'	,	'AnaSofia@hotmail.com'	,	 ' 123529 ' 	,	 ' 80093 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961530 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	74	,	'Ana'	,	'Vitoria'	,	'Souza'	,	'AnaVitoria@hotmail.com'	,	 ' 123530 ' 	,	 ' 80094 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961531 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	75	,	'Ana'	,	'Prestes'	,	'Souza'	,	'AnaPrestes@hotmail.com'	,	 ' 123531 ' 	,	 ' 80095 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961532 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	76	,	'Joao'	,	'Maria'	,	'Souza'	,	'Ãƒâ€šaria@hotmail.com'	,	 ' 123532 ' 	,	 ' 80096 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961533 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	77	,	'Angelina'	,	'Beatriz'	,	'Souza'	,	'AngelinaBeatriz@hotmail.com'	,	 ' 123533 ' 	,	 ' 80097 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961534 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	78	,	'Angelina'	,	'Luisa'	,	'Souza'	,	'AngelinaLuisa@hotmail.com'	,	 ' 123534 ' 	,	 ' 80098 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961535 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	79	,	'Antonela'	,	'Beatriz'	,	'Souza'	,	'AntonelaBeatriz@hotmail.com'	,	 ' 123535 ' 	,	 ' 80099 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961536 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	80	,	'Antonela'	,	'Maria'	,	'Souza'	,	'AntonelaMaria@hotmail.com'	,	 ' 123536 ' 	,	 ' 80100 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961537 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	81	,	'Ariana'	,	'Lis'	,	'Souza'	,	'ArianaLis@hotmail.com'	,	 ' 123537 ' 	,	 ' 80101 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961538 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	82	,	'Ariana'	,	'Eugenia'	,	'Souza'	,	'ArianaEugenia@hotmail.com'	,	 ' 123538 ' 	,	 ' 80102 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961539 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	83	,	'Aurora'	,	'Luisa'	,	'Souza'	,	'AuroraLuisa@hotmail.com'	,	 ' 123539 ' 	,	 ' 80103 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961540 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	84	,	'Bela'	,	'Sofia'	,	'Souza'	,	'BelaSofia@hotmail.com'	,	 ' 123540 ' 	,	 ' 80104 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961541 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	85	,	'Bela'	,	'Vitoria'	,	'Souza'	,	'BelaVitoria@hotmail.com'	,	 ' 123541 ' 	,	 ' 80105 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961542 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	86	,	'Catarina'	,	'Alice'	,	'Souza'	,	'CatarinaAlice@hotmail.com'	,	 ' 123542 ' 	,	 ' 80106 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961543 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	87	,	'Catarina'	,	'Bela'	,	'Souza'	,	'CatarinaBela@hotmail.com'	,	 ' 123543 ' 	,	 ' 80107 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961544 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	88	,	'Clara'	,	'Lis'	,	'Souza'	,	'ClaraLis@hotmail.com'	,	 ' 123544 ' 	,	 ' 80108 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961545 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	89	,	'Clara'	,	'Helena'	,	'Souza'	,	'ClaraHelena@hotmail.com'	,	 ' 123545 ' 	,	 ' 80109 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961546 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	90	,	'Clara'	,	'Antonia'	,	'Souza'	,	'ClaraAntonia@hotmail.com'	,	 ' 123546 ' 	,	 ' 80110 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961547 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	91	,	'Clara'	,	'Maria'	,	'Souza'	,	'ClaraMaria@hotmail.com'	,	 ' 123547 ' 	,	 ' 80111 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961548 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	92	,	'Clara'	,	'Beatriz'	,	'Souza'	,	'ClaraBeatriz@hotmail.com'	,	 ' 123548 ' 	,	 ' 80112 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961549 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	93	,	'Dora'	,	'Luisa'	,	'Souza'	,	'DoraLuisa@hotmail.com'	,	 ' 123549 ' 	,	 ' 80113 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961550 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	94	,	'Dora'	,	'Beatriz'	,	'Souza'	,	'DoraBeatriz@hotmail.com'	,	 ' 123550 ' 	,	 ' 80114 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961551 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	95	,	'Dora'	,	'Bela'	,	'Souza'	,	'DoraBela@hotmail.com'	,	 ' 123551 ' 	,	 ' 80115 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961552 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	96	,	'Elis'	,	'Regina'	,	'Souza'	,	'ElisRegina@hotmail.com'	,	 ' 123552 ' 	,	 ' 80116 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961553 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	97	,	'Estela'	,	'Luisa'	,	'Souza'	,	'EstelaLuisa@hotmail.com'	,	 ' 123553 ' 	,	 ' 80117 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961554 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	98	,	'Estela'	,	'Sofia'	,	'Souza'	,	'EstelaSofia@hotmail.com'	,	 ' 123554 ' 	,	 ' 80118 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961555 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	99	,	'Flora'	,	'Alice'	,	'Souza'	,	'FloraAlice@hotmail.com'	,	 ' 123555 ' 	,	 ' 80119 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961556 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	100	,	'Flora'	,	'Bela'	,	'Souza'	,	'FloraBela@hotmail.com'	,	 ' 123556 ' 	,	 ' 80120 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961557 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	101	,	'Flora'	,	'Lis'	,	'Souza'	,	'FloraLis@hotmail.com'	,	 ' 123557 ' 	,	 ' 80121 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961558 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	102	,	'Heloisa'	,	'Helena'	,	'Souza'	,	'HeloisaHelena@hotmail.com'	,	 ' 123558 ' 	,	 ' 80122 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961559 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	103	,	'Heloisa'	,	'Antonia'	,	'Souza'	,	'HeloisaAntonia@hotmail.com'	,	 ' 123559 ' 	,	 ' 80123 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961560 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	104	,	'Ingrid'	,	'Maria'	,	'Souza'	,	'IngridMaria@hotmail.com'	,	 ' 123560 ' 	,	 ' 80124 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961561 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	105	,	'Isadora'	,	'Beatriz'	,	'Souza'	,	'IsadoraBeatriz@hotmail.com'	,	 ' 123561 ' 	,	 ' 80125 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961562 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	106	,	'Isadora'	,	'Luisa'	,	'Souza'	,	'IsadoraLuisa@hotmail.com'	,	 ' 123562 ' 	,	 ' 80126 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961563 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	107	,	'Julia'	,	'Beatriz'	,	'Souza'	,	'JuliaBeatriz@hotmail.com'	,	 ' 123563 ' 	,	 ' 80127 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961564 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	108	,	'Julia'	,	'Helena'	,	'Souza'	,	'JuliaHelena@hotmail.com'	,	 ' 123564 ' 	,	 ' 80128 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961565 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	109	,	'Lara'	,	'Eduarda'	,	'Souza'	,	'LaraEduarda@hotmail.com'	,	 ' 123565 ' 	,	 ' 80129 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961566 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	110	,	'Larissa'	,	'Beatriz'	,	'Souza'	,	'LarissaBeatriz@hotmail.com'	,	 ' 123566 ' 	,	 ' 80130 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961567 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	111	,	'Laura'	,	'Patricia'	,      	'Souza'	,	'LauraPatricia@hotmail.com'	,	 ' 123567 ' 	,	 ' 80131 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961568 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	112	,	'Laura'	,	'Regina'	,	'Souza'	,	'LauraRegina@hotmail.com'	,	 ' 123568 ' 	,	 ' 80132 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961569 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	113	,	'Luisa'	,	'Eduarda'	,	'Souza'	,	'LuisaEduarda@hotmail.com'	,	 ' 123569 ' 	,	 ' 80133 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961570 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	114	,	'Luisa'	,	'Eloa'	,	'Souza'	,	'LuisaEloa@hotmail.com'	,	 ' 123570 ' 	,	 ' 80134 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961571 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	115	,	'Leticia'	,	'Lopez'	,	'Souza'	,	'LeticiaLopez@hotmail.com'	,	 ' 123571 ' 	,	 ' 80135 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961572 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	116	,	'Leticia'	,	'Helena'	,	'Souza'	,	'LeticiaHelena@hotmail.com'	,	 ' 123572 ' 	,	 ' 80136 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961573 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	117	,	'Lavinia'	,	'Beatriz'	,	'Souza'	,	'LaviniaBeatriz@hotmail.com'	,	 ' 123573 ' 	,	 ' 80137 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961574 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	118	,	'Livia'	,	'Maria'	,	'Souza'	,	'LiviaMaria@hotmail.com'	,	 ' 123574 ' 	,	 ' 80138 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961575 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	119	,	'Livia'	,	'Sofia'	,	'Souza'	,	'LiviaSofia@hotmail.com'	,	 ' 123575 ' 	,	 ' 80139 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961576 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	120	,	'Maria'	,	'Alice'	,	'Souza'	,	'MariaAlice@hotmail.com'	,	 ' 123576 ' 	,	 ' 80140 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961577 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	121	,	'Maria'	,	'Amelia'	,	'Souza'	,	'MariaAmelia@hotmail.com'	,	 ' 123577 ' 	,	 ' 80141 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961578 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	122	,	'Maria'	,	'Antonia'	,	'Souza'	,	'MariaAntonia@hotmail.com'	,	 ' 123578 ' 	,	 ' 80142 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961579 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	123	,	'Maria'	,	'Augusta'	,	'Souza'	,	'MariaAugusta@hotmail.com'	,	 ' 123579 ' 	,	 ' 80143 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961580 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	124	,	'Maria'	,	'Cecilia'	,	'Souza'	,	'MariaCecilia@hotmail.com'	,	 ' 123580 ' 	,	 ' 80144 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961581 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	125	,	'Maria'	,	'Clara'	,	'Souza'	,	'MariaClara@hotmail.com'	,	 ' 123581 ' 	,	 ' 80145 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961582 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	126	,	'Maria'	,	'Cristina'	,	'Souza'	,	'MariaCristina@hotmail.com'	,	 ' 123582 ' 	,	 ' 80146 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961583 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	127	,	'Maria'	,	'Eduarda'	,	'Souza'	,	'MariaEduarda@hotmail.com'	,	 ' 123583 ' 	,	 ' 80147 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961584 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	128	,	'Maria'	,	'Elisa'	,	'Souza'	,	'MariaElisa@hotmail.com'	,	 ' 123584 ' 	,	 ' 80148 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961585 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	129	,	'Maria'	,	'Elisabete'	,	'Souza'	,	'MariaElisabete@hotmail.com'	,	 ' 123585 ' 	,	 ' 80149 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961586 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	130	,	'Maria'	,	'Eloa'	,	'Souza'	,	'MariaEloa@hotmail.com'	,	 ' 123586 ' 	,	 ' 80150 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961587 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	131	,	'Maria'	,	'Emilia'	,	'Souza'	,	'MariaEmilia@hotmail.com'	,	 ' 123587 ' 	,	 ' 80151 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961588 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	132	,	'Maria'	,	'Eugenia'	,	'Souza'	,	'MariaEugenia@hotmail.com'	,	 ' 123588 ' 	,	 ' 80152 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961589 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	133	,	'Maria'	,	'Fernanda'	,	'Souza'	,	'MariaFernanda@hotmail.com'	,	 ' 123589 ' 	,	 ' 80153 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961590 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	134	,	'Maria'	,	'Francisca'	,	'Souza'	,	'MariaFrancisca@hotmail.com'	,	 ' 123590 ' 	,	 ' 80154 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961591 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	135	,	'Maria'	,	'Gabriela'	,	'Souza'	,	'MariaGabriela@hotmail.com'	,	 ' 123591 ' 	,	 ' 80155 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961592 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	136	,	'Maria'	,	'Helena'	,	'Souza'	,	'MariaHelena@hotmail.com'	,	 ' 123592 ' 	,	 ' 80156 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961593 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	137	,	'Maria'	,	'InÃƒÂªs'	,	'Souza'	,	  'MariaInÃƒÂªs@hotmail.com'	,	 ' 123593 ' 	,	 ' 80157 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961594 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	138	,	'Maria'	,	'Isabel'	,	'Souza'	,	'MariaIsabel@hotmail.com'	,	 ' 123594 ' 	,	 ' 80158 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961595 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	139	,	'Maria'	,	'Joana'	,	'Souza'	,	'MariaJoana@hotmail.com'	,	 ' 123595 ' 	,	 ' 80159 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961596 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	140	,	'Maria'	,	'Joaquina'	,	'Souza'	,	'MariaJoaquina@hotmail.com'	,	 ' 123596 ' 	,	 ' 80160 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961597 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	141	,	'Maria'	,	'Julia'	,	'Souza'	,	'MariaJulia@hotmail.com'	,	 ' 123597 ' 	,	 ' 80161 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961598 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	142	,	'Maria'	,	'Laura'	,	'Souza'	,	'MariaLaura@hotmail.com'	,	 ' 123598 ' 	,	 ' 80162 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961599 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	143	,	'Maria'	,	'LÃƒÂºcia'	,	'Souza'	,	'MariaLÃƒÂºcia@hotmail.com'	,	 ' 123599 ' 	,	 ' 80163 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961600 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	144	,	'Maria'	,	'LuÃƒÂ­sa'	,	'Souza'	,	'MariaLuÃƒÂ­sa@hotmail.com'	,	 ' 123600 ' 	,	 ' 80164 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961601 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	145	,	'Maria'	,	'OlÃƒÂ­via'	,	'Souza'	,	'MariaOlÃƒÂ­via@hotmail.com'	,	 ' 123601 ' 	,	 ' 80165 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961602 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	146	,	'Maria'	,	'Paula'	,	'Souza'	,	'MariaPaula@hotmail.com'	,	 ' 123602 ' 	,	 ' 80166 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961603 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	147	,	'Maria'	,	'Raquel'	,	'Souza'	,	'MariaRaquel@hotmail.com'	,	 ' 123603 ' 	,	 ' 80167 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961604 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	148	,	'Maria'	,	'Regina'	,	'Souza'	,	'MariaRegina@hotmail.com'	,	 ' 123604 ' 	,	 ' 80168 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961605 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	149	,	'Maria'	,	'Rita'	,	'Souza'	,	'MariaRita@hotmail.com'	,	 ' 123605 ' 	,	 ' 80169 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961606 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	150	,	'Maria'	,	'Roberta'	,	'Souza'	,	'MariaRoberta@hotmail.com'	,	 ' 123606 ' 	,	 ' 80170 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961607 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	151	,	'Maria'	,	'Tarsila'	,	'Souza'	,	'MariaTarsila@hotmail.com'	,	 ' 123607 ' 	,	 ' 80171 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961608 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	152	,	'Maria'	,	'Teresa'	,	'Souza'	,	'MariaTeresa@hotmail.com'	,	 ' 123608 ' 	,	 ' 80172 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961609 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	153	,	'Maria'	,	'Valentina'	,	'Souza'	,	'MariaValentina@hotmail.com'	,	 ' 123609 ' 	,	 ' 80173 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961610 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	154	,	'Maria'	,	'VitÃƒÂ³ria'	,	'Souza'	,	'MariaVitÃƒÂ³ria@hotmail.com'	,	 ' 123610 ' 	,	 ' 80174 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961611 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	155	,	'Maria'	,	'Gabriela'	,	'Souza'	,	'MariaGabriela@hotmail.com'	,	 ' 123611 ' 	,	 ' 80175 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961612 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	156	,	'Marilia'	,	'Sofia'	,	'Souza'	,	'MariliaSofia@hotmail.com'	,	 ' 123612 ' 	,	 ' 80176 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961613 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	157	,	'Mirela'	,	'Beatriz'	,	'Souza'	,	'MirelaBeatriz@hotmail.com'	,	 ' 123613 ' 	,	 ' 80177 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961614 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	158	,	'Nicole'	,	'Sofia'	,	'Souza'	,	'NicoleSofia@hotmail.com'	,	 ' 123614 ' 	,	 ' 80178 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961615 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	159	,	'Nicole'	,	'Augusta'	,	'Souza'	,	'NicoleAugusta@hotmail.com'	,	 ' 123615 ' 	,	 ' 80179 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961616 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	160	,	'Nina'	,	'Maria'	,	'Souza'	,	'NinaMaria@hotmail.com'	,	 ' 123616 ' 	,	 ' 80180 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961617 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	161	,	'Nina'	,	'Paraiba'	,	'Souza'	,	'NinaParaiba@hotmail.com'	,	 ' 123617 ' 	,	 ' 80181 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961618 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	162	,	'Gustavo'	,	'Emanuel'	,	'Souza'	,	'GustavoEmanuel@hotmail.com'	,	 ' 123618 ' 	,	 ' 80182 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961619 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	163	,	'Gustavo'	,	'Henrique'	,	'Souza'	,	'GustavoHenrique@hotmail.com'	,	 ' 123619 ' 	,	 ' 80183 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961620 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	164	,	'Heitor'	,	'Augusto'	,	'Souza'	,	'HeitorAugusto@hotmail.com'	,	 ' 123620 ' 	,	 ' 80184 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961621 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	165	,	'Heitor'	,	'Gabriel'	,	'Souza'	,	'HeitorGabriel@hotmail.com'	,	 ' 123621 ' 	,	 ' 80185 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961622 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	166	,	'Henry'	,	'Gael'	,	'Souza'	,	'HenryGael@hotmail.com'	,	 ' 123622 ' 	,	 ' 80186 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961623 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	167	,	'Henry'	,	'Gabriel'	,	'Souza'	,	'HenryGabriel@hotmail.com'	,	 ' 123623 ' 	,	 ' 80187 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961624 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	168	,	'Jean'	,	'Carlo'	,	'Souza'	,	'JeanCarlo@hotmail.com'	,	 ' 123624 ' 	,	 ' 80188 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961625 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	169	,	'Joao'	,	'Alencar'	,	'Souza'	,	'JoÃƒÂ£oAlencar@hotmail.com'	,	 ' 123625 ' 	,	 ' 80189 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961626 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	170	,	'JJoao'	,	'Augusto'	,	'Souza'	,	'JoÃƒÂ£oAugusto@hotmail.com'	,	 ' 123626 ' 	,	 ' 80190 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961627 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	171	,	'JJoao'	,	'Carlos'	,	'Souza'	,	'JoÃƒÂ£oCarlos@hotmail.com'	,	 ' 123627 ' 	,	 ' 80191 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961628 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	172	,	'Joao'	,	'Felipe'	,	'Souza'	,	'JoÃƒÂ£oFelipe@hotmail.com'	,	 ' 123628 ' 	,	 ' 80192 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961629 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	173	,	'Joaoo'	,	'Gabriel'	,	'Souza'	,	'JoÃƒÂ£oGabriel@hotmail.com'	,	 ' 123629 ' 	,	 ' 80193 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961630 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	174	,	'Joaoo'	,	'Guilherme'	,	'Souza'	,	'JoÃƒÂ£oGuilherme@hotmail.com'	,	 ' 123630 ' 	,	 ' 80194 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961631 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	175	,	'JJoaoo'	,	'Henrique'	,	'Souza'	,	'JoÃƒÂ£oHenrique@hotmail.com'	,	 ' 123631 ' 	,	 ' 80195 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961632 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	176	,	'Joao'	,	'Lucas'	,	'Souza'	,	'JoÃƒÂ£oLucas@hotmail.com'	,	 ' 123632 ' 	,	 ' 80196 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961633 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	177	,	'Joao'	,	'Miguel'	,	'Souza'	,	'JoÃƒÂ£oMiguel@hotmail.com'	,	 ' 123633 ' 	,	 ' 80197 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961634 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	178	,	'Joaoo'	,	'Paulo'	,	'Souza'	,	'JoÃƒÂ£oPaulo@hotmail.com'	,	 ' 123634 ' 	,	 ' 80198 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961635 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	179	,	'Joaoo'	,	'Pedro'	,	'Souza'	,	'JoÃƒÂ£oPedro@hotmail.com'	,	 ' 123635 ' 	,	 ' 80199 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961636 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	180	,	'Joao'	,	'Rafael'	,	'Souza'	,	'JoÃƒÂ£oRafael@hotmail.com'	,	 ' 123636 ' 	,	 ' 80200 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961637 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	181	,	'Joaoo'	,	'Vicente'	,	'Souza'	,	'JoÃƒÂ£oVicente@hotmail.com'	,	 ' 123637 ' 	,	 ' 80201 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961638 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	182	,	'Joaoo'	,	'Vitor'	,	'Souza'	,	'JoÃƒÂ£oVitor@hotmail.com'	,	 ' 123638 ' 	,	 ' 80202 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961639 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	183	,	'Joao'	,	'Augusto'	,	'Souza'	,	'JoÃƒÂ£oAugusto@hotmail.com'	,	 ' 123639 ' 	,	 ' 80203 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961640 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	184	,	'Joao'	,	'Luis'	,	'Souza'	,	'JoÃƒÂ£oLuis@hotmail.com'	,	 ' 123640 ' 	,	 ' 80204 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961641 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	185	,	'Joao'	,	'Felipe'	,	'Souza'	,	'JoÃƒÂ£oFelipe@hotmail.com'	,	 ' 123641 ' 	,	 ' 80205 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961642 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	186	,	'Joao'	,	'Henrique'	,	'Souza'	,	'JoÃƒÂ£oHenrique@hotmail.com'	,	 ' 123642 ' 	,	 ' 80206 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961643 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	187	,	'Joao'	,	'Augusto'	,	'Souza'	,	'JoÃƒÂ£oAugusto@hotmail.com'	,	 ' 123643 ' 	,	 ' 80207 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961644 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	188	,	'Joaoo'	,	'Carlos'	,	'Souza'	,	'JoÃƒÂ£oCarlos@hotmail.com'	,	 ' 123644 ' 	,	 ' 80208 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961645 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	189	,	'Joaoo'	,	'Fernando'	,	'Souza'	,	'JoÃƒÂ£oFernando@hotmail.com'	,	 ' 123645 ' 	,	 ' 80209 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961646 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	190	,	'JJoaoo'	,	'Luis'	,	'Souza'	,	'JoÃƒÂ£oLuis@hotmail.com'	,	 ' 123646 ' 	,	 ' 80210 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961647 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	191	,	'Jorge'	,	'Felipe'	,	'Souza'	,	'JorgeFelipe@hotmail.com'	,	 ' 123647 ' 	,	 ' 80211 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961648 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	192	,	'Jorge'	,	'Henrique'	,	'Souza'	,	'JorgeHenrique@hotmail.com'	,	 ' 123648 ' 	,	 ' 80212 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961649 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	193	,	'Jorge'	,	'Augusto'	,	'Souza'	,	'JorgeAugusto@hotmail.com'	,	 ' 123649 ' 	,	 ' 80213 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961650 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	194	,	'Jorge'	,	'Da paz'	,	'Souza'	,	'JorgeDa paz@hotmail.com'	,	 ' 123650 ' 	,	 ' 80214 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961651 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	195	,	'Joao'	,	'Augusto'	,	'Souza'	,	'JosÃƒÂ©Augusto@hotmail.com'	,	 ' 123651 ' 	,	 ' 80215 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961652 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	196	,	'JJoao'	,	'Carlos'	,	'Souza'	,	'JosÃƒÂ©Carlos@hotmail.com'	,	 ' 123652 ' 	,	 ' 80216 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961653 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	197	,	'Joao�'	,	'Fernando'	,	'Souza'	,	'JosÃƒÂ©Fernando@hotmail.com'	,	 ' 123653 ' 	,	 ' 80217 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961654 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	198	,	'JJoao'	,	'Luis'	,	'Souza'	,	'JosÃƒÂ©Luis@hotmail.com'	,	 ' 123654 ' 	,	 ' 80218 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961655 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	199	,	'Joao'	,	'Vitor'	,	'Souza'	,	'JosÃƒÂ©Vitor@hotmail.com'	,	 ' 123655 ' 	,	 ' 80219 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961656 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	200	,	'Julio'	,	'CÃƒÂ©sar'	,	'Souza'	,	'JulioCÃƒÂ©sar@hotmail.com'	,	 ' 123656 ' 	,	 ' 80220 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961657 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	201	,	'Lorenzo'	,	'Gustavo'	,	'Souza'	,	'LorenzoGustavo@hotmail.com'	,	 ' 123657 ' 	,	 ' 80221 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961658 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	202	,	'Lorenzo'	,	'Felipe'	,	'Souza'	,	'LorenzoFelipe@hotmail.com'	,	 ' 123658 ' 	,	 ' 80222 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961659 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	203	,	'Lucas'	,	'Gabriel'	,	'Souza'	,	'LucasGabriel@hotmail.com'	,	 ' 123659 ' 	,	 ' 80223 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961660 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	204	,	'Luis'	,	'AntÃƒÂ´nio'	,	'Souza'	,	'LuisAntÃƒÂ´nio@hotmail.com'	,	 ' 123660 ' 	,	 ' 80224 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961661 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	205	,	'Luis'	,	'Eduardo'	,	'Souza'	,	'LuisEduardo@hotmail.com'	,	 ' 123661 ' 	,	 ' 80225 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961662 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	206	,	'Luis'	,	'Emanuel'	,	'Souza'	,	'LuisEmanuel@hotmail.com'	,	 ' 123662 ' 	,	 ' 80226 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961663 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	207	,	'Luis'	,	'Felipe'	,	'Souza'	,	'LuisFelipe@hotmail.com',	 ' 123663 ' 	,	 ' 80227 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961664 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	208	,	'Luis'	,	'Henrique'	,	'Souza'	,	'LuisHenrique@hotmail.com'	,	 ' 123664 ' 	,	 ' 80228 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961665 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	209	,	'Luis'	,	'Guilherme'	,	'Souza'	,	'LuisGuilherme@hotmail.com'	,	 ' 123665 ' 	,	 ' 80229 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961666 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	210	,	'Luis'	,	'Gustavo'	,	'Souza'	,	'LuisGustavo@hotmail.com'	,	 ' 123666 ' 	,	 ' 80230 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961667 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	211	,	'Luis'	,	'Marcelo'	,	'Souza'	,	'LuisMarcelo@hotmail.com'	,	 ' 123667 ' 	,	 ' 80231 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961668 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	212	,	'Luis'	,	'Miguel'	,	'Souza'	,	'LuisMiguel@hotmail.com'	,	 ' 123668 ' 	,	 ' 80232 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961669 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	213	,	'Luis'	,	'OtÃƒÂ¡vio'	,	'Souza'	,	'LuisOtÃƒÂ¡vio@hotmail.com'	,	 ' 123669 ' 	,	 ' 80233 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961670 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	214	,	'Luis'	,	'Vinicius'	,	'Souza'	,	'LuisVinicius@hotmail.com'	,	 ' 123670 ' 	,	 ' 80234 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961671 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	215	,	'Marco'	,	'AntÃƒÂ´nio'	,	'Souza'	,	'MarcoAntÃƒÂ´nio@hotmail.com'	,	 ' 123671 ' 	,	 ' 80235 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961672 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	216	,	'Marco'	,	'AurÃƒÂ©lio'	,	'Souza'	,	'MarcoAurÃƒÂ©lio@hotmail.com'	,	 ' 123672 ' 	,	 ' 80236 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961673 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	217	,	'Marcos'	,	'Vinicius'	,	'Souza'	,	'MarcosVinicius@hotmail.com'	,	 ' 123673 ' 	,	 ' 80237 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961674 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	218	,	'Mario'	,	'Augusto'	,	'Souza'	,	'MarioAugusto@hotmail.com'	,	 ' 123674 ' 	,	 ' 80238 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961675 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	219	,	'Mateus',	'Henrique'	,	'Souza'	,	'MateusHenrique@hotmail.com'	,	 ' 123675 ' 	,	 ' 80239 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961676 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	220	,	'Murilo'	,	'Benecio'	,	'Souza'	,	'MuriloBenecio@hotmail.com'	,	 ' 123676 ' 	,	 ' 80240 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961677 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	221	,	'Murilo'	,	'Vinicius'	,	'Souza'	,	'MuriloVinicius@hotmail.com'	,	 ' 123677 ' 	,	 ' 80241 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961678 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	222	,	'Otavio'	,	'Augusto'	,	'Souza'	,	'OtavioAugusto@hotmail.com'	,	 ' 123678 ' 	,	 ' 80242 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961679 ' 	)	;		
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	223	,	'Otavio'	,	'Luis'	,	'Souza'	,	'OtavioLuis@hotmail.com'	,	 ' 123679 ' 	,	 ' 80243 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961680 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	224	,	'Paulo'	,	'Afonso'	,	'Souza'	,	'PauloAfonso@hotmail.com'	,	 ' 123680 ' 	,	 ' 80244 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961681 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	225	,	'Paulo'	,	'CÃƒÂ©sar'	,	'Souza'	,	'PauloCÃƒÂ©sar@hotmail.com'	,	 ' 123681 ' 	,	 ' 80245 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961682 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	226	,	'Paulo'	,	'Eduardo'	,	'Souza'	,	'PauloEduardo@hotmail.com'	,	 ' 123682 ' 	,	 ' 80246 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961683 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	227	,	'Paulo'	,	'Henrique'	,	'Souza'	,	'PauloHenrique@hotmail.com'	,	 ' 123683 ' 	,	 ' 80247 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961684 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	228	,	'Paulo'	,	'Ricardo'	,	'Souza'	,	'PauloRicardo@hotmail.com'	,	 ' 123684 ' 	,	 ' 80248 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961685 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	229	,	'Paulo'	,	'Roberto'	,	'Souza'	,	'PauloRoberto@hotmail.com'	,	 ' 123685 ' 	,	 ' 80249 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961686 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	230	,	'Paulo'	,	'Sergio'	,	'Souza'	,	'PauloSergio@hotmail.com'	,	 ' 123686 ' 	,	 ' 80250 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961687 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	231	,	'Patric' ,	'Gael'	,	'Souza'	,	'PatricGael@hotmail.com'	,	 ' 123687 ' 	,	 ' 80251 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961688 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	232	,	'Pedro'	,	'Afonso'	,	'Souza'	,	'PedroAfonso@hotmail.com'	,	 ' 123688 ' 	,	 ' 80252 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961689 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	233	,	'Pedro'	,	'Emanuel'	,	'Souza'	,	'PedroEmanuel@hotmail.com'	,	 ' 123689 ' 	,	 ' 80253 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961690 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	234	,	'Pedro'	,	'Henrique'	,	'Souza'	,	'PedroHenrique@hotmail.com'	,	 ' 123690 ' 	,	 ' 80254 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961691 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	235	,	'Pedro'	,	'Gabriel'	,	'Souza'	,	'PedroGabriel@hotmail.com'	,	 ' 123691 ' 	,	 ' 80255 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961692 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	236	,	'Pedro'	,	'Lucas'	,	'Souza'	,	'PedroLucas@hotmail.com'	,	 ' 123692 ' 	,	 ' 80256 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961693 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	237	,	'Pedro'	,	'Miguel'	,	'Souza'	,	'PedroMiguel@hotmail.com'	,	 ' 123693 ' 	,	 ' 80257 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961694 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	238	,	'Pedro'	,	'Boy'	,	'Souza'	,	'PedroBoy@hotmail.com'	,	 ' 123694 ' 	,	 ' 80258 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961695 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	239	,	'Tarcisio'	,	'Eduardo'	,	'Souza'	,	'TarcisioEduardo@hotmail.com'	,	 ' 123695 ' 	,	 ' 80259 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961696 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	240	,	'Vitor'	,	'Hugo'	,	'Souza'	,	'VitorHugo@hotmail.com'	,	 ' 123696 ' 	,	 ' 80260 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961697 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	241	,	'Vitor'	,	'Gabriel'	,	'Souza'	,	'VitorGabriel@hotmail.com'	,	 ' 123697 ' 	,	 ' 80261 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961698 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	242	,	'Tales'	,	'Gael'	,	'Souza'	,	'TalesGael@hotmail.com'	,	 ' 123698 ' 	,	 ' 80262 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961699 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	243	,	'Tales'	,	'Gabriel'	,	'Souza'	,	'TalesGabriel@hotmail.com'	,	 ' 123699 ' 	,	 ' 80263 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961700 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	244	,	'Tales'	,	'Dominic'	,	'Souza'	,	'TalesDominic@hotmail.com'	,	 ' 123700 ' 	,	 ' 80264 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961701 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	245	,	'TÃƒÂ©o'	,	'Henrique'	,	'Souza'	,	'TÃƒÂ©oHenrique@hotmail.com'	,	 ' 123701 ' 	,	 ' 80265 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961702 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	246	,	'Joao'	,	'Miguel'	,	'Souza'	,	'JoÃƒÂ£oMiguel@hotmail.com'	,	 ' 123702 ' 	,	 ' 80266 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961703 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	247	,	'Enzo'	,	'Gabriel'	,	'Souza'	,	'EnzoGabriel@hotmail.com'	,	 ' 123703 ' 	,	 ' 80267 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961704 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	248	,	'Maria'	,	'Cecilia'	,	'Souza'	,	'MariaCecilia@hotmail.com'	,	 ' 123704 ' 	,	 ' 80268 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961705 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	249	,	'Maria'	,	'Julia'	,	'Souza'	,	'MariaJulia@hotmail.com'	,	 ' 123705 ' 	,	 ' 80269 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961706 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	250	,	'Maria'	,	'Valentina'	,	'Souza'	,	'MariaValentina@hotmail.com'	,	 ' 123706 ' 	,	 ' 80270 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961707 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	251	,	'Maria'	,	'Clara'	,	'Souza'	,	'MariaClara@hotmail.com'	,	 ' 123707 ' 	,	 ' 80271 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961708 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	252	,	'Maria'	,	'Eduarda'	,	'Souza'	,	'MariaEduarda@hotmail.com'	,	 ' 123708 ' 	,	 ' 80272 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961709 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	253	,	'Maria'	,	'Alice'	,	'Souza'	,	'MariaAlice@hotmail.com'	,	 ' 123709 ' 	,	 ' 80273 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961710 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	254	,	'Ana'	,	'Julia'	,	'Souza'	,	'AnaJulia@hotmail.com'	,	 ' 123710 ' 	,	 ' 80274 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961711 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	255	,	'Joaoo'	,	'Lucas'	,	'Souza'	,	'JoÃƒÂ£oLucas@hotmail.com'	,	 ' 123711 ' 	,	 ' 80275 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961712 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	256	,	'JJoaoo'	,	'Guilherme'	,	'Souza'	,	'JoÃƒÂ£oGuilherme@hotmail.com'	,	 ' 123712 ' 	,	 ' 80276 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961713 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	257	,	'Joao'	,	'Pedro'	,	'Souza'	,	'JoÃƒÂ£oPedro@hotmail.com'	,	 ' 123713 ' 	,	 ' 80277 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961714 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	258	,	'Maria'	,	'Isis'	,	'Souza'	,	'MariaIsis@hotmail.com'	,	 ' 123714 ' 	,	 ' 80278 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961715 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	259	,	'Ana'	,	'Laura'	,	'Souza'	,	'AnaLaura@hotmail.com'	,	 ' 123715 ' 	,	 ' 80279 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961716 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	260	,	'Maria'	,	'Luiza'	,	'Souza'	,	'MariaLuiza@hotmail.com'	,	 ' 123716 ' 	,	 ' 80280 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961717 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	261	,	'Pedro'	,	'Lucas'	,	'Souza'	,	'PedroLucas@hotmail.com',	 ' 123717 ' 	,	 ' 80281 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961718 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	262	,	'Maria'	,	'Eloa'	,	'Souza'	,	'MariaEloa@hotmail.com',	 ' 123718 ' 	,	 ' 80282 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961719 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	263	,	'Joao'	,	'Gabriel'	,	'Souza'	,	'joÃƒÂ£oGabriel@hotmail.com'	,	 ' 123719 ' 	,	 ' 80283 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961720 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	264	,	'Maria'	,	'VitÃƒÂ³ria'	,	'Souza'	,	'MariaVitÃƒÂ³ria@hotmail.com'	,	 ' 123720 ' 	,	 ' 80284 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961721 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	265	,	'Maria'	,	'Heloisa'	,	'Souza'	,	'MariaHeloisa@hotmail.com'	,	 ' 123721 ' 	,	 ' 80285 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961722 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	266	,	'Ana'	,	'Cecilia'	,	'Souza'	,	'AnaCecilia@hotmail.com'	,	 ' 123722 ' 	,	 ' 80286 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961723 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	267	,	'Davi'	,	'Lucas'	,	'Souza'	,	'DaviLucas@hotmail.com'	,	 ' 123723 ' 	,	 ' 80287 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961724 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	268	,	'Maria'	,	'Helena'	,	'Souza'	,	'MariaHelena@hotmail.com'	,	 ' 123724 ' 	,	 ' 80288 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961725 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	269	,	'Ana'	,	'Liz'	,	'Souza'	,	'AnaLiz@hotmail.com'	,	 ' 123725 ' 	,	 ' 80289 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961726 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	270	,	'Ana'	,	'Luiza'	,	'Souza'	,	'AnaLuiza@hotmail.com'	,	 ' 123726 ' 	,	 ' 80290 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961727 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	271	,	'Ana'	 ,	'Sophia'	,	'Souza'	,	'AnaSophia@hotmail.com'	,	 ' 123727 ' 	,	 ' 80291 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961728 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	272	,	'Ana'	 ,	'VitÃƒÂ³ria'	,	'Souza'	,	'AnaVitÃƒÂ³ria@hotmail.com'	,	 ' 123728 ' 	,	 ' 80292 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961729 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	273	,	'Maria'	 ,	'Laura'	,	'Souza'	, 	'MariaLaura@hotmail.com'	,	 ' 123729 ' 	,	 ' 80293 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961730 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	274	,	'Ana'	 ,	'Clara'	,	'Souza'	,	'AnaClara@hotmail.com'	,	 ' 123730 ' 	,	 ' 80294 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961731 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	275	,	'Ana'	 ,	'Livia'	,	'Souza'	,	'AnaLivia@hotmail.com'	,	 ' 123731 ' 	,	 ' 80295 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961732 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	276	,	'Pedro'	 ,	'Thomaz'	,	'Souza'	,	'PedroThomaz@hotmail.com'	,	 ' 123732 ' 	,	 ' 80296 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961733 ' 	)	;			
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	277	,	'Ana'	 ,	'Beatriz'	,	'Souza'	,	'AnaBeatriz@hotmail.com'	,	 ' 123733 ' 	,	 ' 80297 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961734 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	278	,	'Joao'	 ,	'Miguel'	,	'Souza'	,	'JosÃƒÂ©Miguel@hotmail.com'	,	 ' 123734 ' 	,	 ' 80298 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961735 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	279	,	'Maria'	 ,	'Isadora'	,	'Souza'	,	'MariaIsadora@hotmail.com'	,	 ' 123735 ' 	,	 ' 80299 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961736 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	280	,	'Joao'   ,	'Arthur'	,	'Souza'	,	'JoÃƒÂ£oArthur@hotmail.com'	,	 ' 123736 ' 	,	 ' 80300 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961737 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	281	,	'Maria'	 ,	'Liz'	,	'Souza'	,	'MariaLiz@hotmail.com'	,	 ' 123737 ' 	,	 ' 80301 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961738 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	282	,	'Arthur' ,'maia',	 		'Souza'	,	'Arthur@hotmail.com'	,	 ' 123738 ' 	,	 ' 80302 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961739 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	283	,	'Maria'	 ,	'Shopia'	,	'Souza'	,	'MariaShopia@hotmail.com'	,	 ' 123739 ' 	,	 ' 80303 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961740 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	284	,	'Maria'	 ,	'Esther'	,	'Souza'	,	'MariaEsther@hotmail.com'	,	 ' 123740 ' 	,	 ' 80304 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961741 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	285	,	'Luiz'	 ,	'Miguel'	,	'Souza'	,	'LuizMiguel@hotmail.com'	,	 ' 123741 ' 	,	 ' 80305 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961742 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	286	,	'Ana'	 ,	'Sofia'	,	'Souza'	,	'AnaSofia@hotmail.com'	,	 ' 123742 ' 	,	 ' 80306 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961743 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	287	,	'Miguel'  , 'Gilbert',	'Souza'	,	'Miguel@hotmail.com'	,	 ' 123743 ' 	,	 ' 80307 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961744 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	288	,	'Maria'	,	'Luisa'	,	'Souza'	,	'MariaLuisa@hotmail.com'	,	 ' 123744 ' 	,	 ' 80308 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961745 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	289	,	'Joao'	,	'Arthur'	,	'Souza'	,	'JosÃƒÂ©Arthur@hotmail.com'	,	 ' 123745 ' 	,	 ' 80309 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961746 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	290	,	'Maria'	,	'Eloah'	,	'Souza'	,	'MariaEloah@hotmail.com'	,	 ' 123746 ' 	,	 ' 80310 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961747 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	291	,	'Maria'	,'Maris'	,	'Souza'	,	'Maria@hotmail.com'	,	 ' 123747 ' 	,	 ' 80311 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961748 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	292	,	'Davi'	,	'Luca'	,	'Souza'	,	'DaviLuca@hotmail.com'	,	 ' 123748 ' 	,	 ' 80312 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961749 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	293	,	'Pedro'	,	'Arthur'	,	'Souza'	,	'PedroArthur@hotmail.com'	,	 ' 123749 ' 	,	 ' 80313 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961750 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	294	,	'Heitor'	,	'Thomaz'	,	'Souza'	,	'HeitorThomaz@hotmail.com'	,	 ' 123750 ' 	,	 ' 80314 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961751 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	295	,	'Lucas'	,	'Gabriel'	,	'Souza'	,	'LucasGabriel@hotmail.com'	,	 ' 123751 ' 	,	 ' 80315 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961752 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	296	,	'Wesley'	,	'Bonaccorsi'	,	'Souza'	,	'WesleyBonaccorsi@hotmail.com'	,	 ' 123752 ' 	,	 ' 80316 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961753 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	297	,	'Wakin'	,	'Sabba'	,	'Souza'	,	'WakinSabba@hotmail.com'	,	 ' 123753 ' 	,	 ' 80317 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961754 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	298	,	'Thiago'	,	'Prado'	,	'Souza'	,	'ThiagoPrado@hotmail.com'	,	 ' 123754 ' 	,	 ' 80318 ' 	,	'Rio de Janeiro'	,	'Praia ipanema'	,	 ' 47961755 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	299	,	'Valditi'	,	'Lost'	,	'Souza'	,	'ValditiLost@hotmail.com'	,	 ' 123755 ' 	,	 ' 80319 ' 	,	'SÃƒÂ£o Paulo'	,	'Conj Res Cocuera'	,	 ' 47961756 ' 	)	;				
INSERT INTO CLIENTES (cli_id, cli_nome, cli_nome_meio,  cli_ultimo_nome, cli_email, cli_cpf, cli_cep, cli_municipio, cli_bairro, cli_contato)VALUES 	(	300	,	'Rosimeiri'	,	'Machaca'	,	'Souza'	,	'RosimeiriMachaca@hotmail.com'	,	 ' 123756 ' 	,	 ' 80320 ' 	,	'SÃƒÂ£o Paulo'	,	'Praia ipanema'	,	 ' 47961757 ' 	)	;				
									
																										

/*************************** 
  TODO - Insert tabela produtos
****************************/
INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (1,'colecoes de cartas ygo master duel', 'Este produto possuir x pacotes de coleção Master Duel',250,'08/03/2020');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (2,'colecoes de cartas speed duel', 'Este produto possuir x pacotes de coleção speed duel',300,'08/03/2020');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (4,'colecoes de cartas ygo master duel', 'Este produto possuir x pacotes de coleção Master Duel',300,'11/03/2020');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (3,'colecoes de cartas rush duel', 'Este produto possuir x pacotes de colecao rush duel',250,'11/10/2015');


INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (5,'colecoes de cartas rush duel', 'Este produto possuir x pacotes de colecao rush duel',250,'11/10/2015');


INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (6,'colecoes de cartas ygo master duel', 'Este produto possuir x pacotes de Master duel',250,'11/10/2015');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (7,'colecoes de cartas ygo master duel', 'Este produto possuir x de coleção Master Duel',300,'08/03/2020');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (8,'colecoes de cartas speed duel', 'Este produto possuir x pacotes de coleção speed duel',250,'07/05/2020');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (9,'colecoes de cartas ygo master duel', 'Este produto possuir x de coleção Master Duel',150,'15/03/2017');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (10,'colecoes de cartas rush duel', 'Este produto possuir x pacotes de coleção rush duel',150,'05/11/2015');

INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (11,'colecoes de cartas ygo master duel', 'Este produto possuir x pacotes de coleção Master duel',200,'11/10/2015');


INSERT INTO PRODUTOS(pdt_id, pdt_nome, pdt_descricao, pdt_preco, pdt_data_aquisicao)
VALUES (12,'colecoes de cartas ygo speed duel', 'Este produto possuir x pacotes de coleção speed duel',250,'05/08/2014');


INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (13, 'produto FDB100', 'descricao E', 49.99, '21/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (14, 'produto FFB211', 'descricao F', 154.99, '15/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (15, 'produto BAC828', 'descricao G', 184.99, '2/9/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (16, 'produto BFF697', 'descricao C', 199.99, '12/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (17, 'produto GAA732', 'descricao D', 94.99, '27/4/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (18, 'produto BAC956', 'descricao D', 250, '13/4/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (19, 'produto BEC312', 'descricao B', 94.99, '14/4/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (20, 'produto GHB954', 'descricao D', 250, '11/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (21, 'produto GEC333', 'descricao B', 124.99, '1/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (22, 'produto HBE391', 'descricao F', 49.99, '6/8/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (23, 'produto AFH957', 'descricao D', 139.99, '17/10/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (24, 'produto AAC754', 'descricao E', 49.99, '24/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (25, 'produto DEF982', 'descricao E', 94.99, '23/2/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (26, 'produto CAC197', 'descricao C', 79.99, '3/9/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (27, 'produto CGD889', 'descricao G', 79.99, '9/11/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (28, 'produto CDB453', 'descricao H', 199.99, '18/1/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (29, 'produto CDG991', 'descricao E', 199.99, '5/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (30, 'produto GHD670', 'descricao E', 169.99, '26/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (31, 'produto GHB549', 'descricao F', 250, '25/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (32, 'produto HDF689', 'descricao B', 94.99, '10/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (33, 'produto GBA778', 'descricao A', 184.99, '6/7/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (34, 'produto CGE293', 'descricao D', 154.99, '29/8/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (35, 'produto BAC950', 'descricao E', 64.99, '26/5/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (36, 'produto HBD338', 'descricao E', 94.99, '7/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (37, 'produto FCE262', 'descricao F', 184.99, '12/6/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (38, 'produto FGB314', 'descricao B', 199.99, '1/2/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (39, 'produto DDG537', 'descricao C', 154.99, '7/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (40, 'produto HGC886', 'descricao H', 79.99, '11/9/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (41, 'produto HBA217', 'descricao G', 79.99, '25/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (42, 'produto DEH923', 'descricao A', 124.99, '11/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (43, 'produto EDC500', 'descricao A', 184.99, '18/6/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (44, 'produto HAH47', 'descricao G', 250, '3/10/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (45, 'produto CFB962', 'descricao C', 154.99, '9/9/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (46, 'produto AAC20', 'descricao H', 64.99, '23/6/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (47, 'produto DEH15', 'descricao A', 124.99, '10/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (48, 'produto AHA583', 'descricao A', 139.99, '22/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (49, 'produto BBC325', 'descricao A', 139.99, '28/11/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (50, 'produto EFG791', 'descricao D', 124.99, '20/1/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (51, 'produto BGB940', 'descricao B', 94.99, '29/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (52, 'produto BFC111', 'descricao E', 64.99, '18/4/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (53, 'produto HGA747', 'descricao D', 199.99, '27/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (54, 'produto FCE798', 'descricao G', 94.99, '16/11/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (55, 'produto DFH82', 'descricao H', 250, '13/5/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (56, 'produto ACE564', 'descricao C', 124.99, '11/8/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (57, 'produto AFC769', 'descricao E', 64.99, '13/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (58, 'produto BGG435', 'descricao H', 79.99, '24/10/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (59, 'produto CCE794', 'descricao D', 124.99, '13/3/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (60, 'produto BFB819', 'descricao C', 250, '13/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (61, 'produto FDG499', 'descricao E', 139.99, '5/7/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (62, 'produto GCH841', 'descricao F', 94.99, '16/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (63, 'produto HGF559', 'descricao G', 79.99, '6/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (64, 'produto HGC262', 'descricao B', 250, '10/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (65, 'produto AHE250', 'descricao C', 250, '15/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (66, 'produto BEB850', 'descricao C', 109.99, '26/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (67, 'produto HGG607', 'descricao D', 199.99, '15/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (68, 'produto AHE480', 'descricao F', 64.99, '16/3/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (69, 'produto GEE479', 'descricao H', 94.99, '6/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (70, 'produto CEB340', 'descricao A', 94.99, '29/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (71, 'produto DHF761', 'descricao G', 79.99, '16/1/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (72, 'produto FAD155', 'descricao A', 154.99, '23/11/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (73, 'produto CHB920', 'descricao B', 199.99, '13/3/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (74, 'produto GDA150', 'descricao B', 154.99, '3/9/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (75, 'produto HEC997', 'descricao H', 199.99, '24/2/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (76, 'produto GGG491', 'descricao G', 109.99, '17/1/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (77, 'produto GHG705', 'descricao F', 79.99, '8/2/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (78, 'produto HAB399', 'descricao A', 64.99, '7/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (79, 'produto FDD503', 'descricao G', 94.99, '20/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (80, 'produto FHB513', 'descricao H', 250, '23/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (81, 'produto DGB962', 'descricao C', 184.99, '9/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (82, 'produto AGE353', 'descricao E', 154.99, '23/7/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (83, 'produto AHA341', 'descricao F', 169.99, '11/1/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (84, 'produto EHA688', 'descricao H', 154.99, '6/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (85, 'produto GDA770', 'descricao G', 184.99, '2/7/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (86, 'produto BHE273', 'descricao E', 250, '19/4/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (87, 'produto HCC270', 'descricao D', 154.99, '13/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (88, 'produto EGF460', 'descricao A', 64.99, '7/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (89, 'produto DBD88', 'descricao E', 79.99, '22/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (90, 'produto ACH165', 'descricao H', 109.99, '4/6/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (91, 'produto AED502', 'descricao D', 250, '5/2/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (92, 'produto ACC928', 'descricao G', 49.99, '8/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (93, 'produto DFF284', 'descricao F', 169.99, '12/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (94, 'produto AFG995', 'descricao B', 64.99, '2/2/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (95, 'produto BGC706', 'descricao F', 169.99, '19/10/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (96, 'produto BHE493', 'descricao D', 184.99, '10/5/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (97, 'produto ABH918', 'descricao F', 94.99, '11/7/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (98, 'produto BFD167', 'descricao H', 139.99, '3/9/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (99, 'produto EDG730', 'descricao C', 79.99, '22/10/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (100, 'produto EDF683', 'descricao B', 169.99, '26/4/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (101, 'produto CAF702', 'descricao G', 154.99, '7/9/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (102, 'produto CHD147', 'descricao G', 154.99, '14/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (103, 'produto CFE977', 'descricao H', 139.99, '13/9/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (104, 'produto DCD480', 'descricao E', 139.99, '13/1/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (105, 'produto AHF149', 'descricao G', 79.99, '8/7/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (106, 'produto BGC505', 'descricao H', 199.99, '16/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (107, 'produto GCD786', 'descricao F', 154.99, '17/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (108, 'produto FHH346', 'descricao G', 64.99, '17/4/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (109, 'produto BFE811', 'descricao H', 154.99, '16/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (110, 'produto GBH211', 'descricao C', 64.99, '18/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (111, 'produto HBA224', 'descricao E', 184.99, '15/6/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (112, 'produto CDB965', 'descricao F', 184.99, '20/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (113, 'produto EGE881', 'descricao G', 64.99, '1/11/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (114, 'produto BFC616', 'descricao H', 64.99, '28/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (115, 'produto GGB219', 'descricao E', 124.99, '16/5/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (116, 'produto BHH422', 'descricao A', 94.99, '27/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (117, 'produto EAD329', 'descricao G', 154.99, '17/3/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (118, 'produto ADH301', 'descricao D', 139.99, '27/10/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (119, 'produto HCC436', 'descricao B', 184.99, '18/2/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (120, 'produto DBH443', 'descricao D', 250, '20/1/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (121, 'produto EHA164', 'descricao H', 79.99, '2/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (122, 'produto EEE254', 'descricao G', 49.99, '9/5/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (123, 'produto DFE115', 'descricao F', 154.99, '13/10/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (124, 'produto BDF434', 'descricao H', 154.99, '8/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (125, 'produto FFE522', 'descricao F', 124.99, '3/1/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (126, 'produto HAB914', 'descricao C', 124.99, '12/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (127, 'produto FBF222', 'descricao A', 109.99, '4/11/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (128, 'produto HGD925', 'descricao D', 109.99, '14/11/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (129, 'produto FHA800', 'descricao G', 169.99, '6/3/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (130, 'produto EEH100', 'descricao C', 94.99, '6/4/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (131, 'produto GDD300', 'descricao H', 94.99, '6/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (132, 'produto BBF221', 'descricao A', 139.99, '13/5/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (133, 'produto EDG530', 'descricao D', 124.99, '28/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (134, 'produto DHA688', 'descricao A', 169.99, '24/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (135, 'produto HCG896', 'descricao A', 139.99, '27/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (136, 'produto DAG126', 'descricao E', 109.99, '5/4/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (137, 'produto FAA331', 'descricao D', 169.99, '3/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (138, 'produto BFG712', 'descricao E', 64.99, '9/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (139, 'produto FFF752', 'descricao G', 109.99, '12/11/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (140, 'produto CGD335', 'descricao B', 49.99, '5/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (141, 'produto FCB653', 'descricao E', 49.99, '8/5/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (142, 'produto DAA491', 'descricao A', 184.99, '25/2/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (143, 'produto DHG952', 'descricao A', 250, '25/2/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (144, 'produto DDD769', 'descricao C', 79.99, '14/9/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (145, 'produto CAA140', 'descricao H', 184.99, '6/9/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (146, 'produto HDE716', 'descricao C', 139.99, '22/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (147, 'produto EDC23', 'descricao B', 250, '9/7/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (148, 'produto HGE495', 'descricao F', 49.99, '16/1/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (149, 'produto AAC809', 'descricao B', 124.99, '28/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (150, 'produto FDC379', 'descricao G', 199.99, '22/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (151, 'produto BHE70', 'descricao G', 184.99, '27/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (152, 'produto ACE463', 'descricao H', 94.99, '5/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (153, 'produto ADE297', 'descricao G', 250, '13/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (154, 'produto BBD161', 'descricao A', 169.99, '1/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (155, 'produto HAH526', 'descricao B', 64.99, '24/3/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (156, 'produto CFA994', 'descricao F', 199.99, '18/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (157, 'produto BGB108', 'descricao A', 169.99, '28/8/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (158, 'produto EBA762', 'descricao B', 124.99, '6/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (159, 'produto ABE66', 'descricao H', 169.99, '26/9/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (160, 'produto AGD253', 'descricao D', 154.99, '16/1/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (161, 'produto DHF195', 'descricao D', 199.99, '8/7/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (162, 'produto BBB404', 'descricao H', 79.99, '13/8/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (163, 'produto CBF169', 'descricao B', 169.99, '11/7/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (164, 'produto DGC496', 'descricao H', 64.99, '2/4/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (165, 'produto BAD664', 'descricao D', 154.99, '1/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (166, 'produto FGC586', 'descricao E', 94.99, '19/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (167, 'produto GED147', 'descricao F', 169.99, '8/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (168, 'produto GED627', 'descricao D', 79.99, '24/9/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (169, 'produto EBE290', 'descricao F', 49.99, '10/1/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (170, 'produto DAH43', 'descricao B', 49.99, '24/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (171, 'produto EHE521', 'descricao C', 109.99, '15/10/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (172, 'produto CDH459', 'descricao G', 139.99, '1/2/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (173, 'produto EDA242', 'descricao H', 124.99, '2/9/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (174, 'produto AFB134', 'descricao A', 49.99, '20/3/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (175, 'produto BDG368', 'descricao B', 154.99, '16/7/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (176, 'produto DHD889', 'descricao D', 79.99, '24/10/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (177, 'produto HDD602', 'descricao G', 94.99, '16/7/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (178, 'produto ABG876', 'descricao B', 49.99, '11/4/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (179, 'produto GAE772', 'descricao E', 124.99, '28/5/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (180, 'produto DFG231', 'descricao C', 139.99, '20/2/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (181, 'produto EAE226', 'descricao G', 199.99, '29/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (182, 'produto DEG281', 'descricao H', 109.99, '14/11/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (183, 'produto BAH811', 'descricao D', 94.99, '22/11/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (184, 'produto ADG911', 'descricao E', 154.99, '10/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (185, 'produto BBA285', 'descricao D', 94.99, '9/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (186, 'produto CDB634', 'descricao A', 49.99, '21/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (187, 'produto CCH307', 'descricao D', 139.99, '12/1/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (188, 'produto DHA97', 'descricao E', 154.99, '11/1/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (189, 'produto EBE797', 'descricao C', 139.99, '26/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (190, 'produto AAF68', 'descricao F', 199.99, '24/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (191, 'produto CFG535', 'descricao F', 250, '2/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (192, 'produto HHA0', 'descricao D', 124.99, '24/9/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (193, 'produto HFH631', 'descricao A', 139.99, '20/9/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (194, 'produto FEH845', 'descricao G', 64.99, '12/2/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (195, 'produto CHE574', 'descricao B', 154.99, '18/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (196, 'produto EGF988', 'descricao C', 139.99, '20/6/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (197, 'produto FHH496', 'descricao C', 124.99, '4/5/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (198, 'produto GHH21', 'descricao G', 139.99, '7/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (199, 'produto AFA672', 'descricao E', 154.99, '2/11/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (200, 'produto CEF208', 'descricao G', 124.99, '18/2/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (201, 'produto DAE14', 'descricao G', 199.99, '8/1/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (202, 'produto GAE845', 'descricao B', 49.99, '22/6/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (203, 'produto BCH735', 'descricao B', 139.99, '1/9/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (204, 'produto ECH478', 'descricao D', 79.99, '24/2/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (205, 'produto DFD215', 'descricao G', 169.99, '17/5/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (206, 'produto AFG384', 'descricao C', 199.99, '26/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (207, 'produto BEE471', 'descricao H', 169.99, '14/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (208, 'produto EDA481', 'descricao G', 124.99, '5/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (209, 'produto CFC838', 'descricao C', 184.99, '4/3/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (210, 'produto BCB313', 'descricao H', 139.99, '28/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (211, 'produto GCC511', 'descricao F', 250, '20/11/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (212, 'produto BDC576', 'descricao G', 199.99, '5/4/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (213, 'produto AGA265', 'descricao B', 169.99, '9/7/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (214, 'produto AFD612', 'descricao H', 64.99, '27/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (215, 'produto HFE280', 'descricao C', 154.99, '17/2/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (216, 'produto BGH630', 'descricao E', 79.99, '7/11/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (217, 'produto GCB917', 'descricao E', 79.99, '22/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (218, 'produto HGF556', 'descricao E', 64.99, '19/9/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (219, 'produto HFF345', 'descricao C', 124.99, '12/2/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (220, 'produto HCG37', 'descricao C', 154.99, '4/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (221, 'produto BEH326', 'descricao G', 64.99, '11/6/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (222, 'produto HEE900', 'descricao D', 49.99, '20/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (223, 'produto BHA412', 'descricao D', 199.99, '25/9/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (224, 'produto DHF725', 'descricao F', 124.99, '14/1/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (225, 'produto EHC734', 'descricao H', 64.99, '15/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (226, 'produto DFH233', 'descricao D', 64.99, '19/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (227, 'produto CGH931', 'descricao A', 109.99, '2/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (228, 'produto DCF696', 'descricao B', 169.99, '2/5/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (229, 'produto FFC295', 'descricao C', 199.99, '16/3/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (230, 'produto DCE781', 'descricao H', 94.99, '5/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (231, 'produto GCE456', 'descricao C', 64.99, '11/7/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (232, 'produto DCC727', 'descricao E', 94.99, '20/5/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (233, 'produto AEG374', 'descricao D', 169.99, '18/1/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (234, 'produto DDC162', 'descricao B', 184.99, '18/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (235, 'produto DFE710', 'descricao E', 139.99, '10/11/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (236, 'produto BDE705', 'descricao C', 199.99, '2/11/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (237, 'produto DAA237', 'descricao B', 250, '28/2/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (238, 'produto CHB699', 'descricao H', 79.99, '28/8/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (239, 'produto BFD801', 'descricao G', 250, '21/9/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (240, 'produto CGA686', 'descricao D', 169.99, '24/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (241, 'produto AED528', 'descricao B', 154.99, '14/2/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (242, 'produto EGF553', 'descricao A', 154.99, '16/11/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (243, 'produto EGG951', 'descricao H', 169.99, '18/11/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (244, 'produto HBB991', 'descricao E', 124.99, '18/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (245, 'produto BBF176', 'descricao D', 139.99, '26/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (246, 'produto AAH410', 'descricao C', 154.99, '6/2/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (247, 'produto GDB551', 'descricao C', 64.99, '4/5/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (248, 'produto CEA418', 'descricao H', 184.99, '14/6/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (249, 'produto DCH545', 'descricao H', 199.99, '19/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (250, 'produto EHH734', 'descricao C', 124.99, '5/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (251, 'produto ACE331', 'descricao G', 49.99, '24/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (252, 'produto HAD867', 'descricao C', 250, '3/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (253, 'produto GGA274', 'descricao C', 64.99, '16/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (254, 'produto EDF28', 'descricao F', 64.99, '19/2/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (255, 'produto FEE128', 'descricao F', 109.99, '26/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (256, 'produto EFE559', 'descricao G', 64.99, '11/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (257, 'produto AFD820', 'descricao E', 124.99, '6/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (258, 'produto EFF788', 'descricao H', 49.99, '29/4/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (259, 'produto HGA845', 'descricao G', 124.99, '1/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (260, 'produto AEB64', 'descricao B', 184.99, '11/11/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (261, 'produto AGH671', 'descricao A', 250, '6/8/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (262, 'produto EAC120', 'descricao G', 124.99, '1/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (263, 'produto BAG554', 'descricao B', 169.99, '11/3/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (264, 'produto DDF650', 'descricao C', 184.99, '12/11/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (265, 'produto BFB613', 'descricao G', 250, '26/3/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (266, 'produto BFH560', 'descricao C', 109.99, '19/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (267, 'produto FBF164', 'descricao E', 199.99, '20/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (268, 'produto AGA570', 'descricao B', 64.99, '28/4/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (269, 'produto EGH819', 'descricao E', 169.99, '19/5/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (270, 'produto AED411', 'descricao B', 250, '24/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (271, 'produto ACC784', 'descricao D', 169.99, '11/11/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (272, 'produto EBB873', 'descricao G', 154.99, '1/5/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (273, 'produto BGA802', 'descricao C', 154.99, '9/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (274, 'produto FCH483', 'descricao D', 250, '22/11/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (275, 'produto GEG322', 'descricao G', 154.99, '28/3/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (276, 'produto AEH341', 'descricao A', 169.99, '8/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (277, 'produto FAC271', 'descricao G', 64.99, '22/1/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (278, 'produto FDF225', 'descricao A', 154.99, '5/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (279, 'produto CDF387', 'descricao A', 250, '11/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (280, 'produto HFA734', 'descricao A', 154.99, '13/7/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (281, 'produto ADG576', 'descricao E', 199.99, '25/4/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (282, 'produto DAD688', 'descricao A', 139.99, '3/2/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (283, 'produto FCH36', 'descricao E', 49.99, '22/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (284, 'produto EDF609', 'descricao H', 199.99, '12/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (285, 'produto HBF630', 'descricao D', 154.99, '5/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (286, 'produto DHB235', 'descricao G', 184.99, '29/6/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (287, 'produto HHB882', 'descricao B', 109.99, '25/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (288, 'produto CHG439', 'descricao G', 199.99, '3/1/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (289, 'produto ACF656', 'descricao E', 109.99, '3/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (290, 'produto AGB869', 'descricao C', 109.99, '24/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (291, 'produto HFD513', 'descricao A', 139.99, '2/4/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (292, 'produto HGC882', 'descricao F', 250, '8/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (293, 'produto HGE699', 'descricao H', 49.99, '22/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (294, 'produto DEH621', 'descricao E', 199.99, '22/2/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (295, 'produto HHE179', 'descricao H', 199.99, '11/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (296, 'produto HCH177', 'descricao B', 64.99, '3/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (297, 'produto HFG755', 'descricao F', 250, '8/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (298, 'produto DDD466', 'descricao E', 109.99, '25/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (299, 'produto DDB435', 'descricao C', 250, '24/11/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (300, 'produto CBC388', 'descricao C', 250, '28/9/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (301, 'produto BEB372', 'descricao D', 250, '11/8/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (302, 'produto HGA478', 'descricao A', 64.99, '4/9/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (303, 'produto HHE50', 'descricao G', 49.99, '23/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (304, 'produto HDF554', 'descricao F', 154.99, '8/4/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (305, 'produto AEC229', 'descricao E', 94.99, '3/5/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (306, 'produto DCH884', 'descricao G', 94.99, '16/3/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (307, 'produto EFF16', 'descricao A', 94.99, '13/3/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (308, 'produto ECG875', 'descricao G', 109.99, '9/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (309, 'produto BEF186', 'descricao A', 154.99, '25/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (310, 'produto ABH459', 'descricao E', 64.99, '6/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (311, 'produto BEC51', 'descricao G', 64.99, '8/2/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (312, 'produto EGF938', 'descricao G', 169.99, '11/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (313, 'produto BHF490', 'descricao G', 79.99, '5/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (314, 'produto FFA7', 'descricao A', 250, '10/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (315, 'produto HFB676', 'descricao G', 64.99, '2/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (316, 'produto HFG187', 'descricao G', 199.99, '18/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (317, 'produto EFD393', 'descricao D', 250, '9/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (318, 'produto DGE365', 'descricao E', 199.99, '13/9/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (319, 'produto FBG6', 'descricao H', 169.99, '19/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (320, 'produto GEB963', 'descricao C', 184.99, '15/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (321, 'produto CEG538', 'descricao F', 64.99, '10/8/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (322, 'produto GBE925', 'descricao A', 109.99, '17/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (323, 'produto EHE745', 'descricao E', 199.99, '4/3/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (324, 'produto HHB758', 'descricao B', 184.99, '8/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (325, 'produto GEA365', 'descricao A', 199.99, '12/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (326, 'produto HHB352', 'descricao C', 49.99, '4/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (327, 'produto EBA574', 'descricao H', 154.99, '20/5/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (328, 'produto AGB700', 'descricao A', 109.99, '6/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (329, 'produto BGB380', 'descricao C', 79.99, '11/11/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (330, 'produto CED604', 'descricao G', 49.99, '10/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (331, 'produto DCC174', 'descricao F', 169.99, '26/2/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (332, 'produto EEA904', 'descricao D', 184.99, '26/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (333, 'produto CAD145', 'descricao D', 124.99, '3/9/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (334, 'produto FAE793', 'descricao E', 199.99, '7/11/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (335, 'produto DBA139', 'descricao F', 109.99, '20/10/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (336, 'produto HDB55', 'descricao A', 184.99, '11/5/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (337, 'produto DFG744', 'descricao C', 250, '27/5/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (338, 'produto DFC410', 'descricao B', 109.99, '2/4/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (339, 'produto DEE487', 'descricao G', 64.99, '28/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (340, 'produto HEG307', 'descricao A', 154.99, '20/10/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (341, 'produto GHC426', 'descricao F', 199.99, '27/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (342, 'produto ABG199', 'descricao D', 199.99, '15/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (343, 'produto HGF941', 'descricao H', 139.99, '26/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (344, 'produto FEB656', 'descricao G', 154.99, '2/2/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (345, 'produto FGH463', 'descricao H', 109.99, '9/7/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (346, 'produto EEH953', 'descricao C', 139.99, '25/2/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (347, 'produto CEF584', 'descricao G', 184.99, '6/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (348, 'produto FHA956', 'descricao H', 139.99, '25/5/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (349, 'produto DGC431', 'descricao B', 169.99, '25/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (350, 'produto HDC283', 'descricao C', 139.99, '21/8/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (351, 'produto CGH175', 'descricao G', 49.99, '16/4/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (352, 'produto EEG374', 'descricao C', 109.99, '5/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (353, 'produto FBG790', 'descricao G', 154.99, '25/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (354, 'produto GGA506', 'descricao B', 154.99, '20/7/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (355, 'produto HFD774', 'descricao G', 139.99, '29/7/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (356, 'produto DDA495', 'descricao E', 109.99, '16/2/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (357, 'produto HCE460', 'descricao F', 139.99, '11/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (358, 'produto FBF431', 'descricao F', 124.99, '14/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (359, 'produto HHD111', 'descricao A', 124.99, '29/5/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (360, 'produto EEB141', 'descricao D', 64.99, '4/10/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (361, 'produto EAE506', 'descricao C', 184.99, '25/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (362, 'produto CDG314', 'descricao F', 184.99, '24/2/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (363, 'produto FEA718', 'descricao B', 139.99, '2/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (364, 'produto CCA973', 'descricao D', 250, '27/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (365, 'produto BGF763', 'descricao C', 64.99, '12/1/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (366, 'produto ABH346', 'descricao H', 199.99, '1/8/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (367, 'produto GCH507', 'descricao H', 64.99, '12/5/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (368, 'produto EDA723', 'descricao C', 199.99, '13/10/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (369, 'produto DED456', 'descricao H', 139.99, '29/11/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (370, 'produto ACB19', 'descricao E', 124.99, '14/9/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (371, 'produto BDD424', 'descricao C', 154.99, '14/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (372, 'produto FAC970', 'descricao G', 154.99, '18/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (373, 'produto CCE773', 'descricao E', 109.99, '21/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (374, 'produto CDH86', 'descricao G', 250, '24/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (375, 'produto DAA766', 'descricao G', 109.99, '14/10/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (376, 'produto GGE237', 'descricao E', 79.99, '1/6/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (377, 'produto BBA802', 'descricao C', 199.99, '17/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (378, 'produto HEE726', 'descricao C', 154.99, '1/10/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (379, 'produto CHH629', 'descricao B', 199.99, '28/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (380, 'produto ADF134', 'descricao A', 199.99, '4/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (381, 'produto HHF243', 'descricao F', 169.99, '14/3/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (382, 'produto CGD455', 'descricao F', 124.99, '19/9/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (383, 'produto DCF756', 'descricao B', 94.99, '16/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (384, 'produto CDA323', 'descricao D', 109.99, '13/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (385, 'produto BCA250', 'descricao E', 250, '10/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (386, 'produto GHC440', 'descricao C', 124.99, '25/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (387, 'produto DAC234', 'descricao D', 49.99, '6/7/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (388, 'produto AAF190', 'descricao G', 124.99, '26/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (389, 'produto BEB227', 'descricao F', 109.99, '2/6/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (390, 'produto ACH728', 'descricao D', 199.99, '24/4/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (391, 'produto CAF43', 'descricao C', 184.99, '18/6/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (392, 'produto DGE119', 'descricao F', 124.99, '22/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (393, 'produto DDG706', 'descricao F', 169.99, '7/10/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (394, 'produto GGG977', 'descricao C', 94.99, '22/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (395, 'produto HCB606', 'descricao E', 139.99, '13/9/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (396, 'produto BCF383', 'descricao H', 184.99, '7/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (397, 'produto FBE484', 'descricao C', 94.99, '9/5/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (398, 'produto BGF987', 'descricao F', 64.99, '6/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (399, 'produto CAA948', 'descricao C', 184.99, '20/4/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (400, 'produto DBG617', 'descricao A', 49.99, '8/5/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (401, 'produto HCH426', 'descricao G', 124.99, '20/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (402, 'produto EEA864', 'descricao F', 154.99, '9/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (403, 'produto BFE307', 'descricao B', 199.99, '13/7/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (404, 'produto BCC860', 'descricao H', 184.99, '16/6/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (405, 'produto GGH577', 'descricao F', 199.99, '23/11/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (406, 'produto EBG895', 'descricao G', 109.99, '21/4/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (407, 'produto AFF783', 'descricao F', 199.99, '22/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (408, 'produto FBD730', 'descricao E', 154.99, '5/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (409, 'produto BEB615', 'descricao A', 49.99, '28/2/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (410, 'produto GFC734', 'descricao E', 184.99, '15/7/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (411, 'produto FBC59', 'descricao F', 199.99, '25/10/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (412, 'produto GFH277', 'descricao A', 94.99, '8/1/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (413, 'produto BAB502', 'descricao C', 154.99, '18/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (414, 'produto GDE710', 'descricao E', 109.99, '12/2/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (415, 'produto GFH602', 'descricao E', 94.99, '20/11/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (416, 'produto BBG208', 'descricao D', 124.99, '25/2/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (417, 'produto EDF899', 'descricao B', 250, '26/9/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (418, 'produto CGA192', 'descricao A', 154.99, '17/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (419, 'produto FEH470', 'descricao H', 79.99, '2/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (420, 'produto HEB94', 'descricao E', 124.99, '17/6/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (421, 'produto FDE886', 'descricao C', 124.99, '2/10/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (422, 'produto DCD820', 'descricao A', 79.99, '4/9/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (423, 'produto HFH65', 'descricao D', 169.99, '24/11/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (424, 'produto ABA982', 'descricao G', 124.99, '3/4/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (425, 'produto FDB956', 'descricao D', 109.99, '10/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (426, 'produto FGE556', 'descricao D', 169.99, '1/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (427, 'produto HGC174', 'descricao H', 169.99, '24/1/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (428, 'produto ACD83', 'descricao E', 184.99, '16/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (429, 'produto EEE802', 'descricao D', 94.99, '8/11/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (430, 'produto AAE378', 'descricao C', 169.99, '1/9/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (431, 'produto GHG335', 'descricao G', 139.99, '4/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (432, 'produto FEA134', 'descricao B', 49.99, '18/4/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (433, 'produto HCE95', 'descricao H', 124.99, '26/9/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (434, 'produto CBF100', 'descricao F', 79.99, '1/3/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (435, 'produto DAB707', 'descricao C', 139.99, '5/2/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (436, 'produto AFB324', 'descricao B', 154.99, '3/11/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (437, 'produto GEC840', 'descricao C', 64.99, '7/1/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (438, 'produto BED323', 'descricao C', 109.99, '20/4/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (439, 'produto FEH816', 'descricao H', 199.99, '21/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (440, 'produto FHA564', 'descricao E', 79.99, '26/10/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (441, 'produto HFC134', 'descricao A', 79.99, '8/11/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (442, 'produto GCG804', 'descricao C', 169.99, '15/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (443, 'produto AAD582', 'descricao E', 94.99, '17/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (444, 'produto FFB373', 'descricao A', 109.99, '18/6/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (445, 'produto EGG705', 'descricao H', 199.99, '24/6/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (446, 'produto GAD958', 'descricao A', 250, '14/3/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (447, 'produto HAE726', 'descricao E', 139.99, '8/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (448, 'produto BHG993', 'descricao B', 184.99, '2/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (449, 'produto FFF46', 'descricao A', 109.99, '21/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (450, 'produto GCH317', 'descricao D', 139.99, '5/1/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (451, 'produto GGH770', 'descricao H', 124.99, '9/1/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (452, 'produto GDE891', 'descricao D', 250, '22/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (453, 'produto DAF761', 'descricao E', 154.99, '13/3/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (454, 'produto FBF164', 'descricao C', 79.99, '3/8/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (455, 'produto EGB698', 'descricao D', 169.99, '4/1/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (456, 'produto AHD490', 'descricao F', 64.99, '17/11/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (457, 'produto AFE208', 'descricao G', 124.99, '7/11/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (458, 'produto AHD160', 'descricao D', 49.99, '24/4/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (459, 'produto ECD651', 'descricao G', 49.99, '11/5/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (460, 'produto FGA881', 'descricao D', 154.99, '1/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (461, 'produto EAE265', 'descricao D', 109.99, '19/7/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (462, 'produto DFD598', 'descricao G', 169.99, '19/8/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (463, 'produto HHD123', 'descricao B', 154.99, '27/2/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (464, 'produto GGH871', 'descricao C', 250, '24/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (465, 'produto HBD620', 'descricao H', 169.99, '21/7/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (466, 'produto GFA974', 'descricao C', 199.99, '6/11/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (467, 'produto DEB44', 'descricao E', 124.99, '17/9/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (468, 'produto EAE549', 'descricao C', 250, '20/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (469, 'produto DEB448', 'descricao C', 124.99, '3/7/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (470, 'produto CBC266', 'descricao C', 139.99, '11/2/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (471, 'produto FFE682', 'descricao A', 124.99, '14/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (472, 'produto DAA522', 'descricao D', 109.99, '26/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (473, 'produto CBF304', 'descricao A', 124.99, '28/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (474, 'produto FAA0', 'descricao H', 169.99, '14/4/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (475, 'produto ECA294', 'descricao F', 109.99, '26/1/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (476, 'produto FCH366', 'descricao H', 49.99, '27/9/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (477, 'produto HEA948', 'descricao B', 124.99, '24/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (478, 'produto CDH570', 'descricao C', 64.99, '27/11/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (479, 'produto EFC402', 'descricao C', 79.99, '18/2/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (480, 'produto HCC853', 'descricao D', 94.99, '16/11/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (481, 'produto AEH772', 'descricao C', 79.99, '13/3/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (482, 'produto HAD636', 'descricao B', 94.99, '8/6/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (483, 'produto EAC285', 'descricao E', 109.99, '15/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (484, 'produto CFF246', 'descricao D', 184.99, '14/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (485, 'produto GBB869', 'descricao E', 250, '16/5/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (486, 'produto HGH927', 'descricao A', 184.99, '15/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (487, 'produto HAD381', 'descricao G', 79.99, '10/7/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (488, 'produto BCG641', 'descricao A', 184.99, '10/6/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (489, 'produto HFB829', 'descricao D', 184.99, '5/1/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (490, 'produto CBB973', 'descricao E', 199.99, '13/11/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (491, 'produto EFB68', 'descricao D', 184.99, '27/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (492, 'produto CEB753', 'descricao A', 184.99, '1/4/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (493, 'produto AHG497', 'descricao B', 94.99, '24/11/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (494, 'produto ACD882', 'descricao A', 154.99, '24/6/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (495, 'produto HBB243', 'descricao E', 199.99, '16/2/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (496, 'produto FEH880', 'descricao H', 109.99, '14/9/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (497, 'produto DAD691', 'descricao A', 139.99, '2/9/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (498, 'produto DDH952', 'descricao G', 49.99, '19/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (499, 'produto DCA63', 'descricao H', 169.99, '27/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (500, 'produto ACD491', 'descricao F', 109.99, '19/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (501, 'produto DDA185', 'descricao H', 109.99, '4/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (502, 'produto AGE762', 'descricao F', 169.99, '3/7/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (503, 'produto CGC16', 'descricao E', 184.99, '15/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (504, 'produto BDE558', 'descricao H', 79.99, '26/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (505, 'produto BDF55', 'descricao D', 49.99, '24/8/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (506, 'produto FGH394', 'descricao E', 184.99, '8/5/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (507, 'produto GBG62', 'descricao G', 109.99, '1/10/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (508, 'produto AGE120', 'descricao D', 109.99, '29/12/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (509, 'produto HAD802', 'descricao C', 250, '16/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (510, 'produto DAD53', 'descricao A', 79.99, '11/10/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (511, 'produto BEG394', 'descricao H', 64.99, '22/10/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (512, 'produto EGG480', 'descricao H', 109.99, '5/5/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (513, 'produto FHC851', 'descricao E', 94.99, '1/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (514, 'produto AFA740', 'descricao G', 139.99, '3/2/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (515, 'produto GDF778', 'descricao B', 139.99, '4/4/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (516, 'produto DDH124', 'descricao A', 139.99, '22/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (517, 'produto BHE797', 'descricao A', 124.99, '10/9/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (518, 'produto DEF442', 'descricao E', 139.99, '13/2/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (519, 'produto EAF215', 'descricao D', 49.99, '1/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (520, 'produto HHE842', 'descricao B', 250, '16/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (521, 'produto AEB649', 'descricao B', 199.99, '9/5/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (522, 'produto ADE458', 'descricao C', 64.99, '18/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (523, 'produto GAC359', 'descricao D', 79.99, '13/1/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (524, 'produto FAD523', 'descricao H', 109.99, '16/7/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (525, 'produto BFA700', 'descricao F', 199.99, '6/1/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (526, 'produto DAA369', 'descricao B', 79.99, '17/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (527, 'produto GBC981', 'descricao F', 49.99, '28/10/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (528, 'produto ACD892', 'descricao C', 154.99, '27/10/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (529, 'produto GHB533', 'descricao E', 250, '21/3/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (530, 'produto DAD369', 'descricao E', 184.99, '18/10/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (531, 'produto DAB519', 'descricao F', 49.99, '8/4/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (532, 'produto HHG250', 'descricao G', 94.99, '4/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (533, 'produto FFE392', 'descricao A', 64.99, '22/8/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (534, 'produto CGB518', 'descricao E', 250, '21/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (535, 'produto HDD811', 'descricao D', 250, '2/3/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (536, 'produto BHH903', 'descricao G', 199.99, '5/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (537, 'produto BDG386', 'descricao C', 124.99, '22/11/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (538, 'produto CDC622', 'descricao C', 49.99, '18/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (539, 'produto DDE585', 'descricao B', 139.99, '1/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (540, 'produto ACD165', 'descricao G', 250, '5/11/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (541, 'produto ABH267', 'descricao F', 184.99, '10/3/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (542, 'produto BFH549', 'descricao E', 94.99, '7/10/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (543, 'produto BCA450', 'descricao B', 169.99, '29/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (544, 'produto CGA798', 'descricao A', 94.99, '16/8/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (545, 'produto DDE16', 'descricao H', 124.99, '9/11/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (546, 'produto EGA925', 'descricao H', 184.99, '14/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (547, 'produto DCG163', 'descricao C', 64.99, '1/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (548, 'produto EEA41', 'descricao H', 79.99, '9/7/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (549, 'produto BGH962', 'descricao A', 124.99, '13/2/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (550, 'produto GEH485', 'descricao B', 169.99, '28/4/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (551, 'produto DGD776', 'descricao G', 109.99, '5/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (552, 'produto FEC251', 'descricao E', 49.99, '3/6/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (553, 'produto AHB482', 'descricao G', 169.99, '20/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (554, 'produto EDB77', 'descricao A', 79.99, '1/2/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (555, 'produto EEF678', 'descricao D', 124.99, '16/4/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (556, 'produto EFD506', 'descricao G', 79.99, '17/4/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (557, 'produto AFA546', 'descricao B', 94.99, '17/2/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (558, 'produto CGD617', 'descricao C', 250, '3/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (559, 'produto CCH916', 'descricao A', 109.99, '27/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (560, 'produto EED878', 'descricao A', 94.99, '19/7/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (561, 'produto FGC180', 'descricao B', 94.99, '16/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (562, 'produto HFF823', 'descricao B', 169.99, '14/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (563, 'produto FFC410', 'descricao C', 49.99, '17/7/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (564, 'produto CGG703', 'descricao B', 94.99, '3/8/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (565, 'produto FDF877', 'descricao G', 184.99, '8/3/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (566, 'produto AGD204', 'descricao F', 109.99, '8/1/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (567, 'produto ACE178', 'descricao D', 154.99, '13/1/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (568, 'produto FCA70', 'descricao C', 139.99, '15/3/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (569, 'produto BDF949', 'descricao D', 169.99, '13/9/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (570, 'produto CGF153', 'descricao B', 94.99, '19/1/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (571, 'produto EFE116', 'descricao B', 124.99, '29/2/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (572, 'produto CFE470', 'descricao G', 250, '14/7/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (573, 'produto HBE512', 'descricao F', 169.99, '18/11/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (574, 'produto ECD295', 'descricao A', 199.99, '25/1/2019');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (575, 'produto GCE477', 'descricao C', 250, '8/6/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (576, 'produto EBG69', 'descricao C', 184.99, '28/3/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (577, 'produto GCE712', 'descricao A', 169.99, '9/3/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (578, 'produto HDH437', 'descricao D', 169.99, '26/8/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (579, 'produto FDF128', 'descricao B', 124.99, '27/4/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (580, 'produto EDE627', 'descricao A', 250, '15/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (581, 'produto GBA656', 'descricao A', 250, '9/5/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (582, 'produto FCF160', 'descricao A', 79.99, '21/10/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (583, 'produto DAG383', 'descricao G', 184.99, '3/5/2015');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (584, 'produto FBE672', 'descricao G', 139.99, '27/2/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (585, 'produto DDD114', 'descricao E', 79.99, '23/9/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (586, 'produto EGG501', 'descricao E', 154.99, '24/3/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (587, 'produto GBH817', 'descricao A', 64.99, '24/8/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (588, 'produto FAF560', 'descricao A', 124.99, '15/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (589, 'produto HCF545', 'descricao H', 94.99, '26/11/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (590, 'produto DBC557', 'descricao G', 139.99, '12/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (591, 'produto GAF873', 'descricao B', 250, '26/5/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (592, 'produto BHC234', 'descricao A', 139.99, '8/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (593, 'produto FFC177', 'descricao F', 49.99, '4/4/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (594, 'produto DBA660', 'descricao E', 64.99, '5/8/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (595, 'produto HFE109', 'descricao E', 199.99, '24/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (596, 'produto BDB89', 'descricao D', 199.99, '7/5/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (597, 'produto HAF236', 'descricao A', 49.99, '19/6/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (598, 'produto DEE993', 'descricao E', 139.99, '10/5/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (599, 'produto CCF922', 'descricao G', 184.99, '23/9/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (600, 'produto ECB840', 'descricao H', 250, '12/7/2012');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (601, 'produto BAG457', 'descricao H', 199.99, '20/1/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (602, 'produto BDE681', 'descricao H', 139.99, '23/10/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (603, 'produto DEC982', 'descricao A', 199.99, '19/7/2011');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (604, 'produto BCF159', 'descricao E', 109.99, '9/8/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (605, 'produto ECA837', 'descricao B', 139.99, '11/3/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (606, 'produto HDD999', 'descricao G', 79.99, '14/11/2017');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (607, 'produto AFE155', 'descricao A', 184.99, '18/8/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (608, 'produto GEF910', 'descricao D', 124.99, '7/6/2010');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (609, 'produto CHH8', 'descricao B', 94.99, '16/11/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (610, 'produto EDE661', 'descricao C', 199.99, '18/7/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (611, 'produto FHE600', 'descricao D', 94.99, '19/5/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (612, 'produto EHH8', 'descricao D', 154.99, '2/8/2018');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (613, 'produto CFG378', 'descricao H', 94.99, '26/7/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (614, 'produto EDF332', 'descricao A', 124.99, '24/9/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (615, 'produto CEH557', 'descricao A', 169.99, '26/4/2016');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (616, 'produto HGF492', 'descricao D', 184.99, '2/10/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (617, 'produto DHF61', 'descricao A', 79.99, '17/1/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (618, 'produto DAC817', 'descricao E', 250, '4/11/2014');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (619, 'produto BGG156', 'descricao A', 124.99, '15/1/2013');
INSERT INTO PRODUTOS(pdt_id,pdt_nome,pdt_descricao,pdt_preco,pdt_data_aquisicao) VALUES (620, 'produto FAE980', 'descricao F', 94.99, '12/9/2016');

/*************************** 
  TODO - Insert produtos_clientes
****************************/
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(1,148,'20/9/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(2,367,'27/4/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(2,160,'9/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(2,162,'6/3/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(3,359,'10/8/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(3,597,'14/1/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(3,320,'13/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(3,72,'4/7/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(4,297,'23/3/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(4,279,'12/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(5,464,'9/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(5,260,'8/11/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(5,379,'2/9/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(6,536,'20/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(6,44,'16/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(6,119,'15/11/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(7,242,'20/3/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(7,349,'28/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(7,363,'8/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(7,246,'9/7/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(8,64,'12/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(8,228,'17/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(9,133,'26/9/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(9,416,'22/8/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(9,553,'29/8/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(9,555,'21/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(9,473,'11/9/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(10,14,'21/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(10,302,'29/4/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(11,335,'26/5/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(11,95,'20/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(11,18,'20/6/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(11,602,'19/3/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(12,599,'23/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(12,443,'4/3/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(12,55,'27/1/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(12,43,'8/6/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(12,88,'4/9/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(13,260,'7/8/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(13,540,'1/10/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(13,499,'8/6/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(14,190,'7/5/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(15,388,'22/11/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(15,451,'16/3/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(15,384,'28/4/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(16,257,'9/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(16,327,'13/4/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(17,517,'2/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(17,48,'23/9/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(17,619,'19/8/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(17,25,'8/6/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(18,69,'11/8/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(19,91,'4/1/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(19,104,'1/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(19,415,'5/1/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(19,375,'26/4/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(20,357,'15/3/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(20,409,'12/4/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(20,588,'24/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(20,478,'10/7/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(21,46,'17/6/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(21,343,'7/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(22,73,'2/2/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(22,615,'2/2/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(22,450,'4/10/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(23,261,'23/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(23,182,'20/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(23,392,'28/9/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(24,85,'20/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(24,66,'21/3/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(24,564,'12/10/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(25,529,'11/6/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(26,367,'14/6/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(26,530,'27/7/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(27,532,'17/2/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(27,470,'5/7/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(27,562,'7/9/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(27,433,'16/7/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(28,441,'15/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(28,20,'10/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(28,354,'26/8/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(29,428,'20/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(29,482,'3/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(29,164,'10/2/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(30,208,'13/4/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(31,463,'5/4/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(31,140,'25/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(31,180,'29/11/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(32,192,'28/5/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(32,249,'17/10/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(33,121,'17/4/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(34,539,'12/10/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(34,198,'9/3/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(35,225,'27/3/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(35,109,'15/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(35,389,'3/1/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(36,229,'27/7/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(36,297,'16/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(36,488,'10/6/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(36,234,'17/4/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(36,104,'28/6/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(37,199,'5/10/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(37,395,'18/11/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(38,420,'9/2/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(38,244,'13/9/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(39,508,'15/2/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(40,38,'29/3/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(41,16,'18/5/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(41,486,'6/4/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(41,328,'22/7/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(41,402,'26/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(41,4,'17/2/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(42,387,'26/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(43,31,'5/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(43,45,'20/3/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(43,58,'2/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(43,129,'7/7/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(44,389,'4/2/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(45,492,'24/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(45,480,'25/5/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(45,485,'5/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(45,9,'4/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(45,35,'4/10/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(46,245,'2/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(46,509,'22/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(46,196,'3/10/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(47,42,'22/4/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(47,515,'16/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(47,455,'26/9/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(48,213,'22/1/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(48,571,'13/4/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(49,361,'27/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(49,28,'9/9/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(49,67,'12/6/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(50,549,'21/6/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(50,245,'23/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(50,74,'4/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(51,124,'29/6/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(51,49,'10/3/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(51,111,'16/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(51,380,'17/7/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(52,509,'8/5/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(52,258,'18/9/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(53,286,'7/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(53,258,'8/9/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(53,612,'10/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(53,609,'13/8/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(53,573,'2/4/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(54,393,'18/7/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(54,6,'17/4/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(55,462,'13/8/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(55,251,'6/4/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(55,588,'7/3/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(55,61,'3/4/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(55,135,'14/4/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(56,442,'11/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(56,28,'15/3/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(56,241,'23/2/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(57,6,'14/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(57,97,'10/5/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(57,213,'3/6/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(57,298,'23/11/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(58,310,'17/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(58,141,'2/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(58,513,'13/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(58,183,'12/8/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(59,69,'3/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(59,620,'1/2/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(60,111,'23/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(60,584,'20/1/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(61,373,'11/3/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(61,94,'25/2/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(61,596,'22/6/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(61,302,'19/10/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(62,196,'2/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(62,249,'16/2/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(62,115,'14/10/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(62,161,'23/9/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(63,109,'21/7/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(63,72,'24/1/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(63,567,'19/9/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(63,261,'12/9/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(64,343,'23/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(65,4,'13/10/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(66,107,'25/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(66,318,'26/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(66,285,'8/8/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(67,419,'24/4/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(67,123,'17/8/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(67,605,'8/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(67,215,'17/8/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(68,363,'24/6/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(68,165,'5/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(68,119,'29/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(68,505,'1/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(68,486,'15/9/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(69,431,'7/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(69,175,'20/1/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(70,369,'14/5/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(71,264,'16/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(71,148,'20/2/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(71,441,'29/4/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(71,117,'13/11/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(72,472,'26/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(72,542,'5/1/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(72,64,'6/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(72,248,'3/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(72,95,'9/10/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(73,401,'26/7/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(73,538,'8/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(73,369,'20/2/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(73,394,'10/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(73,471,'20/5/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(74,20,'10/3/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(74,11,'13/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(74,9,'2/5/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(75,132,'20/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(75,606,'28/9/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(75,609,'29/1/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(75,202,'24/7/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(76,410,'29/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(77,422,'4/4/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(77,328,'7/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(77,361,'29/3/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(78,579,'24/8/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(78,423,'8/5/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(78,586,'17/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(78,101,'26/5/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(79,430,'29/3/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(79,397,'21/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(80,523,'21/10/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(80,213,'22/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(80,512,'24/1/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(81,14,'19/9/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(82,535,'28/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(82,464,'20/5/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(82,138,'28/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(82,165,'20/3/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(82,355,'25/4/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(83,62,'14/9/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(83,146,'20/9/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(84,419,'18/8/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(84,615,'14/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(84,2,'2/1/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(85,313,'6/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(85,354,'21/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(85,38,'24/5/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(85,149,'13/7/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(85,530,'22/5/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(86,69,'11/4/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(87,134,'10/5/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(87,402,'28/9/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(87,30,'23/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(87,245,'4/10/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(87,387,'22/10/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(88,144,'17/11/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(89,51,'9/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(89,489,'21/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(89,7,'22/6/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(90,526,'25/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(90,367,'18/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(90,153,'2/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(90,135,'23/7/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(91,249,'27/8/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(92,6,'7/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(92,406,'9/10/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(92,49,'29/1/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(93,199,'21/7/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(93,259,'17/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(93,354,'1/5/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(94,461,'10/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(94,420,'5/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(94,49,'19/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(94,296,'29/3/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(95,564,'21/2/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(95,376,'7/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(95,424,'6/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(95,288,'7/6/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(96,48,'2/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(96,130,'19/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(96,197,'27/6/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(97,276,'26/6/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(97,359,'10/9/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(97,450,'26/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(98,234,'23/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(98,211,'26/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(98,351,'29/10/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(99,295,'27/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(100,522,'26/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(100,207,'26/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(100,357,'22/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(100,81,'28/7/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(100,29,'3/6/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(101,258,'14/1/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(102,499,'1/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(102,387,'22/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(102,369,'29/8/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(103,487,'12/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(103,293,'7/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(103,196,'20/2/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(103,392,'6/10/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(103,278,'4/7/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(104,375,'27/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(104,129,'24/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(104,423,'9/9/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(105,43,'1/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(105,199,'16/10/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(106,589,'25/6/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(106,242,'14/6/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(107,361,'9/11/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(108,438,'13/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(108,179,'17/5/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(108,127,'19/6/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(109,578,'21/6/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(109,153,'4/4/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(110,77,'12/4/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(111,564,'8/4/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(111,185,'12/5/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(111,338,'5/11/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(111,108,'15/9/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(112,579,'9/1/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(113,350,'2/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(114,388,'10/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(114,576,'8/10/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(114,435,'21/4/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(114,467,'29/2/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(114,257,'22/9/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(115,26,'24/9/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(115,307,'29/6/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(116,608,'20/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(116,97,'10/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(116,432,'6/7/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(117,523,'24/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(117,168,'3/9/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(117,353,'9/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(117,504,'25/5/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(118,423,'26/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(118,303,'28/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(118,353,'22/6/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(118,493,'13/3/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(119,142,'27/5/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(119,473,'28/9/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(119,132,'26/6/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(120,87,'23/10/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(120,102,'22/9/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(121,386,'7/2/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(121,318,'16/10/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(121,12,'2/5/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(121,170,'1/9/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(122,149,'25/6/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(122,293,'10/8/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(122,456,'15/3/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(123,475,'26/8/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(123,197,'27/7/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(124,41,'3/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(125,513,'23/7/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(125,528,'11/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(125,588,'6/9/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(126,257,'11/1/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(126,434,'17/5/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(127,281,'7/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(127,36,'15/3/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(128,606,'19/7/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(128,448,'2/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(128,497,'6/6/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(129,593,'23/11/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(130,181,'28/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(130,461,'28/1/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(130,127,'9/10/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(131,593,'6/8/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(131,155,'1/7/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(131,115,'4/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(132,114,'28/10/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(133,533,'19/9/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(133,39,'8/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(133,8,'14/8/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(134,124,'5/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(134,127,'11/5/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(135,293,'22/11/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(136,298,'13/10/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(136,606,'10/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(136,186,'21/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(136,43,'6/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(136,450,'19/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(137,252,'21/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(137,457,'18/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(137,329,'2/7/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(138,282,'1/10/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(139,574,'6/11/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(140,79,'1/4/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(140,396,'29/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(140,129,'22/6/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(140,501,'24/10/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(141,65,'19/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(141,92,'6/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(141,414,'25/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(141,343,'6/6/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(142,62,'29/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(142,430,'10/10/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(142,91,'6/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(142,392,'20/7/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(142,71,'24/3/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(143,368,'4/8/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(143,532,'18/1/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(143,399,'24/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(143,263,'18/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(143,560,'13/5/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(144,384,'9/3/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(144,368,'11/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(144,614,'24/5/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(145,254,'9/4/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(145,493,'22/4/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(145,459,'11/4/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(145,345,'9/11/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(145,384,'22/5/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(146,303,'21/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(146,388,'18/9/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(147,63,'28/5/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(147,458,'24/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(147,314,'7/8/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(147,400,'26/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(147,130,'27/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(148,214,'13/5/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(148,434,'13/3/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(149,446,'4/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(149,303,'4/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(149,574,'12/8/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(150,83,'4/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(150,215,'18/7/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(150,385,'8/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(151,32,'25/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(151,381,'23/8/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(151,103,'2/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(151,372,'19/8/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(152,150,'26/11/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(152,132,'11/1/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(152,185,'9/1/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(152,56,'5/8/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(153,305,'17/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(153,490,'5/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(153,356,'4/5/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(153,146,'9/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(153,473,'15/10/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(154,471,'2/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(154,373,'25/6/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(154,324,'25/1/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(154,176,'6/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(155,471,'13/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(155,335,'10/11/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(156,139,'10/7/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(157,381,'1/8/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(157,234,'8/4/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(158,335,'7/3/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(158,479,'1/9/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(158,580,'27/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(158,232,'23/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(158,440,'26/6/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(159,165,'14/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(159,614,'4/2/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(160,445,'12/6/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(160,495,'2/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(160,276,'19/8/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(160,384,'7/7/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(161,151,'3/9/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(161,305,'25/8/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(162,438,'1/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(163,555,'5/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(163,438,'3/8/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(163,580,'24/2/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(163,48,'25/4/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(163,140,'25/5/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(164,363,'7/7/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(164,384,'7/2/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(165,317,'14/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(165,143,'27/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(165,469,'16/6/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(165,43,'6/11/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(166,318,'14/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(166,500,'29/7/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(167,600,'15/4/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(168,352,'6/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(168,114,'4/6/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(169,450,'29/11/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(169,601,'12/10/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(169,586,'13/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(169,424,'16/8/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(169,458,'1/11/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(170,160,'9/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(170,266,'14/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(171,562,'6/6/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(172,255,'14/7/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(172,278,'17/4/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(172,271,'14/11/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(173,310,'10/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(173,594,'11/5/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(174,1,'18/5/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(174,260,'10/7/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(174,74,'22/7/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(174,92,'25/9/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(174,436,'21/3/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(175,558,'8/8/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(175,588,'7/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(175,543,'4/3/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(176,67,'19/11/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(177,480,'18/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(178,383,'1/1/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(179,53,'22/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(179,148,'23/5/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(179,91,'5/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(179,397,'13/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(179,611,'16/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(180,87,'21/8/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(181,453,'19/3/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(181,501,'1/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(181,215,'2/6/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(181,388,'26/11/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(181,255,'2/2/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(182,279,'15/1/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(182,41,'8/10/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(183,315,'25/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(183,597,'7/4/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(184,378,'8/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(184,60,'13/1/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(185,61,'22/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(185,503,'27/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(185,335,'18/6/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(185,608,'17/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(185,130,'27/2/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(186,379,'1/2/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(186,16,'14/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(186,572,'8/4/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(187,568,'13/3/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(187,400,'10/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(187,491,'17/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(187,245,'6/3/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(188,344,'12/6/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(188,156,'28/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(188,150,'17/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(188,580,'17/5/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(189,14,'19/7/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(190,392,'8/1/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(190,566,'10/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(190,437,'23/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(190,85,'25/8/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(191,600,'7/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(192,415,'21/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(192,122,'24/8/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(192,247,'11/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(192,55,'8/8/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(193,377,'10/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(193,159,'2/9/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(194,71,'21/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(194,54,'9/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(194,454,'25/6/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(195,134,'16/5/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(196,252,'22/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(196,140,'4/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(196,393,'18/9/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(197,171,'11/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(197,502,'28/11/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(198,613,'8/6/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(198,41,'22/3/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(198,213,'23/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(198,90,'28/7/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(199,6,'3/11/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(200,20,'28/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(200,30,'12/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(200,46,'17/11/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(200,24,'1/6/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(200,469,'22/6/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(201,388,'2/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(201,439,'26/6/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(202,49,'10/3/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(202,404,'19/7/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(203,72,'13/10/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(203,220,'18/10/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(203,261,'3/11/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(203,32,'28/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(203,325,'28/9/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(204,140,'25/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(204,295,'13/5/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(204,4,'25/11/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(204,154,'23/4/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(204,600,'13/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(205,438,'7/8/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(206,418,'13/7/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(206,400,'6/2/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(206,64,'16/7/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(207,33,'3/9/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(207,123,'21/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(207,49,'24/1/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(208,233,'21/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(208,175,'1/1/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(208,354,'25/2/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(209,276,'13/9/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(209,68,'10/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(209,103,'15/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(209,362,'9/6/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(209,62,'14/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(210,418,'7/4/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(210,451,'29/7/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(210,231,'6/5/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(210,180,'8/3/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(210,110,'24/2/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(211,153,'24/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(211,373,'12/7/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(211,270,'18/10/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(211,157,'2/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(212,58,'28/3/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(212,55,'14/9/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(212,214,'27/7/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(213,135,'14/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(213,421,'4/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(213,466,'1/1/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(213,301,'22/4/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(213,481,'19/2/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(214,269,'14/9/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(214,130,'26/3/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(214,446,'14/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(214,250,'28/11/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(215,583,'3/8/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(215,477,'3/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(215,362,'20/8/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(215,310,'28/6/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(216,226,'9/3/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(217,63,'19/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(217,2,'13/7/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(217,461,'10/2/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(217,544,'23/4/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(218,455,'12/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(218,251,'7/7/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(219,210,'12/10/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(219,371,'2/2/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(219,403,'9/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(219,430,'14/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(219,24,'21/11/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(220,223,'17/4/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(221,254,'21/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(221,323,'10/1/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(221,447,'24/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(221,103,'10/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(221,96,'2/11/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(222,172,'16/10/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(222,411,'17/10/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(222,241,'24/11/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(222,164,'18/10/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(223,134,'8/2/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(224,340,'3/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(224,190,'16/10/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(225,441,'26/3/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(225,35,'25/4/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(225,484,'12/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(226,35,'22/9/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(226,22,'22/3/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(226,27,'5/4/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(227,200,'1/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(227,70,'2/2/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(227,310,'20/6/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(227,334,'28/10/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(227,97,'11/10/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(228,325,'4/9/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(229,310,'7/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(229,67,'3/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(229,509,'23/5/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(230,586,'2/4/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(231,291,'21/3/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(232,601,'22/4/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(232,415,'5/10/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(232,377,'17/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(232,365,'20/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(232,567,'11/7/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(233,153,'21/5/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(234,378,'26/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(235,411,'21/8/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(235,521,'3/9/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(235,264,'20/4/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(236,211,'25/11/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(236,273,'27/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(236,174,'4/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(236,135,'6/8/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(236,562,'6/1/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(237,466,'12/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(237,478,'2/1/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(238,362,'6/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(238,500,'2/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(238,219,'24/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(238,582,'16/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(239,575,'2/1/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(240,454,'1/5/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(240,532,'5/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(240,458,'29/9/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(240,578,'15/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(240,231,'26/4/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(241,36,'9/5/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(241,426,'11/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(241,55,'16/4/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(241,523,'5/9/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(242,169,'21/1/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(242,549,'23/8/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(243,606,'20/10/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(243,143,'7/3/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(243,165,'6/5/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(244,332,'28/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(244,536,'20/7/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(244,306,'23/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(244,222,'10/7/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(244,466,'28/6/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(245,467,'13/10/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(245,282,'24/11/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(245,311,'20/7/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(246,39,'8/3/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(247,464,'23/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(247,498,'23/9/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(247,520,'16/4/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(247,564,'21/6/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(247,173,'6/8/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(248,365,'14/11/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(248,314,'29/10/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(248,292,'15/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(248,569,'6/7/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(249,99,'10/11/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(249,555,'7/11/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(249,459,'24/6/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(249,330,'15/1/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(249,131,'25/6/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(250,192,'12/2/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(250,84,'5/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(250,365,'26/6/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(251,40,'17/6/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(251,159,'23/2/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(251,221,'12/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(251,500,'21/9/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(252,86,'26/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(252,172,'28/8/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(252,45,'5/7/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(253,251,'10/1/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(253,123,'29/6/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(253,555,'14/8/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(253,593,'21/1/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(254,505,'22/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(254,243,'2/11/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(254,451,'2/7/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(254,322,'15/9/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(255,32,'16/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(255,231,'18/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(255,100,'26/3/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(255,372,'4/1/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(255,177,'18/6/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(256,313,'12/7/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(256,15,'29/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(256,204,'10/8/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(257,370,'19/5/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(258,330,'25/11/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(258,372,'8/5/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(258,163,'6/7/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(258,425,'4/9/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(258,106,'27/8/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(259,574,'10/8/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(260,384,'2/5/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(261,610,'21/7/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(261,373,'18/11/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(261,494,'23/2/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(261,304,'8/8/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(262,346,'27/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(262,173,'9/11/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(262,83,'15/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(262,458,'23/5/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(262,284,'2/8/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(263,295,'5/7/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(263,227,'7/2/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(264,590,'2/4/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(264,213,'7/5/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(264,92,'22/8/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(265,554,'25/8/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(265,170,'10/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(265,74,'22/1/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(266,326,'19/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(266,296,'5/4/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(267,612,'22/6/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(267,493,'12/4/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(267,51,'8/8/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(267,113,'14/6/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(267,250,'6/1/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(268,287,'9/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(268,124,'1/7/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(269,56,'18/1/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(269,259,'10/6/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(269,200,'29/6/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(270,273,'3/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(270,583,'17/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(270,113,'21/5/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(271,364,'26/7/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(271,21,'5/11/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(272,143,'6/3/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(272,101,'5/8/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(272,139,'2/4/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(272,42,'3/9/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(272,58,'22/1/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(273,303,'9/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(273,441,'2/8/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(273,44,'8/3/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(273,269,'11/1/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(274,558,'22/5/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(274,467,'27/4/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(274,312,'11/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(274,189,'23/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(274,170,'10/3/2015');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(275,544,'22/1/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(275,156,'29/3/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(275,202,'1/1/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(276,570,'12/3/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(276,587,'23/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(276,256,'15/2/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(276,181,'28/10/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(277,558,'29/11/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(277,267,'29/9/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(277,254,'7/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(277,414,'12/5/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(277,404,'17/11/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(278,219,'23/7/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(278,161,'25/4/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(278,158,'13/5/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(278,573,'20/4/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(278,123,'2/8/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(279,84,'19/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(279,22,'23/2/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(279,611,'27/3/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(280,57,'28/2/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(280,214,'4/2/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(281,470,'7/7/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(281,335,'12/3/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(281,178,'24/10/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(281,77,'16/3/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(282,390,'17/5/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(283,22,'28/11/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(284,33,'1/2/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(285,382,'23/5/2019');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(286,331,'15/6/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(286,438,'7/9/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(286,162,'6/1/2012');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(287,244,'23/9/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(287,41,'18/1/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(288,56,'26/7/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(288,598,'25/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(288,302,'27/2/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(288,237,'18/10/2011');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(289,521,'27/2/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(290,308,'2/2/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(291,377,'9/2/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(291,239,'15/4/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(291,369,'15/11/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(292,411,'26/10/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(292,313,'26/6/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(292,249,'10/5/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(292,140,'4/1/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(292,497,'20/10/2013');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(293,482,'14/6/2014');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(293,297,'9/3/2017');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(293,35,'21/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(293,90,'7/5/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(293,527,'25/11/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(294,419,'16/9/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(294,533,'5/7/2010');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(295,471,'4/8/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(295,601,'20/3/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(296,116,'5/6/2013');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(296,435,'9/3/2016');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(296,353,'27/9/2018');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(296,528,'7/3/2017');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(297,136,'29/5/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(297,8,'25/7/2014');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(298,435,'12/9/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(298,58,'26/11/2019');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(298,349,'13/7/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(298,49,'26/4/2016');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(299,619,'14/2/2015');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(299,15,'5/6/2012');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(299,390,'2/9/2018');

INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(300,62,'6/5/2010');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(300,537,'5/10/2011');
INSERT INTO PRODUTOS_CLIENTES(cps_cli_id, cps_pdt_id,cps_data_compra) VALUES(300,336,'16/4/2015');






/*************************** 
  TODO - Insert sleeves
****************************/
INSERT INTO SLEEVES(slv_marca, slv_pdt_id)
VALUES
    ('Ultra-Pro',1);

INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(321, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(322, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(323, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(324, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(325, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(326, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(327, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(328, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(329, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(330, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(331, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(332, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(333, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(334, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(335, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(336, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(337, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(338, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(339, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(340, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(341, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(342, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(343, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(344, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(345, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(346, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(347, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(348, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(349, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(350, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(351, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(352, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(353, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(354, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(355, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(356, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(357, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(358, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(359, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(360, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(361, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(362, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(363, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(364, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(365, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(366, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(367, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(368, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(369, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(370, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(371, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(372, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(373, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(374, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(375, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(376, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(377, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(378, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(379, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(380, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(381, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(382, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(383, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(384, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(385, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(386, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(387, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(388, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(389, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(390, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(391, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(392, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(393, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(394, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(395, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(396, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(397, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(398, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(399, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(400, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(401, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(402, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(403, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(404, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(405, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(406, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(407, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(408, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(409, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(410, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(411, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(412, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(413, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(414, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(415, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(416, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(417, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(418, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(419, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(420, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(421, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(422, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(423, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(424, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(425, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(426, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(427, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(428, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(429, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(430, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(431, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(432, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(433, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(434, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(435, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(436, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(437, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(438, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(439, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(440, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(441, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(442, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(443, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(444, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(445, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(446, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(447, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(448, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(449, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(450, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(451, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(452, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(453, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(454, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(455, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(456, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(457, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(458, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(459, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(460, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(461, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(462, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(463, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(464, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(465, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(466, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(467, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(468, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(469, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(470, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(471, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(472, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(473, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(474, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(475, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(476, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(477, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(478, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(479, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(480, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(481, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(482, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(483, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(484, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(485, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(486, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(487, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(488, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(489, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(490, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(491, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(492, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(493, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(494, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(495, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(496, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(497, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(498, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(499, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(500, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(501, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(502, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(503, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(504, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(505, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(506, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(507, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(508, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(509, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(510, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(511, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(512, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(513, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(514, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(515, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(516, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(517, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(518, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(519, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(520, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(521, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(522, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(523, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(524, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(525, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(526, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(527, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(528, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(529, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(530, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(531, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(532, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(533, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(534, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(535, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(536, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(537, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(538, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(539, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(540, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(541, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(542, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(543, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(544, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(545, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(546, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(547, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(548, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(549, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(550, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(551, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(552, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(553, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(554, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(555, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(556, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(557, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(558, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(559, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(560, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(561, 'ojama sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(562, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(563, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(564, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(565, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(566, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(567, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(568, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(569, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(570, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(571, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(572, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(573, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(574, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(575, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(576, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(577, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(578, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(579, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(580, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(581, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(582, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(583, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(584, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(585, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(586, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(587, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(588, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(589, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(590, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(591, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(592, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(593, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(594, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(595, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(596, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(597, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(598, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(599, 'wizard senior');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(600, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(601, 'Marcio 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(602, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(603, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(604, 'Lucas 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(605, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(606, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(607, 'KMC');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(608, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(609, '6 is 10');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(610, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(611, 'crystal dragon');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(612, 'fatec sleeve');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(613, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(614, 'Ultra Pro');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(615, 'Dragon shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(616, 'Mari the best teacher');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(617, 'Gabriel 4 MVP');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(618, 'konami shield');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(619, 'Elementar protect');
INSERT INTO SLEEVES(slv_pdt_id, slv_marca) VALUES(620, 'wizard senior');

/*************************** 
  TODO - Insert PLAYMATCHES
****************************/
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 13);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 14);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Verde', 15);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 16);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Majenta', 17);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 18);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 19);
INSERT INTO PLAYMATCHS(plt_tamaho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 20);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 21);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 22);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Roxo', 23);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 24);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 25);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 26);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 27);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 28);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 29);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 30);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 31);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 32);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 33);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 34);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 35);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 36);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 37);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 38);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 39);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 40);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 41);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 42);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 43);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 44);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Amarelo', 45);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 46);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Verde', 47);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 48);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 49);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 50);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 51);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 52);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 53);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 54);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 55);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 56);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 57);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Vermelho', 58);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 59);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 60);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 61);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 62);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 63);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 64);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 65);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 66);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 67);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 68);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 69);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Verde', 70);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 71);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 72);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 73);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 74);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 75);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 76);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 77);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 78);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Amarelo', 79);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 80);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Verde', 81);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 82);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 83);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 84);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 85);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 86);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 87);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 88);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 89);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 90);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 91);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 92);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 93);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 94);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 95);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 96);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 97);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 98);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 99);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 100);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 101);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 102);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 103);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 104);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 105);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 106);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 107);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 108);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 109);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 110);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 111);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 112);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 113);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 114);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Azul', 115);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 116);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Ciano', 117);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 118);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 119);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 120);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 121);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 122);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 123);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 124);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 125);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 126);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 127);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 128);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 129);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 130);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 131);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 132);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 133);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 134);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 135);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 136);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 137);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 138);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 139);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 140);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 141);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 142);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 143);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 144);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 145);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 146);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 147);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 148);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 149);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 150);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 151);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 152);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 153);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 154);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 155);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Azul', 156);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 157);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 158);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 159);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 160);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 161);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 162);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 163);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 164);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 165);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Ciano', 166);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 167);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 168);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 169);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Ciano', 170);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Vermelho', 171);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 172);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 173);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 174);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 175);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 176);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 177);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Vermelho', 178);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 179);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 180);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 181);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 182);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 183);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 184);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 185);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Ciano', 186);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 187);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Azul', 188);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 189);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 190);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 191);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 192);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 193);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 194);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 195);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 196);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 197);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 198);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 199);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 200);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 201);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Roxo', 202);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 203);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 204);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Ciano', 205);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 206);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 207);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 208);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 209);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 210);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Roxo', 211);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 212);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 213);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Preto', 214);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Verde', 215);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 216);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 217);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 218);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 219);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 220);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 221);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 222);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 223);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 224);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 225);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 226);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Azul', 227);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 228);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Verde', 229);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 230);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 231);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 232);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 233);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 234);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 235);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 236);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 237);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 238);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 239);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 240);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 241);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 242);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Verde', 243);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 244);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Majenta', 245);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Majenta', 246);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 247);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Amarelo', 248);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 249);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 250);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 251);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 252);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 253);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Vermelho', 254);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 255);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Roxo', 256);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 257);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 258);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 259);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 260);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Violeta', 261);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 262);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 263);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Violeta', 264);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 265);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 266);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 267);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 268);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 269);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 270);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 271);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Ciano', 272);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 273);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 274);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 275);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Ciano', 276);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 277);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 278);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 279);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Majenta', 280);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 281);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 282);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 283);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 284);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Azul', 285);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 286);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'branco', 287);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 288);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 289);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 290);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Majenta', 291);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Vermelho', 292);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 293);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Amarelo', 294);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 295);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Laranja', 296);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 297);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'branco', 298);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Amarelo', 299);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Laranja', 300);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Verde', 301);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Verde', 302);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 303);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 304);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 305);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 306);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Laranja', 307);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Ciano', 308);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Roxo', 309);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Preto', 310);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Vermelho', 311);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Violeta', 312);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'branco', 313);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Verde', 314);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 315);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Vermelho', 316);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Medio', 'Azul', 317);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Azul', 320);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Pequeno', 'Preto', 318);
INSERT INTO PLAYMATCHS(plt_tamanho, plt_cor,plt_pdt_id) VALUES ('Grande', 'Azul', 319);

/*************************** 
  TODO - Insert colecoes
****************************/
INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES
    ('The dark side of dimensions',1);
    
INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES
    ('Phantom Darkness GX3 ',2);
    
INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Crossroads of Chaos 5D1',3);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Raging Battle 5D1',4);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('The Shining Darkness ',5);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Hidden Arsenal 2 5D1',6);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Duelist Revolution 5D1',7);


INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Starstrike Blast 5D1',8);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Hidden Arsenal 3 5D1 ',9);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Magic Ruler ',10);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Legacy of Darkness ',11);

INSERT INTO COLECOES(col_tema, col_pdt_id)
VALUES('Pharaonic Guardian ',12);





/*************************** 
  TODO - Insert CARTAS
****************************/
    /*FIXME xyz*/
/*************************** 
  TODO - Insert CARTAS XYZ
****************************/INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Dweller ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 1 , 1 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Adreus  Keeper of Armageddon ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 2 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Aegaion the Sea Castrum ' , ' WATER ' , ' Machine ' , ' teste ' , 3 , 3 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Alchemic Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 4 , 4 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Alsei  the Sylvan High Protector ' , ' LIGHT ' , ' Plant ' , ' teste ' , 5 , 5 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Armored Kappa ' , ' WATER ' , ' Psychic ' , ' teste ' , 6 , 6 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Artifact Durendal ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 7 , 7 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Artorigus  King of the Noble Knights ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 8 , 8 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Baby Tiragon ' , ' EARTH ' , ' Dragon ' , ' teste ' , 9 , 9 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bahamut Shark ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 10 , 10 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Battlecruiser Dianthus ' , ' EARTH ' , ' Plant ' , ' teste ' , 11 , 11 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Battlin Boxer Cheat Commissioner ' , ' FIRE ' , ' Warrior ' , ' teste ' , 12 , 12 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Battlin Boxer Lead Yoke ' , ' FIRE ' , ' Warrior ' , ' teste ' , 1 , 13 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Beatrice  Lady of the Eternal ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 2 , 14 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Black Ray Lancer ' , ' DARK ' , ' Beast-Warrior ' , ' teste ' , 3 , 15 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Blade Armor Ninja ' , ' WIND ' , ' Warrior ' , ' teste ' , 4 , 16 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Brotherhood of the Fire Fist - Cardinal ' , ' FIRE ' , ' Beast-Warrior ' , ' teste ' , 5 , 17 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Brotherhood of the Fire Fist - Lion Emperor ' , ' FIRE ' , ' Beast-Warrior ' , ' teste ' , 6 , 18 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Brotherhood of the Fire Fist - Tiger King ' , ' FIRE ' , ' Beast-Warrior ' , ' teste ' , 7 , 19 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bujinki Amaterasu ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 8 , 20 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bujintei Kagutsuchi ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 9 , 21 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bujintei Susanowo ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 10 , 22 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bujintei Tsukuyomi ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 11 , 23 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cairngorgon  Antiluminescent Knight ' , ' DARK ' , ' Rock ' , ' teste ' , 12 , 24 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Castel  the Skyblaster Musketeer ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 1 , 25 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cat Shark ' , ' WATER ' , ' Beast ' , ' teste ' , 2 , 26 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chronomaly Crystal Chrononaut ' , ' LIGHT ' , ' Psychic ' , ' teste ' , 3 , 27 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Coach King Giantrainer ' , ' FIRE ' , ' Warrior ' , ' teste ' , 4 , 28 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Comics Hero King Arthur ' , ' EARTH ' , ' Warrior ' , ' teste ' , 5 , 29 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Constellar Hyades ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 6 , 30 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Constellar Omega ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 7 , 31 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Constellar Pleiades ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 8 , 32 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Constellar Praesepe ' , ' LIGHT ' , ' Machine ' , ' teste ' , 9 , 33 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Constellar Ptolemy M7 ' , ' LIGHT ' , ' Machine ' , ' teste ' , 10 , 34 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Crimson Knight Vampire Bram ' , ' DARK ' , ' Zombie ' , ' teste ' , 11 , 35 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Barian Hope ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 12 , 36 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Battleship Cherry Blossom ' , ' EARTH ' , ' Plant ' , ' teste ' , 1 , 37 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Coach Lord Ultimatrainer ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 38 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Comics Hero Legend Arthur ' , ' EARTH ' , ' Warrior ' , ' teste ' , 3 , 39 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Dark Fairy Cheer Girl ' , ' DARK ' , ' Fairy ' , ' teste ' , 4 , 40 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Mechquipped Djinn Angeneral ' , ' DARK ' , ' Fairy ' , ' teste ' , 5 , 41 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Simon the Great Moral Leader ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 6 , 42 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' CXyz Skypalace Babylon ' , ' WIND ' , ' Machine ' , ' teste ' , 7 , 43 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber Dragon Infinity ' , ' LIGHT ' , ' Machine ' , ' teste ' , 8 , 44 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber Dragon Nova ' , ' LIGHT ' , ' Machine ' , ' teste ' , 9 , 45 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Duo-Dawn King Kali Yuga ' , ' DARK ' , ' Fiend ' , ' teste ' , 10 , 46 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Marksman King Tell ' , ' DARK ' , ' Fiend ' , ' teste ' , 11 , 47 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Stone King Darius ' , ' EARTH ' , ' Fiend ' , ' teste ' , 12 , 48 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Super Doom King Dark Armageddon ' , ' DARK ' , ' Fish ' , ' teste ' , 1 , 49 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Wave High King Caesar ' , ' WATER ' , ' Fiend ' , ' teste ' , 2 , 50 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Wave King Caesar ' , ' WATER ' , ' Fiend ' , ' teste ' , 3 , 51 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Daigusto Emeral ' , ' WIND ' , ' Rock ' , ' teste ' , 4 , 52 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Daigusto Phoenix ' , ' WIND ' , ' Pyro ' , ' teste ' , 5 , 53 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dante  Traveler of the Burning Abyss ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 6 , 54 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Rebellion Xyz Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 7 , 55 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Requiem Xyz Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 8 , 56 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Darktellarknight Batlamyus ' , ' DARK ' , ' Warrior ' , ' teste ' , 9 , 57 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dhampir Vampire Sheridan ' , ' DARK ' , ' Zombie ' , ' teste ' , 10 , 58 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Diamond Dire Wolf ' , ' EARTH ' , ' Beast ' , ' teste ' , 11 , 59 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Digital Bug Corebage ' , ' LIGHT ' , ' Insect ' , ' teste ' , 12 , 60 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Digital Bug Rhinosebus ' , ' LIGHT ' , ' Insect ' , ' teste ' , 1 , 61 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Digital Bug Scaradiator ' , ' LIGHT ' , ' Insect ' , ' teste ' , 2 , 62 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Digvorzhak  King of Heavy Industry ' , ' EARTH ' , ' Machine ' , ' teste ' , 3 , 63 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Disdainful Bird of Paradise ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 4 , 64 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Divine Dragon Knight Felgrand ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 5 , 65 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Downerd Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 6 , 66 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ebon High Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 7 , 67 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ebon Illusion Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 8 , 68 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Empress of Prophecy ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 9 , 69 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evigishki Merrowgeist ' , ' WATER ' , ' Aqua ' , ' teste ' , 10 , 70 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evilswarm Bahamut ' , ' DARK ' , ' Dragon ' , ' teste ' , 11 , 71 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evilswarm Exciton Knight ' , ' LIGHT ' , ' Fiend ' , ' teste ' , 12 , 72 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evilswarm Nightmare ' , ' DARK ' , ' Fiend ' , ' teste ' , 1 , 73 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evilswarm Ophion ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 74 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evilswarm Ouroboros ' , ' DARK ' , ' Dragon ' , ' teste ' , 3 , 75 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evilswarm Thanatos ' , ' DARK ' , ' Fiend ' , ' teste ' , 4 , 76 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evolzar Dolkka ' , ' FIRE ' , ' Dragon ' , ' teste ' , 5 , 77 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evolzar Laggia ' , ' FIRE ' , ' Dragon ' , ' teste ' , 6 , 78 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evolzar Solda ' , ' FIRE ' , ' Dragon ' , ' teste ' , 7 , 79 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' E�?™HERO Pit Boss ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 8 , 80 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fairy Cheer Girl ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 9 , 81 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fairy King Albverdich ' , ' EARTH ' , ' Plant ' , ' teste ' , 10 , 82 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fairy Knight Ingunar ' , ' EARTH ' , ' Plant ' , ' teste ' , 11 , 83 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Full Armored Black Ray Lancer ' , ' WATER ' , ' Beast-Warrior ' , ' teste ' , 12 , 84 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Full Armored Crystalzero Lancer ' , ' WATER ' , ' Warrior ' , ' teste ' , 1 , 85 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gachi Gachi Gantetsu ' , ' EARTH ' , ' Rock ' , ' teste ' , 2 , 86 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gagaga Cowboy ' , ' EARTH ' , ' Warrior ' , ' teste ' , 3 , 87 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gagaga Samurai ' , ' EARTH ' , ' Warrior ' , ' teste ' , 4 , 88 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gagagigo the Risen ' , ' WATER ' , ' Reptile ' , ' teste ' , 5 , 89 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gaia Dragon  the Thunder Charger ' , ' WIND ' , ' Dragon ' , ' teste ' , 6 , 90 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Galaxy Stealth Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 7 , 91 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Galaxy-Eyes Cipher Blade Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 8 , 92 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Galaxy-Eyes Cipher Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 9 , 93 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Galaxy-Eyes Full Armor Photon Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 10 , 94 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gauntlet Launcher ' , ' EARTH ' , ' Warrior ' , ' teste ' , 11 , 95 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gear Gigant X ' , ' EARTH ' , ' Machine ' , ' teste ' , 12 , 96 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Geargiagear Gigant XG ' , ' EARTH ' , ' Machine ' , ' teste ' , 1 , 97 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gem-Knight Pearl ' , ' EARTH ' , ' Rock ' , ' teste ' , 2 , 98 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ghostrick Alucard ' , ' DARK ' , ' Zombie ' , ' teste ' , 3 , 99 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ghostrick Angel of Mischief ' , ' DARK ' , ' Fairy ' , ' teste ' , 4 , 100 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ghostrick Dullahan ' , ' DARK ' , ' Fiend ' , ' teste ' , 5 , 101 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ghostrick Socuteboss ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 6 , 102 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Giant Soldier of Steel ' , ' EARTH ' , ' Rock ' , ' teste ' , 7 , 103 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Googly-Eyes Drum Dragon ' , ' EARTH ' , ' Machine ' , ' teste ' , 8 , 104 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gorgonic Guardian ' , ' DARK ' , ' Rock ' , ' teste ' , 9 , 105 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Grandopolis  The Eternal Golden City ' , ' LIGHT ' , ' Machine ' , ' teste ' , 10 , 106 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Grenosaurus ' , ' FIRE ' , ' Dinosaur ' , ' teste ' , 11 , 107 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Harpies Pet Phantasmal Dragon ' , ' WIND ' , ' Dragon ' , ' teste ' , 12 , 108 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Hazy Flame Basiltrice ' , ' FIRE ' , ' Pyro ' , ' teste ' , 1 , 109 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Heavy Armored Train Ironwolf ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 110 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Herald of Pure Light ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 3 , 111 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Heroic Champion - Excalibur ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 4 , 112 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Heroic Champion - Gandiva ' , ' EARTH ' , ' Warrior ' , ' teste ' , 5 , 113 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Heroic Champion - Kusanagi ' , ' EARTH ' , ' Warrior ' , ' teste ' , 6 , 114 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Hieratic Dragon King of Atum ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 7 , 115 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Hieratic Sun Dragon Overlord of Heliopolis ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 8 , 116 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Hierophant of Prophecy ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 9 , 117 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Humhumming the Key Djinn ' , ' WATER ' , ' Fiend ' , ' teste ' , 10 , 118 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ice Beast Zerofyne ' , ' WATER ' , ' Winged Beast ' , ' teste ' , 11 , 119 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ice Princess Zereort ' , ' WATER ' , ' Winged Beast ' , ' teste ' , 12 , 120 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Infernal Flame Vixen ' , ' FIRE ' , ' Pyro ' , ' teste ' , 1 , 121 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Inzektor Exa-Beetle ' , ' DARK ' , ' Insect ' , ' teste ' , 2 , 122 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Inzektor Exa-Stag ' , ' DARK ' , ' Insect ' , ' teste ' , 3 , 123 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kachi Kochi Dragon ' , ' EARTH ' , ' Dragon ' , ' teste ' , 4 , 124 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' King Landia the Goldfang ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 5 , 125 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' King of the Feral Imps ' , ' DARK ' , ' Reptile ' , ' teste ' , 6 , 126 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lavalval Chain ' , ' FIRE ' , ' Sea Serpent ' , ' teste ' , 7 , 127 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lavalval Ignis ' , ' FIRE ' , ' Warrior ' , ' teste ' , 8 , 128 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Legendary Dragon of White ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 9 , 129 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Legendary Magician of Dark ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 10 , 130 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Leviair the Sea Dragon ' , ' WIND ' , ' Aqua ' , ' teste ' , 11 , 131 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lightning Chidori ' , ' WIND ' , ' Thunder ' , ' teste ' , 12 , 132 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lyrilusc - Assembled Nightingale ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 1 , 133 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lyrilusc - Recital Starling ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 2 , 134 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' M-X-Saber Invoker ' , ' EARTH ' , ' Warrior ' , ' teste ' , 3 , 135 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Madolche Puddingcess Chocolat-a-la-Mode ' , ' EARTH ' , ' Fairy ' , ' teste ' , 4 , 136 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Madolche Queen Tiaramisu ' , ' EARTH ' , ' Fairy ' , ' teste ' , 5 , 137 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Maestroke the Symphony Djinn ' , ' DARK ' , ' Fiend ' , ' teste ' , 6 , 138 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Magi Magi �?™ Magician Gal ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 7 , 139 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majester Paladin  the Ascending Dracoslayer ' , ' WIND ' , ' Dragon ' , ' teste ' , 8 , 140 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mecha Phantom Beast Dracossack ' , ' WIND ' , ' Machine ' , ' teste ' , 9 , 141 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mechquipped Angineer ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 10 , 142 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Meliae of the Trees ' , ' EARTH ' , ' Plant ' , ' teste ' , 11 , 143 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Melomelody the Brass Djinn ' , ' LIGHT ' , ' Fiend ' , ' teste ' , 12 , 144 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mermail Abyssgaios ' , ' WATER ' , ' Aqua ' , ' teste ' , 1 , 145 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mermail Abysstrite ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 2 , 146 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Minerva  the Exalted Lightsworn ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 3 , 147 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mira the Star-Bearer ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 4 , 148 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Muzurhythm the String Djinn ' , ' WIND ' , ' Fiend ' , ' teste ' , 5 , 149 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Neo Galaxy-Eyes Cipher Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 6 , 150 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Neo Galaxy-Eyes Photon Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 7 , 151 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Night Papilloperative ' , ' DARK ' , ' Warrior ' , ' teste ' , 8 , 152 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Norito the Moral Leader ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 9 , 153 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 100: Numeron Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 10 , 154 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 101: Silent Honor ARK ' , ' WATER ' , ' Aqua ' , ' teste ' , 11 , 155 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 102: Star Seraph Sentry ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 12 , 156 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 103: Ragnazero ' , ' WATER ' , ' Fairy ' , ' teste ' , 1 , 157 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 104: Masquerade ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 158 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 105: Battlin Boxer Star Cestus ' , ' FIRE ' , ' Warrior ' , ' teste ' , 3 , 159 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 106: Giant Hand ' , ' EARTH ' , ' Rock ' , ' teste ' , 4 , 160 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 107: Galaxy-Eyes Tachyon Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 5 , 161 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 10: Illumiknight ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 6 , 162 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 11: Big Eye ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 7 , 163 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 12: Crimson Shadow Armor Ninja ' , ' EARTH ' , ' Warrior ' , ' teste ' , 8 , 164 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 13: Embodiment of Crime ' , ' DARK ' , ' Fiend ' , ' teste ' , 9 , 165 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 14: Greedy Sarameya ' , ' DARK ' , ' Beast ' , ' teste ' , 10 , 166 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 15: Gimmick Puppet Giant Grinder ' , ' DARK ' , ' Machine ' , ' teste ' , 11 , 167 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 16: Shock Master ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 12 , 168 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 17: Leviathan Dragon ' , ' WATER ' , ' Dragon ' , ' teste ' , 1 , 169 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 18: Heraldry Patriarch ' , ' LIGHT ' , ' Psychic ' , ' teste ' , 2 , 170 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 19: Freezadon ' , ' WATER ' , ' Dinosaur ' , ' teste ' , 3 , 171 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 20: Giga-Brilliant ' , ' LIGHT ' , ' Insect ' , ' teste ' , 4 , 172 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 21: Frozen Lady Justice ' , ' WATER ' , ' Aqua ' , ' teste ' , 5 , 173 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 22: Zombiestein ' , ' DARK ' , ' Zombie ' , ' teste ' , 6 , 174 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 23: Lancelot  Dark Knight of the Underworld ' , ' DARK ' , ' Zombie ' , ' teste ' , 7 , 175 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 24: Dragulas the Vampiric Dragon ' , ' DARK ' , ' Wyrm ' , ' teste ' , 8 , 176 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 25: Force Focus ' , ' LIGHT ' , ' Machine ' , ' teste ' , 9 , 177 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 28: Titanic Moth ' , ' FIRE ' , ' Insect ' , ' teste ' , 10 , 178 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 29: Mannequin Cat ' , ' LIGHT ' , ' Beast ' , ' teste ' , 11 , 179 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 30: Acid Golem of Destruction ' , ' WATER ' , ' Rock ' , ' teste ' , 12 , 180 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 31: Embodiment of Punishment ' , ' DARK ' , ' Fiend ' , ' teste ' , 1 , 181 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 32: Shark Drake ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 2 , 182 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 33: Chronomaly Machu Mech ' , ' LIGHT ' , ' Machine ' , ' teste ' , 3 , 183 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 34: Terror-Byte ' , ' DARK ' , ' Machine ' , ' teste ' , 4 , 184 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 35: Ravenous Tarantula ' , ' DARK ' , ' Insect ' , ' teste ' , 5 , 185 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 36: Chronomaly Chateau Huyuk ' , ' LIGHT ' , ' Machine ' , ' teste ' , 6 , 186 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 37: Hope Woven Dragon Spider Shark ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 7 , 187 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 38: Hope Harbinger Dragon Titanic Galaxy ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 8 , 188 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 39: Utopia ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 9 , 189 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 39: Utopia Beyond ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 10 , 190 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 39: Utopia Roots ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 11 , 191 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 40: Gimmick Puppet of Strings ' , ' DARK ' , ' Machine ' , ' teste ' , 12 , 192 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 41: Bagooska the Terribly Tired Tapir ' , ' EARTH ' , ' Fiend ' , ' teste ' , 1 , 193 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 42: Galaxy Tomahawk ' , ' WIND ' , ' Machine ' , ' teste ' , 2 , 194 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 43: Manipulator of Souls ' , ' DARK ' , ' Fiend ' , ' teste ' , 3 , 195 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 44: Sky Pegasus ' , ' LIGHT ' , ' Beast ' , ' teste ' , 4 , 196 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 45: Crumble Logos the Prophet of Demolition ' , ' EARTH ' , ' Zombie ' , ' teste ' , 5 , 197 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 46: Dragluon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 6 , 198 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 47: Nightmare Shark ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 7 , 199 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 48: Shadow Lich ' , ' DARK ' , ' Zombie ' , ' teste ' , 8 , 200 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 49: Fortune Tune ' , ' LIGHT ' , ' Winged Beast ' , ' teste ' , 9 , 201 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 50: Blackship of Corn ' , ' DARK ' , ' Plant ' , ' teste ' , 10 , 202 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 51: Finisher the Strong Arm ' , ' EARTH ' , ' Rock ' , ' teste ' , 11 , 203 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 52: Diamond Crab King ' , ' EARTH ' , ' Rock ' , ' teste ' , 12 , 204 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 53: Heart-eartH ' , ' DARK ' , ' Fiend ' , ' teste ' , 1 , 205 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 54: Lion Heart ' , ' EARTH ' , ' Warrior ' , ' teste ' , 2 , 206 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 55: Gogogo Goliath ' , ' EARTH ' , ' Rock ' , ' teste ' , 3 , 207 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 56: Gold Rat ' , ' LIGHT ' , ' Beast ' , ' teste ' , 4 , 208 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 57: Tri-Head Dust Dragon ' , ' FIRE ' , ' Dragon ' , ' teste ' , 5 , 209 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 58: Burner Visor ' , ' FIRE ' , ' Pyro ' , ' teste ' , 6 , 210 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 59: Crooked Cook ' , ' FIRE ' , ' Warrior ' , ' teste ' , 7 , 211 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 61: Volcasaurus ' , ' FIRE ' , ' Dinosaur ' , ' teste ' , 8 , 212 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 62: Galaxy-Eyes Prime Photon Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 9 , 213 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 63: Shamoji Soldier ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 10 , 214 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 64: Ronin Raccoon Sandayu ' , ' EARTH ' , ' Beast ' , ' teste ' , 11 , 215 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 65: Djinn Buster ' , ' DARK ' , ' Fiend ' , ' teste ' , 12 , 216 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 66: Master Key Beetle ' , ' DARK ' , ' Insect ' , ' teste ' , 1 , 217 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 68: Sanaphond the Sky Prison ' , ' DARK ' , ' Rock ' , ' teste ' , 2 , 218 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 69: Heraldry Crest ' , ' LIGHT ' , ' Psychic ' , ' teste ' , 3 , 219 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 6: Chronomaly Atlandis ' , ' LIGHT ' , ' Machine ' , ' teste ' , 4 , 220 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 70: Malevolent Sin ' , ' DARK ' , ' Insect ' , ' teste ' , 5 , 221 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 71: Rebarian Shark ' , ' WATER ' , ' Dragon ' , ' teste ' , 6 , 222 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 72: Shogi Rook ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 7 , 223 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 73: Abyss Splash ' , ' WATER ' , ' Warrior ' , ' teste ' , 8 , 224 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 74: Master of Blades ' , ' EARTH ' , ' Psychic ' , ' teste ' , 9 , 225 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 77: The Seven Sins ' , ' DARK ' , ' Fiend ' , ' teste ' , 10 , 226 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 78: Number Archive ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 11 , 227 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 79: Battlin Boxer Nova Kaiser ' , ' FIRE ' , ' Warrior ' , ' teste ' , 12 , 228 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 7: Lucky Straight ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 1 , 229 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 80: Rhapsody in Berserk ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 230 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 81: Superdreadnought Rail Cannon Super Dora ' , ' EARTH ' , ' Machine ' , ' teste ' , 3 , 231 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 82: Heartlandraco ' , ' EARTH ' , ' Dragon ' , ' teste ' , 4 , 232 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 83: Galaxy Queen ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 5 , 233 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 84: Pain Gainer ' , ' DARK ' , ' Insect ' , ' teste ' , 6 , 234 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 85: Crazy Box ' , ' DARK ' , ' Fiend ' , ' teste ' , 7 , 235 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 86: Heroic Champion - Rhongomyniad ' , ' DARK ' , ' Warrior ' , ' teste ' , 8 , 236 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 87: Queen of the Night ' , ' WATER ' , ' Plant ' , ' teste ' , 9 , 237 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 88: Gimmick Puppet of Leo ' , ' DARK ' , ' Machine ' , ' teste ' , 10 , 238 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 89: Diablosis the Mind Hacker ' , ' DARK ' , ' Psychic ' , ' teste ' , 11 , 239 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 8: Heraldic King Genom-Heritage ' , ' LIGHT ' , ' Psychic ' , ' teste ' , 12 , 240 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 91: Thunder Spark Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 1 , 241 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 92: Heart-eartH Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 242 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 93: Utopia Kaiser ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 3 , 243 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 94: Crystalzero ' , ' WATER ' , ' Warrior ' , ' teste ' , 4 , 244 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 95: Galaxy-Eyes Dark Matter Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 5 , 245 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 96: Dark Mist ' , ' DARK ' , ' Fiend ' , ' teste ' , 6 , 246 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 98: Antitopian ' , ' DARK ' , ' Warrior ' , ' teste ' , 7 , 247 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 99: Utopic Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 8 , 248 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number 9: Dyson Sphere ' , ' LIGHT ' , ' Machine ' , ' teste ' , 9 , 249 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C101: Silent Honor DARK ' , ' WATER ' , ' Aqua ' , ' teste ' , 10 , 250 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C102: Archfiend Seraph ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 11 , 251 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C103: Ragnafinity ' , ' WATER ' , ' Fairy ' , ' teste ' , 12 , 252 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C104: Umbral Horror Masquerade ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 1 , 253 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C105: Battlin Boxer Comet Cestus ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 254 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C106: Giant Red Hand ' , ' EARTH ' , ' Rock ' , ' teste ' , 3 , 255 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C107: Neo Galaxy-Eyes Tachyon Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 4 , 256 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C15: Gimmick Puppet Giant Hunter ' , ' DARK ' , ' Machine ' , ' teste ' , 5 , 257 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C32: Shark Drake Veiss ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 6 , 258 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C39: Utopia Ray ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 7 , 259 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C39: Utopia Ray V ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 8 , 260 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C39: Utopia Ray Victory ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 9 , 261 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C40: Gimmick Puppet of Dark Strings ' , ' DARK ' , ' Machine ' , ' teste ' , 10 , 262 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C43: High Manipulator of Chaos ' , ' DARK ' , ' Fiend ' , ' teste ' , 11 , 263 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C5: Chaos Chimera Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 12 , 264 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C65: King Overfiend ' , ' DARK ' , ' Fiend ' , ' teste ' , 1 , 265 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C69: Heraldry Crest of Horror ' , ' LIGHT ' , ' Psychic ' , ' teste ' , 2 , 266 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C6: Chronomaly Chaos Atlandis ' , ' LIGHT ' , ' Machine ' , ' teste ' , 3 , 267 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C73: Abyss Supra Splash ' , ' WATER ' , ' Warrior ' , ' teste ' , 4 , 268 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C80: Requiem in Berserk ' , ' DARK ' , ' Fiend ' , ' teste ' , 5 , 269 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C88: Gimmick Puppet Disaster Leo ' , ' DARK ' , ' Machine ' , ' teste ' , 6 , 270 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C92: Heart-eartH Chaos Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 7 , 271 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C96: Dark Storm ' , ' DARK ' , ' Fiend ' , ' teste ' , 8 , 272 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number C9: Chaos Dyson Sphere ' , ' LIGHT ' , ' Machine ' , ' teste ' , 9 , 273 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number F0: Utopic Future ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 10 , 274 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number F0: Utopic Future - Future Slash ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 11 , 275 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number S0: Utopic ZEXAL ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 12 , 276 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number S39: Utopia Prime ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 1 , 277 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Number S39: Utopia the Lightning ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 2 , 278 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Absolute Dragon ' , ' WATER ' , ' Dragon ' , ' teste ' , 3 , 279 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Raging Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 4 , 280 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Rebellion Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 5 , 281 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' One-Eyed Skill Gainer ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 6 , 282 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Orea  the Sylvan High Arbiter ' , ' DARK ' , ' Plant ' , ' teste ' , 7 , 283 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Outer Entity Azzathoth ' , ' DARK ' , ' Fiend ' , ' teste ' , 8 , 284 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Outer Entity Nyarla ' , ' EARTH ' , ' Fiend ' , ' teste ' , 9 , 285 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Paleozoic Anomalocaris ' , ' WATER ' , ' Aqua ' , ' teste ' , 10 , 286 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Paleozoic Opabinia ' , ' WATER ' , ' Aqua ' , ' teste ' , 11 , 287 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performage Trapeze Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 12 , 288 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Phantom Fortress Enterblathnir ' , ' WIND ' , ' Machine ' , ' teste ' , 1 , 289 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Photon Alexandra Queen ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 2 , 290 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Photon Papilloperative ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 3 , 291 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Photon Strike Bounzer ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 4 , 292 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Pilgrim Reaper ' , ' DARK ' , ' Zombie ' , ' teste ' , 5 , 293 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Princess Cologne ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 6 , 294 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Queen Dragun Djinn ' , ' DARK ' , ' Dragon ' , ' teste ' , 7 , 295 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Queen Nereia the Silvercrown ' , ' LIGHT ' , ' Plant ' , ' teste ' , 8 , 296 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Arsenal Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 9 , 297 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Blade Burner Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 10 , 298 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Blaze Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 11 , 299 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Fiend Eagle ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 12 , 300 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Final Fortress Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 1 , 301 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Force Strix ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 2 , 302 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Revolution Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 3 , 303 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Revolution Falcon - Airraid ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 4 , 304 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Rise Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 5 , 305 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Satellite Cannon Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 6 , 306 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Stranger Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 7 , 307 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raidraptor - Ultimate Falcon ' , ' DARK ' , ' Winged Beast ' , ' teste ' , 8 , 308 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Red-Eyes Flare Metal Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 9 , 309 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sacred Noble Knight of King Artorigus ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 10 , 310 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shadow of the Six Samurai - Shien ' , ' EARTH ' , ' Warrior ' , ' teste ' , 11 , 311 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shark Caesar ' , ' WATER ' , ' Fish ' , ' teste ' , 12 , 312 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shark Fortress ' , ' DARK ' , ' Fish ' , ' teste ' , 1 , 313 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shining Elf ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 314 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sky Cavalry Centaurea ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 3 , 315 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Skypalace Gangaridai ' , ' WIND ' , ' Machine ' , ' teste ' , 4 , 316 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Slacker Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 5 , 317 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Snowdust Giant ' , ' WATER ' , ' Beast-Warrior ' , ' teste ' , 6 , 318 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Soul of Silvermountain ' , ' EARTH ' , ' Rock ' , ' teste ' , 7 , 319 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Starliege Lord Galaxion ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 8 , 320 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Starliege Paladynamo ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 9 , 321 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Steelswarm Roach ' , ' DARK ' , ' Fiend ' , ' teste ' , 10 , 322 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Stellarknight Constellar Diamond ' , ' LIGHT ' , ' Wyrm ' , ' teste ' , 11 , 323 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Stellarknight Delteros ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 12 , 324 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Stellarknight Triverr ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 1 , 325 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Submersible Carrier Aero Shark ' , ' WATER ' , ' Fish ' , ' teste ' , 2 , 326 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Quantal Mech Beast Aeroboros ' , ' WIND ' , ' Machine ' , ' teste ' , 3 , 327 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Quantal Mech Beast Grampulse ' , ' WATER ' , ' Machine ' , ' teste ' , 4 , 328 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Quantal Mech Beast Magnaliger ' , ' FIRE ' , ' Machine ' , ' teste ' , 5 , 329 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Quantal Mech King Great Magnus ' , ' LIGHT ' , ' Machine ' , ' teste ' , 6 , 330 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Superdimensional Robot Galaxy Destroyer ' , ' LIGHT ' , ' Machine ' , ' teste ' , 7 , 331 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Superdreadnought Rail Cannon Gustav Max ' , ' EARTH ' , ' Machine ' , ' teste ' , 8 , 332 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Dragon Dark Rebellion ' , ' DARK ' , ' Dragon ' , ' teste ' , 9 , 333 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sword Breaker ' , ' EARTH ' , ' Warrior ' , ' teste ' , 10 , 334 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sylvan Princessprite ' , ' LIGHT ' , ' Plant ' , ' teste ' , 11 , 335 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tellarknight Ptolemaeus ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 12 , 336 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Temtempo the Percussion Djinn ' , ' EARTH ' , ' Fiend ' , ' teste ' , 1 , 337 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' The Phantom Knights of Break Sword ' , ' DARK ' , ' Warrior ' , ' teste ' , 2 , 338 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' The Phantom Knights of Cursed Javelin ' , ' DARK ' , ' Warrior ' , ' teste ' , 3 , 339 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Thunder End Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 4 , 340 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Timestar Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 5 , 341 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tin Archduke ' , ' EARTH ' , ' Machine ' , ' teste ' , 6 , 342 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tiras  Keeper of Genesis ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 7 , 343 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Toadally Awesome ' , ' WATER ' , ' Aqua ' , ' teste ' , 8 , 344 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tornado Dragon ' , ' WIND ' , ' Wyrm ' , ' teste ' , 9 , 345 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Totem Bird ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 10 , 346 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Traptrix Rafflesia ' , ' EARTH ' , ' Plant ' , ' teste ' , 11 , 347 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tri-Edge Levia ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 12 , 348 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' True King of All Calamities ' , ' DARK ' , ' Wyrm ' , ' teste ' , 1 , 349 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Unformed Void ' , ' LIGHT ' , ' Aqua ' , ' teste ' , 2 , 350 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vola-Chemicritter Methydraco ' , ' FIRE ' , ' Beast-Warrior ' , ' teste ' , 3 , 351 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vylon Disigma ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 4 , 352 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wind-Up Arsenal Zenmaioh ' , ' WIND ' , ' Machine ' , ' teste ' , 5 , 353 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wind-Up Carrier Zenmaity ' , ' WATER ' , ' Machine ' , ' teste ' , 6 , 354 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wind-Up Zenmaines ' , ' FIRE ' , ' Machine ' , ' teste ' , 7 , 355 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wind-Up Zenmaister ' , ' EARTH ' , ' Machine ' , ' teste ' , 8 , 356 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoodiac Boarbow ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 9 , 357 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoodiac Broadbull ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 10 , 358 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoodiac Chakanine ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 11 , 359 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoodiac Drident ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 12 , 360 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoodiac Hammerkong ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 1 , 361 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoodiac Tigermortar ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 1 , 362 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zubaba General ' , ' EARTH ' , ' Warrior ' , ' teste ' , 1 , 363 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' ZW - Leo Arms ' , ' LIGHT ' , ' Beast ' , ' teste ' , 1 , 364 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zubaba General ' , ' LIGHT ' , ' Beast ' , ' teste ' , 1 , 365 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' ZW - Leo Arms ' , ' LIGHT ' , ' Beast ' , ' teste ' , 1 , 366 );


/*************************** 
  TODO - Insert monstros XYZ 
****************************/
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1400 , 1 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1700 , 2 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 3000 , 3 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 4 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 3200 , 5 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 400 , 1000 , 6 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2100 , 7 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 8 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 900 , 900 , 9 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 10 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 11 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 1300 , 12 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2000 , 13 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2800 , 14 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 600 , 15 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1000 , 16 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2200 , 17 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 200 , 18 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 19 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2500 , 20 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 21 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1600 , 22 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2300 , 23 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2450 , 1950 , 24 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1500 , 25 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 26 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1000 , 27 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 28 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 29 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1100 , 30 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 500 , 31 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1500 , 32 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 800 , 33 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 34 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 0 , 35 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 36 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 37 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3800 , 2300 , 38 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2400 , 39 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1900 , 40 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1600 , 41 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 42 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3800 , 4000 , 43 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1600 , 44 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1600 , 45 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 46 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 2000 , 47 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1000 , 48 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 49 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1800 , 50 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 51 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 800 , 52 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1100 , 53 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2500 , 54 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 55 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 56 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 550 , 57 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1000 , 58 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1200 , 59 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 60 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2200 , 61 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1400 , 62 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2000 , 63 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 64 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1800 , 65 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 200 , 66 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 2800 , 67 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 68 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1700 , 69 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1600 , 70 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2350 , 1350 , 71 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 0 , 72 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 950 , 1950 , 73 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2550 , 1650 , 74 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2750 , 1950 , 75 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2350 , 1350 , 76 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1700 , 77 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 78 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1000 , 79 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2000 , 80 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1500 , 81 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1400 , 82 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 3000 , 83 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 600 , 84 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1600 , 85 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 1800 , 86 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 2400 , 87 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1600 , 88 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2950 , 2800 , 89 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 90 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1600 , 91 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2800 , 92 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 93 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 3500 , 94 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2800 , 95 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1500 , 96 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1300 , 97 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1900 , 98 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1600 , 99 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 100 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 0 , 101 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 1200 , 102 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 2000 , 103 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 104 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1200 , 105 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 3500 , 106 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1900 , 107 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 108 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1800 , 109 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2200 , 110 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 600 , 1000 , 111 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 112 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 113 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2400 , 114 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2100 , 115 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2400 , 116 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2600 , 117 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1100 , 1800 , 118 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2200 , 119 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 120 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2000 , 121 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 122 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 800 , 123 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1300 , 124 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 125 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 2000 , 126 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1000 , 127 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1400 , 128 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 129 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 130 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1600 , 131 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1600 , 132 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 133 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 134 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 500 , 135 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2200 , 136 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2100 , 137 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2300 , 138 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 139 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1850 , 2000 , 140 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2200 , 141 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1000 , 142 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 900 , 143 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 1600 , 144 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1600 , 145 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 2800 , 146 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 800 , 147 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1100 , 1000 , 148 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1000 , 149 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3000 , 150 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3000 , 151 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2000 , 152 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 153 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 154 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1000 , 155 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 156 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 157 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 1200 , 158 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1600 , 159 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 160 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 161 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2400 , 162 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2000 , 163 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1700 , 164 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 165 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1500 , 166 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 2500 , 167 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1600 , 168 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 0 , 169 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2200 , 170 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 171 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1800 , 172 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 173 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 1000 , 174 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1500 , 175 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2800 , 176 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 177 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2200 , 178 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 900 , 179 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 180 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 181 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2100 , 182 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1500 , 183 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2900 , 184 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 185 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 186 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 187 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 188 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 189 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 190 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 100 , 191 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 192 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 2000 , 193 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 3000 , 194 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 195 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1600 , 196 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 0 , 197 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 198 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 199 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 0 , 200 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 400 , 900 , 201 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1500 , 202 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 0 , 203 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 3000 , 204 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 205 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 206 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 207 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 600 , 208 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 2600 , 209 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 210 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 200 , 211 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1000 , 212 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 3000 , 213 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2000 , 214 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 215 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 0 , 216 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 800 , 217 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 2700 , 218 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1400 , 219 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 3000 , 220 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 221 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2000 , 222 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1200 , 223 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1400 , 224 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2300 , 225 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 3000 , 226 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 227 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1600 , 228 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 700 , 700 , 229 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 1200 , 230 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 4000 , 231 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1500 , 232 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 233 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 234 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 300 , 235 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 236 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2800 , 237 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2300 , 238 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1200 , 239 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1800 , 240 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 241 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 242 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 243 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1600 , 244 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 0 , 245 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 1000 , 246 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 247 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 2000 , 248 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 3000 , 249 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1500 , 250 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2400 , 251 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 252 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 1500 , 253 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 254 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2000 , 255 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3000 , 256 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1500 , 257 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2100 , 258 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 259 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2000 , 260 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 261 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 2000 , 262 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 263 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 264 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 0 , 265 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 1800 , 266 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 3300 , 267 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 268 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2000 , 269 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 2500 , 270 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 0 , 271 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 272 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3600 , 3200 , 273 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 274 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 275 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 276 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2510 , 2000 , 277 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 278 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 279 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 280 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 281 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2600 , 282 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 283 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 0 , 284 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2600 , 285 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 0 , 286 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2400 , 287 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 288 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2500 , 289 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 290 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 291 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 292 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 293 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 2200 , 294 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1200 , 295 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2400 , 296 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 297 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 298 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2000 , 299 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 0 , 300 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3800 , 2800 , 301 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 2000 , 302 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 3000 , 303 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 3000 , 304 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 2000 , 305 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 306 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 307 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 2000 , 308 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 309 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2200 , 310 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 400 , 311 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2000 , 312 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1800 , 313 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1000 , 314 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 0 , 315 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3400 , 3000 , 316 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 200 , 2100 , 317 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 800 , 318 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2200 , 319 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2100 , 320 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 321 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 0 , 322 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 323 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 324 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 2500 , 325 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1000 , 326 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2400 , 327 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2800 , 328 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2000 , 329 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3600 , 3200 , 330 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 5000 , 2000 , 331 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 332 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 333 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 1000 , 334 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 100 , 335 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 550 , 2600 , 336 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1000 , 337 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 338 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 0 , 339 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 340 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 341 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1200 , 342 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1700 , 343 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 0 , 344 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 2000 , 345 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1400 , 346 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 2500 , 347 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1500 , 348 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 349 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 350 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 351 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 352 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1900 , 353 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 354 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 2100 , 355 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1500 , 356 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 357 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 358 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 359 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 360 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 361 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 362 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 363 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 1200 , 364 );


/******************************
    INSERT RANK XYZ
*******************************/
/**************************
TODO - Insert monstro xyz
/***************************/
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 1 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 2 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 3 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 4 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 5 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 6 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 7 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 8 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 9 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 10 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 11 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 12 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 13 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 14 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 15 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 16 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 17 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 18 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 19 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 20 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 21 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 22 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 23 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 24 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 25 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 26 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 27 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 28 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 29 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 30 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 31 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 32 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 33 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 34 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 35 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 36 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 37 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 38 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 39 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 40 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 41 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 42 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 11 , 43 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 44 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 45 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 46 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 47 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 48 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 49 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 50 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 51 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 52 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 53 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 54 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 55 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 56 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 57 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 58 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 59 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 60 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 61 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 62 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 63 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 64 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 65 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 66 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 67 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 68 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 69 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 70 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 71 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 72 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 73 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 74 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 75 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 76 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 77 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 78 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 79 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 80 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 81 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 82 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 83 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 84 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 85 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 86 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 87 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 88 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 92 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 93 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 94 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 95 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 96 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 97 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 98 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 99 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 100 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 89 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 90 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 91 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 101 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 102 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 103 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 104 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 105 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 106 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 107 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 108 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 109 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 110 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 111 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 112 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 113 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 114 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 115 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 116 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 117 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 118 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 119 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 120 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 121 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 122 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 123 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 124 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 125 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 126 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 127 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 128 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 129 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 130 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 131 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 132 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 133 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 134 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 135 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 136 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 137 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 138 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 139 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 140 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 141 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 142 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 143 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 144 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 145 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 146 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 147 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 148 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 149 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 150 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 151 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 152 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 153 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 154 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 155 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 156 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 157 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 158 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 159 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 160 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 161 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 162 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 163 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 164 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 165 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 166 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 167 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 168 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 169 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 170 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 171 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 172 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 173 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 174 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 175 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 176 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 177 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 178 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 179 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 180 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 181 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 182 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 183 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 184 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 185 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 186 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 187 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 188 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 189 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 190 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 191 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 192 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 193 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 194 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 195 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 196 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 197 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 198 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 199 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 200 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 201 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 202 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 203 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 204 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 205 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 206 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 207 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 208 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 209 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 210 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 211 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 212 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 213 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 214 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 215 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 216 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 217 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 218 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 219 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 220 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 221 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 222 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 223 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 224 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 225 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 12 , 226 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 227 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 228 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 229 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 230 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 231 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 232 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 233 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 11 , 234 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 235 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 236 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 237 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 238 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 239 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 240 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 241 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 242 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 12 , 243 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 244 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 245 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 246 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 247 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 248 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 249 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 250 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 251 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 252 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 253 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 254 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 255 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 256 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 257 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 258 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 259 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 260 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 261 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 262 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 263 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 264 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 265 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 266 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 267 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 268 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 269 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 270 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 271 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 272 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 273 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 274 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 275 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 276 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 277 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 278 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 279 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 280 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 281 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 282 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 283 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 284 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 285 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 286 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 287 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 288 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 289 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 290 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 291 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 292 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 293 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 294 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 295 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 296 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 297 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 298 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 299 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 300 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 12 , 301 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 302 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 303 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 304 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 305 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 306 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 307 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 308 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 7 , 309 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 310 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 311 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 312 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 313 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 314 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 315 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 316 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 317 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 318 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 319 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 320 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 321 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 322 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 323 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 324 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 325 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 326 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 327 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 328 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 329 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 12 , 330 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 331 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 10 , 332 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 333 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 6 , 334 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 1 , 335 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 336 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 337 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 338 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 339 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 340 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 341 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 342 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 343 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 2 , 344 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 345 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 346 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 347 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 348 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 9 , 349 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 350 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 8 , 351 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 352 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 353 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 354 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 3 , 355 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 356 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 357 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 358 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 359 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 360 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 361 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 362 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 4 , 363 );
INSERT INTO XYZS(xyz_rank, xyz_mon_id) VALUES ( 5 , 364 );


/*************************** 
  TODO - Insert CARTAS PENDULO
****************************/
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Curtain Raiser ' , ' DARK ' , ' Fiend ' , ' Gains 1100 ATK if you control no other monsters Once per turn  You can send 1  Abyss Script  Spell from your Deck to the GY  add 1 face-up  Abyss Actor  Pendulum Monster from your Extra Deck to your hand ' , 2 , 367 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Evil Heel ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 368 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Extras ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 369 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Funky Comedian ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 370 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Leading Lady ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 371 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Sassy Rookie ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 372 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Superstar ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 373 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Trendy Understudy ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 374 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Twinkle Littlestar ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 375 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Abyss Actor - Wild Hope ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 376 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Acrobatic Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 377 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Aether, the Evil Empowering Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 378 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Envy ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 379 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Gluttony ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 380 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Goliath ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 381 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Greed ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 382 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Lechery ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 383 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Pride ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 384 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Sloth ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 385 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amorphage Wrath ' , ' EARTH ' , ' Dragon ' , ' teste ' , 2 , 386 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Archfiend Eccentrick ' , ' LIGHT ' , ' Fiend ' , ' teste ' , 2 , 387 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Astrograph Sorcerer ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 388 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Black Fang Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 389 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bujin Hiruko ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 2 , 390 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chronograph Sorcerer ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 391 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Clear Wing Fast Dragon ' , ' WIND ' , ' Dragon ' , ' teste ' , 2 , 392 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Crystal Protector ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 393 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Crystal Vanguard ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 394 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Cerberus ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 395 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Orthros ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 396 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Proud Chevalier ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 397 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Proud Ogre ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 398 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Savant Copernicus ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 399 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Savant Galilei ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 400 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Savant Kepler ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 401 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Savant Newton ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 402 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Savant Nikola ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 403 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D Savant Thomas ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 404 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Chaos King Apocalypse ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 405 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Destiny King Zero Laplace ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 406 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Doom King Armageddon ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 407 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Oblivion King Abyss Ragnarok ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 408 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Rebel King Leonidas ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 409 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Super Doom King Bright Armageddon ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 410 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Super Doom King Dark Armageddon ' , ' DARK ' , ' Fish ' , ' teste ' , 2 , 411 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Superdoom King Purplish Armageddon ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 412 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Supersight King Zero Maxwell ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 413 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Doriado ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 414 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Deskbot 005 ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 415 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Deskbot 006 ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 416 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Deskbot 007 ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 417 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Deskbot 008 ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 418 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dharma-Eye Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 419 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Ankylos ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 420 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Brachion ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 421 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Ceratops ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 422 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Plesios ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 423 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Pteran ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 424 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Rex ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 425 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Spinos ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 426 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinomist Stegosaur ' , ' WATER ' , ' Machine ' , ' teste ' , 2 , 427 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Double Iris Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 428 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragodies, the Empowered Warrior ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 2 , 429 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragon Horn Hunter ' , ' DARK ' , ' Warrior ' , ' teste ' , 2 , 430 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragoncaller Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 431 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragong ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 432 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragonox, the Empowered Warrior ' , ' DARK ' , ' Warrior ' , ' teste ' , 2 , 433 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragonpit Magician ' , ' WATER ' , ' Spellcaster ' , ' teste ' , 2 , 434 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragonpulse Magician ' , ' EARTH ' , ' Spellcaster ' , ' teste ' , 2 , 435 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragoons of Draconia ' , ' FIRE ' , ' Beast-Warrior ' , ' teste ' , 2 , 436 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Edge Imp Cotton Eater ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 437 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fire Opalhead ' , ' FIRE ' , ' Dinosaur ' , ' teste ' , 2 , 438 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Flash Knight ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 2 , 439 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Foucault s Cannon ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 440 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ghost Beef ' , ' DARK ' , ' Beast ' , ' teste ' , 2 , 441 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Guiding Ariadne ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 2 , 442 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Hallohallo ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 443 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Harmonizing Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 444 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Cavalier ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 445 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Crusader ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 446 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Gallant ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 447 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Margrave ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 448 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Paladin ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 449 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Squire ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 450 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Templar ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 451 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Igknight Veteran ' , ' FIRE ' , ' Warrior ' , ' teste ' , 2 , 452 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Juno, the Celestial Goddess ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 2 , 453 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kai-Den Kendo Spirit ' , ' WIND ' , ' Warrior ' , ' teste ' , 2 , 454 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kuro-Obi Karate Spirit ' , ' WIND ' , ' Warrior ' , ' teste ' , 2 , 455 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kuzunoha, the Onmyojin ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 456 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lancephorhynchus ' , ' WIND ' , ' Dinosaur ' , ' teste ' , 2 , 457 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lector Pendulum, the Dracoverlord ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 458 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Leonardo s Silver Skyship ' , ' WIND ' , ' Machine ' , ' teste ' , 2 , 459 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lunalight Tiger ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 2 , 460 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lunalight Wolf ' , ' LIGHT ' , ' Beast-Warrior ' , ' teste ' , 2 , 461 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Luster Pendulum, the Dracoslayer ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 2 , 462 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Magical Abductor ' , ' EARTH ' , ' Spellcaster ' , ' teste ' , 2 , 463 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Magical Cavalry of Cxulub ' , ' EARTH ' , ' Dinosaur ' , ' teste ' , 2 , 464 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majespecter Cat - Nekomata ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 465 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majespecter Crow - Yata ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 466 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majespecter Fox - Kyubi ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 467 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majespecter Raccoon - Bunbuku ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 468 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majespecter Toad - Ogama ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 469 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Majespecter Unicorn - Kirin ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 470 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mandragon ' , ' EARTH ' , ' Plant ' , ' teste ' , 2 , 471 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Master Pendulum, the Dracoslayer ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 2 , 472 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mayosenju Daibak ' , ' WIND ' , ' Beast ' , ' teste ' , 2 , 473 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Goldriver ' , ' FIRE ' , ' Psychic ' , ' teste ' , 2 , 474 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Silverd ' , ' FIRE ' , ' Psychic ' , ' teste ' , 2 , 475 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Steelen ' , ' FIRE ' , ' Psychic ' , ' teste ' , 2 , 476 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Volflame ' , ' FIRE ' , ' Psychic ' , ' teste ' , 2 , 477 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metrognome ' , ' EARTH ' , ' Fairy ' , ' teste ' , 2 , 478 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mild Turkey ' , ' FIRE ' , ' Winged Beast ' , ' teste ' , 2 , 479 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mythical Beast Bashilisk ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 480 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mythical Beast Garuda ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 481 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mythical Beast Jackal ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 482 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mythical Beast Jackal King ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 483 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mythical Beast Master Cerberus ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 484 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mythical Beast Medusa ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 485 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Nirvana High Paladin ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 486 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Nobledragon Magician ' , ' FIRE ' , ' Spellcaster ' , ' teste ' , 2 , 487 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Oafdragon Magician ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 488 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Arc Pendulum Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 489 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Mirage Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 490 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Pendulum Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 491 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Persona Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 492 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Phantom Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 493 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Raging Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 494 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Rebellion Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 495 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Revolution Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste ' , 2 , 496 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Venom Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 497 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Odd-Eyes Wing Dragon ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 498 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' P.M. Captor ' , ' DARK ' , ' Zombie ' , ' teste ' , 2 , 499 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Pandora s Jewelry Box ' , ' DARK ' , ' Wyrm ' , ' teste ' , 2 , 500 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Pendulumucho ' , ' EARTH ' , ' Winged Beast ' , ' teste ' , 2 , 501 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performage Mirror Conductor ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 502 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performage Plushfire ' , ' FIRE ' , ' Spellcaster ' , ' teste ' , 2 , 503 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Ballad ' , ' EARTH ' , ' Plant ' , ' teste ' , 2 , 504 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Barracuda ' , ' EARTH ' , ' Plant ' , ' teste ' , 2 , 505 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Bit Bite Turtle ' , ' WATER ' , ' Reptile ' , ' teste ' , 2 , 506 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Bubblebowwow ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 507 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Camelump ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 508 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Card Gardna ' , ' EARTH ' , ' Rock ' , ' teste ' , 2 , 509 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Changeraffe ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 510 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Cheermole ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 511 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Coin Dragon ' , ' WATER ' , ' Dragon ' , ' teste ' , 2 , 512 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Dag Daggerman ' , ' EARTH ' , ' Warrior ' , ' teste ' , 2 , 513 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Drummerilla ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 514 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Extra Slinger ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 515 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Fire Mufflerlion ' , ' FIRE ' , ' Beast ' , ' teste ' , 2 , 516 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Fireflux ' , ' LIGHT ' , ' Insect ' , ' teste ' , 2 , 517 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Five-Rainbow Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 518 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Gold Fang ' , ' LIGHT ' , ' Beast ' , ' teste ' , 2 , 519 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Gongato ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 520 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Guitartle ' , ' WATER ' , ' Aqua ' , ' teste ' , 2 , 521 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Gumgumouton ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 522 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Handstandaccoon ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 523 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Kaleidoscorp ' , ' LIGHT ' , ' Insect ' , ' teste ' , 2 , 524 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal King Bear ' , ' EARTH ' , ' Beast-Warrior ' , ' teste ' , 2 , 525 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Laugh Maker ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 526 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Le-Bellman ' , ' LIGHT ' , ' Fairy ' , ' teste ' , 2 , 527 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Lizardraw ' , ' EARTH ' , ' Reptile ' , ' teste ' , 2 , 528 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Momoncarpet ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 529 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Monkeyboard ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 530 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Odd-Eyes Dissolver ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 531 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Odd-Eyes Light Phoenix ' , ' LIGHT ' , ' Winged Beast ' , ' teste ' , 2 , 532 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Odd-Eyes Minitaurus ' , ' DARK ' , ' Beast-Warrior ' , ' teste ' , 2 , 533 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Odd-Eyes Synchron ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 534 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Odd-Eyes Unicorn ' , ' LIGHT ' , ' Beast ' , ' teste ' , 2 , 535 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Parrotrio ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 2 , 536 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Partnaga ' , ' EARTH ' , ' Reptile ' , ' teste ' , 2 , 537 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Pendulum Sorcerer ' , ' EARTH ' , ' Spellcaster ' , ' teste ' , 2 , 538 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Radish Horse ' , ' EARTH ' , ' Plant ' , ' teste ' , 2 , 539 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Seal Eel ' , ' WATER ' , ' Fish ' , ' teste ' , 2 , 540 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Sellshell Crab ' , ' WATER ' , ' Aqua ' , ' teste ' , 2 , 541 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Silver Claw ' , ' DARK ' , ' Beast ' , ' teste ' , 2 , 542 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Skullcrobat Joker ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 543 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Splashmammoth ' , ' WATER ' , ' Beast ' , ' teste ' , 2 , 544 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Swincobra ' , ' EARTH ' , ' Reptile ' , ' teste ' , 2 , 545 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Trampolynx ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 546 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Trump Girl ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 547 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Trump Witch ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 548 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Trumpanda ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 549 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Turn Toad ' , ' WATER ' , ' Aqua ' , ' teste ' , 2 , 550 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal U Go Golem ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 551 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Whim Witch ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 552 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Purple Poison Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 553 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Carrier ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 554 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Cephalopod ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 555 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Disk ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 556 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Helix ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 557 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Monolith ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 558 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Scout ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 559 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Shell ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 560 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Qliphort Stealth ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 561 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Raremetalfoes Bismugear ' , ' FIRE ' , ' Psychic ' , ' teste ' , 2 , 562 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rescue Hamster ' , ' EARTH ' , ' Beast ' , ' teste ' , 2 , 563 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Risebell the Summoner ' , ' WIND ' , ' Psychic ' , ' teste ' , 2 , 564 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ritual Beast Tamer Zeframpilica ' , ' WIND ' , ' Psychic ' , ' teste ' , 2 , 565 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ritual Beast Tamer Zefrawendi ' , ' WIND ' , ' Psychic ' , ' teste ' , 2 , 566 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sakyo, Swordmaster of the Far East ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 2 , 567 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Samurai Cavalry of Reptier ' , ' EARTH ' , ' Dinosaur ' , ' teste ' , 2 , 568 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Satellarknight Zefrathuban ' , ' LIGHT ' , ' Warrior ' , ' teste ' , 2 , 569 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sea Dragoons of Draconia ' , ' WATER ' , ' Sea Serpent ' , ' teste ' , 2 , 570 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shaddoll Zefracore ' , ' DARK ' , ' Rock ' , ' teste ' , 2 , 571 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shaddoll Zefranaga ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 572 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Shelga, the Tri-Warlord ' , ' WATER ' , ' Psychic ' , ' teste ' , 2 , 573 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sky Dragoons of Draconia ' , ' WIND ' , ' Winged Beast ' , ' teste ' , 2 , 574 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Speedroid Domino Butterfly ' , ' WIND ' , ' Machine ' , ' teste ' , 2 , 575 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Speedroid Passinglider ' , ' WIND ' , ' Machine ' , ' teste ' , 2 , 576 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Stargazer Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 577 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Steel Cavalry of Dinon ' , ' EARTH ' , ' Dinosaur ' , ' teste ' , 2 , 578 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Stellarknight Zefraxciton ' , ' LIGHT ' , ' Fiend ' , ' teste ' , 2 , 579 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Superheavy Samurai General Coral ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 580 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Superheavy Samurai General Jade ' , ' EARTH ' , ' Machine ' , ' teste ' , 2 , 581 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Dragon Darkwurm ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 582 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Dragon Odd-Eyes ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 583 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Gate Infinity ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 584 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Gate Zero ' , ' DARK ' , ' Fiend ' , ' teste ' , 2 , 585 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Z-ARC ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 586 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Symphonic Warrior Guitaar ' , ' WIND ' , ' Machine ' , ' teste ' , 2 , 587 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Symphonic Warrior Miccs ' , ' WIND ' , ' Machine ' , ' teste ' , 2 , 588 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' The Twin Kings, Founders of the Empire ' , ' LIGHT ' , ' Beast ' , ' teste ' , 2 , 589 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Timebreaker Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 590 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Timegazer Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 591 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Twilight Ninja Jogen ' , ' DARK ' , ' Warrior ' , ' teste ' , 2 , 592 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Twilight Ninja Kagen ' , ' DARK ' , ' Warrior ' , ' teste ' , 2 , 593 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vector Pendulum, the Dracoverlord ' , ' DARK ' , ' Dragon ' , ' teste ' , 2 , 594 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' White Wing Magician ' , ' WIND ' , ' Spellcaster ' , ' teste ' , 2 , 595 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wisdom-Eye Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 596 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Xiangke Magician ' , ' DARK ' , ' Spellcaster ' , ' teste ' , 2 , 597 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Xiangsheng Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste ' , 2 , 598 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Yoko-Zuna Sumo Spirit ' , ' WIND ' , ' Warrior ' , ' teste ' , 2 , 599 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Yosenju Shinchu L ' , ' WIND ' , ' Rock ' , ' teste ' , 2 , 600 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Yosenju Shinchu R ' , ' WIND ' , ' Rock ' , ' teste ' , 2 , 601 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zany Zebra ' , ' DARK ' , ' Beast ' , ' teste ' , 2 , 602 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zefraath ' , ' EARTH ' , ' Rock ' , ' teste ' , 2 , 603 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zefraniu, Secret of the Yang Zing ' , ' EARTH ' , ' Wyrm ' , ' teste ' , 2 , 604 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zefrasaber, Swordmaster of the Nekroz ' , ' WATER ' , ' Spellcaster ' , ' teste ' , 2 , 605 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zefraxa, Flame Beast of the Nekroz ' , ' FIRE ' , ' Dragon ' , ' teste ' , 2 , 606 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zefraxi, Treasure of the Yang Zing ' , ' EARTH ' , ' Wyrm ' , ' teste ' , 2 , 607 );

/*************************** 
  TODO - Insert CARTAS PENDULO ataque defesa
****************************/
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1100 , 1000 , 367 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 368 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 369 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 200 , 370 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1000 , 371 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1000 , 372 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1800 , 373 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 700 , 700 , 374 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 375 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1200 , 376 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 2300 , 377 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1600 , 378 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2050 , 379 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 1850 , 380 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2750 , 0 , 381 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 1950 , 382 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1350 , 0 , 383 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1750 , 0 , 384 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2250 , 0 , 385 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1650 , 0 , 386 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 1000 , 387 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 388 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 800 , 389 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2000 , 390 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1700 , 391 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 392 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1800 , 393 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 1000 , 394 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 600 , 395 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 600 , 1800 , 396 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 700 , 397 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1500 , 398 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 399 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 400 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 401 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 402 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 403 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2600 , 404 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 405 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 406 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 1000 , 407 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 3000 , 408 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1200 , 409 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 410 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 411 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 412 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 413 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1400 , 414 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 415 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 416 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 417 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 418 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 419 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 2000 , 420 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 800 , 421 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 400 , 422 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1400 , 423 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1200 , 424 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2200 , 425 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1800 , 426 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1800 , 427 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1000 , 428 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 429 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1000 , 430 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 431 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 2100 , 432 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 433 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 900 , 2700 , 434 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 900 , 435 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 200 , 436 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1600 , 437 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1000 , 438 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 600 , 439 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1200 , 440 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 441 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 800 , 442 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 600 , 443 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 444 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1200 , 445 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 300 , 446 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 2200 , 447 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 2500 , 448 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 1900 , 449 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2000 , 450 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1300 , 451 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 2700 , 452 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 453 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 454 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 455 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2300 , 456 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 800 , 457 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1950 , 0 , 458 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 3000 , 459 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 800 , 460 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1800 , 461 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1850 , 0 , 462 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1400 , 463 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1800 , 464 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 1800 , 465 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1500 , 466 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1000 , 467 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 900 , 468 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 500 , 469 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 470 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1000 , 471 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1950 , 0 , 472 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 300 , 473 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 500 , 474 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 100 , 475 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2100 , 476 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 477 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1600 , 478 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2000 , 479 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 500 , 480 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 1600 , 481 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 1400 , 482 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1400 , 483 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2800 , 484 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 485 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 2500 , 486 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 700 , 1400 , 487 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1400 , 488 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 489 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 600 , 490 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 491 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 2400 , 492 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 493 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 494 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 495 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 496 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 2500 , 497 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 498 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 0 , 499 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 500 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 501 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 600 , 1400 , 502 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 503 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 1100 , 504 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 1100 , 505 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 1200 , 506 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1000 , 507 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 1800 , 508 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 509 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 500 , 510 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 600 , 1000 , 511 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1000 , 512 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 600 , 513 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 900 , 514 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 1100 , 515 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 800 , 516 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 1600 , 517 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 518 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 700 , 519 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 520 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 400 , 521 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 900 , 2400 , 522 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 400 , 600 , 523 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 2300 , 524 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1000 , 525 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 526 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 2600 , 527 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 600 , 528 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 100 , 529 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2400 , 530 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2600 , 531 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 532 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 1600 , 533 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 200 , 600 , 534 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 600 , 535 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 500 , 536 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 2100 , 537 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 800 , 538 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 2000 , 539 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 540 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 2500 , 541 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 700 , 542 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 100 , 543 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 2300 , 544 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 1800 , 545 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 300 , 546 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 200 , 200 , 547 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 100 , 548 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 800 , 549 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 800 , 550 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1000 , 551 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 800 , 552 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 2100 , 553 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 554 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1000 , 555 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1000 , 556 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 557 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 558 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2800 , 559 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1000 , 560 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1000 , 561 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 562 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 100 , 563 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 800 , 564 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1500 , 565 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1000 , 566 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2600 , 567 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1200 , 568 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2100 , 569 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 200 , 2100 , 570 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 450 , 1950 , 571 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 900 , 100 , 572 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 573 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 200 , 574 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 100 , 300 , 575 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2000 , 576 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 2400 , 577 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 2600 , 578 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 0 , 579 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 500 , 580 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2800 , 581 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1200 , 582 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 583 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 584 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 585 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 4000 , 586 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 100 , 587 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1100 , 588 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2200 , 589 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 0 , 590 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 600 , 591 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 592 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2000 , 593 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1850 , 0 , 594 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1400 , 595 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1500 , 596 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 500 , 597 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 1500 , 598 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 599 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2100 , 600 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2100 , 601 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2000 , 602 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3450 , 2950 , 603 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2600 , 604 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 800 , 605 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 606 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 0 , 607 );

/*TODO Insert pendulo tabela */
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If you control no monsters You can Special Summon this card from your Pendulum Zone You can only use this effect of Abyss Actor  Curtain Raiser once per Duel	'	,	367	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can Tribute 1  Abyss Actor  monster  then target 1 face-up monster your opponent controls  it loses ATK equal to the original ATK of the Tributed monster  until the end of this turn (even if this card leaves the field) 	'	,	368	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If your opponent controls a monster  You can Special Summon this card from your Pendulum Zone  You can only use this effect of  Abyss Actor - Extras  once per turn 	'	,	369	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Once per turn  You can Tribute 1  Abyss Actor  monster  then target 1  Abyss Actor  monster you control  it gains ATK equal to the original ATK of the Tributed monster  until the end of this turn (even if this card leaves the field) 	'	,	370	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  when you take battle damage from an opponent s attacking monster  You can activate 1 of these effects Ã‚ï¿½Ã…â€œ That opponent s monster loses ATK equal to the damage you took (even if this card leaves the field) Ã‚ï¿½Ã…â€œ Add 1 face-up  Abyss Actor  Pendulum Monster from your Extra Deck to your hand with ATK less than or equal to the damage you took 	'	,	371	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	If an  Abyss Actor  monster(s) you control would be destroyed by battle or an opponent s card effect  you can destroy this card instead 	'	,	372	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  You can Tribute 1  Abyss Actor  monster  then target 1  Abyss Script  Spell Card in your Graveyard  add it to your hand 	'	,	373	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	When you Pendulum Summon a monster  You can add 1 face-up Level 1 or 8  Abyss Actor  Pendulum Monster from your Extra Deck to your hand 	'	,	374	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	You cannot Pendulum Summon monsters  except  Abyss Actor  monsters  This effect cannot be negated  Once per turn  You can target 1  Abyss Actor  monster you control  this turn  it can make a second and third attack on monsters during each Battle Phase  also other monsters you control cannot attack (even if this card leaves the field) 	'	,	375	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can target 1  Abyss Actor  card in your other Pendulum Zone  its Pendulum Scale becomes 9 until the end of this turn  also you cannot Special Summon monsters for the rest of this turn  except  Abyss Actor  monsters (even if this card leaves the field) 	'	,	376	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	When a monster(s) you control is destroyed by a card effect (except during the Damage Step)  You can Special Summon this card from your Pendulum Zone  You can only use this effect of  Acrobatic Magician  once per turn 	'	,	377	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can banish 1  Empowered Warrior  monster from your Graveyard  then target 1 card on the field  destroy it 	'	,	378	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	While you control an  Amorphage  monster  neither player can activate cards or effects as Chain Link 2 or higher  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	379	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	While you control an  Amorphage  monster  monsters cannot activate their effects  except  Amorphage  monsters  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	380	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	While you control an  Amorphage  monster  any card sent to the Graveyard is banished instead  except  Amorphage  cards  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	381	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	While you control an  Amorphage  monster  neither player can activate Trap Cards or their effects  except for  Amorphage  cards  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	382	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	While you control an  Amorphage  monster  neither player can activate Spell Cards or their effects  except for  Amorphage  cards  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	383	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	While you control an  Amorphage  monster  neither player takes any effect damage  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	384	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	While you control an  Amorphage  monster  neither player can add cards from their Deck to their hand except by drawing them  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	385	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	While you control an  Amorphage  monster  neither player can Tribute monsters  except  Amorphage  monsters  Once per turn  during your Standby Phase  Tribute 1 monster or destroy this card 	'	,	386	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	You can target 1 other Spell/Trap Card on the field  destroy both it and this card  You can only use this effect of  Archfiend Eccentrick  once per turn 	'	,	387	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	During your Main Phase  You can destroy this card  and if you do  take 1  Stargazer Magician  from your hand or Deck  and either place it in your Pendulum Zone or Special Summon it  You can only use this effect of  Astrograph Sorcerer  once per turn 	'	,	388	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Once per turn  You can target 1 face-up monster your opponent controls  its ATK becomes half its current ATK (until the end of this turn)  then destroy this card 	'	,	389	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	You can banish this card in your Pendulum Zone  then target 1  Bujin  Xyz Monster you control  Special Summon from your Extra Deck  1  Bujin  Xyz Monster with a different name  by using that target as the Xyz Material  (This Special Summon is treated as an Xyz Summon  Xyz Materials attached to it also become Xyz Materials on the Summoned monster )	'	,	390	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	During your Main Phase  You can destroy this card  and if you do  take 1  Timegazer Magician  from your hand or Deck  and either place it in your Pendulum Zone or Special Summon it  You can only use this effect of  Chronograph Sorcerer  once per turn 	'	,	391	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	You can send 1 face-up  Speedroid  Tuner and 1 face-up non-Tuner monster you control to the Graveyard  whose total Levels equal 7  Special Summon this card from your Pendulum Zone  You can only use this effect of  Clear Wing Fast Dragon  once per turn 	'	,	392	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Each turn  the first  Crystal Beast  card(s)   Rainbow Dragon(s)  and/or  Rainbow Dark Dragon(s)  you control that would be destroyed by a card effect  is not destroyed 	'	,	393	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Your opponent cannot target  Crystal Beast  cards   Rainbow Dragon   and  Rainbow Dark Dragon  you control with card effects 	'	,	394	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once per turn  You can target 1  D/D  monster you control  change its Level to 4  and if you do  it gains 400 ATK and DEF (even if this card leaves the field) 	'	,	395	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  You can target 1 Spell/Trap Card on the field and 1 other  D/D  or  Dark Contract  card you control  destroy them 	'	,	396	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once per turn  You can pay 500 LP  then target 1 face-up monster your opponent controls  it loses 500 ATK (even if this card leaves the field)  Unless you have a  D/D  card in your other Pendulum Zone  this card s Pendulum Scale becomes 5 	'	,	397	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Once per turn  You can pay 500 LP  then target 1  D/D  monster you control  it gains 500 ATK (even if this card leaves the field)  Unless you have a  D/D  card in your other Pendulum Zone  this card s Pendulum Scale becomes 5 	'	,	398	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  D/D  monsters  This effect cannot be negated  Once  while this card is in your Pendulum Zone  you can negate an activated Spell effect that would inflict damage to you  then destroy this card 	'	,	399	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  D/D  monsters  This effect cannot be negated  Once per turn  during your Standby Phase  Increase this card s Pendulum Scale by 2 (max  10)  then destroy all monsters you control with a Level less than or equal to this card s Pendulum Scale  except  D/D  monsters 	'	,	400	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You cannot Pendulum Summon monsters  except  D/D  monsters  This effect cannot be negated  Once per turn  during your Standby Phase  Reduce this card s Pendulum Scale by 2 (min  1)  then destroy all monsters you control with a Level greater than or equal to this card s Pendulum Scale  except  D/D  monsters 	'	,	401	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You cannot Pendulum Summon monsters  except  D/D  monsters  This effect cannot be negated  Once  while this card is in your Pendulum Zone  you can negate an activated Trap effect that would inflict damage to you  then destroy this card 	'	,	402	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	You cannot Pendulum Summon monsters  except  D/D  monsters  This effect cannot be negated  Once per turn  You can discard 1  D/D/D  monster  then target 1 Level 6 or lower  D/D  monster you control  it gains 2000 ATK and DEF until the end of this turn (even if this card leaves the field) 	'	,	403	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	During your Main Phase  You can add 1 face-up  D/D  Pendulum Monster from your Extra Deck to your hand  You can only use this effect of  D/D Savant Thomas  once per turn 	'	,	404	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	You can banish 2  D/D  monsters from your Graveyard  Special Summon this card from your Pendulum Zone 	'	,	405	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	During your Main Phase  You can add 1 face-up  D/D/D  monster from your Extra Deck to your hand  except  D/D/D Destiny King Zero Laplace   You can only use this effect of  D/D/D Destiny King Zero Laplace  once per turn 	'	,	406	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1  D/D  monster you control  it gains 800 ATK until the end of this turn (even if this card leaves the field) 	'	,	407	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	If you Special Summon a  D/D  monster(s)  except during the Damage Step  You can target 1  D/D  monster in your Graveyard  any battle damage your opponent takes becomes halved for the rest of this turn  also Special Summon that monster  and if you do  take 1000 damage  You can only use this effect of  D/D/D Oblivion King Abyss Ragnarok  once per turn 	'	,	408	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	When you take effect damage (except during the Damage Step)  You can destroy this card  and if you do  any effect that would inflict damage to a player this turn increases their LP by the same amount  instead 	'	,	409	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  when an opponent s monster declares an attack  You can target 1  D/D/D  Synchro Monster you control  destroy as many monsters your opponent controls as possible with DEF less than or equal to the targeted monster s ATK  and if you do  inflict 1000 damage to your opponent for each monster destroyed 	'	,	410	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  if you have a  D/D  card in your other Pendulum Zone  You can Special Summon 1  D/D/D  Xyz Monster from your Extra Deck  except  D/D/D Super Doom King Dark Armageddon  	'	,	411	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  if a  D/D/D  Fusion Monster you control battles an opponent s monster  before damage calculation  You can make that opponent s monster lose 1000 ATK until the end of this turn (even if this card leaves the field) 	'	,	412	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	You can target 1 face-up monster on the field  change its DEF to 0 until the end of this turn (even if this card leaves the field)  You can only use this effect of  D/D/D Supersight King Zero Maxwell  once per turn 	'	,	413	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	All EARTH  WATER  FIRE  and WIND monsters you control gain 200 ATK and DEF for every different Attribute among the monsters you control 	'	,	414	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You cannot Pendulum Summon monsters  except  Deskbot  monsters  This effect cannot be negated 	'	,	415	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  Deskbot  monsters  This effect cannot be negated 	'	,	416	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You cannot Pendulum Summon monsters  except  Deskbot  monsters  This effect cannot be negated 	'	,	417	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  Deskbot  monsters  This effect cannot be negated 	'	,	418	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can reveal 1 Pendulum Monster from your hand  then target 1  Magician  card in your Pendulum Zone  that target s Pendulum Scale becomes the same as the revealed Pendulum Monster s  until the end of this turn (even if this card leaves the field) 	'	,	419	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once  while this card is in your Pendulum Zone  you can negate an activated card effect that targets another  Dinomist  card(s) you control  then destroy this card 	'	,	420	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once  while this card is in your Pendulum Zone  you can negate an activated card effect that targets another  Dinomist  card(s) you control  then destroy this card 	'	,	421	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If another  Dinomist  card(s) you control would be destroyed by battle or an opponent s card effect  you can destroy this card instead 	'	,	422	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once  while this card is in your Pendulum Zone  you can negate an activated card effect that targets another  Dinomist  card(s) you control  then destroy this card 	'	,	423	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If another  Dinomist  card(s) you control would be destroyed by battle or an opponent s card effect  you can destroy this card instead 	'	,	424	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once  while this card is in your Pendulum Zone  you can negate an activated card effect that targets another  Dinomist  card(s) you control  then destroy this card 	'	,	425	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If another  Dinomist  card(s) you control would be destroyed by battle or an opponent s card effect  you can destroy this card instead 	'	,	426	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If another  Dinomist  card(s) you control would be destroyed by battle or an opponent s card effect  you can destroy this card instead 	'	,	427	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Once per turn  You can target 1 DARK Spellcaster-Type monster you control  apply this effect to it  then destroy this card  Once applied  double any battle damage that monster inflicts to your opponent this turn if it battles an opponent s monster 	'	,	428	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	At the start of the Damage Step  if a monster you control battles an opponent s face-up monster  You can discard 1 card  the opponent s battling monster s ATK and DEF become half its current ATK and DEF (even if this card leaves the field) 	'	,	429	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	All Normal Monsters gain 200 ATK  You take no battle damage from battles involving Normal Monsters you control 	'	,	430	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can target 1 face-up monster on the field  it becomes Dragon-Type until the end of your opponent s turn (even if this card leaves the field) 	'	,	431	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	None	'	,	432	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	When an opponent s monster declares an attack  You can destroy this card  then end the Battle Phase 	'	,	433	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Once per turn  if you have a  Magician  card in your other Pendulum Zone  You can discard 1 Pendulum Monster  then target 1 Spell/Trap Card on the field  destroy it 	'	,	434	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  if you have a  Magician  card in your other Pendulum Zone  You can discard 1 Pendulum Monster  then target 1 face-up monster on the field  destroy it 	'	,	435	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  if a Normal Monster you control destroys an opponent s monster by battle  after damage calculation  You can add 1 Level 4 or higher Normal Monster from your Deck to your hand 	'	,	436	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	All Fusion Monsters you control gain 300 ATK  Once per turn  if a  Frightfur  Fusion Monster is Fusion Summoned to your field  You can draw 1 card 	'	,	437	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	0	,	'		'	,	438	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	None	'	,	439	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  during the End Phase  if this card was activated this turn  You can target 1 face-up Spell/Trap Card on the field  destroy it 	'	,	440	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can roll a six-sided die  Until the end of this turn  increase this card s Pendulum Scale by that number (max  10) 	'	,	441	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	 Apply these effects 	'	,	442	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'		'	,	443	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Ã‚ï¿½Ã…â€œ You do not pay LP to activate Counter Trap Cards 	'	,	444	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'		'	,	445	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Ã‚ï¿½Ã…â€œ You do not discard to activate Counter Trap Cards  	'	,	446	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can target 1 face-up monster on the field  roll a six-sided die and that monster s Level becomes the same as the result until the end of this turn 	'	,	447	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	All monsters you control gain 100 ATK and DEF for each face-up  Magician  Pendulum Monster with different names in your Extra Deck 	'	,	448	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	449	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	450	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	451	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	452	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	453	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	454	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	455	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	If you have an  Igknight  card in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1 FIRE Warrior-Type monster from your Deck or Graveyard to your hand 	'	,	456	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	Once per turn  You can banish 3 Fairy-Type Pendulum Monsters you control  then target 1 Pendulum Monster you control  if it attacks your opponent directly and reduces their LP to 0 this turn  you win the Match 	'	,	457	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	 	'	,	458	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'		'	,	459	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	    If a monster(s) is Pendulum Summoned  Return this card from the Pendulum Zone to the hand  	'	,	460	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	If a monster(s) is Pendulum Summoned  Return this card from the Pendulum Zone to the hand 	'	,	461	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  You can banish 3 Spellcaster-Type Pendulum Monsters you control  then target 1 Pendulum Monster you control  if it attacks your opponent directly and reduces their LP to 0 this turn  you win the Match 	'	,	462	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If a Normal Monster you control attacks a Defense Position monster  inflict piercing battle damage to your opponent 	'	,	463	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Negate the effects of face-up Pendulum Monsters while your opponent controls them 	'	,	464	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can banish 3 Machine-Type Pendulum Monsters you control  then target 1 Pendulum Monster you control  if it attacks your opponent directly and reduces their LP to 0 this turn  you win the Match 	'	,	465	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  You can target 1  Lunalight  monster in your Graveyard  Special Summon it  but it cannot attack  its effects are negated  also it is destroyed during the End Phase 	'	,	466	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	You cannot Pendulum Summon monsters  except  Lunalight  monsters  This effect cannot be negated  Once per turn  You can Fusion Summon 1  Lunalight  Fusion Monster from your Extra Deck  by banishing Fusion Materials listed on it from your field or Graveyard 	'	,	467	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  if you have a card in your other Pendulum Zone  You can destroy that card  and if you do  add 1 card from your Deck to your hand  with the same name as that card 	'	,	468	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Each time a Spell Card is activated  place 1 Spell Counter on this card when that Spell Card resolves  Once per turn  You can remove 3 Spell Counters from this card  add 1 Pendulum Monster from your Deck to your hand 	'	,	469	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	None	'	,	470	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	None	'	,	471	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	None	'	,	472	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	None	'	,	473	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	None	'	,	474	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	None	'	,	475	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	None	'	,	476	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	None	'	,	477	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once  while this card is in your Pendulum Zone  You can target 1 card in a Pendulum Zone  destroy it 	'	,	478	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	When a  Yosenju  monster you control declares an attack  You can have that attacking monster gain 300 ATK until the end of the Battle Phase 	'	,	479	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1 other face-up card you control  destroy it  and if you do  Set 1  Metalfoes  Spell/Trap Card directly from your Deck 	'	,	480	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1 other face-up card you control  destroy it  and if you do  Set 1  Metalfoes  Spell/Trap Card directly from your Deck 	'	,	481	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1 other face-up card you control  destroy it  and if you do  Set 1  Metalfoes  Spell/Trap Card directly from your Deck 	'	,	482	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1 other face-up card you control  destroy it  and if you do  Set 1  Metalfoes  Spell/Trap Card directly from your Deck 	'	,	483	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1 other card in a Pendulum Zone  this card s Pendulum Scale becomes equal to that card s  until the end of this turn 	'	,	484	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can roll a six-sided die  Until the end of this turn  reduce this card s Pendulum Scale by that number (min  1) 	'	,	485	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	If you have no card in your other Pendulum Zone  You can destroy this card  and if you do  shuffle 1 face-up Spellcaster Pendulum Monster from your Extra Deck into your Deck  except  Mythical Beast Bashilisk   then draw 1 card  You can only use this effect of  Mythical Beast Bashilisk  once per turn 	'	,	486	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	If you have no card in your other Pendulum Zone  You can target 1 other Spell/Trap on the field  destroy both it and this card  You can only use this effect of  Mythical Beast Garuda  once per turn 	'	,	487	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	If you have no card in your other Pendulum Zone  You can target 1 card you control that you can place a Spell Counter on  destroy this card  and if you do  place 1 Spell Counter on that card  You can only use this effect of  Mythical Beast Jackal  once per turn 	'	,	488	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	If you have no cards in your other Pendulum Zone  You can destroy this card  and if you do  Special Summon 1 face-up  Mythical Beast  Pendulum Monster from your Extra Deck  except  Mythical Beast Jackal King   You can only use this effect of  Mythical Beast Jackal King  once per turn 	'	,	489	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	If you have no cards in your other Pendulum Zone  You can destroy this card  and if you do  add 1 Level 7 or lower  Mythical Beast  Effect Monster from your Deck to your hand  You can only use this effect of  Mythical Beast Master Cerberus  once per turn 	'	,	490	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	If you have no card in your other Pendulum Zone  You can target 1 monster in your GY that you can place a Spell Counter on  destroy this card  and if you do  Special Summon that monster  and if you do that  place 1 Spell Counter on it  You can only use this effect of  Mythical Beast Medusa  once per turn 	'	,	491	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	If a Pendulum Monster you control attacks  for that battle  it cannot be destroyed by battle  also you take no battle damage  At the end of the Damage Step  if a Pendulum Monster you control attacked  All monsters your opponent currently controls lose ATK equal to that attacking monster s ATK  until the end of this turn 	'	,	492	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Unless you have a  Magician  card in your other Pendulum Zone  destroy this card 	'	,	493	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	If you have a  Magician  card in your other Pendulum Zone  You can add 1 face-up  Magician  or  Odd-Eyes  Pendulum Monster from your Extra Deck to your hand  except  Oafdragon Magician   You can only use this effect of  Oafdragon Magician  once per turn 	'	,	494	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	If an  Odd-Eyes  card(s) you control is destroyed by battle or card effect  You can Special Summon 1  Odd-Eyes  monster from your hand  Deck  or GY  You can only use this effect of  Odd-Eyes Arc Pendulum Dragon  once per turn 	'	,	495	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	12	,	'	Once per turn  if a face-up  Odd-Eyes  Pendulum Monster(s) you control is destroyed by battle or card effect  You can destroy 1 card in your Pendulum Zone  and if you do  place 1 face-up  Odd-Eyes  Pendulum Monster in your Extra Deck in your Pendulum Zone  except  Odd-Eyes Mirage Dragon  	'	,	496	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You can reduce the battle damage you take from an attack involving a Pendulum Monster you control to 0  During your End Phase  You can destroy this card  and if you do  add 1 Pendulum Monster with 1500 or less ATK from your Deck to your hand  You can only use each Pendulum Effect of  Odd-Eyes Pendulum Dragon  once per turn 	'	,	497	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	Once per turn  during the End Phase  if your opponent activated a card or effect this turn that targeted exactly 1  Odd-Eyes  Pendulum Monster you controlled (and no other cards) while this card was in your Pendulum Zone  Special Summon this card  and if you do  place 1 face-up  Odd-Eyes  Pendulum Monster from your Extra Deck in your Pendulum Zone  except  Odd-Eyes Persona Dragon  	'	,	498	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  while you control an  Odd-Eyes  card in your other Pendulum Zone  if an attack is declared involving a face-up monster you control and an opponent s monster  You can have your battling monster gain 1200 ATK until the end of the Battle Phase (even if this card leaves the field) 	'	,	499	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  if you have no cards in your other Pendulum Zone  You can place 1 Pendulum Monster from your Deck in your Pendulum Zone 	'	,	500	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	0	,	'	Once per turn  if you have no cards in your other Pendulum Zone  You can place 1 Pendulum Monster from your Deck in your Pendulum Zone 	'	,	501	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	You cannot Pendulum Summon monsters  except Dragon monsters  This effect cannot be negated  You can target 1 Dragon Fusion  Synchro  or Xyz Monster in your GY  destroy this card  and if you do  Special Summon that monster 	'	,	502	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  You can target 1 Fusion Monster you control  it gains 1000 ATK for each monster your opponent controls  until the end of this turn 	'	,	503	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  if a monster you control battles an opponent s monster  before damage calculation  You can make that monster you control gain ATK equal to the current ATK of the opponent s monster it is battling until the end of the Damage Step (even if this card leaves the field) 	'	,	504	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	When you Pendulum Summon a Zombie-Type monster(s)  You can activate this effect  it cannot be destroyed by battle or card effects this turn 	'	,	505	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	While you have no cards in your Extra Deck  You can target 1 card in your opponent s Pendulum Zone  destroy it  and if you do  place this card in your opponent s Pendulum Zone 	'	,	506	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  during your Main Phase  if this card was activated this turn  You can target 1 of your Pendulum Monsters  that is banished or in your Graveyard  except  Pendulumucho   add it to your Extra Deck face-up 	'	,	507	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can target 1 face-up Special Summoned monster on the field  its ATK and DEF become equal to its current ATK or DEF (whichever is lower) until the end of this turn (even if this card leaves the field) 	'	,	508	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	If a  Performage  monster(s) you control is destroyed by battle or card effect  You can Special Summon this card from your Pendulum Zone  then take 500 damage  You can only use this effect of  Performage Plushfire  once per turn 	'	,	509	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  at the start of the Damage Step  when your  Performapal  monster battles an opponent s face-up monster  You can make that opponent s monster lose 600 ATK (even if this card leaves the field) 	'	,	510	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  if your  Performapal  monster battles an opponent s monster  before damage calculation  You can make that opponent s monster lose ATK equal to the difference between its original ATK and current ATK (even if this card leaves the field) 	'	,	511	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  You can reveal 1  Performapal  or  Odd-Eyes  monster in your hand  and if you do  reduce the Levels of monsters in your hand with that name by 1 for the rest of this turn (even after they are Summoned/Set  and even if this card leaves the field) 	'	,	512	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	If a face-up non-Pendulum Monster(s) you control that was Special Summoned from the Extra Deck would be destroyed by battle or card effect  you can destroy this card instead 	'	,	513	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  during your Main Phase 1  You can target 1 face-up monster you control  the monsters your opponent currently controls lose 800 DEF until the end of this turn  and if they do  if the targeted monster attacks a Defense Position monster this turn  inflict piercing battle damage to your opponent  (These effects remain even if this card leaves the field )	'	,	514	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Once per turn  You can target 1 face-up Defense Position monster you control  its DEF becomes the combined original DEF of all face-up Defense Position monsters you control (even if this card leaves the field) 	'	,	515	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	When exactly 1 monster you control (and no other cards) is destroyed by battle  You can destroy this card  and if you do  Special Summon that monster destroyed by battle in Attack Position  and if you do that  it cannot be destroyed by battle this turn (even if this card leaves the field) 	'	,	516	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	All Pendulum Monsters you control gain 300 ATK 	'	,	517	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	12	,	'	Other Dragon-Type monsters you control gain 500 ATK  also they cannot be destroyed by card effects 	'	,	518	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	During your Main Phase  if this card was activated this turn  You can target 1  Performapal  monster in your Graveyard  add it to your hand  You can only use this effect of  Performapal Dag Daggerman  once per turn 	'	,	519	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  when an attack is declared involving a monster you control and an opponent s monster  You can target that monster you control  it gains 600 ATK until the end of the Battle Phase (even if this card leaves the field) 	'	,	520	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	During your Main Phase  You can inflict 300 damage to your opponent for each face-up Pendulum Monster in your Extra Deck  You can only use this effect of  Performapal Extra Slinger  once per turn  You cannot Pendulum Summon the turn you activate this effect 	'	,	521	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	When a Pendulum Monster you control is destroyed by battle  You can Special Summon this card from your Pendulum Zone 	'	,	522	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  when an opponent s monster declares an attack  You can Tribute 1  Performapal  monster  negate the attack  then end the Battle Phase 	'	,	523	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	 You cannot Pendulum Summon  except from the Extra Deck  This effect cannot be negated  Each player applies 1 of these effects based on the number of Set cards in their Spell  Trap Zones 	'	,	524	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'		'	,	525	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Ã‚ï¿½Ã…â€œ 0  All monsters they control cannot attack or activate their effects 	'	,	526	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'		'	,	527	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	Ã‚ï¿½Ã…â€œ 4 or more  The ATK of all monsters they control become double their original ATK  	'	,	528	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	Once per turn  if a  Performapal  monster you control destroys an opponent s monster by battle  Inflict 1000 damage to your opponent 	'	,	529	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  when an opponent s monster declares a direct attack  You can activate this effect  you take no battle damage from that battle (even if this card leaves the field) 	'	,	530	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	If a  Performapal  card is activated in your other Pendulum Zone  You can draw 1 card  You can only use this effect of  Performapal Guitartle  once per turn 	'	,	531	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  when an attack is declared involving a monster you control and an opponent s monster  You can activate this effect  that monster you control cannot be destroyed by that battle 	'	,	532	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	You can target 1  Performapal  card you control  return it to the hand  but for the rest of this turn  your cards with the same name as the one returned to the hand by this effect  and their effects  cannot be activated (even if this card leaves the field)  You can only use this effect of  Performapal Handstandaccoon  once per turn 	'	,	533	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	6	,	'	All LIGHT monsters you control gain 300 ATK 	'	,	534	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Once per turn  during the End Phase  if this card was activated this turn  You can destroy this card  and if you do  add 1 Level 7 or higher monster to your hand  that is either in your Graveyard or face-up in your Extra Deck 	'	,	535	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  if your opponent controls a monster whose current ATK is higher than its original ATK  You can gain 1000 LP 	'	,	536	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  You can increase the Levels of all Pendulum Summoned monsters you control by 1 (even if this card leaves the field) 	'	,	537	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	If you have a  Performapal  card in your other Pendulum Zone  except  Performapal Lizardraw   You can destroy this card  and if you do  draw 1 card  You can only use this effect of  Performapal Lizardraw  once per turn 	'	,	538	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Unless you have a card in your other Pendulum Zone  destroy this card  While this card is in the Pendulum Zone  any battle damage you take becomes halved 	'	,	539	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Unless you have a  Performapal  card in your other Pendulum Zone  this card s Pendulum Scale becomes 4  During your Main Phase  if this card was activated this turn  You can add 1 Level 4 or lower  Performapal  monster from your Deck to your hand  You can only use this effect of  Performapal Monkeyboard  once per turn 	'	,	540	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once per turn  You can Fusion Summon 1 Dragon Fusion Monster from your Extra Deck  using monsters from your hand or field as Fusion Materials 	'	,	541	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	When an opponent s monster declares a direct attack while you have a card in your other Pendulum Zone  You can destroy the card in your other Pendulum Zone  and if you do  Special Summon this card 	'	,	542	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	If your  Performapal  or  Odd-Eyes  monster attacks a Defense Position monster  inflict piercing battle damage to your opponent 	'	,	543	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1  Performapal  or  Odd-Eyes  monster you control  this turn  that face-up monster is treated as a Tuner  also its Level becomes 1 (even if this card leaves the field) 	'	,	544	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	Once  while this card is in your Pendulum Zone  when an  Odd-Eyes  monster you control declares an attack  You can target 1 other  Performapal  monster you control  that attacking monster gains ATK equal to the original ATK of the targeted monster on the field  until the end of the Battle Phase (even if this card leaves the field) 	'	,	545	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  if you control a  Performapal    Magician   or  Odd-Eyes  card in your other Pendulum Zone  except  Performapal Parrotrio   You can make this card s Pendulum Scale become 7 until the end of this turn 	'	,	546	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can target 1 face-up monster you control  it gains 300 ATK for each  Performapal  card you currently control  until the end of this turn 	'	,	547	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	If a  Performapal  monster(s) is Pendulum Summoned to your field  All  Performapal  monsters you currently control gain 1000 ATK until the end of this turn (even if this card leaves the field) 	'	,	548	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  You can target 1 face-up monster your opponent controls  and 1  Performapal  monster you control  that opponent s monster loses ATK equal to the ATK of that  Performapal  monster you control (even if this card leaves the field) 	'	,	549	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Once per turn  You can target 1 face-up monster your opponent controls  that face-up monster has its effects negated until the end of this turn (even if this card leaves the field) 	'	,	550	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  when a  Performapal  monster you control is destroyed by battle  You can target 1  Performapal  or  Odd-Eyes  card in your Pendulum Zone  Special Summon it 	'	,	551	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	All  Performapal  monsters you control gain 300 ATK 	'	,	552	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  Performapal  monsters   Magician  Pendulum Monsters  and  Odd-Eyes  monsters  This effect cannot be negated 	'	,	553	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  when a Fusion Monster(s) is Special Summoned to your side of the field (except during the Damage Step)  You can Special Summon 1 face-up  Odd-Eyes  Pendulum Monster from your Extra Deck 	'	,	554	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	Once per turn  when a monster you control inflicts battle damage to your opponent  You can send the top card of your opponent s Deck to the Graveyard 	'	,	555	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	When you Pendulum Summon a monster(s)  You can target 1 card in either player s Pendulum Zone  return it to the hand  You can only use this effect of  Performapal Trampolynx  once per turn 	'	,	556	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	None	'	,	557	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can Fusion Summon 1 Fusion Monster from your Extra Deck  using monsters you control as Fusion Materials 	'	,	558	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	Once per turn  You can increase this card s Pendulum Scale by 1 (max  12) 	'	,	559	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	9	,	'	Once per turn  You can target 1 face-up monster on the field  switch its current ATK and DEF until the end of this turn 	'	,	560	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  if a monster is Fusion Summoned to your field (except during the Damage Step)  You can add 1  Performapal    Odd-Eyes   or  Magician  Pendulum Monster from your Graveyard or face-up in your Extra Deck to your hand 	'	,	561	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	If your opponent controls a face-up monster that was Special Summoned from the Extra Deck and you do not  You can Special Summon this card from your Pendulum Zone  You can only use this effect of  Performapal Whim Witch  once per turn 	'	,	562	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Once per turn  if your DARK Spellcaster-Type monster battles  before damage calculation  You can activate this effect  that monster gains 1200 ATK (until the end of the Damage Step)  then destroy this card 	'	,	563	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  All  Qli  monsters you control gain 300 ATK 	'	,	564	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You can only Special Summon  Qli  monsters  This effect cannot be negated  All monsters your opponent controls lose 300 ATK 	'	,	565	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  All  Qli  monsters you control gain 300 ATK 	'	,	566	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  All monsters your opponent controls lose 300 ATK 	'	,	567	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  Once per turn  during the End Phase  if you Tribute Summoned this turn  You can draw a number of cards equal to the number of  Qli  monsters you Tributed for Tribute Summons this turn 	'	,	568	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  Once per turn  You can pay 800 LP  add 1  Qli  card from your Deck to your hand  except  Qliphort Scout  	'	,	569	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  All monsters your opponent controls lose 300 ATK 	'	,	570	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	You cannot Special Summon monsters  except  Qli  monsters  This effect cannot be negated  All  Qli  monsters you control gain 300 ATK 	'	,	571	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can target 1 other face-up card you control  destroy it  and if you do  Set 1  Metalfoes  Spell/Trap Card directly from your Deck 	'	,	572	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You can banish this card from your Pendulum Zone  add 2 face-up Pendulum Monster Cards with the same name from your Extra Deck to your hand  You can only use this effect of  Rescue Hamster  once per Duel 	'	,	573	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	Once per turn  You can target 1 face-up monster on the field  increase its Level by 1 (even if this card leaves the field) 	'	,	574	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	You cannot Pendulum Summon monsters  except  Ritual Beast  or  Zefra  monsters  This effect cannot be negated 	'	,	575	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	You cannot Pendulum Summon monsters  except  Ritual Beast  and  Zefra  monsters  This effect cannot be negated 	'	,	576	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can banish 3 Warrior-Type Pendulum Monsters you control  then target 1 Pendulum Monster you control  if it attacks your opponent directly and reduces their LP to 0 this turn  you win the Match 	'	,	577	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	None	'	,	578	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	You cannot Pendulum Summon monsters  except  tellarknight  and  Zefra  monsters  This effect cannot be negated 	'	,	579	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	When a monster is destroyed by battle  You can Special Summon 1 Normal Monster from your hand  You can only use this effect of  Sea Dragoons of Draconia  once per turn 	'	,	580	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  Shaddoll  and  Zefra  monsters  This effect cannot be negated 	'	,	581	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	You cannot Pendulum Summon monsters  except  Shaddoll  and  Zefra  monsters  This effect cannot be negated 	'	,	582	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	4	,	'	Once per turn  You can banish 3 Psychic-Type Pendulum Monsters you control  then target 1 Pendulum Monster you control  if it attacks your opponent directly and reduces their LP to 0 this turn  you win the Match 	'	,	583	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	13	,	'	Once per turn  when a Normal Monster you control inflicts battle damage to your opponent  You can target 1 card on the field  destroy it 	'	,	584	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	0	,	'	You cannot Pendulum Summon monsters  except WIND monsters  This effect cannot be negated  You can discard 1 WIND monster  then target 1 of your banished WIND monsters  add it to your hand  You can only use this effect of  Speedroid Dominobutterfly  once per turn 	'	,	585	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can send 1  Speedroid  Tuner from your hand or face-up from your field to the GY  increase or reduce (min  1) this card s Pendulum Scale by the original Level of the sent monster until the end of this turn 	'	,	586	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If a Pendulum Monster you control battles  your opponent cannot activate Spell Cards until the end of the Damage Step  Unless you have a  Magician  card or  Odd-Eyes  card in your other Pendulum Zone  this card s Pendulum Scale becomes 4 	'	,	587	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	None	'	,	588	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	You cannot Pendulum Summon monsters  except  tellarknight  and  Zefra  monsters  This effect cannot be negated 	'	,	589	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	2	,	'	While you have a Spell/Trap Card(s) in your Graveyard  this card s Pendulum Scale becomes 4  Once per turn  when a  Superheavy Samurai  monster you control destroys an opponent s monster by battle  You can activate this effect  that monster can make a second attack in a row (even if this card leaves the field) 	'	,	590	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	You cannot Pendulum Summon monsters  except  Superheavy Samurai  monsters  This effect cannot be negated  Once per turn  You can target 1  Superheavy Samurai  monster you control  increase its Level by 1 (even if this card leaves the field) 	'	,	591	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  if you control no monsters  You can place 1  Supreme King Gate  Pendulum Monster from your Deck in your Pendulum Zone  also you cannot Pendulum Summon monsters for the rest of this turn  except DARK monsters 	'	,	592	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	10	,	'	You can Tribute 1  Supreme King Dragon  monster  destroy this card  and if you do  add 1 Pendulum Monster with 1500 or less ATK from your Deck to your hand 	'	,	593	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	If you control a monster  you cannot Pendulum Summon  This effect cannot be negated  Once per turn  if you control  Supreme King Z-ARC   You can target 1 face-up monster your opponent controls  gain LP equal to its ATK 	'	,	594	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	If you control  Supreme King Z-ARC   you take no damage  Once per turn  if you have  Supreme King Gate Infinity  in your other Pendulum Zone  You can destroy both cards in your Pendulum Zones  and if you do  add 1  Polymerization  Spell Card or  Fusion  Spell Card from your Deck to your hand 	'	,	595	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	Fusion  Synchro  and Xyz Monsters your opponent controls cannot activate their effects  Once per turn  when your opponent adds a card(s) from their Deck to their hand (except during the Draw Phase or the Damage Step)  You can destroy that card(s) 	'	,	596	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	You can discard 1 card  Special Summon 1  Symphonic Warrior  monster from your Deck  except  Symphonic Warrior Guitaar   You can only use this effect of  Symphonic Warrior Guitaar  once per turn 	'	,	597	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	8	,	'	Unless you have a  Symphonic Warrior  card in your other Pendulum Zone  this card s Pendulum Scale becomes 4  Once per turn  during your End Phase  You can target 1 of your banished  Symphonic Warrior  monsters  add it to your hand 	'	,	598	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can banish 3 Beast-Type Pendulum Monsters you control  then target 1 Pendulum Monster you control  if it attacks your opponent directly and reduces their LP to 0 this turn  you win the Match 	'	,	599	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	3	,	'	Each turn  the first Pendulum Monster(s) you control that would be destroyed by an opponent s card effect  is not destroyed 	'	,	600	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	You must control no monsters to activate this card  If a Pendulum Monster you control battles  your opponent cannot activate Trap Cards until the end of the Damage Step  Unless you have a  Magician  card or  Odd-Eyes  card in your other Pendulum Zone  this card s Pendulum Scale becomes 4 	'	,	601	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If your  Ninja  monster attacks a Defense Position monster  inflict piercing battle damage to your opponent 	'	,	602	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	5	,	'	You cannot Pendulum Summon monsters  except  Ninja  monsters  This effect cannot be negated  Once per turn  when your  Ninja  monster declares an attack  You can make that monster gain 1000 ATK until the end of the Damage Step (even if this card leaves the field) 	'	,	603	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	Negate all card effects in your opponent s Pendulum Zones 	'	,	604	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  when an activated card or effect resolves that targets a DARK Spellcaster-Type monster you control  negate that effect  then destroy this card 	'	,	605	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	7	,	'	If you have a  Magician  or  Performapal  card in your other Pendulum Zone  You can destroy this card  and if you do  place 1  Magician  Pendulum Monster from your Deck in your Pendulum Zone  except  Wisdom-Eye Magician  	'	,	606	);
INSERT INTO PENDULOS(pen_escala, pen_efeito, pen_car_mon_id) VALUES	(	1	,	'	Once per turn  You can target 1 face-up Xyz Monster you control  this turn  you can use it as an Xyz Material for an Xyz Summon using its Rank as if it were a Level (even if this card leaves the field) 	'	,	607	);

/*************************** 
  TODO - Insert CARTAS NORMAL/EFEITO
****************************/INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' AtoZDragon Buster Cannon ' , ' LIGHT ' , ' Machine ' , ' teste3 ' , 1 , 608 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' ABCDragon Buster ' , ' LIGHT ' , ' Machine ' , ' teste4 ' , 2 , 609 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Alligators Sword Dragon ' , ' WIND ' , ' Dragon ' , ' teste5 ' , 3 , 610 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amazoness Empress ' , ' EARTH ' , ' Warrior ' , ' teste6 ' , 4 , 611 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amazoness Pet Liger ' , ' EARTH ' , ' Beast ' , ' teste7 ' , 5 , 612 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ambulance Rescueroid ' , ' FIRE ' , ' Machine ' , ' teste8 ' , 6 , 613 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amphibious Bugroth ' , ' WATER ' , ' Aqua ' , ' teste9 ' , 7 , 614 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Amulet Dragon ' , ' DARK ' , ' Dragon ' , ' teste10 ' , 8 , 615 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ancient Gear Howitzer ' , ' EARTH ' , ' Machine ' , ' teste11 ' , 9 , 616 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ancient Gear Megaton Golem ' , ' EARTH ' , ' Machine ' , ' teste12 ' , 10 , 617 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Aqua Dragon ' , ' WATER ' , ' Sea Serpent ' , ' teste13 ' , 11 , 618 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Arcana Knight Joker ' , ' LIGHT ' , ' Warrior ' , ' teste14 ' , 12 , 619 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Archfiend Black Skull Dragon ' , ' DARK ' , ' Dragon ' , ' teste15 ' , 1 , 620 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Armed Dragon Catapult Cannon ' , ' LIGHT ' , ' Machine ' , ' teste16 ' , 2 , 621 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Armityle the Chaos Phantom ' , ' DARK ' , ' Fiend ' , ' teste17 ' , 3 , 622 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' B Skull Dragon ' , ' DARK ' , ' Dragon ' , ' teste18 ' , 4 , 623 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Barbaroid the Ultimate Battle Machine ' , ' EARTH ' , ' Machine ' , ' teste19 ' , 5 , 624 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Barox ' , ' DARK ' , ' Fiend ' , ' teste20 ' , 6 , 625 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' BeastEyes Pendulum Dragon ' , ' EARTH ' , ' Dragon ' , ' teste21 ' , 7 , 626 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bickuribox ' , ' DARK ' , ' Fiend ' , ' teste22 ' , 8 , 627 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Blaze Fenix the Burning Bombardment Bird ' , ' FIRE ' , ' Pyro ' , ' teste23 ' , 9 , 628 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bloom Diva the Melodious Choir ' , ' LIGHT ' , ' Fairy ' , ' teste24 ' , 10 , 629 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bloom Prima the Melodious Choir ' , ' LIGHT ' , ' Fairy ' , ' teste25 ' , 11 , 630 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' BlueEyes Twin Burst Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste26 ' , 12 , 631 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' BlueEyes Ultimate Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste27 ' , 1 , 632 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bracchioraidus ' , ' WATER ' , ' Dinosaur ' , ' teste28 ' , 2 , 633 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' BraveEyes Pendulum Dragon ' , ' DARK ' , ' Dragon ' , ' teste29 ' , 3 , 634 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Buster Blader the Dragon Destroyer Swordsman ' , ' LIGHT ' , ' Warrior ' , ' teste30 ' , 4 , 635 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chaos Ancient Gear Giant ' , ' DARK ' , ' Machine ' , ' teste31 ' , 5 , 636 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Charubin the Fire Knight ' , ' FIRE ' , ' Pyro ' , ' teste32 ' , 6 , 637 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chimera the Flying Mythical Beast ' , ' WIND ' , ' Beast ' , ' teste33 ' , 7 , 638 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chimeratech Fortress Dragon ' , ' DARK ' , ' Machine ' , ' teste34 ' , 8 , 639 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chimeratech Megafleet Dragon ' , ' DARK ' , ' Machine ' , ' teste35 ' , 9 , 640 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chimeratech Overdragon ' , ' DARK ' , ' Machine ' , ' teste36 ' , 10 , 641 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chimeratech Rampage Dragon ' , ' DARK ' , ' Machine ' , ' teste37 ' , 11 , 642 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Contrast HERO Chaos ' , ' DARK ' , ' Warrior ' , ' teste38 ' , 12 , 643 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Crimson Nova Trinity the Dark Cubic Lord ' , ' DARK ' , ' Fiend ' , ' teste39 ' , 1 , 644 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Crimson Sunbird ' , ' FIRE ' , ' Winged Beast ' , ' teste40 ' , 2 , 645 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber Blader ' , ' EARTH ' , ' Warrior ' , ' teste41 ' , 3 , 646 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber End Dragon ' , ' LIGHT ' , ' Machine ' , ' teste42 ' , 4 , 647 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber Ogre 2 ' , ' EARTH ' , ' Machine ' , ' teste43 ' , 5 , 648 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber Saurus ' , ' EARTH ' , ' Machine ' , ' teste44 ' , 6 , 649 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyber Twin Dragon ' , ' LIGHT ' , ' Machine ' , ' teste45 ' , 7 , 650 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyberdark Dragon ' , ' DARK ' , ' Machine ' , ' teste46 ' , 8 , 651 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cyberdarkness Dragon ' , ' DARK ' , ' Dragon ' , ' teste47 ' , 9 , 652 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D3S Frog ' , ' WATER ' , ' Aqua ' , ' teste48 ' , 10 , 653 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Dragonbane King Beowulf ' , ' DARK ' , ' Fiend ' , ' teste49 ' , 11 , 654 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Flame High King Executive Genghis ' , ' FIRE ' , ' Fiend ' , ' teste50 ' , 12 , 655 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Flame King Genghis ' , ' FIRE ' , ' Fiend ' , ' teste51 ' , 1 , 656 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Oracle King dArc ' , ' DARK ' , ' Fiend ' , ' teste52 ' , 2 , 657 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Superdoom King Purplish Armageddon ' , ' DARK ' , ' Fiend ' , ' teste53 ' , 3 , 658 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D/D/D Wave Oblivion King Caesar Ragnarok ' , ' DARK ' , ' Fiend ' , ' teste54 ' , 4 , 659 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dante Pilgrim of the Burning Abyss ' , ' LIGHT ' , ' Fairy ' , ' teste55 ' , 5 , 660 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Balter the Terrible ' , ' DARK ' , ' Fiend ' , ' teste56 ' , 6 , 661 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Blade the Dragon Knight ' , ' DARK ' , ' Warrior ' , ' teste57 ' , 7 , 662 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Flare Knight ' , ' DARK ' , ' Warrior ' , ' teste58 ' , 8 , 663 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Magician Girl the Dragon Knight ' , ' DARK ' , ' Dragon ' , ' teste59 ' , 9 , 664 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Magician the Dragon Knight ' , ' DARK ' , ' Dragon ' , ' teste60 ' , 10 , 665 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Paladin ' , ' DARK ' , ' Spellcaster ' , ' teste61 ' , 11 , 666 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Darkfire Dragon ' , ' DARK ' , ' Dragon ' , ' teste62 ' , 12 , 667 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Deepsea Shark ' , ' WATER ' , ' Fish ' , ' teste63 ' , 1 , 668 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Destiny End Dragoon ' , ' DARK ' , ' Warrior ' , ' teste64 ' , 2 , 669 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Destiny HERO  Dangerous ' , ' DARK ' , ' Warrior ' , ' teste65 ' , 3 , 670 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Destiny HERO  Dusktopia ' , ' DARK ' , ' Warrior ' , ' teste66 ' , 4 , 671 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Destiny HERO  Dystopia ' , ' DARK ' , ' Warrior ' , ' teste67 ' , 5 , 672 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dinoster Power the Mighty Dracoslayer ' , ' WATER ' , ' Dragon ' , ' teste68 ' , 6 , 673 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Doom Virus Dragon ' , ' DARK ' , ' Dragon ' , ' teste69 ' , 7 , 674 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragon Knight DracoEquiste ' , ' WIND ' , ' Dragon ' , ' teste70 ' , 8 , 675 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragon Master Knight ' , ' LIGHT ' , ' Dragon ' , ' teste71 ' , 9 , 676 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragonecro Nethersoul Dragon ' , ' DARK ' , ' Dragon ' , ' teste72 ' , 10 , 677 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dragoness the Wicked Knight ' , ' WIND ' , ' Warrior ' , ' teste73 ' , 11 , 678 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' El Shaddoll Anoyatyllis ' , ' WATER ' , ' Fiend ' , ' teste74 ' , 12 , 679 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' El Shaddoll Construct ' , ' LIGHT ' , ' Fairy ' , ' teste75 ' , 1 , 680 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' El Shaddoll Grysta ' , ' FIRE ' , ' Rock ' , ' teste76 ' , 2 , 681 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' El Shaddoll Shekhinaga ' , ' EARTH ' , ' Machine ' , ' teste77 ' , 3 , 682 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' El Shaddoll Wendigo ' , ' WIND ' , ' Psychic ' , ' teste78 ' , 4 , 683 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' El Shaddoll Winda ' , ' DARK ' , ' Spellcaster ' , ' teste79 ' , 5 , 684 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elder Entity Ntss ' , ' LIGHT ' , ' Fairy ' , ' teste80 ' , 6 , 685 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elder Entity Norden ' , ' WATER ' , ' Fairy ' , ' teste81 ' , 7 , 686 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Absolute Zero ' , ' WATER ' , ' Warrior ' , ' teste82 ' , 8 , 687 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Air Neos ' , ' WIND ' , ' Warrior ' , ' teste83 ' , 9 , 688 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Aqua Neos ' , ' WATER ' , ' Warrior ' , ' teste84 ' , 10 , 689 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Chaos Neos ' , ' DARK ' , ' Warrior ' , ' teste85 ' , 11 , 690 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Core ' , ' EARTH ' , ' Warrior ' , ' teste86 ' , 12 , 691 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Dark Neos ' , ' DARK ' , ' Warrior ' , ' teste87 ' , 1 , 692 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Darkbright ' , ' DARK ' , ' Warrior ' , ' teste88 ' , 2 , 693 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Divine Neos ' , ' LIGHT ' , ' Warrior ' , ' teste89 ' , 3 , 694 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Electrum ' , ' LIGHT ' , ' Warrior ' , ' teste90 ' , 4 , 695 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Escuridao ' , ' DARK ' , ' Warrior ' , ' teste91 ' , 5 , 696 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Flame Wingman ' , ' WIND ' , ' Warrior ' , ' teste92 ' , 6 , 697 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Flare Neos ' , ' FIRE ' , ' Warrior ' , ' teste93 ' , 7 , 698 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Gaia ' , ' EARTH ' , ' Warrior ' , ' teste94 ' , 8 , 699 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Glow Neos ' , ' LIGHT ' , ' Warrior ' , ' teste95 ' , 9 , 700 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Grand Neos ' , ' EARTH ' , ' Warrior ' , ' teste96 ' , 10 , 701 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Great Tornado ' , ' WIND ' , ' Warrior ' , ' teste97 ' , 11 , 702 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Inferno ' , ' FIRE ' , ' Pyro ' , ' teste98 ' , 12 , 703 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Magma Neos ' , ' FIRE ' , ' Warrior ' , ' teste99 ' , 1 , 704 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Marine Neos ' , ' WATER ' , ' Warrior ' , ' teste100 ' , 2 , 705 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Mariner ' , ' WATER ' , ' Warrior ' , ' teste101 ' , 3 , 706 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Mudballman ' , ' EARTH ' , ' Warrior ' , ' teste102 ' , 4 , 707 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Necroid Shaman ' , ' DARK ' , ' Warrior ' , ' teste103 ' , 5 , 708 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Neos Knight ' , ' LIGHT ' , ' Warrior ' , ' teste104 ' , 6 , 709 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Nova Master ' , ' FIRE ' , ' Warrior ' , ' teste105 ' , 7 , 710 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Phoenix Enforcer ' , ' FIRE ' , ' Warrior ' , ' teste106 ' , 8 , 711 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Plasma Vice ' , ' EARTH ' , ' Warrior ' , ' teste107 ' , 9 , 712 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Rampart Blaster ' , ' EARTH ' , ' Warrior ' , ' teste108 ' , 10 , 713 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Shining Flare Wingman ' , ' LIGHT ' , ' Warrior ' , ' teste109 ' , 11 , 714 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Shining Phoenix Enforcer ' , ' FIRE ' , ' Warrior ' , ' teste110 ' , 12 , 715 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Steam Healer ' , ' WATER ' , ' Warrior ' , ' teste111 ' , 1 , 716 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Storm Neos ' , ' WIND ' , ' Warrior ' , ' teste112 ' , 2 , 717 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Tempest ' , ' WIND ' , ' Warrior ' , ' teste113 ' , 3 , 718 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Terra Firma ' , ' EARTH ' , ' Warrior ' , ' teste114 ' , 4 , 719 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO The Shining ' , ' LIGHT ' , ' Warrior ' , ' teste115 ' , 5 , 720 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Thunder Giant ' , ' LIGHT ' , ' Warrior ' , ' teste116 ' , 6 , 721 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Wild Wingman ' , ' EARTH ' , ' Warrior ' , ' teste117 ' , 7 , 722 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Elemental HERO Wildedge ' , ' EARTH ' , ' Warrior ' , ' teste118 ' , 8 , 723 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Empress Judge ' , ' EARTH ' , ' Warrior ' , ' teste119 ' , 9 , 724 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evil HERO Dark Gaia ' , ' EARTH ' , ' Fiend ' , ' teste120 ' , 10 , 725 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evil HERO Infernal Sniper ' , ' FIRE ' , ' Fiend ' , ' teste121 ' , 11 , 726 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evil HERO Inferno Wing ' , ' FIRE ' , ' Fiend ' , ' teste122 ' , 12 , 727 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evil HERO Lightning Golem ' , ' LIGHT ' , ' Fiend ' , ' teste123 ' , 1 , 728 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evil HERO Malicious Fiend ' , ' FIRE ' , ' Fiend ' , ' teste124 ' , 2 , 729 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Evil HERO Wild Cyclone ' , ' EARTH ' , ' Fiend ' , ' teste125 ' , 3 , 730 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fiend Skull Dragon ' , ' WIND ' , ' Dragon ' , ' teste126 ' , 4 , 731 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' First of the Dragons ' , ' DARK ' , ' Dragon ' , ' teste127 ' , 5 , 732 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' FiveHeaded Dragon ' , ' DARK ' , ' Dragon ' , ' teste128 ' , 6 , 733 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Flame Ghost ' , ' DARK ' , ' Zombie ' , ' teste129 ' , 7 , 734 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Flame Swordsman ' , ' FIRE ' , ' Warrior ' , ' teste130 ' , 8 , 735 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Flower Wolf ' , ' EARTH ' , ' Beast ' , ' teste131 ' , 9 , 736 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Bear ' , ' DARK ' , ' Fiend ' , ' teste132 ' , 10 , 737 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Chimera ' , ' DARK ' , ' Fiend ' , ' teste133 ' , 11 , 738 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Daredevil ' , ' DARK ' , ' Fiend ' , ' teste134 ' , 12 , 739 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Kraken ' , ' WATER ' , ' Fiend ' , ' teste135 ' , 1 , 740 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Leo ' , ' DARK ' , ' Fiend ' , ' teste136 ' , 2 , 741 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur SabreTooth ' , ' DARK ' , ' Fiend ' , ' teste137 ' , 3 , 742 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Sheep ' , ' DARK ' , ' Fiend ' , ' teste138 ' , 4 , 743 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Tiger ' , ' DARK ' , ' Fiend ' , ' teste139 ' , 5 , 744 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Frightfur Wolf ' , ' DARK ' , ' Fiend ' , ' teste140 ' , 6 , 745 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fullmetalfoes Alkahest ' , ' FIRE ' , ' Psychic ' , ' teste141 ' , 7 , 746 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fusionist ' , ' EARTH ' , ' Beast ' , ' teste142 ' , 8 , 747 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gaia Drake the Universal Force ' , ' EARTH ' , ' Beast-Warrior ' , ' teste143 ' , 9 , 748 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gaia the Dragon Champion ' , ' WIND ' , ' Dragon ' , ' teste144 ' , 10 , 749 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gatling Dragon ' , ' DARK ' , ' Machine ' , ' teste145 ' , 11 , 750 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Amethyst ' , ' EARTH ' , ' Aqua ' , ' teste146 ' , 12 , 751 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Aquamarine ' , ' EARTH ' , ' Aqua ' , ' teste147 ' , 1 , 752 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Citrine ' , ' EARTH ' , ' Pyro ' , ' teste148 ' , 2 , 753 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Lady Brilliant Diamond ' , ' EARTH ' , ' Rock ' , ' teste149 ' , 3 , 754 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Lady Lapis Lazuli ' , ' EARTH ' , ' Rock ' , ' teste150 ' , 4 , 755 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Master Diamond ' , ' EARTH ' , ' Rock ' , ' teste151 ' , 5 , 756 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Prismaura ' , ' EARTH ' , ' Thunder ' , ' teste152 ' , 6 , 757 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Ruby ' , ' EARTH ' , ' Pyro ' , ' teste153 ' , 7 , 758 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Seraphinite ' , ' EARTH ' , ' Fairy ' , ' teste154 ' , 8 , 759 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Topaz ' , ' EARTH ' , ' Thunder ' , ' teste155 ' , 9 , 760 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' GemKnight Zirconia ' , ' EARTH ' , ' Rock ' , ' teste156 ' , 10 , 761 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Giltia the D Knight ' , ' LIGHT ' , ' Warrior ' , ' teste157 ' , 11 , 762 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Andabata ' , ' DARK ' , ' Beast-Warrior ' , ' teste158 ' , 12 , 763 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Essedarii ' , ' EARTH ' , ' Beast ' , ' teste159 ' , 1 , 764 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Gaiodiaz ' , ' DARK ' , ' Dinosaur ' , ' teste160 ' , 2 , 765 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Gyzarus ' , ' DARK ' , ' Winged Beast ' , ' teste161 ' , 3 , 766 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Heraklinos ' , ' FIRE ' , ' Beast-Warrior ' , ' teste162 ' , 4 , 767 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Nerokius ' , ' DARK ' , ' Winged Beast ' , ' teste163 ' , 5 , 768 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beast Tamer Editor ' , ' DARK ' , ' Beast-Warrior ' , ' teste164 ' , 6 , 769 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Goddess Bow ' , ' LIGHT ' , ' Warrior ' , ' teste165 ' , 7 , 770 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Goyo Emperor ' , ' EARTH ' , ' Warrior ' , ' teste166 ' , 8 , 771 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Great Mammoth of Goldfine ' , ' DARK ' , ' Zombie ' , ' teste167 ' , 9 , 772 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Greedy Venom Fusion Dragon ' , ' DARK ' , ' Dragon ' , ' teste168 ' , 10 , 773 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Humanoid Worm Drake ' , ' WATER ' , ' Aqua ' , ' teste169 ' , 11 , 774 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ignition Beast Volcannon ' , ' EARTH ' , ' Machine ' , ' teste170 ' , 12 , 775 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Imperion Magnum the Superconductive Battlebot ' , ' EARTH ' , ' Rock ' , ' teste171 ' , 1 , 776 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Infernoid Tierra ' , ' FIRE ' , ' Fiend ' , ' teste172 ' , 2 , 777 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Caliga ' , ' DARK ' , ' Beast ' , ' teste173 ' , 3 , 778 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Cocytus ' , ' WATER ' , ' Dragon ' , ' teste174 ' , 4 , 779 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Elysium ' , ' LIGHT ' , ' Fairy ' , ' teste175 ' , 5 , 780 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Magellanica ' , ' EARTH ' , ' Rock ' , ' teste176 ' , 6 , 781 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Mechaba ' , ' LIGHT ' , ' Machine ' , ' teste177 ' , 7 , 782 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Purgatrio ' , ' FIRE ' , ' Fiend ' , ' teste178 ' , 8 , 783 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Invoked Raidjin ' , ' WIND ' , ' Warrior ' , ' teste179 ' , 9 , 784 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kaiser Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste180 ' , 10 , 785 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kaminari Attack ' , ' WIND ' , ' Thunder ' , ' teste181 ' , 11 , 786 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kamionwizard ' , ' DARK ' , ' Spellcaster ' , ' teste182 ' , 12 , 787 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Karbonala Warrior ' , ' EARTH ' , ' Warrior ' , ' teste183 ' , 1 , 788 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' King Dragun ' , ' DARK ' , ' Dragon ' , ' teste184 ' , 2 , 789 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' KoaloKoala ' , ' EARTH ' , ' Beast ' , ' teste185 ' , 3 , 790 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Kwagar Hercules ' , ' EARTH ' , ' Insect ' , ' teste186 ' , 4 , 791 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Labyrinth Tank ' , ' DARK ' , ' Machine ' , ' teste187 ' , 5 , 792 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lunalight Cat Dancer ' , ' DARK ' , ' Beast-Warrior ' , ' teste188 ' , 6 , 793 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lunalight Leo Dancer ' , ' DARK ' , ' Beast-Warrior ' , ' teste189 ' , 7 , 794 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lunalight Panther Dancer ' , ' DARK ' , ' Beast-Warrior ' , ' teste190 ' , 8 , 795 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lyrilusc  Independent Nightingale ' , ' WIND ' , ' Winged Beast ' , ' teste191 ' , 9 , 796 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Maneating Black Shark ' , ' WATER ' , ' Fish ' , ' teste192 ' , 10 , 797 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Marine Beast ' , ' WATER ' , ' Fish ' , ' teste193 ' , 11 , 798 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Acid ' , ' WATER ' , ' Warrior ' , ' teste194 ' , 12 , 799 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Anki ' , ' DARK ' , ' Warrior ' , ' teste195 ' , 1 , 800 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Blast ' , ' WIND ' , ' Warrior ' , ' teste196 ' , 2 , 801 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Dark Law ' , ' DARK ' , ' Warrior ' , ' teste197 ' , 3 , 802 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Dian ' , ' EARTH ' , ' Warrior ' , ' teste198 ' , 4 , 803 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Divine Wind ' , ' WIND ' , ' Warrior ' , ' teste199 ' , 5 , 804 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Goka ' , ' FIRE ' , ' Warrior ' , ' teste200 ' , 6 , 805 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Koga ' , ' LIGHT ' , ' Warrior ' , ' teste201 ' , 7 , 806 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Masked HERO Vapor ' , ' WATER ' , ' Warrior ' , ' teste202 ' , 8 , 807 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Master of Oz ' , ' EARTH ' , ' Beast ' , ' teste203 ' , 9 , 808 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mavelus ' , ' WIND ' , ' Winged Beast ' , ' teste204 ' , 10 , 809 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metal Dragon ' , ' WIND ' , ' Machine ' , ' teste205 ' , 11 , 810 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Adamante ' , ' FIRE ' , ' Psychic ' , ' teste206 ' , 12 , 811 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Crimsonite ' , ' FIRE ' , ' Psychic ' , ' teste207 ' , 1 , 812 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Mithrilium ' , ' FIRE ' , ' Psychic ' , ' teste208 ' , 2 , 813 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metalfoes Orichalc ' , ' FIRE ' , ' Psychic ' , ' teste209 ' , 3 , 814 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Meteor B Dragon ' , ' FIRE ' , ' Dragon ' , ' teste210 ' , 4 , 815 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Meteor Black Comet Dragon ' , ' DARK ' , ' Dragon ' , ' teste211 ' , 5 , 816 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' MillenniumEyes Restrict ' , ' DARK ' , ' Spellcaster ' , ' teste212 ' , 6 , 817 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mirror Force Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste213 ' , 7 , 818 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mokey Mokey King ' , ' LIGHT ' , ' Fairy ' , ' teste214 ' , 8 , 819 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mudragon of the Swamp ' , ' WATER ' , ' Wyrm ' , ' teste215 ' , 9 , 820 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Multiple Piece Golem ' , ' EARTH ' , ' Rock ' , ' teste216 ' , 10 , 821 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Musician King ' , ' LIGHT ' , ' Spellcaster ' , ' teste217 ' , 11 , 822 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mystical Sand ' , ' EARTH ' , ' Rock ' , ' teste218 ' , 12 , 823 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Naturia Exterio ' , ' EARTH ' , ' Beast ' , ' teste219 ' , 1 , 824 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Naturia Gaiastrio ' , ' EARTH ' , ' Rock ' , ' teste220 ' , 2 , 825 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Neo BlueEyes Ultimate Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste221 ' , 3 , 826 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' NeoSpacian Marine Dolphin ' , ' WATER ' , ' Warrior ' , ' teste222 ' , 4 , 827 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' NeoSpacian Twinkle Moss ' , ' LIGHT ' , ' Plant ' , ' teste223 ' , 5 , 828 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' OddEyes Venom Dragon ' , ' DARK ' , ' Dragon ' , ' teste224 ' , 6 , 829 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' OddEyes Vortex Dragon ' , ' WIND ' , ' Dragon ' , ' teste225 ' , 7 , 830 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ojama King ' , ' LIGHT ' , ' Beast ' , ' teste226 ' , 8 , 831 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ojama Knight ' , ' LIGHT ' , ' Beast ' , ' teste227 ' , 9 , 832 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Pair Cycroid ' , ' EARTH ' , ' Machine ' , ' teste228 ' , 10 , 833 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Panzer Dragon ' , ' LIGHT ' , ' Machine ' , ' teste229 ' , 11 , 834 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal Gatlinghoul ' , ' DARK ' , ' Fiend ' , ' teste230 ' , 12 , 835 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Performapal OddEyes Metal Claw ' , ' DARK ' , ' Dragon ' , ' teste231 ' , 1 , 836 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Pragtical ' , ' EARTH ' , ' Dinosaur ' , ' teste232 ' , 2 , 837 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Predaplant Chimerafflesia ' , ' DARK ' , ' Plant ' , ' teste233 ' , 3 , 838 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Predaplant Dragostapelia ' , ' DARK ' , ' Plant ' , ' teste234 ' , 4 , 839 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Punished Eagle ' , ' WIND ' , ' Winged Beast ' , ' teste235 ' , 5 , 840 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rabid Horseman ' , ' EARTH ' , ' Beast-Warrior ' , ' teste236 ' , 6 , 841 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rainbow Neos ' , ' LIGHT ' , ' Warrior ' , ' teste237 ' , 7 , 842 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rainbow Overdragon ' , ' LIGHT ' , ' Dragon ' , ' teste238 ' , 8 , 843 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rare Fish ' , ' WATER ' , ' Fish ' , ' teste239 ' , 9 , 844 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Reaper on the Nightmare ' , ' DARK ' , ' Zombie ' , ' teste240 ' , 10 , 845 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' RedEyes Black Dragon Sword ' , ' DARK ' , ' Dragon ' , ' teste241 ' , 11 , 846 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' RedEyes Slash Dragon ' , ' DARK ' , ' Dragon ' , ' teste242 ' , 12 , 847 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ritual Beast UltiApelio ' , ' WIND ' , ' Pyro ' , ' teste243 ' , 1 , 848 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ritual Beast UltiCannahawk ' , ' WIND ' , ' Thunder ' , ' teste244 ' , 2 , 849 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ritual Beast UltiGaiapelio ' , ' LIGHT ' , ' Psychic ' , ' teste245 ' , 3 , 850 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ritual Beast UltiPettlephin ' , ' WIND ' , ' Aqua ' , ' teste246 ' , 4 , 851 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Roaring Ocean Snake ' , ' WATER ' , ' Aqua ' , ' teste247 ' , 5 , 852 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rocket Hermos Cannon ' , ' LIGHT ' , ' Warrior ' , ' teste248 ' , 6 , 853 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rose Spectre of Dunn ' , ' DARK ' , ' Plant ' , ' teste249 ' , 7 , 854 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' RuneEyes Pendulum Dragon ' , ' DARK ' , ' Dragon ' , ' teste250 ' , 8 , 855 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ryu Senshi ' , ' EARTH ' , ' Warrior ' , ' teste251 ' , 9 , 856 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sanwitch ' , ' DARK ' , ' Spellcaster ' , ' teste252 ' , 10 , 857 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Schuberta the Melodious Maestra ' , ' LIGHT ' , ' Fairy ' , ' teste253 ' , 11 , 858 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sea Monster of Theseus ' , ' WATER ' , ' Zombie ' , ' teste254 ' , 12 , 859 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Secret Six Samurai  Rihan ' , ' EARTH ' , ' Warrior ' , ' teste255 ' , 1 , 860 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Skelgon ' , ' DARK ' , ' Zombie ' , ' teste256 ' , 2 , 861 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Skull Knight ' , ' DARK ' , ' Spellcaster ' , ' teste257 ' , 3 , 862 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Skull Knight #2 ' , ' DARK ' , ' Spellcaster ' , ' teste258 ' , 4 , 863 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Skullbird ' , ' WIND ' , ' Winged Beast ' , ' teste259 ' , 5 , 864 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sky Galloping Gaia the Dragon Champion ' , ' WIND ' , ' Dragon ' , ' teste260 ' , 6 , 865 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Soul Hunter ' , ' DARK ' , ' Fiend ' , ' teste261 ' , 7 , 866 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' St Joan ' , ' LIGHT ' , ' Fairy ' , ' teste262 ' , 8 , 867 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Starving Venom Fusion Dragon ' , ' DARK ' , ' Dragon ' , ' teste263 ' , 9 , 868 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Steam Gyroid ' , ' EARTH ' , ' Machine ' , ' teste264 ' , 10 , 869 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Robolady ' , ' EARTH ' , ' Machine ' , ' teste265 ' , 11 , 870 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Roboyarou ' , ' EARTH ' , ' Machine ' , ' teste266 ' , 12 , 871 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Vehicroid  Mobile Base ' , ' EARTH ' , ' Machine ' , ' teste267 ' , 1 , 872 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Vehicroid  Stealth Union ' , ' EARTH ' , ' Machine ' , ' teste268 ' , 2 , 873 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Super Vehicroid Jumbo Drill ' , ' EARTH ' , ' Machine ' , ' teste269 ' , 3 , 874 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Superalloy Beast Raptinus ' , ' LIGHT ' , ' Dragon ' , ' teste270 ' , 4 , 875 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme Arcanite Magician ' , ' LIGHT ' , ' Spellcaster ' , ' teste271 ' , 5 , 876 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King Dragon Starving Venom ' , ' DARK ' , ' Dragon ' , ' teste272 ' , 6 , 877 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Supreme King ZARC ' , ' DARK ' , ' Dragon ' , ' teste273 ' , 7 , 878 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' The Last Warrior from Another Planet ' , ' EARTH ' , ' Warrior ' , ' teste274 ' , 8 , 879 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Thousand Dragon ' , ' WIND ' , ' Dragon ' , ' teste275 ' , 9 , 880 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' ThousandEyes Restrict ' , ' DARK ' , ' Spellcaster ' , ' teste276 ' , 10 , 881 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Timaeus the Knight of Destiny ' , ' LIGHT ' , ' Warrior ' , ' teste277 ' , 11 , 882 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Time Magic Hammer ' , ' LIGHT ' , ' Spellcaster ' , ' teste278 ' , 12 , 883 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Twin Photon Lizard ' , ' LIGHT ' , ' Dragon ' , ' teste279 ' , 1 , 884 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' TwinHeaded Thunder Dragon ' , ' LIGHT ' , ' Thunder ' , ' teste280 ' , 2 , 885 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tyrant Burst Dragon ' , ' LIGHT ' , ' Dragon ' , ' teste281 ' , 3 , 886 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' UFOroid Fighter ' , ' LIGHT ' , ' Machine ' , ' teste282 ' , 4 , 887 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ultimate Ancient Gear Golem ' , ' EARTH ' , ' Machine ' , ' teste283 ' , 5 , 888 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Ultimate Axon Kicker ' , ' LIGHT ' , ' Psychic ' , ' teste284 ' , 6 , 889 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vermillion Sparrow ' , ' FIRE ' , ' Pyro ' , ' teste285 ' , 7 , 890 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vision HERO Adoration ' , ' DARK ' , ' Warrior ' , ' teste286 ' , 8 , 891 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vision HERO Trinity ' , ' DARK ' , ' Warrior ' , ' teste287 ' , 9 , 892 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' VWTiger Catapult ' , ' LIGHT ' , ' Machine ' , ' teste288 ' , 10 , 893 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' VWXYZDragon Catapult Cannon ' , ' LIGHT ' , ' Machine ' , ' teste289 ' , 11 , 894 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Warrior of Tradition ' , ' EARTH ' , ' Warrior ' , ' teste290 ' , 12 , 895 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Windwitch  Crystal Bell ' , ' WIND ' , ' Spellcaster ' , ' teste291 ' , 1 , 896 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Worm Zero ' , ' LIGHT ' , ' Reptile ' , ' teste292 ' , 2 , 897 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' XYDragon Cannon ' , ' LIGHT ' , ' Machine ' , ' teste293 ' , 3 , 898 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' XYZDragon Cannon ' , ' LIGHT ' , ' Machine ' , ' teste294 ' , 4 , 899 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' XZTank Cannon ' , ' LIGHT ' , ' Machine ' , ' teste295 ' , 5 , 900 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Yasushi the Skull Knight ' , ' DARK ' , ' Spellcaster ' , ' teste296 ' , 6 , 901 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' YZTank Dragon ' , ' LIGHT ' , ' Machine ' , ' teste297 ' , 7 , 902 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zombie Warrior ' , ' DARK ' , ' Zombie ' , ' teste298 ' , 8 , 903 );


/*TODO INSERT NORMAL/EFEITO MONSTROS */
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 4000 , 608 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2800 , 609 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1500 , 610 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 611 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2400 , 612 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1800 , 613 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1850 , 1300 , 614 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2500 , 615 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1800 , 616 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 3300 , 617 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2250 , 1900 , 618 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3800 , 2500 , 619 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2500 , 620 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 621 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 622 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2500 , 623 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 4000 , 624 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1380 , 1530 , 625 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 626 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 2000 , 627 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2300 , 628 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2000 , 629 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 2000 , 630 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 631 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3800 , 632 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2000 , 633 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 634 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 635 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3000 , 636 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1100 , 800 , 637 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 638 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 639 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 640 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 641 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1600 , 642 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2600 , 643 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3000 , 644 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1800 , 645 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 800 , 646 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 2800 , 647 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1900 , 648 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1400 , 649 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2100 , 650 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1000 , 651 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 652 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 653 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 654 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 655 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1500 , 656 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 657 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 658 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 3000 , 659 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 660 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1200 , 661 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1500 , 662 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 800 , 663 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1700 , 664 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 665 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2400 , 666 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1250 , 667 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1600 , 668 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 669 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2600 , 670 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 671 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 672 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2950 , 673 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1500 , 674 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2000 , 675 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 5000 , 5000 , 676 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 0 , 677 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 900 , 678 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 679 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 680 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2450 , 1950 , 681 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 3000 , 682 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 200 , 2800 , 683 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 800 , 684 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1200 , 685 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2200 , 686 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 687 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 688 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 689 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 690 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2200 , 691 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 692 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1000 , 693 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2500 , 694 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2600 , 695 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 696 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1200 , 697 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 698 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2600 , 699 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 700 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 701 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2200 , 702 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1600 , 703 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 704 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2300 , 705 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 1000 , 706 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 3000 , 707 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1800 , 708 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1000 , 709 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 710 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1200 , 711 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2300 , 712 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 713 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 714 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 715 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1000 , 716 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2500 , 717 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2800 , 718 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 719 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 720 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1500 , 721 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 2300 , 722 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2300 , 723 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1700 , 724 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 725 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2500 , 726 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1200 , 727 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1500 , 728 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 2100 , 729 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 2300 , 730 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1200 , 731 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 2000 , 732 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 5000 , 5000 , 733 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 800 , 734 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1600 , 735 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1400 , 736 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 737 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 738 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2200 , 739 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 3000 , 740 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 741 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 742 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2000 , 743 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1200 , 744 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1500 , 745 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 746 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 900 , 700 , 747 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 2800 , 748 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 749 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1200 , 750 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1950 , 2450 , 751 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 2600 , 752 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1950 , 753 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3400 , 2000 , 754 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 755 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2500 , 756 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2450 , 1400 , 757 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1300 , 758 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1400 , 759 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 1800 , 760 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2500 , 761 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1850 , 1500 , 762 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2800 , 763 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1400 , 764 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1500 , 765 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1500 , 766 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2800 , 767 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1900 , 768 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 3000 , 769 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1600 , 770 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 2500 , 771 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 772 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 2500 , 773 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2000 , 774 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 1600 , 775 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 4000 , 776 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3400 , 3600 , 777 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 1800 , 778 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1800 , 2900 , 779 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 4000 , 780 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3300 , 781 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2100 , 782 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 2000 , 783 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2400 , 784 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2300 , 2000 , 785 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1400 , 786 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 1100 , 787 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1200 , 788 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1100 , 789 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 200 , 790 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1700 , 791 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2400 , 792 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 793 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 3000 , 794 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2500 , 795 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 0 , 796 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1300 , 797 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1600 , 798 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 799 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1200 , 800 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 801 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1800 , 802 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 3000 , 803 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 1900 , 804 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 805 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 1800 , 806 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 807 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4200 , 3700 , 808 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1300 , 900 , 809 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1850 , 1700 , 810 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2500 , 811 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 3000 , 812 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1000 , 813 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2200 , 814 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 2000 , 815 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3500 , 2000 , 816 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 817 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 1200 , 818 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 300 , 100 , 819 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1600 , 820 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 1300 , 821 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1750 , 1500 , 822 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1700 , 823 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 824 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2100 , 825 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3800 , 826 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 900 , 1100 , 827 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 1100 , 828 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3300 , 2500 , 829 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 3000 , 830 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 3000 , 831 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 2500 , 832 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1600 , 1200 , 833 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1000 , 2600 , 834 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 900 , 835 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 836 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1500 , 837 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 838 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2700 , 1900 , 839 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 840 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1700 , 841 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4500 , 3000 , 842 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 0 , 843 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1200 , 844 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 800 , 600 , 845 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 846 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 847 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 400 , 848 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 1600 , 849 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3200 , 2100 , 850 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 200 , 2800 , 851 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 852 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1500 , 1300 , 853 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1800 , 854 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 855 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 1200 , 856 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 1800 , 857 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 858 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 859 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2400 , 860 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1700 , 1900 , 861 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2650 , 2250 , 862 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2650 , 2250 , 863 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1700 , 864 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2600 , 2100 , 865 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1800 , 866 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 867 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 868 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1600 , 869 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 500 , 870 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 500 , 871 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 5000 , 872 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3600 , 3000 , 873 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2000 , 874 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 2200 , 875 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1400 , 2800 , 876 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2000 , 877 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4000 , 4000 , 878 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2350 , 2300 , 879 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2000 , 880 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 881 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 882 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 500 , 400 , 883 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 1000 , 884 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2100 , 885 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 2500 , 886 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 887 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 4400 , 3400 , 888 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2900 , 1700 , 889 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1500 , 890 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2100 , 891 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2500 , 2000 , 892 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2000 , 2100 , 893 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 3000 , 2800 , 894 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1900 , 1700 , 895 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2400 , 896 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 0 , 0 , 897 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2200 , 1900 , 898 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2800 , 2600 , 899 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2400 , 2100 , 900 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2650 , 2250 , 901 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 2100 , 2200 , 902 );
INSERT INTO MONSTROS(mon_atk, mon_def, mon_car_id) VALUES ( 1200 , 900 , 903 );


/*TODO - INSERT ESTRELAS */
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 608 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 609 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 610 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 611 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 612 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 613 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 614 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 615 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 616 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 617 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 618 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 619 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 620 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 621 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 622 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 623 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 624 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 625 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 626 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 627 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 628 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 629 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 630 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 631 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 632 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 633 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 634 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 635 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 636 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 3 , 637 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 638 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 639 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 640 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 641 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 642 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 643 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 644 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 645 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 646 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 647 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 648 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 649 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 650 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 651 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 652 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 653 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 654 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 655 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 656 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 657 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 658 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 659 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 660 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 661 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 662 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 663 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 664 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 665 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 666 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 667 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 668 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 669 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 670 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 671 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 672 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 673 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 674 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 675 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 676 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 677 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 3 , 678 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 679 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 680 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 681 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 682 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 683 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 684 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 685 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 686 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 687 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 688 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 689 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 690 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 691 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 692 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 693 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 694 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 695 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 696 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 697 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 698 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 699 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 700 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 701 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 702 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 703 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 704 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 705 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 706 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 707 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 708 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 709 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 710 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 711 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 712 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 713 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 714 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 715 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 716 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 717 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 718 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 719 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 720 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 721 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 722 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 723 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 724 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 725 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 726 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 727 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 728 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 729 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 730 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 731 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 732 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 733 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 3 , 734 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 735 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 736 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 737 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 738 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 739 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 740 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 741 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 742 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 743 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 744 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 745 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 1 , 746 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 3 , 747 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 748 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 749 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 750 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 751 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 752 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 753 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 754 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 755 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 756 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 757 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 758 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 759 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 760 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 761 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 762 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 763 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 764 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 765 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 766 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 767 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 768 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 769 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 770 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 771 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 772 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 773 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 774 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 775 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 776 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 11 , 777 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 778 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 779 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 780 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 781 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 782 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 783 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 784 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 785 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 786 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 787 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 788 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 789 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 790 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 791 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 792 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 793 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 794 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 795 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 1 , 796 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 797 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 798 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 799 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 800 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 801 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 802 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 803 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 804 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 805 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 806 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 807 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 808 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 809 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 810 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 811 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 812 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 813 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 814 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 815 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 816 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 1 , 817 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 818 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 819 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 820 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 821 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 822 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 823 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 824 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 825 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 826 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 827 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 828 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 829 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 830 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 831 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 832 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 833 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 834 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 835 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 836 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 837 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 838 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 839 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 840 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 841 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 842 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 843 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 844 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 845 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 846 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 847 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 848 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 849 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 850 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 851 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 852 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 4 , 853 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 854 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 855 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 856 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 857 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 858 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 859 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 860 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 861 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 862 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 863 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 864 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 865 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 866 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 867 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 868 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 869 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 870 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 871 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 872 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 9 , 873 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 874 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 875 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 876 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 877 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 12 , 878 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 879 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 880 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 1 , 881 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 882 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 2 , 883 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 884 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 885 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 886 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 887 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 888 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 889 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 5 , 890 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 891 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 892 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 893 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 894 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 895 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 896 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 10 , 897 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 898 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 8 , 899 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 900 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 7 , 901 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 6 , 902 );
INSERT INTO NML_MONSTROS(nml_estrelas,nml_mon_id) VALUES ( 3 , 903 );


/*TODO Insert CARTAS magica/armadilha======================================================== */
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Scrap Lube ' , ' None ' , ' Spell ' , ' Add 1 Ice Barrier monster from your Deck to your hand ' , 4 , 907 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wattcastle ' , ' None ' , ' Spell ' , ' During this turn each time a card(s) is removed from play from your hand your side of the field and/or your Graveyard by the effect of an opponents Effect Monster: ' , 5 , 908 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wattjustment ' , ' None ' , ' Spell ' , ' If a card in your hand is removed from play remove from play up to 2 random cards in your opponents hand ' , 6 , 909 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Barkions Bark ' , ' None ' , ' Spell ' , ' If a card you control is removed from play remove from play up to 2 cards your opponent controls ' , 7 , 910 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Leodrakes Mane ' , ' None ' , ' Spell ' , ' If a card in your Graveyard is removed from play remove from play up to 2 cards in your opponents Graveyard ' , 8 , 911 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Medallion of the Ice Barrier ' , ' None ' , ' Spell ' , ' Reveal 1 Iron Core of Koaki Meiru in your hand to select 1 face-up monster on the field Destroy that monster and both players take 1000 damage ' , 9 , 912 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mirror of the Ice Barrier ' , ' None ' , ' Spell ' , ' The equipped monster cannot attack and its ATK and DEF become 100 During each of your Standby Phase inflict 500 damage to the controller of the equipped monster ' , 10 , 913 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Koaki Ring ' , ' None ' , ' Spell ' , ' The equipped monster gains 1000 ATK and its effect(s) is negated During each of your Standby Phases the controller of the equipped monster takes 500 damage ' , 1 , 914 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Darkworld Shackles ' , ' None ' , ' Spell ' , ' When the equipped monster is destroyed and this card is sent to the Graveyard inflict damage to the player who controlled the equipped monster equal to the monsters original DEF ' , 2 , 915 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Axe of Fools ' , ' None ' , ' Spell ' , ' When the equipped monster inflicts Battle Damage to your opponent you can select and remove from play up to 2 monsters from your opponents Graveyard ' , 3 , 916 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cursed Bill ' , ' None ' , ' Spell ' , ' This card can only be activated at the start of Main Phase 1 Neither player can Normal or Special Summon an Effect Monsters until your next Draw Phase ' , 4 , 917 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tokkosho of Ghost Destroying ' , ' None ' , ' Spell ' , ' Send 1 face-up non-Effect monster you control to the Graveyard to draw 2 cards ' , 5 , 918 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Heat Wave ' , ' None ' , ' Spell ' , ' Select 1 face-up Defense Position monster you control Its DEF becomes double its original DEF ' , 6 , 919 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' White Elephants Gift ' , ' None ' , ' Spell ' , ' Your opponents monsters cannot declare attacks This cards controller must pay 1000 Life Points during each of their End Phases (this is not optional) or this card is destroyed If Red Dragon Archfiend is face-up on the field you can select 1 Level 1 Tuner Monster in your Graveyard then destroy this card and Special Summon that monster ' , 7 , 920 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' D2 Shield ' , ' None ' , ' Spell ' , ' Activate only during your turn Select 1 Blackwing monster with 2000 or less ATK in your Graveyard and Special Summon it You cannot Normal Summon or Set the turn you activate this card ' , 8 , 921 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Red Screen ' , ' None ' , ' Trap ' , ' Activate only during the Battle Phase Defense Position monsters your opponent controls are changed to face-up Attack Position and their effects are negated ' , 9 , 922 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Blackback ' , ' None ' , ' Trap ' , ' Activate by sending 1 face-up Synchro Monster you control to the Graveyard when your opponent Summons a monster Negate the Summon and destroy that card Your opponent cannot Summon a monster until the End Phase of this turn ' , 10 , 923 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Defenders Intersect ' , ' None ' , ' Trap ' , ' When this Set card is destroyed by your opponents card effect while you control a face-up Blackwing monster inflict 1000 damage to your opponent and draw 1 card ' , 1 , 924 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gravity Collapse ' , ' None ' , ' Trap ' , ' Activate only when a Synchro Monster is Special Summoned by selecting it Special Summon 1 Siphon Token (Spellcaster-Type/DARK/Level 1/ATK 0/DEF 0) Its Level is that of the selected monster and the selected monster is now Level 1 ' , 2 , 925 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Blackwing   Boobytrap ' , ' None ' , ' Trap ' , ' Activate only during damage calculation if a monster you control is being attacked The attack target monster you control gains ATK equal to half the original ATK of the attacking monster until the End Phase ' , 3 , 926 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Star Siphon ' , ' None ' , ' Trap ' , ' Activate only when the battle position of a face-up Karakuri monster you control is changed  Select 1 card on the field and destroy it ' , 4 , 927 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Half Counter ' , ' None ' , ' Trap ' , ' Activate only when a face-up Defense Position Karakuri monster is selected as an attack target Destroy all face-up monsters your opponent controls ' , 5 , 928 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Karakuri Trick House ' , ' None ' , ' Trap ' , ' Activate only when a Scrap monster you control is destroyed and sent to the Graveyard Destroy all face-up Spell/Trap Cards on the field ' , 6 , 929 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Karakuri Klock ' , ' None ' , ' Trap ' , ' Select 1 Level 4 or lower Watt monster in your Graveyard Special Summon that monster from the Graveyard Destroy it during the End Phase ' , 7 , 930 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Scrap Crash ' , ' None ' , ' Trap ' , ' Activate only if you control a face-up Naturia monster and have at least 1 card in your hand Negate the activation of an opponents Spell/Trap Card and destroy it Then send 1 card from your hand to the Graveyard ' , 8 , 931 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Wattkeeper ' , ' None ' , ' Trap ' , ' Neither player can Special Summon monsters Destroy this card when a card is sent from the Deck or the field to your Graveyard ' , 9 , 932 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Exterios Fang ' , ' None ' , ' Trap ' , ' This turn any monster sent to the Graveyard is removed from play instead ' , 10 , 933 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vanitys Emptiness ' , ' None ' , ' Trap ' , ' Each time a monster effect is activated place 1 Spellstone Counter on this card (max 2) While this card has 2 Spellstone Counters face-up monsters on the field cannot activate their effects and their effects are negated During each End Phase remove all Spellstone Counters on this card ' , 1 , 934 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Different Dimension Ground ' , ' None ' , ' Trap ' , ' Tribute 1 monster to activate this card All face-up monsters on the field that you own are unaffected by other Trap Cards ' , 2 , 935 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Powersink Stone ' , ' None ' , ' Trap ' , ' Activate only when your opponent Special Summons 2 or more monsters face-up Send all of those monsters to the Graveyard Then send all monsters in the opponents hand and Deck to the Graveyard that have the same name as either of those monsters ' , 3 , 936 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Tyrants Temper ' , ' None ' , ' Trap ' , ' Send 1 face-up non-Effect monster you control to the Graveyard to draw 2 cards ' , 4 , 937 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Trap Hole ' , ' None ' , ' Trap ' , ' Select 1 face-up Defense Position monster you control Its DEF becomes double its original DEF ' , 5 , 938 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Card Rotator ' , ' none ' , ' Spell ' , ' Send 1 card from your hand to the Graveyard Change the battle positions of all monsters your opponent controls (Face-down Defense Position monsters are flipped to face-up Attack Position) ' , 6 , 939 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Seed of Deception ' , ' none ' , ' Spell ' , ' Special Summon 1 Level 2 or lower Plant-Type monster from your hand ' , 7 , 940 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Mark of the Rose ' , ' none ' , ' Spell ' , ' Remove from play 1 Plant-Type monster from your Graveyard and equip this card to a monster your opponent controls Gain control of the equipped monster During your End Phase give control of the equipped monster to your opponent During your Standby Phase gain control of the equipped monster ' , 8 , 941 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Black Garden ' , ' none ' , ' Spell ' , ' When a monster is Normal or Special Summoned except by the effect of Black Garden halve its ATK and Special Summon 1 Rose Token (Plant-Type/DARK/Level 2/ATK 800/DEF 800) to its controllers opponents side of the field in Attack Position You can destroy this card and all face-up Plant-Type monsters on the field and Special Summon 1 monster with ATK equal to the total ATK of those monsters from your Graveyard ' , 9 , 942 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Factory of 100 Machines ' , ' none ' , ' Spell ' , ' Remove from play all Morphtronic monsters from your Graveyard Target face-up Machine-Type monster you control gains 200 ATK for each card removed until the End Phase ' , 10 , 943 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Morphtronic Accelerator ' , ' none ' , ' Spell ' , ' Return 1 Morphtronic card from your hand to the Deck Destroy 1 card on the field and draw 1 card ' , 1 , 944 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Morphtronic Cord ' , ' none ' , ' Spell ' , ' Equip only to a Morphtronic monster Each time the equipped monsters battle position is changed destroy 1 Spell or Trap Card on the field ' , 2 , 945 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Morphtronic Engine ' , ' none ' , ' Spell ' , ' Equip only to a Level 3 Morphtronic monster Its ATK becomes double its original ATK During your second Standby Phase after this cards activation destroy this card and take damage equal to the original ATK of the equipped monster ' , 3 , 946 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Poison Chain ' , ' none ' , ' Spell ' , ' During the End Phase of your turn if you did not attack your opponent sends cards equal to the number of face-up Iron Chain monsters you control from the top of their Deck to the Graveyard ' , 4 , 947 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Paralyzing Chain ' , ' none ' , ' Spell ' , ' When a card(s) is sent from your opponents Deck to the Graveyard by a card effect inflict 300 damage to your opponent ' , 5 , 948 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Teleport ' , ' none ' , ' Spell ' , ' Once per turn if your opponent controls a monster and you control no monsters you can pay 800 Life Points to Special Summon 1 Psychic-Type monster from your hand ' , 6 , 949 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Psychokinesis ' , ' none ' , ' Spell ' , ' Activate only while you control a face-up Psychic-Type monster Destroy 1 card on the field and take 1000 damage ' , 7 , 950 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Miracle Fertilizer ' , ' none ' , ' Spell ' , ' Once per turn you can select 1 Plant-Type monster from your Graveyard and Special Summon it You cannot Normal Summon or Set the turn you Special Summon a monster with this effect If a monster Special Summoned by this effect is removed from the field destroy this card ' , 8 , 951 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fragrance Storm ' , ' none ' , ' Spell ' , ' Destroy 1 face-up Plant-Type monster on the field and draw 1 card If that card is a Plant-Type monster you can reveal it to your opponent and draw 1 more card ' , 9 , 952 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' The World Tree ' , ' none ' , ' Spell ' , ' Each time a Plant-Type monster(s) on the field is destroyed place 1 Flower Counter on this card You can remove Flower Counters to activate this cards effects ?Remove 1 Target face-up Plant-Type monster gains 400 ATK and DEF until the End Phase ?Remove 2 Destroy 1 card on the field ?Remove 3 Select 1 Plant-Type monster from your Graveyard and Special Summon it ' , 10 , 953 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Everliving Underworld Cannon ' , ' none ' , ' Spell ' , ' Once during each players turn when a Zombie-Type monster is Special Summoned to your side of the field inflict 800 damage to your opponent ' , 1 , 954 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Secret Village of the Spellcasters ' , ' none ' , ' Spell ' , ' If you control a Spellcaster-Type monster and your opponent does not your opponent cannot activate Spell Cards If you control no Spellcaster-Type monsters you cannot activate Spell Cards ' , 2 , 955 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Omega Goggles ' , ' none ' , ' Spell ' , ' Equip only to a monster you control Once per turn you can look at 1 random card in your opponents hand The equipped monster cannot attack the turn you activate this effect ' , 3 , 956 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Battle Mania ' , ' none ' , ' Trap ' , ' Activate only during your opponents Standby Phase All face-up monsters your opponent controls are changed to Attack Position and cannot change their battle positions this turn All monsters your opponent currently controls must attack this turn if able ' , 4 , 957 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Confusion Chaff ' , ' none ' , ' Trap ' , ' Activate only when your opponent declares a second direct attack during the same Battle Phase Conduct battle between the attacking monster and the first monster that attacked directly (other effects cannot be activated during this battle) ' , 5 , 958 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Urgent Tuning ' , ' none ' , ' Trap ' , ' Activate only during the Battle Phase Synchro Summon 1 Synchro Monster (Send the appropriate Synchro Material Monsters to the Graveyard) ' , 6 , 959 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Synchro Strike ' , ' none ' , ' Trap ' , ' Target Synchro Summoned monster gains 500 ATK for each Synchro Material Monster used to Summon it until the End Phase ' , 7 , 960 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Prideful Roar ' , ' none ' , ' Trap ' , ' Activate only during damage calculation when the ATK of your battling monster is lower than the ATK of your opponents and pay Life Points equal to the difference in ATK Your monster gains ATK equal to that difference +300 during damage calculation only ' , 8 , 961 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Revival Gift ' , ' none ' , ' Trap ' , ' Select 1 Tuner monster from your Graveyard and Special Summon it Its effects are negated Special Summon 2 Gift Fiend Tokens (Fiend-Type/DARK/Level 3/ATK 1500/DEF 1500) to your opponents side of the field ' , 9 , 962 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Lineage of Destruction ' , ' none ' , ' Trap ' , ' Activate only during a turn in which you destroyed a Defense Position monster your opponent controlled Select 1 Level 8 monster you control During this turn the selected monster can attack twice ' , 10 , 963 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Doppelganger ' , ' none ' , ' Trap ' , ' When you take damage from the effect of a monster your opponent controls inflict the same amount of damage to your opponent ' , 1 , 964 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Morphtransition ' , ' none ' , ' Trap ' , ' Activate only when a face-up Morphtronic monster you control is selected as an attack target Negate the attack and change the battle position of the selected Morphtronic monster ' , 2 , 965 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Morphtronic Monitron ' , ' none ' , ' Trap ' , ' When a Morphtronic monster is Summoned you can change it to face-up Defense Position ' , 3 , 966 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Psychic Trigger ' , ' none ' , ' Trap ' , ' Activate only while your Life Points are lower than your opponents Select 2 Psychic-Type monsters in your Graveyard Remove them from play and draw 2 cards ' , 4 , 967 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Pollinosis ' , ' none ' , ' Trap ' , ' Tribute 1 Plant-Type monster Negate the activation of a Spell or Trap Card or the Normal or Special Summon of a monster and destroy that card ' , 5 , 968 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Bamboo Scrap ' , ' none ' , ' Trap ' , ' Tribute 1 Plant-Type monster Special Summon 2 Plant Tokens (Plant-Type/EARTH/Level 1/ATK 800/DEF 500) to your opponents side of the field in Defense Position ' , 6 , 969 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Plant Food Chain ' , ' none ' , ' Trap ' , ' Equip this card to a Plant-Type monster you control It gains 500 ATK If this card is destroyed by a card effect while equipped you can Special Summon 1 Plant-Type monster from your Graveyard ' , 7 , 970 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Trap of the Imperial Tomb ' , ' none ' , ' Trap ' , ' Activate only when a Zombie-Type monster(s) is Special Summoned from your opponents Graveyard to your side of the field Destroy 2 cards on the field ' , 8 , 971 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' DNA Checkup ' , ' none ' , ' Trap ' , ' Select 1 face-down monster you control Your opponent declares 2 Attributes Reveal the selected monster If its Attribute is one of the declared Attributes your opponent draws 2 cards If not you draw 2 cards ' , 9 , 972 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gozen Match ' , ' none ' , ' Trap ' , ' Each player sends monsters they control to the Graveyard until they each control monsters of only 1 Attribute Each player cannot control monsters with different Attributes ' , 10 , 973 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Giant Trap Hole ' , ' none ' , ' Trap ' , ' Activate only when 2 or more monsters are Special Summoned at the same time Destroy all monsters on the field ' , 1 , 974 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Treacherous Trap Hole ' , ' none ' , ' Trap ' , ' Destroy 2 monsters on the field You cannot activate this card if you have any Trap Cards in your Graveyard ' , 2 , 975 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Time Machine ' , ' none ' , ' Trap ' , ' Activate only when a monster is destroyed by battle and sent to the Graveyard Special Summon that monster to the same side of the field it was on in the same battle position it was in when destroyed ' , 3 , 976 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Virus Cannon ' , ' none ' , ' Trap ' , ' Tribute any number of non-Token monsters you control For each Tributed monster your opponent selects 1 Spell Card from their Deck and sends it to the Graveyard ' , 4 , 977 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rainbow Veil ' , ' none ' , ' Spell ' , ' If the equipped monster battles an opponents monster while that monster is on the field its effect(s) is negated during the Battle Phase only ' , 5 , 978 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Vicious Claw ' , ' none ' , ' Spell ' , ' The equipped monster gains 300 ATK If the equipped monster would be destroyed by battle return this card to its owners hand instead Then destroy 1 monster except the one that battled the equipped monster and inflict 600 damage to your opponent After that Special Summon 1 Evil Token (Fiend-Type/DARK/Level 7/ATK 2500/DEF 2500) on your opponents side of the field During the turn this card is returned to your hand you cannot use Vicious Claw from your hand ' , 6 , 979 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Instant Neo Space ' , ' none ' , ' Spell ' , ' Equip only to a Fusion Monster that lists Elemental Hero Neos as a Fusion Material Monster The equipped monster does not have to have its effect activated that returns itself to the Fusion Deck during the End Phase When the equipped monster is removed from the field you can Special Summon 1 Elemental Hero Neos from your hand Deck or Graveyard ' , 7 , 980 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Spell Chronicle ' , ' none ' , ' Spell ' , ' Send all cards in your hand to the Graveyard Select and remove from play 5 Spell or Trap Cards from your Deck Each time your opponent activates a Spell Card place 1 Chronicle Counter on this card You can remove 2 Chronicle Counters from this card to have your opponent select 1 of the cards removed from play with this cards effect and add it to your hand When this card is removed from the field you take 500 damage for each card that is still removed from play due to this cards effect ' , 8 , 981 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' The Beginning of the End ' , ' none ' , ' Spell ' , ' Activate only if there are 7 or more DARK monsters in your Graveyard Remove from play 5 DARK monsters from your Graveyard to draw 3 cards ' , 9 , 982 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Eruption ' , ' none ' , ' Spell ' , ' Add 1 DARK monster with 1500 or less ATK from your Graveyard to your hand ' , 10 , 983 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Acidic Downpour ' , ' none ' , ' Spell ' , ' All EARTH monsters lose 500 ATK and gain 400 DEF ' , 2 , 984 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Six Samurai United ' , ' none ' , ' Spell ' , ' Each time a Six Samurai monster(s) is Normal or Special Summoned place 1 Bushido Counter on this card (max 2) You can send this card to the Graveyard to draw 1 card for each Bushido Counter on this card ' , 1 , 985 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Beasts Battle Archfiend Shield ' , ' none ' , ' Spell ' , ' Equip only to a Gladiator Beast monster If the equipped monster would be destroyed this card is destroyed instead When the equipped monster is returned from your side of the field to the Deck and this card is sent to the Graveyard return this card to your hand ' , 2 , 986 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gladiator Proving Ground ' , ' none ' , ' Spell ' , ' Add 1 Level 4 or lower Gladiator Beast monster from your Deck to you hand ' , 3 , 987 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark World Grimoire ' , ' none ' , ' Spell ' , ' During your End Phase if you discard a Monster Card(s) to the Graveyard because you had more than 6 cards in your hand you can Special Summon 1 of those monsters ' , 4 , 988 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rainbow Path ' , ' none ' , ' Trap ' , ' Activate only by sending 1 Crystal Beast card from your Spell  Trap Card Zone to the Graveyard when an opponents monster declares an attack Negate the attack then you can add 1 Rainbow Dragon or Rainbow Dark Dragon from your Deck to your hand ' , 5 , 989 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Rainbow Life ' , ' none ' , ' Trap ' , ' Discard 1 card Until the end of this turn whenever you would take damage you gain that amount of Life Points instead ' , 6 , 990 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Sinister Seeds ' , ' none ' , ' Trap ' , ' Activate only when a face-up Attack Position monster you control is destroyed by battle Special Summon 1 Sinister Seed Token (Plant-Type/DARK/Level 1/ATK 100/DEF 100) for every 500 points of Battle Damage you took from that battle ' , 7 , 991 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Hate Buster ' , ' none ' , ' Trap ' , ' Activate only when a face-up Fiend-Type monster you control is selected as an attack target Destroy the attacking monster and the attack target monster and inflict damage to your opponent equal to the original ATK of the attacking monster ' , 8 , 992 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Chain Material ' , ' none ' , ' Trap ' , ' Any time you Fusion Summon a monster this turn you can remove from play from your side of the field Deck hand or Graveyard Fusion Material Monsters that are listed on the Fusion Monster Card and use them as Fusion Material Monsters You cannot attack during the turn this card is activated If you used this effect for a Fusion Summon the Summoned Fusion Monster(s) is destroyed during the End Phase ' , 9 , 993 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Alchemy Cycle ' , ' none ' , ' Trap ' , ' The original ATK of all face-up monsters you control becomes 0 until the End Phase Each time a monster that had its original ATK reduced to 0 by this effect is destroyed by battle and sent to the Graveyard draw 1 card ' , 10 , 994 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cybernetic Hidden Technology ' , ' none ' , ' Trap ' , ' When an opponents monster declares an attack you can send 1 Cyber Dragon you control or a Fusion Monster you control that lists Cyber Dragon as a Fusion Material Monster to the Graveyard Destroy the attacking monster ' , 2 , 995 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Spirit Art - Greed ' , ' none ' , ' Trap ' , ' Tribute 1 DARK monster Draw 2 cards Your opponent can negate this effect by revealing 1 Spell Card in their hnd ' , 2 , 996 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Dark Illusion ' , ' none ' , ' Trap ' , ' Negate the activation of a Spell Card Trap Card or Effect Monsters effect that targets a face-up DARK monster and destroy that card ' , 2 , 997 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Escape From The Dark Dimension ' , ' none ' , ' Trap ' , ' Select 1 of your removed from play DARK monsters and Special Summon it When this card is removed from the field destroy and remove from play that monster When that monster is destroyed destroy this card ' , 2 , 998 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Gemini Trap Hole ' , ' none ' , ' Trap ' , ' Activate only when a Gemini Monster that is treated as an Effect Monster is destroyed by battle Destroy all monsters your opponent controls ' , 2 , 999 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Drastic Drop Off ' , ' none ' , ' Trap ' , ' Activate only when your opponent adds a card(s) from their Deck to their hand including drawing a card(s) Your opponent discards 1 of those cards ' , 1 , 1000 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' All-Out Attacks   ' , ' none ' , ' Trap ' , ' All monsters that are Special Summoned are changed to face-up Attack Position and must attack if able during the turn they are Special Summoned ' , 2 , 1001 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Double Tag Team ' , ' none ' , ' Trap ' , ' Activate only when you Special Summon a Gladiator Beast monster Special Summon 1 Level 4 or lower Gladiator Beast monster from your hand or Deck ' , 3 , 1002 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Offering to the Snake Deity ' , ' none ' , ' Trap ' , ' Destroy 1 Reptile-Type monster you control and 2 cards your opponent controls ' , 4 , 1003 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Cry Havoc! ' , ' none ' , ' Trap ' , ' You can remove from play 1 monster from your Graveyard to Normal Summon or Set 1 Normal Monster from your hand You can only activate this effect during your Main Phase ' , 5 , 1004 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Transmigration Break ' , ' none ' , ' Trap ' , ' Any cards that would be returned to the Deck from the Graveyard are removed from play instead ' , 6 , 1005 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Fine ' , ' none ' , ' Trap ' , ' Discard 2 cards ' , 7 , 1006 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Allure of Darkness ' , ' none ' , ' Spell ' , ' Draw 2 cards then remove from play 1 DARK monster from your hand If you dont have any DARK monsters in your hand to remove send all cards in your hand to the Graveyard ' , 8 , 1007 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Metal Reflect Slime ' , ' none ' , ' Trap ' , ' After activation Special Summon this card in Defense Position it is treated as an Effect Monster Card (Aqua-Type/WATER/Level 10/ATK 0/DEF 3000) This card cannot attack (This card is till treated as a Trap Card) ' , 9 , 1008 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Zoma The Spirit ' , ' none ' , ' Trap ' , ' After activation Special Summon this card in Defense Position it is treated as an Effect Monster Card (Zombie-Type/DARK/Level 4/ATK 1800/DEF 500) If this card is destroyed by battle inflict damage to your opponent equal to the ATK of the monster that destroyed it (This card is still treated as a Trap Card) ' , 10 , 1009 );
INSERT INTO CARTAS(car_nome, car_atributo, car_tipo, car_desc, car_col_fk,car_id) VALUES ( ' Call of the Earthbound ' , ' none ' , ' Trap ' , ' Activate only when an opponents monster declares an attack You select the target of the attack ' , 2 , 1010 );

/*TODO INSERT TABELA MAGICA/ARMADILHA */
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Field ' , 1 , 904 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Quick-Play ' , 1 , 905 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 906 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 907 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Field ' , 1 , 908 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 909 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 910 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 911 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 912 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Quick-Play ' , 1 , 913 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 914 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 915 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 916 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 917 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 918 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 919 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 920 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 921 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 922 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 923 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 924 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Counter ' , 3 , 925 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 926 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 927 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 928 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 929 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 930 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 931 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 932 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Counter ' , 3 , 933 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 934 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 935 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 936 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 937 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 938 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 939 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Quick-Play ' , 1 , 940 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 941 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Field ' , 1 , 942 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Quick-Play ' , 1 , 943 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 944 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 945 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 946 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 947 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 948 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 949 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 950 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 951 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 952 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 953 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 954 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Field ' , 2 , 955 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 2 , 956 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 3 , 957 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 958 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 959 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 960 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 961 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 962 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 963 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 964 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 3 , 965 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 966 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 967 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Counter ' , 2 , 968 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 969 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 970 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 971 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 972 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 973 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 974 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 975 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 976 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 977 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 978 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 979 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 980 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 981 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 982 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 983 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Field ' , 1 , 984 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 985 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Equip ' , 1 , 986 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 987 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 988 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 989 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 990 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 991 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 992 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 993 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 994 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 995 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 996 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Counter ' , 3 , 997 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 998 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 999 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Counter ' , 3 , 1000 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 1001 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 1002 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 1003 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 1004 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 2 , 1005 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 2 , 1006 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 1007 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 1008 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Continuous ' , 1 , 1009 );
INSERT INTO MAGICAS(mag_efeito, mag_velocidade, mag_car_id) VALUES ( ' Normal ' , 1 , 1010 );

