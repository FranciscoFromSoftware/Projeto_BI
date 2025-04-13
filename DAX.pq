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

