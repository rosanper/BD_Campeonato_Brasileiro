USE campeonato_brasileiro;

-- SELECTS

SELECT obter_nome_clube(5) AS nome_clube;
SELECT obter_nome_estadio(5) AS nome_clube;
SELECT obter_qnt_vitorias_como_mandante(1);
SELECT obter_qnt_vitorias_como_visitante(1);
SELECT obter_qnt_derrotas_como_mandante(1);
SELECT obter_qnt_derrotas_como_visitante(1);
SELECT obter_gols_rodada(1); 
SELECT obter_qnt_partidas_rodada(1);
SELECT obter_media_gols_partida_rodada(1);
SELECT obter_total_gols();
SELECT obter_media_gols_partida();
SELECT obter_qnt_cartoes_amarelos();
SELECT obter_qnt_cartoes_vermelhos();
SELECT obter_media_cartoes_amarelos_partida();
SELECT obter_media_cartoes_vermelhos_partida();
SELECT obter_qnt_gols_tipo('Gol Contra');
SELECT obter_qnt_gols_tipo('Cabeça');
SELECT obter_qnt_gols_tipo('');
SELECT obter_qnt_gols_no_tempo('primeiro');
SELECT obter_qnt_gols_no_tempo('segundo');
SELECT obter_media_publico_estadio(2);

-- SELECT utilizando funções para substituir o join
SELECT 
	p.id, 
    obter_nome_clube(p.clb_mand_id) AS clube_mandante,
    obter_nome_clube(p.clb_visit_id) AS clube_visitante,
    p.qnt_gols_man,
    p.qnt_gols_visit,
    p.clb_mand_venceu,
	p.clb_visit_venceu,
    p.empate,
    p.rodada,
    p.data,
    obter_nome_estadio(p.estadio_id) AS estadio,
    p.qnt_puplico
FROM partida p
ORDER BY rodada;

-- Comparativo entre formas de obter a quantidade total de gols
SELECT obter_total_gols() AS qnt_gols;                         -- Função utilizando a tabela partida
SELECT COUNT(id) AS qnt_gols FROM gols;                        -- SELECT utilizando a tabela gols
SELECT SUM(qnt_gols_marc) AS qnt_gols FROM classificacao;      -- SELECT utilizando a tabela classificacao

-- DROP


-- DROP FUNCTION obter_nome_clube;
-- DROP FUNCTION obter_nome_estadio;
-- DROP FUNCTION obter_qnt_vitorias_como_mandante;
-- DROP FUNCTION obter_qnt_vitorias_como_visitante;
-- DROP FUNCTION obter_qnt_derrotas_como_mandante;
-- DROP FUNCTION obter_qnt_derrotas_como_visitante;
-- DROP FUNCTION obter_gols_rodada; 
-- DROP FUNCTION obter_qnt_partidas_rodada;
-- DROP FUNCTION obter_media_gols_partida_rodada;
-- DROP FUNCTION obter_media_publico_partida;
-- DROP FUNCTION obter_media_publico_partida_rodada;
-- DROP FUNCTION obter_total_publico;
-- DROP FUNCTION obter_total_gols;
-- DROP FUNCTION obter_media_gols_partida;
-- DROP FUNCTION obter_qnt_cartoes_amarelos;
-- DROP FUNCTION obter_qnt_cartoes_vermelhos;
-- DROP FUNCTION obter_media_cartoes_amarelos_partida;
-- DROP FUNCTION obter_media_cartoes_vermelhos_partida;
-- DROP FUNCTION obter_qnt_gols_tipo;
-- DROP FUNCTION obter_qnt_gols_no_tempo;