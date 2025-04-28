-- Calendário com o dia da semana em português

dCalendario =
ADDCOLUMNS(
    CALENDAR(DATE(2024, 9, 7), MAX(fDados_Curva[Atributo])),
    "Número da Semana", CONCATENATE(YEAR([Date]), CONCATENATE(" Sem-", WEEKNUM([Date], 16))),
    "Dia da Semana", FORMAT([Date], "dddd"),
    "Mes", FORMAT([Date], "MMMM"),
    "Ano", YEAR([Date]),
    "Ano e Mês", CONCATENATE(YEAR([Date]), CONCATENATE(" ", FORMAT([Date], "MMMM"))),
    "Semana", CONCATENATE("SEM-", WEEKNUM([Date], 16)),
    "Numero Semana", WEEKNUM([Date], 16),
    "Mês Ano", CONCATENATE(YEAR([Date]), CONCATENATE("-", FORMAT([Date], "MMM")))
)

-- Medida com icones de status

medidasStatusIcon =
ADDCOLUMNS(
    dCalendario,
    "Status",
    SWITCH(
        TRUE(),
        [Date] < TODAY(), "✔️",
        [Date] = TODAY(), "⏳",
        [Date] > TODAY(), "❌"
    )
)    

medidasStatusIcon =
VAR DATA_DURAÇÃO= MAX(fDados_Curva[Atributo]) - MIN(fDados_Curva[Atributo])
VAR PERCENTUAL= FORMAT(DATA_DURAÇÃO, "#%")
RETURN IF(
    DATA_DURAÇÃO < 30, "❌",
    IF(
        DATA_DURAÇÃO = 30, "✔️",
        IF(
            DATA_DURAÇÃO > 30, "⏳",
            BLANK()
        )
    )
)    

# symbl.cc tem mais opções para esolher setas


Dias Uteis =
NETWORDAYS(
    SELECTEDVALUE(dCalendario[Date]), -- data inicial
    SELECTEDVALUE(dCalendario[Date]), -- data final
    1, -- 1 = domingo é o primeiro dia da semana
    FERIADOS -- lista de feriados
)
--OBS: 1 = domingo é o primeiro dia da semana
--OBS: 2 = segunda é o primeiro dia da semana
--OBS: 11 = segunda é o primeiro dia da semana
--OBS: 12 = terça é o primeiro dia da semana
--OBS: 13 = quarta é o primeiro dia da semana
--OBS: 14 = quinta é o primeiro dia da semana
--OBS: 15 = sexta é o primeiro dia da semana
--OBS: 16 = sábado é o primeiro dia da semana

Função para tratar dados em branco
TratarDadosEmBranco =
    COALESCE(
        [Vendedor], 
        [Canal de Vendas]
)

-- OBS: COALESCE retorna o primeiro valor não nulo de uma lista de valores.
-- OBS: COALESCE é útil para tratar dados em branco ou nulos em colunas ou medidas.

