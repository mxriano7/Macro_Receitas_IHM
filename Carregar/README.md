# 📥 Macro de Carregamento de Receitas – HMI

---

## 📌 Descrição

Esta macro é responsável pelo **carregamento de receitas previamente salvas** na memória retentiva da IHM para a **área de trabalho do processo**.

Seu objetivo é disponibilizar os **valores das zonas da receita selecionada** para uso imediato, assegurando **validação de índices, integridade dos dados e limpeza automática** em condições inválidas.

---

## ▶️ Acionamento

A macro é executada mediante comando do operador:

* **LB15 = 1** → Solicitação de carregamento de receita

Ao término da execução, o comando é **automaticamente resetado**, evitando reexecuções indevidas.

---

## 🧠 Inicialização

No início da execução, todas as variáveis internas são **explicitamente inicializadas**, garantindo:

* Estado limpo de execução
* Isolamento entre ciclos de macro
* Prevenção de resíduos de execuções anteriores

---

## 📊 Controle de Índice e Quantidade

Registradores utilizados:

* **LW52** → Índice da receita selecionada
* **LW51** → Quantidade total de receitas armazenadas

O carregamento **somente é permitido** quando existe ao menos **uma receita válida** no banco.

---

## 🧱 Estrutura das Receitas

Cada receita armazenada possui estrutura fixa e previsível:

* 📝 Nome da receita
* ⚙️ Valores das zonas de processo

A quantidade de zonas é obtida dinamicamente a partir do registrador:

* **RW10** → Número de zonas configuradas

Isso garante que o carregamento esteja sempre alinhado à configuração atual do sistema.

---

## 🔍 Validações Executadas

Antes da transferência de dados, a macro executa as seguintes validações:

* Verificação do índice selecionado (limites inferior e superior)
* Confirmação da existência da receita na posição indicada

Caso qualquer validação falhe, o carregamento é abortado de forma segura.

---

## 📥 Carregamento das Zonas

Quando a receita é considerada válida:

* Os valores das zonas são lidos da memória retentiva (`RW`)
* Os dados são copiados para a área de trabalho da IHM (`LW`)

### 📍 Área de Destino

* **LW200 em diante** → Zonas ativas da receita carregada

Essa área passa a representar os **parâmetros ativos de processo**.

---

## 🧹 Limpeza Automática de Segurança

A macro executa limpeza automática das zonas nas seguintes condições:

* Não existem receitas armazenadas
* O índice selecionado é inválido
* A receita selecionada está vazia ou inconsistente

Nessas situações:

* Os registradores de saída são preenchidos com **zero**
* Nenhum valor residual é aplicado ao processo

---

## 🔄 Finalização

Após a execução:

* O comando **LB15** é resetado automaticamente
* A macro retorna ao estado de espera
* O sistema permanece pronto para nova solicitação do operador

---

## ✅ Resultado

✔️ Carregamento de receitas **seguro e determinístico**
✔️ Aplicação apenas de dados válidos ao processo
✔️ Proteção contra estados inválidos ou inconsistentes
✔️ Integração limpa com a lógica operacional da máquina
