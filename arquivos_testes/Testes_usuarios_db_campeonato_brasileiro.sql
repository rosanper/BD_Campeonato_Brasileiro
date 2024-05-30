USE campeonato_brasileiro;

-- SELECT tabelas

SELECT * FROM estadio;
SELECT * FROM clube;
SELECT * FROM tecnico;
SELECT * FROM jogador;
SELECT * FROM partida;
SELECT * FROM atuacao;
SELECT * FROM classificacao;
SELECT * FROM gols;

SELECT * FROM log_estadio;
SELECT * FROM log_clube;
SELECT * FROM log_tecnico;
SELECT * FROM log_jogador;
SELECT * FROM log_partida;
SELECT * FROM log_atuacao;
SELECT * FROM log_classificacao;
SELECT * FROM log_gols;

-- SELECT views

SELECT * FROM jogador_vw;
SELECT * FROM partida_vw;
SELECT * FROM atuacao_vw;
SELECT * FROM partida_dia_semana_vw;
SELECT * FROM patida_clube_id1_vw; 
SELECT * FROM classificacao_posicao_time_vw;
SELECT * FROM artilharia_vw;
SELECT * FROM publico_vw;

-- PROCEDURES
CALL obter_tab_partida_time(2);
CALL ordenar_tab_partida('');


-- INSERT, UPDATE e DELETE

INSERT INTO estadio (id, nome, cidade, uf, capacidade) VALUES (100, CONCAT('teste insert', USER()), 'teste', 'SP', 0);  

UPDATE estadio SET capacidade = 100000 WHERE id=100;

DELETE FROM estadio WHERE id = 100;


-- INSERT INTO estadio (id, nome, cidade, uf, capacidade) VALUES (101, CONCAT('teste insert', USER()), 'teste', 'SP', 0);  
-- UPDATE estadio SET capacidade = 100000 WHERE id=100;
-- DELETE FROM estadio WHERE id = 101;


