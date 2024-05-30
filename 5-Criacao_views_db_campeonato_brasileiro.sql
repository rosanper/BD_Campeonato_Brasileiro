USE campeonato_brasileiro;

-- View tabela jogador

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW jogador_vw AS
SELECT 
	j.nome, 
    j.sobrenome, 
    j.dt_nasc, 
    j.nacionalidade, 
    j.posicao, 
    c.nome AS clube 
FROM jogador j 
INNER JOIN clube c ON j.clube_id = c.id; 


-- View tabela partida

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW partida_vw AS
SELECT 
	cm.nome AS clube_mandante,
    cv.nome AS clube_visitante,
    p.qnt_gols_man,
    p.qnt_gols_visit,
    p.clb_mand_venceu,
	p.clb_visit_venceu,
    p.empate,
    p.rodada,
    p.data,
    e.nome AS estadio,
    p.qnt_puplico
FROM partida p 
INNER JOIN clube cm ON p.clb_mand_id = cm.id 
INNER JOIN clube cv ON p.clb_visit_id = cv.id
INNER JOIN estadio e ON p.estadio_id = e.id
ORDER BY rodada;

-- View tabela atuacao

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW atuacao_vw AS
SELECT 
	jogador.nome, 
    jogador.sobrenome, 
    partida.data AS 'data partida', 
    partida.rodada AS 'rodada',
    atuacao.qnt_gols, 
    atuacao.qnt_assistencias, 
    atuacao.qnt_defesas, 
    atuacao.qnt_cart_amar, 
    atuacao.qnt_cart_verm,
    clb_mandante.nome AS time_mandante,
    clb_visitante.nome AS time_visitante
FROM atuacao 
INNER JOIN jogador ON atuacao.jogador_id = jogador.id 
INNER JOIN partida ON atuacao.partida_id = partida.id
INNER JOIN clube AS clb_mandante ON partida.clb_mand_id = clb_mandante.id
INNER JOIN clube AS clb_visitante ON partida.clb_visit_id = clb_visitante.id; 



-- View mostrando a quantidade de partidas que ocorreu em cada dia da semana

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW partida_dia_semana_vw AS
SELECT 
	dayname(data) AS dia_da_semana, 
    count(*) AS qnt_jogos 
FROM partida p 
GROUP BY dia_da_semana;

-- View mostrando as partidas de um time

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW patida_clube_id1_vw AS
SELECT 
    cm.nome AS clube_mandante,
    cv.nome AS clube_visitante,
    p.qnt_gols_man,
    p.qnt_gols_visit,
    p.clb_mand_venceu,
	p.clb_visit_venceu,
    p.empate,
    p.rodada,
    p.data,
    e.nome AS estadio,
    p.qnt_puplico
FROM partida p 
INNER JOIN clube cm ON p.clb_mand_id = cm.id 
INNER JOIN clube cv ON p.clb_visit_id = cv.id
INNER JOIN estadio e ON p.estadio_id = e.id
WHERE cm.id = 1 OR cv.id = 1
ORDER BY rodada;    


-- View mostrando a posição de cada time na tabela de classificacao

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW classificacao_posicao_time_vw AS
SELECT 
	row_number() over(order by qnt_pontos desc, qnt_vitorias desc, saldo_gols desc ) as posicao, 
    clube.nome, 
    classificacao.qnt_part_jogadas, 
    classificacao.qnt_vitorias, 
    classificacao.qnt_empates, 
    classificacao.qnt_derrotas, 
    classificacao.qnt_gols_marc, 
    classificacao.qnt_gols_sofr, 
    classificacao.saldo_gols, 
    classificacao.perc_aprov, 
    classificacao.qnt_pontos 
FROM classificacao 
INNER JOIN clube ON classificacao.clube_id = clube.id;

-- View mostrando a artilharia do campeonato

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW artilharia_vw AS
SELECT 
	jogador.nome AS nome_jogador,
    jogador.sobrenome AS sobrenome_jogador,
    clube.nome AS time,
    jogador.posicao,
	COUNT(gols.id) AS qnt_gols 
FROM gols 
INNER JOIN jogador ON gols.jogador_id = jogador.id
INNER JOIN clube ON jogador.clube_id = clube.id
GROUP BY(jogador_id)
ORDER BY(qnt_gols) DESC;


-- View mostrando o publico das partidas e comparando com a capacidade do estadio e a média de publico do estadio no campeonato

CREATE OR REPLACE
ALGORITHM = TEMPTABLE
VIEW publico_vw AS
SELECT
	partida.rodada,
    obter_nome_clube(partida.clb_mand_id) AS clb_mandante,
    obter_nome_clube(partida.clb_visit_id) AS clb_visitante,
	estadio.nome AS nome_estaddio,
    partida.qnt_puplico AS qnt_publico_partida,
    estadio.capacidade AS capacidade_estadio,
    ((partida.qnt_puplico / estadio.capacidade)*100) AS percentual_ocupacao,
    obter_media_publico_estadio(partida.estadio_id) AS media_publico_estadio_campeonato
FROM partida
INNER JOIN estadio ON partida.estadio_id = estadio.id
ORDER BY rodada;     
