USE campeonato_brasileiro;

-- Estadio

INSERT INTO estadio (id, nome, cidade, uf, capacidade)
VALUES (800, 'Teste TRIGGER', 'Teste TRIGGER', 'RJ', 78838);

UPDATE estadio SET nome = 'ALTERADO' WHERE id = 800;

-- Clube

INSERT INTO clube (id, nome, cidade, uf, ano_fund, estadio_id)
VALUES (800, 'Teste TRIGGER', 'Teste TRIGGER', 'RJ', '1895-11-15', 800);

INSERT INTO clube (id, nome, cidade, uf, ano_fund, estadio_id)
VALUES (801, 'Teste TRIGGER 2', 'Teste TRIGGER 2', 'RJ', '1895-11-15', 800);

UPDATE clube SET nome = 'ALTERADO' WHERE id = 800;
UPDATE clube SET nome = 'ALTERADO 2' WHERE id = 801;

-- Jogador

INSERT INTO jogador (id, nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id)
VALUES (800, 'Teste TRIGGER', 'Teste TRIGGER', '1994-06-16', 'Brasileiro', 'Goleiro', 800);

UPDATE jogador SET nome = 'ALTERADO' WHERE id = 800;

-- Tecnico
INSERT INTO tecnico (id, nome, sobrenome, dt_nasc, nacionalidade, clube_id)
VALUES (800, 'Teste TRIGGER', 'Teste TRIGGER', '1954-07-24', 'Português', 800);

UPDATE tecnico SET nome = 'ALTERADO' WHERE id = 800;

-- Partida

INSERT INTO partida (id, qnt_gols_man, qnt_gols_visit, data, rodada, qnt_puplico, clb_mand_venceu, clb_visit_venceu, empate, clb_mand_id, clb_visit_id, estadio_id) 
VALUES (800, 0, 3, '2023-03-06 22:00:00', 800, 35248, false, true, false, 800, 801, 800);

UPDATE partida SET data = CURDATE() WHERE id = 800;

-- Classificacao

INSERT INTO classificacao (id, qnt_part_jogadas, qnt_vitorias, qnt_derrotas, qnt_empates, qnt_gols_marc, qnt_gols_sofr, saldo_gols, perc_aprov, qnt_pontos, clube_id) 
VALUES (800, 800, 800, 800, 800, 800, 800, 800, 0.800, 800, 800);

UPDATE classificacao SET qnt_pontos = 1000 WHERE id = 800;

-- Atuacao

INSERT INTO atuacao (id, qnt_gols, qnt_assistencias, qnt_defesas, qnt_cart_amar, qnt_cart_verm, titular, substituido, tempo_atuacao, jogador_id, partida_id, clube_id) 
 VALUES (80000, 0, 0, 4, 0, 0, true, false, 90, 800, 800, 800);
 
 UPDATE atuacao SET qnt_gols = 100 WHERE id = 80000;

-- Gols
INSERT INTO gols (id, rodada, min_gol, tipo_gol, clube_id, jogador_id, partida_id)
VALUES (80000, 800, 28, 'Olímpico', 800, 800, 800);

UPDATE gols SET rodada = 1000 WHERE id = 80000;

-- SELECTS

SELECT * FROM log_estadio;
SELECT * FROM log_clube;
SELECT * FROM log_tecnico;
SELECT * FROM log_jogador;
SELECT * FROM log_partida;
SELECT * FROM log_classificacao;
SELECT * FROM log_atuacao;
SELECT * FROM log_gols;

SELECT * FROM estadio       WHERE id = 800;
SELECT * FROM clube         WHERE id IN(800, 801);
SELECT * FROM tecnico       WHERE id = 800;
SELECT * FROM jogador       WHERE id = 800;
SELECT * FROM partida       WHERE id = 800;
SELECT * FROM classificacao WHERE id = 800;
SELECT * FROM atuacao WHERE id = 80000;
SELECT * FROM gols          WHERE id = 80000;


-- DELETES 

DELETE FROM gols WHERE id = 80000;
DELETE FROM atuacao WHERE id = 80000;
DELETE FROM classificacao WHERE id = 800;
DELETE FROM partida WHERE id = 800;
DELETE FROM tecnico WHERE id = 800;
DELETE FROM jogador WHERE id = 800;
DELETE FROM clube WHERE id = 800;
DELETE FROM clube WHERE id = 801;
DELETE FROM estadio WHERE id = 800;


-- SELECTS

SELECT * FROM log_estadio;
SELECT * FROM log_clube;
SELECT * FROM log_tecnico;
SELECT * FROM log_jogador;
SELECT * FROM log_partida;
SELECT * FROM log_classificacao;
SELECT * FROM log_atuacao;
SELECT * FROM log_gols;

-- DROP TRIGGERS

-- DROP TRIGGER tr_insert_estadio;
-- DROP TRIGGER tr_update_estadio;
-- DROP TRIGGER tr_delete_estadio;

-- DROP TRIGGER tr_insert_clube;
-- DROP TRIGGER tr_update_clube;
-- DROP TRIGGER tr_delete_clube;

-- DROP TRIGGER tr_insert_jogador;
-- DROP TRIGGER tr_update_jogador;
-- DROP TRIGGER tr_delete_jogador;

-- DROP TRIGGER tr_insert_tecnico;
-- DROP TRIGGER tr_update_tecnico;
-- DROP TRIGGER tr_delete_tecnico;

-- DROP TRIGGER tr_insert_partida;
-- DROP TRIGGER tr_update_partida;
-- DROP TRIGGER tr_delete_partida;

-- DROP TRIGGER tr_insert_classificacao;
-- DROP TRIGGER tr_update_classificacao;
-- DROP TRIGGER tr_delete_classificacao;

-- DROP TRIGGER tr_insert_gols;
-- DROP TRIGGER tr_update_gols;
-- DROP TRIGGER tr_delete_gols;