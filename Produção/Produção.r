macro_command main()

// =======================================
// Botão PRODUÇÃO
// =======================================
short cmdProd
cmdProd = 0

GetData(cmdProd, "Local HMI", LB, 25, 1)

if cmdProd == 1 then

    short valor
    valor = 0

    // =======================================
    // Escrita das ZONAS NO COEL
    // LW200~LW217 → 1#6~18#6
    // =======================================

    GetData(valor, "Local HMI", LW, 200, 1)
    SetData(valor, "CFW E COEL", 4x, 1#6, 1)

    GetData(valor, "Local HMI", LW, 201, 1)
    SetData(valor, "CFW E COEL", 4x, 2#6, 1)

    GetData(valor, "Local HMI", LW, 202, 1)
    SetData(valor, "CFW E COEL", 4x, 3#6, 1)

    GetData(valor, "Local HMI", LW, 203, 1)
    SetData(valor, "CFW E COEL", 4x, 4#6, 1)

    GetData(valor, "Local HMI", LW, 204, 1)
    SetData(valor, "CFW E COEL", 4x, 5#6, 1)

    GetData(valor, "Local HMI", LW, 205, 1)
    SetData(valor, "CFW E COEL", 4x, 6#6, 1)

    GetData(valor, "Local HMI", LW, 206, 1)
    SetData(valor, "CFW E COEL", 4x, 7#6, 1)

    GetData(valor, "Local HMI", LW, 207, 1)
    SetData(valor, "CFW E COEL", 4x, 8#6, 1)

    GetData(valor, "Local HMI", LW, 208, 1)
    SetData(valor, "CFW E COEL", 4x, 9#6, 1)

    GetData(valor, "Local HMI", LW, 209, 1)
    SetData(valor, "CFW E COEL", 4x, 10#6, 1)

    GetData(valor, "Local HMI", LW, 210, 1)
    SetData(valor, "CFW E COEL", 4x, 11#6, 1)

    GetData(valor, "Local HMI", LW, 211, 1)
    SetData(valor, "CFW E COEL", 4x, 12#6, 1)

    GetData(valor, "Local HMI", LW, 212, 1)
    SetData(valor, "CFW E COEL", 4x, 13#6, 1)

    GetData(valor, "Local HMI", LW, 213, 1)
    SetData(valor, "CFW E COEL", 4x, 14#6, 1)

    GetData(valor, "Local HMI", LW, 214, 1)
    SetData(valor, "CFW E COEL", 4x, 15#6, 1)

    GetData(valor, "Local HMI", LW, 215, 1)
    SetData(valor, "CFW E COEL", 4x, 16#6, 1)

    GetData(valor, "Local HMI", LW, 216, 1)
    SetData(valor, "CFW E COEL", 4x, 17#6, 1)

    GetData(valor, "Local HMI", LW, 217, 1)
    SetData(valor, "CFW E COEL", 4x, 18#6, 1)

    // =======================================
    // Ativar indicador "Produção Online"
    // =======================================
    short um
    um = 1
    SetData(um, "Local HMI", LB, 14, 1)

    // =======================================
    // Reset botão PRODUÇÃO
    // =======================================
    short zero
    zero = 0
    SetData(zero, "Local HMI", LB, 25, 1)

end if

end macro_command
