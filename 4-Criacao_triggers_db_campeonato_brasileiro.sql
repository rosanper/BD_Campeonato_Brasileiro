USE campeonato_brasileiro;

-- Criação das tabelas de log

-- Tabela 1: jogador
CREATE TABLE log_jogador (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    jogador_id INT NOT NULL,
    nome_antigo VARCHAR(20),
    sobrenome_antigo VARCHAR(20),
    dt_nasc_antigo DATE,
    nacionalidade_antigo VARCHAR(20),
    posicao_antigo ENUM('Goleiro', 'Zagueiro', 'Lateral', 'Meio de Campo', 'Atacante'),
    clube_id_antigo INT,
	acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 2: tecnico
CREATE TABLE log_tecnico (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tecnico_id INT NOT NULL,
    nome_antigo VARCHAR(20),
    sobrenome_antigo VARCHAR(20),
    dt_nasc_antigo DATE,
    nacionalidade_antigo VARCHAR(20),
    clube_id_antigo INT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 3: estadio
CREATE TABLE log_estadio (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estadio_id INT NOT NULL,
    nome_antigo VARCHAR(40),
    cidade_antigo VARCHAR(40),
    uf_antigo ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'),
    capacidade_antigo FLOAT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 4: clube
CREATE TABLE log_clube (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    clube_id INT NOT NULL,
    nome_antigo VARCHAR(40),
    cidade_antigo VARCHAR(40),
    uf_antigo ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'),
    ano_fund_antigo DATE,
    estadio_id_antigo INT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 5: partida
CREATE TABLE log_partida (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    partida_id INT NOT NULL,
    qnt_gols_man_antigo INT,
    qnt_gols_visit_antigo INT,
    data_antigo DATETIME,
    rodada_antigo INT,
    qnt_puplico_antigo INT,
    clb_mand_venceu_antigo BOOLEAN,
    clb_visit_venceu_antigo BOOLEAN,
    empate_antigo BOOLEAN,
    clb_mand_id_antigo INT,
    clb_visit_id_antigo INT,
    estadio_id_antigo INT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 6: atuacao
CREATE TABLE log_atuacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    atuacao_id INT NOT NULL,
    qnt_gols_antigo INT,
    qnt_assistencias_antigo INT,
    qnt_defesas_antigo INT,
    qnt_cart_amar_antigo INT,
    qnt_cart_verm_antigo INT,
    titular_antigo BOOLEAN,
    substituido_antigo BOOLEAN,
    tempo_atuacao_antigo INT,
    jogador_id_antigo INT,
    partida_id_antigo INT,
    clube_id_antigo INT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 7: classificacao
CREATE TABLE log_classificacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    classificacao_id INT NOT NULL,
    qnt_part_jogadas_antigo INT,
    qnt_vitorias_antigo INT,
    qnt_derrotas_antigo INT,
    qnt_empates_antigo INT,
    qnt_gols_marc_antigo INT,
    qnt_gols_sofr_antigo INT,
    saldo_gols_antigo INT,
    perc_aprov_antigo FLOAT,
    qnt_pontos_antigo INT,
    clube_id_antigo INT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);

-- Tabela 8: gols
CREATE TABLE log_gols (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    gols_id INT NOT NULL,
    rodada_antigo INT,
    min_gol_antigo INT,   -- (Minuto na partida em que o gol foi marcado)
    tipo_gol_antigo ENUM('Chute','Cabeça', 'Pênalti', 'Falta', 'Olímpico', 'Gol Contra'), 
    clube_id_antigo INT,
    jogador_id_antigo INT,
    partida_id_antigo INT,
    acao VARCHAR(10) NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    user VARCHAR(100) NOT NULL
);


-- Criação das Triggers

-- tabela 1 jogador

CREATE TRIGGER tr_update_jogador
 BEFORE UPDATE ON jogador
 FOR EACH ROW
 INSERT INTO log_jogador (jogador_id ,nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, posicao_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (NEW.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.posicao, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER());
 
CREATE TRIGGER tr_delete_jogador
 AFTER DELETE ON jogador
 FOR EACH ROW
 INSERT INTO log_jogador (jogador_id, nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, posicao_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.posicao, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER()); 

CREATE TRIGGER tr_insert_jogador
 AFTER INSERT ON jogador
 FOR EACH ROW
 INSERT INTO log_jogador (jogador_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()); 

-- Tabela 2: tecnico

CREATE TRIGGER tr_update_tecnico
 BEFORE UPDATE ON tecnico
 FOR EACH ROW
 INSERT INTO log_tecnico (tecnico_id, nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_delete_tecnico
 AFTER DELETE ON tecnico
 FOR EACH ROW
 INSERT INTO log_tecnico (tecnico_id, nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_insert_tecnico
 AFTER INSERT ON tecnico
 FOR EACH ROW
 INSERT INTO log_tecnico (tecnico_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());


-- Tabela 3: estadio
CREATE TRIGGER tr_update_estadio
 BEFORE UPDATE ON estadio
 FOR EACH ROW
INSERT INTO log_estadio (estadio_id, nome_antigo, cidade_antigo, uf_antigo, capacidade_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.capacidade, 'update', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_delete_estadio
 AFTER DELETE ON estadio
 FOR EACH ROW
INSERT INTO log_estadio (estadio_id, nome_antigo, cidade_antigo, uf_antigo, capacidade_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.capacidade, 'delete', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_insert_estadio
 AFTER INSERT ON estadio
 FOR EACH ROW
INSERT INTO log_estadio (estadio_id, acao, date, time, user) 
VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());

-- Tabela 4: clube

CREATE TRIGGER tr_update_clube
 BEFORE UPDATE ON clube
 FOR EACH ROW
INSERT INTO log_clube (clube_id, nome_antigo, cidade_antigo, uf_antigo, ano_fund_antigo, estadio_id_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.ano_fund, OLD.estadio_id, 'update', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_delete_clube
 AFTER DELETE ON clube
 FOR EACH ROW
INSERT INTO log_clube (clube_id, nome_antigo, cidade_antigo, uf_antigo, ano_fund_antigo, estadio_id_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.ano_fund, OLD.estadio_id, 'delete', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_insert_clube
 AFTER INSERT ON clube
 FOR EACH ROW
INSERT INTO log_clube (clube_id, acao, date, time, user) 
VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());


-- Tabela 5: partida
CREATE TRIGGER tr_update_partida
 BEFORE UPDATE ON partida
 FOR EACH ROW
INSERT INTO log_partida (partida_id, qnt_gols_man_antigo, qnt_gols_visit_antigo, data_antigo, rodada_antigo, qnt_puplico_antigo, clb_mand_venceu_antigo, clb_visit_venceu_antigo, empate_antigo, clb_mand_id_antigo, clb_visit_id_antigo, estadio_id_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.qnt_gols_man, OLD.qnt_gols_visit, OLD.data, OLD.rodada, OLD.qnt_puplico, OLD.clb_mand_venceu, OLD.clb_visit_venceu, OLD.empate, OLD.clb_mand_id, OLD.clb_visit_id, OLD.estadio_id, 'update', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_delete_partida
 AFTER DELETE ON partida
 FOR EACH ROW
 INSERT INTO log_partida (partida_id, qnt_gols_man_antigo, qnt_gols_visit_antigo, data_antigo, rodada_antigo, qnt_puplico_antigo, clb_mand_venceu_antigo, clb_visit_venceu_antigo, empate_antigo, clb_mand_id_antigo, clb_visit_id_antigo, estadio_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_gols_man, OLD.qnt_gols_visit, OLD.data, OLD.rodada, OLD.qnt_puplico, OLD.clb_mand_venceu, OLD.clb_visit_venceu, OLD.empate, OLD.clb_mand_id, OLD.clb_visit_id, OLD.estadio_id, 'delete', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_insert_partida
 AFTER INSERT ON partida
 FOR EACH ROW
 INSERT INTO log_partida (partida_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());


-- Tabela 6: atuacao
CREATE TRIGGER tr_update_atuacao
 BEFORE UPDATE ON atuacao
 FOR EACH ROW
 INSERT INTO log_atuacao (atuacao_id, qnt_gols_antigo, qnt_assistencias_antigo, qnt_defesas_antigo, qnt_cart_amar_antigo, qnt_cart_verm_antigo, titular_antigo, substituido_antigo, tempo_atuacao_antigo, jogador_id_antigo, partida_id_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_gols, OLD.qnt_assistencias, OLD.qnt_defesas, OLD.qnt_cart_amar, OLD.qnt_cart_verm, OLD.titular, OLD.substituido, OLD.tempo_atuacao, OLD.jogador_id, OLD.partida_id, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_delete_atuacao
 AFTER DELETE ON atuacao
 FOR EACH ROW
 INSERT INTO log_atuacao (atuacao_id, qnt_gols_antigo, qnt_assistencias_antigo, qnt_defesas_antigo, qnt_cart_amar_antigo, qnt_cart_verm_antigo, titular_antigo, substituido_antigo, tempo_atuacao_antigo, jogador_id_antigo, partida_id_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_gols, OLD.qnt_assistencias, OLD.qnt_defesas, OLD.qnt_cart_amar, OLD.qnt_cart_verm, OLD.titular, OLD.substituido, OLD.tempo_atuacao, OLD.jogador_id, OLD.partida_id, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_insert_atuacao
 AFTER INSERT ON atuacao
 FOR EACH ROW
 INSERT INTO log_atuacao (atuacao_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());


-- Tabela 7: classificacao
CREATE TRIGGER tr_update_classificacao
 BEFORE UPDATE ON classificacao
 FOR EACH ROW
 INSERT INTO log_classificacao (classificacao_id, qnt_part_jogadas_antigo, qnt_vitorias_antigo, qnt_derrotas_antigo, qnt_empates_antigo, qnt_gols_marc_antigo, qnt_gols_sofr_antigo, saldo_gols_antigo, perc_aprov_antigo, qnt_pontos_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_part_jogadas, OLD.qnt_vitorias, OLD.qnt_derrotas, OLD.qnt_empates, OLD.qnt_gols_marc, OLD.qnt_gols_sofr, OLD.saldo_gols, OLD.perc_aprov, OLD.qnt_pontos, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_delete_classificacao
 AFTER DELETE ON classificacao
 FOR EACH ROW
 INSERT INTO log_classificacao (classificacao_id, qnt_part_jogadas_antigo, qnt_vitorias_antigo, qnt_derrotas_antigo, qnt_empates_antigo, qnt_gols_marc_antigo, qnt_gols_sofr_antigo, saldo_gols_antigo, perc_aprov_antigo, qnt_pontos_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_part_jogadas, OLD.qnt_vitorias, OLD.qnt_derrotas, OLD.qnt_empates, OLD.qnt_gols_marc, OLD.qnt_gols_sofr, OLD.saldo_gols, OLD.perc_aprov, OLD.qnt_pontos, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER());

CREATE TRIGGER tr_insert_classificacao
 AFTER INSERT ON classificacao
 FOR EACH ROW
 INSERT INTO log_classificacao (classificacao_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());



-- Tabela 8: gols
CREATE TRIGGER tr_update_gols
 BEFORE UPDATE ON gols
 FOR EACH ROW
 INSERT INTO log_gols (gols_id, rodada_antigo, min_gol_antigo, tipo_gol_antigo, clube_id_antigo, jogador_id_antigo, partida_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.rodada, OLD.min_gol, OLD.tipo_gol, OLD.clube_id, OLD.jogador_id, OLD.partida_id, 'update', CURDATE(), CURTIME(), USER());   

CREATE TRIGGER tr_delete_gols
 AFTER DELETE ON gols
 FOR EACH ROW
 INSERT INTO log_gols (gols_id, rodada_antigo, min_gol_antigo, tipo_gol_antigo, clube_id_antigo, jogador_id_antigo, partida_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.rodada, OLD.min_gol, OLD.tipo_gol, OLD.clube_id, OLD.jogador_id, OLD.partida_id, 'delete', CURDATE(), CURTIME(), USER());   

CREATE TRIGGER tr_inssert_gols
 AFTER INSERT ON gols
 FOR EACH ROW
 INSERT INTO log_gols (gols_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER());   
