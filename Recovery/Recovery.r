macro_command main()

short i
short valor
short qtd
short zonas
short stride
short total
short zero

i      = 0
valor  = 0
qtd    = 0
zonas  = 0
stride = 0
total  = 0
zero   = 0

// ===============================
// RECUPERA QUANTIDADE DE RECEITAS
// ===============================
GetData(qtd, "Local HMI", RW, 51, 1)
SetData(qtd, "Local HMI", LW, 51, 1)

// ===============================
// SOMENTE SE EXISTE BANCO
// ===============================
if qtd > 0 then

    // ===============================
    // QUANTIDADE DE ZONAS
    // RW10 SÓ É VÁLIDO COM BANCO
    // ===============================
    GetData(zonas, "Local HMI", RW, 10, 1)

    // ===============================
    // STRIDE = 10 (nome) + zonas
    // ===============================
    stride = 10 + zonas

    // ===============================
    // TOTAL DE WORDS DO BANCO
    // ===============================
    total = qtd * stride

    // ===============================
    // RESTAURA BANCO RW → LW
    // ===============================
    for i = 0 to total - 1
        valor = 0
        GetData(valor, "Local HMI", RW, 1000 + i, 1)
        SetData(valor, "Local HMI", LW, 1000 + i, 1)
    next i

end if

// ===============================
// ZERA ÍNDICE ATIVO
// macro principal decide depois
// ===============================
SetData(zero, "Local HMI", LW, 52, 1)

end macro_command
