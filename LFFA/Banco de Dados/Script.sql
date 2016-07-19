-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE CAMPEONATOLD;



CREATE TABLE usuario (
id int PRIMARY KEY identity(1,1) ,
nome_usuario nVarchar(100),
senha_usuario nVarchar(12),
email_usuario nVarchar(100),
tipo_usuario int
)

CREATE TABLE t_bolao (
id int PRIMARY KEY identity(1,1),
gol_time_mandante int,
gol_time_visitante int,
pontos_adquiridos int,
id_partida int,
id_usuario int,
FOREIGN KEY(id_usuario) REFERENCES usuario (id)
)


CREATE TABLE acessos (
id int PRIMARY KEY identity(1,1),
numero_acessos int ,
)

CREATE TABLE time_campeonato (
id int PRIMARY KEY identity(1,1),
id_time int,
id_campeonato int
)

CREATE TABLE classificacao (
id int PRIMARY KEY identity(1,1),
pontos int,
jogos int,
vitoria int,
derrota int,
empate int,
gol_pro int,
gol_contra int,
id_campeonato int,
id_time int
)

CREATE TABLE t_jogador (
id int PRIMARY KEY identity(1,1),
nome nVarchar(100),
foto nVarchar(100),
posicao nVarchar(100),
descricao nVarchar(100)
)

CREATE TABLE times (
id int PRIMARY KEY identity(1,1),
nome nVarchar(100),
escudo nVarchar(100),
presidente nVarchar(100),
descricao nVarchar(500),
telefone nVarchar(100),
data_fundacao DateTime
)

select * from campeonato
CREATE TABLE campeonato (
id int PRIMARY KEY identity(1,1),
data_inicio datetime,
id_bolao int,
nome nVarchar(100),
FOREIGN KEY(id_bolao) REFERENCES t_bolao_campeonato (id)
)

alter table campeonato 
add  id_bolao int
FOREIGN KEY(id_bolao) REFERENCES t_bolao_campeonato (id);

CREATE TABLE partida (
id int PRIMARY KEY identity(1,1),
id_time_mandante int,
id_time_visitante int,
id_campeonato int,
data_partida datetime,
local_partida nVarchar(100),
rodada nVarchar(100),
remarcada_partida bit,
gol_time_mandante int,
gol_time_visitante int,
pontos_computado int,
nova_data_partida DateTime,
FOREIGN KEY(id_time_mandante) REFERENCES times (id),
FOREIGN KEY(id_time_visitante) REFERENCES times (id),
FOREIGN KEY(id_campeonato) REFERENCES campeonato (id)
)

CREATE TABLE T_BOLAO_CAMPEONATO (
id int PRIMARY KEY identity(1,1),
nome nVarchar(100)
)

CREATE TABLE fotos_videos (
id int PRIMARY KEY identity(1,1),
caminho nVarchar(100),
derscricao nVarchar(100),
id_time int,
video nVarchar(100),
id_campeonato int,
id_partida int,
FOREIGN KEY(id_time) REFERENCES times (id),
FOREIGN KEY(id_campeonato) REFERENCES campeonato (id),
FOREIGN KEY(id_partida) REFERENCES partida (id)
)

ALTER TABLE t_bolao ADD FOREIGN KEY(id_partida) REFERENCES partida (id)
ALTER TABLE time_campeonato ADD FOREIGN KEY(id_time) REFERENCES times (id)
ALTER TABLE time_campeonato ADD FOREIGN KEY(id_campeonato) REFERENCES campeonato (id)
ALTER TABLE classificacao ADD FOREIGN KEY(id_campeonato) REFERENCES campeonato (id)
ALTER TABLE classificacao ADD FOREIGN KEY(id_time) REFERENCES times (id)

--INSERT USUARIOS

INSERT INTO usuario (nome_usuario, email_usuario, senha_usuario, tipo_usuario)
            values ('JOAOCELSON', 'joaocelson@gmail.com', 'ibititec', 1);

--INSERT T_BOLAO_CAMPEONATO
INSERT INTO T_BOLAO_CAMPEONATO (nome) VALUES ('1ª Divisão');

--INSERT INTO CAMPEONATO
SELECT * FROM campeonato;
INSERT INTO campeonato (nome, data_inicio)
values ('FULLPAD 2016', '20160702 13:00:00 PM');


--INSERT TIME
SELECT * FROM times;

-- CHAVE A
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('OILERS', 'OILERS.png', '','', '20000704 00:00:00 AM', '');
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('FALCONS', 'FALCONS.png', '','', '20000704 00:00:00 AM', '');
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('BAROES', 'BAROES.png', '','', '20000704 00:00:00 AM', '');
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('ROCKERS', 'ROCKERS.png', '','', '20000704 00:00:00 AM', '');
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('REPTILES', 'REPTILES.png', '','', '20000704 00:00:00 AM', '');
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('ISLANDERS', 'ISLANDERS.png', '','', '20000704 00:00:00 AM', '');
INSERT INTO times (nome, escudo, descricao, presidente, data_fundacao, telefone)
VALUES ('YETIS', 'YETIS.png', '','', '20000704 00:00:00 AM', '');


1,SAODOMINGOS,3
2,PEROBAS,3
3,SERAB,3
4,SOCIAL,3
5,POCOPEDRA,0
6,POLEMICA,0
7,PIUNA,0
8,ORVALHO,0
8,ORVALHO,0


--INSERT TIME_CAMPEONATO
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,8);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,9);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,10);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,11);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,12);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,13);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,14);
INSERT INTO time_campeonato (id_campeonato, id_time)
VALUES (2,15);

--INSERT PARTIDAS

INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160626 02:00:00 PM',8,12,'MACAE','1');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160703 02:00:00 PM',9,11,'VOLTA REDONDA','2');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160703 02:00:00 PM',10,13,'MAGE','2');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160717 02:00:00 PM',11,14,'TERESOPOLIS','3');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160724 02:00:00 PM',12,10,'BOTAFOGO','4');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160724 02:00:00 PM',13,8,'RIO DE JANEIRO','4');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160807 02:00:00 PM',14,9,'NOVA FRIBURGO','5');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160807 02:00:00 PM',10,9,'MAGE','5');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160807 02:00:00 PM',14,8,'NOVA FRIBURGO','5');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160828 02:00:00 PM',12,11,'BOTAFOGO','6');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160904 02:00:00 PM',13,14,'RIO DE JANEIRO','7');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160918 02:00:00 PM',9,12,'VOLTA REDONDA','8');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20160918 02:00:00 PM',8,11,'MACAE','8');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20161009 02:00:00 PM',14,10,'NOVA FRIBURGO','9');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20161009 02:00:00 PM',8,9,'MACAE','9');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20161016 02:00:00 PM',11,13,'TERESOPOLIS','10');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20161030 02:00:00 PM',12,14,'BOTAFOGO','11');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20161113 02:00:00 PM',9,13,'VOLTA REDONDA','12');
INSERT INTO partida (id_campeonato,data_partida, id_time_mandante, id_time_visitante, local_partida, rodada) VALUES (2,'20161113 02:00:00 PM',10,8,'MAGE','12');



--

SElect * from times;

select * from campeonato;

8	OILERS
9	FALCONS
10	BAROES
11	ROCKERS
12	REPTILES
13	ISLANDERS
14	YETIS