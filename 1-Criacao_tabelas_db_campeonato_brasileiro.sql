-- DROP SCHEMA campeonato_brasileiro;

CREATE SCHEMA campeonato_brasileiro;

USE campeonato_brasileiro;

-- Tabela 1: jogador
CREATE TABLE jogador (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(20) NOT NULL,
    dt_nasc DATE NOT NULL,
    nacionalidade VARCHAR(20) NOT NULL,
    posicao ENUM('Goleiro', 'Zagueiro', 'Lateral', 'Meio de Campo', 'Atacante') NOT NULL,
    clube_id INT NOT NULL
);

-- Tabela 2: tecnico
CREATE TABLE tecnico (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(20) NOT NULL,
    dt_nasc DATE NOT NULL,
    nacionalidade VARCHAR(20) NOT NULL,
    clube_id INT NOT NULL
);

-- Tabela 3: estadio
CREATE TABLE estadio (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    uf ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO') NOT NULL,
    capacidade FLOAT NOT NULL
);

-- Tabela 4: clube
CREATE TABLE clube (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    uf ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO') NOT NULL,
    ano_fund DATE NOT NULL,
    estadio_id INT
);

-- Tabela 5: partida
CREATE TABLE partida (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    qnt_gols_man INT DEFAULT 0,
    qnt_gols_visit INT DEFAULT 0,
    data DATETIME NOT NULL,
    rodada INT NOT NULL,
    qnt_puplico INT NOT NULL,
    clb_mand_venceu BOOLEAN NOT NULL DEFAULT false,
    clb_visit_venceu BOOLEAN NOT NULL DEFAULT false,
    empate BOOLEAN NOT NULL DEFAULT false,
    clb_mand_id INT NOT NULL,
    clb_visit_id INT NOT NULL,
    estadio_id INT NOT NULL
);

-- Tabela 6: atuacao
CREATE TABLE atuacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    qnt_gols INT DEFAULT 0,
    qnt_assistencias INT DEFAULT 0,
    qnt_defesas INT DEFAULT 0,
    qnt_cart_amar INT DEFAULT 0,
    qnt_cart_verm INT DEFAULT 0,
    titular BOOLEAN NOT NULL DEFAULT false,
    substituido BOOLEAN NOT NULL DEFAULT false,
    tempo_atuacao INT NOT NULL,
    jogador_id INT NOT NULL,
    partida_id INT NOT NULL,
    clube_id INT NOT NULL
);

-- Tabela 7: classificacao
CREATE TABLE classificacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    qnt_part_jogadas INT DEFAULT 0,
    qnt_vitorias INT DEFAULT 0,
    qnt_derrotas INT DEFAULT 0,
    qnt_empates INT DEFAULT 0,
    qnt_gols_marc INT DEFAULT 0,
    qnt_gols_sofr INT DEFAULT 0,
    saldo_gols INT DEFAULT 0,
    perc_aprov FLOAT DEFAULT 0,
    qnt_pontos INT DEFAULT 0,
    clube_id INT NOT NULL
);

-- Tabela 8: gols
CREATE TABLE gols (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rodada INT NOT NULL,
    min_gol INT NOT NULL,   -- (Minuto na partida em que o gol foi marcado)
    tipo_gol ENUM('Chute','Cabeça', 'Pênalti', 'Falta', 'Olímpico', 'Gol Contra'), 
    clube_id INT NOT NULL,
    jogador_id INT NOT NULL,
    partida_id INT NOT NULL
);


-- Adicionando chaves estrangeiras
ALTER TABLE jogador ADD CONSTRAINT fk_jogador_clube FOREIGN KEY (clube_id) REFERENCES clube(id);
ALTER TABLE tecnico ADD CONSTRAINT fk_tecnico_clube FOREIGN KEY (clube_id) REFERENCES clube(id);
ALTER TABLE clube ADD CONSTRAINT fk_clube_estadio FOREIGN KEY (estadio_id) REFERENCES estadio(id);
ALTER TABLE partida ADD CONSTRAINT fk_partida_clube_mandante FOREIGN KEY (clb_mand_id) REFERENCES clube(id);
ALTER TABLE partida ADD CONSTRAINT fk_partida_clube_visitante FOREIGN KEY (clb_visit_id) REFERENCES clube(id);
ALTER TABLE partida ADD CONSTRAINT fk_partida_estadio FOREIGN KEY (estadio_id) REFERENCES estadio(id);
ALTER TABLE atuacao ADD CONSTRAINT fk_atuacao_jogador FOREIGN KEY (jogador_id) REFERENCES jogador(id);
ALTER TABLE atuacao ADD CONSTRAINT fk_atuacao_partida FOREIGN KEY (partida_id) REFERENCES partida(id);
ALTER TABLE atuacao ADD CONSTRAINT fk_atuacao_clube FOREIGN KEY (clube_id) REFERENCES clube(id);
ALTER TABLE classificacao ADD CONSTRAINT fk_classificacao_clube FOREIGN KEY (clube_id) REFERENCES clube(id);
ALTER TABLE gols ADD CONSTRAINT fk_gols_clube FOREIGN KEY (clube_id) REFERENCES clube(id);
ALTER TABLE gols ADD CONSTRAINT fk_gols_jogador FOREIGN KEY (jogador_id) REFERENCES jogador(id);
ALTER TABLE gols ADD CONSTRAINT fk_gols_partida FOREIGN KEY (partida_id) REFERENCES partida(id);
