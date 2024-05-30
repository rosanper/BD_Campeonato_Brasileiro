USE campeonato_brasileiro;

-- Tabela estadio
SELECT * FROM estadio;

-- Tabela clube
SELECT * FROM clube;
SELECT c.id, c.nome, c.cidade, c.uf, c.ano_fund, e.nome as estadio FROM clube c INNER JOIN estadio e ON c.estadio_id = e.id;

-- Tabela jogador
SELECT * FROM jogador;
SELECT j.id, j.nome, j.sobrenome, j.dt_nasc, j.nacionalidade, j.posicao, c.nome AS clube FROM jogador j INNER JOIN clube c ON j.clube_id = c.id; 

-- Tabela tecnico
SELECT * FROM tecnico;
SELECT t.id, t.nome, t.sobrenome, t.dt_nasc, t.nacionalidade, c.nome AS clube FROM tecnico t INNER JOIN clube c ON t.clube_id = c.id; 

-- Tabela partida
SELECT * FROM partida order by rodada;

SELECT 
	p.id, 
    cm.nome AS clube_mandante,
    cv.nome AS clube_visitante,
    p.qnt_gols_man,
    p.qnt_gols_visit,
    p.clb_mand_venceu,
	p.clb_visit_venceu,
    p.empate,
    p.rodada,
    p.data,
    e.nome,
    p.qnt_puplico
FROM partida p 
INNER JOIN clube cm ON p.clb_mand_id = cm.id 
INNER JOIN clube cv ON p.clb_visit_id = cv.id
INNER JOIN estadio e ON p.estadio_id = e.id;


-- Tabela classificacao
SELECT * FROM classificacao;
SELECT 
	classificacao.id, 
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
FROM classificacao INNER JOIN clube ON classificacao.clube_id = clube.id;


-- Tabela atuacao
SELECT * FROM atuacao;
SELECT 
	jogador.nome, jogador.sobrenome, partida.data AS 'data partida', partida.rodada AS 'rodada da partidda', atuacao.qnt_gols, atuacao.qnt_assistencias, atuacao.qnt_defesas, atuacao.qnt_cart_amar, atuacao.qnt_cart_verm 
FROM atuacao 
INNER JOIN jogador ON atuacao.jogador_id = jogador.id 
INNER JOIN partida ON atuacao.partida_id = partida.id; 

-- Tabela gols
SELECT * FROM gols;

-- SELECTS VIEWS

SELECT * FROM jogador_vw;
SELECT * FROM partida_vw;
SELECT * FROM atuacao_vw;
SELECT * FROM partida_dia_semana_vw;
SELECT * FROM patida_clube_id1_vw; 
SELECT * FROM classificacao_posicao_time_vw;
SELECT * FROM artilharia_vw;
SELECT * FROM publico_vw;