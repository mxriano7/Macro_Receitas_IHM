macro_command main()

short salvar
short qtd
short zonas
short stride
short achou
short posLivre
short i
short j
short base
short v1
short v2
short igual
short zero
short um
short valor

zero = 0
um   = 1

salvar   = 0
qtd      = 0
zonas    = 0
stride   = 0
achou    = 0
posLivre = 0
valor    = 0

// ===============================
// GATILHO SALVAR
// ===============================
GetData(salvar, "Local HMI", LB, 10, 1)

if salvar == um then

    // ===============================
    // VALIDA NOME (OBRIGATÓRIO)
    // ===============================
    GetData(valor, "Local HMI", LW, 90, 1)

    if valor <> zero then

        // ===============================
        // QUANTIDADE DE RECEITAS
        // ===============================
        GetData(qtd, "Local HMI", LW, 51, 1)

        // ===============================
        // ESTRUTURA FIXA (SEMPRE)
        // ===============================
        GetData(zonas, "Local HMI", LW, 11, 1)

        // ===============================
        // STRIDE = 10 (nome) + zonas
        // ===============================
        stride = 10 + zonas

        if qtd < 15 then

            achou = 0
            posLivre = 0

            // ===============================
            // VERIFICA SE NOME JÁ EXISTE
            // ===============================
            for i = 1 to qtd

                if achou == 0 then

                    base = 1000 + ((i - 1) * stride)
                    igual = 1

                    for j = 0 to 9
                        v1 = 0
                        v2 = 0
                        GetData(v1, "Local HMI", LW, 90 + j, 1)
                        GetData(v2, "Local HMI", RW, base + j, 1)

                        if v1 <> v2 then
                            igual = 0
                        end if
                    next j

                    if igual == 1 then
                        achou = 1
                        posLivre = i
                    end if

                end if

            next i

            // ===============================
            // PROCURA POSIÇÃO LIVRE
            // ===============================
            if achou == 0 then

                for i = 1 to 15
                    valor = 0
                    GetData(valor, "Local HMI", RW, 1000 + ((i - 1) * stride), 1)

                    if valor == 0 then
                        posLivre = i
                        i = 15
                    end if
                next i

                if posLivre >= 1 and posLivre <= 15 then

                    base = 1000 + ((posLivre - 1) * stride)

                    // -------------------------------
                    // SALVAR NOME
                    // -------------------------------
                    for j = 0 to 9
                        v1 = 0
                        GetData(v1, "Local HMI", LW, 90 + j, 1)
                        SetData(v1, "Local HMI", RW, base + j, 1)
                        SetData(v1, "Local HMI", LW, base + j, 1)
                    next j

                    // -------------------------------
                    // SALVAR ZONAS
                    // -------------------------------
                    for j = 0 to zonas - 1
                        v1 = 0
                        GetData(v1, "Local HMI", LW, 100 + j, 1)
                        SetData(v1, "Local HMI", RW, base + 10 + j, 1)
                        SetData(v1, "Local HMI", LW, base + 10 + j, 1)
                    next j

                    // -------------------------------
                    // ATUALIZA QUANTIDADE
                    // -------------------------------
                    if posLivre > qtd then
                        qtd = posLivre
                        SetData(qtd, "Local HMI", LW, 51, 1)
                        SetData(qtd, "Local HMI", RW, 51, 1)
                    end if

                end if

            end if

            // ===============================
            // DEFINE ÍNDICE ATIVO
            // ===============================
            if posLivre >= 1 and posLivre <= 15 then
                SetData(posLivre, "Local HMI", LW, 52, 1)
            end if

        end if

        // ===============================
        // COMMIT RW
        // ===============================
        SetData(um,   "Local HMI", LB, 9029, 1)
        SetData(zero,"Local HMI", LB, 9029, 1)

    end if

    // ===============================
    // RESET BOTÃO SALVAR (SEMPRE)
    // ===============================
    SetData(zero, "Local HMI", LB, 10, 1)

end if

end macro_command
