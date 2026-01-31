
macro_command main()

// =======================================
// LEITURA DAS ZONAS ATUAIS DA REDE MODBUS
// VISOR LW100 → LW120
// =======================================

short valor

valor = 0

// =====================
// 	TEMPERATURAS
// =====================

GetData(valor, "CFW E COEL", 4x, 1#6, 1)
SetData(valor, "Local HMI", LW, 100, 1)

GetData(valor, "CFW E COEL", 4x, 2#6, 1)
SetData(valor, "Local HMI", LW, 101, 1)

GetData(valor, "CFW E COEL", 4x, 3#6, 1)
SetData(valor, "Local HMI", LW, 102, 1)

GetData(valor, "CFW E COEL", 4x, 4#6, 1)
SetData(valor, "Local HMI", LW, 103, 1)

GetData(valor, "CFW E COEL", 4x, 5#6, 1)
SetData(valor, "Local HMI", LW, 104, 1)

GetData(valor, "CFW E COEL", 4x, 6#6, 1)
SetData(valor, "Local HMI", LW, 105, 1)

GetData(valor, "CFW E COEL", 4x, 7#6, 1)
SetData(valor, "Local HMI", LW, 106, 1)

GetData(valor, "CFW E COEL", 4x, 8#6, 1)
SetData(valor, "Local HMI", LW, 107, 1)

GetData(valor, "CFW E COEL", 4x, 9#6, 1)
SetData(valor, "Local HMI", LW, 108, 1)

GetData(valor, "CFW E COEL", 4x, 10#6, 1)
SetData(valor, "Local HMI", LW, 109, 1)

GetData(valor, "CFW E COEL", 4x, 11#6, 1)
SetData(valor, "Local HMI", LW, 110, 1)

GetData(valor, "CFW E COEL", 4x, 12#6, 1)
SetData(valor, "Local HMI", LW, 111, 1)

GetData(valor, "CFW E COEL", 4x, 13#6, 1)
SetData(valor, "Local HMI", LW, 112, 1)

GetData(valor, "CFW E COEL", 4x, 14#6, 1)
SetData(valor, "Local HMI", LW, 113, 1)

GetData(valor, "CFW E COEL", 4x, 15#6, 1)
SetData(valor, "Local HMI", LW, 114, 1)

GetData(valor, "CFW E COEL", 4x, 16#6, 1)
SetData(valor, "Local HMI", LW, 115, 1)

GetData(valor, "CFW E COEL", 4x, 17#6, 1)
SetData(valor, "Local HMI", LW, 116, 1)

// =====================
// 	RPM / PRESSÃO
// =====================

// Pressão → 18#6
GetData(valor, "CFW E COEL", 4x, 18#6, 1)
SetData(valor, "Local HMI", LW, 117, 1)

// Extrusora → 20#2
GetData(valor, "CFW E COEL", 4x, 20#2, 1)
SetData(valor, "Local HMI", LW, 118, 1)

// Puxador → 22#2
GetData(valor, "CFW E COEL", 4x, 22#2, 1)
SetData(valor, "Local HMI", LW, 119, 1)

// Calandra → 23#2
GetData(valor, "CFW E COEL", 4x, 23#2, 1)
SetData(valor, "Local HMI", LW, 120, 1)

end macro_command