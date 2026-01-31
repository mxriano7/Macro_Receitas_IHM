macro_command main()

short carregar
short idx
short qtd
short zonas
short stride
short base
short i
short valor
short zero
short um

carregar = 0
idx = 0
qtd = 0
zonas = 0
stride = 0
base = 0
zero = 0
um = 1
valor = 0

// ===============================
// GATILHO CARREGAR
// ===============================
GetData(carregar, "Local HMI", LB, 15, 1)

if carregar == um then

    // ===============================
    // ÍNDICE E QUANTIDADE
    // ===============================
    GetData(idx, "Local HMI", LW, 52, 1)
    GetData(qtd, "Local HMI", LW, 51, 1)

    // ===============================
    // SOMENTE SE EXISTE BANCO
    // ===============================
    if qtd > 0 then

        // ===============================
        // RW10 (ZONAS) É VÁLIDO
        // ===============================
        GetData(zonas, "Local HMI", RW, 10, 1)

        // ===============================
        // STRIDE = 10 (nome) + zonas
        // ===============================
        stride = 10 + zonas

        if idx >= 1 and idx <= qtd then

            base = 1000 + ((idx - 1) * stride)

            // ===============================
            // VERIFICA SE A RECEITA EXISTE
            // ===============================
            valor = 0
            GetData(valor, "Local HMI", RW, base, 1)

            if valor <> 0 then

                // ===============================
                // CARREGA ZONAS
                // RW → LW200
                // ===============================
                for i = 0 to zonas - 1
                    valor = 0
                    GetData(valor, "Local HMI", RW, base + 10 + i, 1)
                    SetData(valor, "Local HMI", LW, 200 + i, 1)
                next i

            else
                // Receita vazia → limpa zonas
                for i = 0 to zonas - 1
                    SetData(zero, "Local HMI", LW, 200 + i, 1)
                next i
            end if

        else
            // Índice inválido → limpa zonas
            for i = 0 to zonas - 1
                SetData(zero, "Local HMI", LW, 200 + i, 1)
            next i
        end if

    else
        // Sem banco → limpa zonas
        for i = 0 to 31
            SetData(zero, "Local HMI", LW, 200 + i, 1)
        next i
    end if

    // ===============================
    // RESET BOTÃO CARREGAR
    // ===============================
    SetData(zero, "Local HMI", LB, 15, 1)

end if

end macro_command
