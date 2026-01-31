macro_command main()

short qtd
short idx
short zonas
short zonas_fix
short stride
short i
short j
short base
short dest
short valor
short zero

zero      = 0
qtd       = 0
idx       = 0
zonas     = 0
zonas_fix = 0
stride    = 0
valor     = 0
base      = 0
dest      = 0

// ===============================
// QUANTIDADE DE RECEITAS
// ===============================
GetData(qtd, "Local HMI", LW, 51, 1)

// ===============================
// CONTROLE ESTRUTURAL DO RW10
// ===============================
GetData(zonas, "Local HMI", RW, 10, 1)
GetData(zonas_fix, "Local HMI", LW, 11, 1)

if qtd == 0 then
    // banco vazio → permite alterar
    SetData(zonas, "Local HMI", LW, 11, 1)
else
    // banco existente → trava RW10
    SetData(zonas_fix, "Local HMI", RW, 10, 1)
    zonas = zonas_fix
end if

// ===============================
// STRIDE = 10 (nome) + zonas
// ===============================
stride = 10 + zonas

// ===============================
// LIMPA LISTA FIXA DE NOMES
// (15 receitas × 10 words)
// ===============================
for i = 0 to 149
    SetData(zero, "Local HMI", LW, 300 + i, 1)
next i

// ===============================
// LIMPA NOME ATIVO
// ===============================
for i = 0 to 9
    SetData(zero, "Local HMI", LW, 80 + i, 1)
next i

if qtd > 0 then

    // ===============================
    // COPIA NOMES PARA LISTA FIXA
    // ===============================
    for i = 1 to qtd

        base = 1000 + ((i - 1) * stride)
        dest = 300  + ((i - 1) * 10)

        for j = 0 to 9
            valor = 0
            GetData(valor, "Local HMI", RW, base + j, 1)
            SetData(valor, "Local HMI", LW, dest + j, 1)
        next j

    next i

    // ===============================
    // NOME ATIVO (BASEADO EM LW52)
    // ===============================
    GetData(idx, "Local HMI", LW, 52, 1)

    if idx >= 1 and idx <= qtd then

        base = 1000 + ((idx - 1) * stride)

        for j = 0 to 9
            valor = 0
            GetData(valor, "Local HMI", RW, base + j, 1)
            SetData(valor, "Local HMI", LW, 80 + j, 1)
        next j

    end if

end if

end macro_command
