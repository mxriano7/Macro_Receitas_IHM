macro_command main()

short deletar
short idx
short qtd
short zonas
short stride
short i
short j
short base_src
short base_dst
short valor
short zero
short um

zero = 0
um   = 1

deletar = 0
idx     = 0
qtd     = 0
zonas   = 0
stride  = 0
valor   = 0

// ===============================
// GATILHO
// ===============================
GetData(deletar, "Local HMI", LB, 20, 1)

if deletar == um then

    // ===============================
    // LEITURAS PRINCIPAIS
    // ===============================
    GetData(idx,   "Local HMI", LW, 52, 1)
    GetData(qtd,   "Local HMI", LW, 51, 1)
    GetData(zonas, "Local HMI", RW, 10, 1)

    // ===============================
    // STRIDE FIXO DO BANCO
    // ===============================
    stride = 10 + zonas

    if idx >= 1 and idx <= qtd then

        // ===============================
        // MOVE RECEITAS DE CIMA PRA BAIXO
        // ===============================
        for i = idx to qtd - 1

            base_dst = 1000 + ((i - 1) * stride)
            base_src = 1000 + (i * stride)

            for j = 0 to stride - 1
                valor = 0
                GetData(valor, "Local HMI", RW, base_src + j, 1)
                SetData(valor, "Local HMI", RW, base_dst + j, 1)
                SetData(valor, "Local HMI", LW, base_dst + j, 1)
            next j

        next i

        // ===============================
        // ZERA ÚLTIMA RECEITA
        // ===============================
        base_dst = 1000 + ((qtd - 1) * stride)

        for j = 0 to stride - 1
            SetData(zero, "Local HMI", RW, base_dst + j, 1)
            SetData(zero, "Local HMI", LW, base_dst + j, 1)
        next j

        // ===============================
        // ATUALIZA CONTADOR
        // ===============================
        qtd = qtd - 1
        SetData(qtd, "Local HMI", LW, 51, 1)
        SetData(qtd, "Local HMI", RW, 51, 1)

        // ===============================
        // AJUSTA ÍNDICE ATIVO
        // ===============================
        if qtd <= 0 then
            SetData(zero, "Local HMI", LW, 52, 1)
        else
            if idx > qtd then
                SetData(qtd, "Local HMI", LW, 52, 1)
            else
                SetData(idx, "Local HMI", LW, 52, 1)
            end if
        end if

        // ===============================
        // COMMIT
        // ===============================
        SetData(um,   "Local HMI", LB, 9029, 1)
        SetData(zero,"Local HMI", LB, 9029, 1)

    end if

    // ===============================
    // RESET BOTÃO
    // ===============================
    SetData(zero, "Local HMI", LB, 20, 1)

end if

end macro_command
