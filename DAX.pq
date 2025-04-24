# Calendário com o dia da semana em português

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

# Medida com icones de status

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