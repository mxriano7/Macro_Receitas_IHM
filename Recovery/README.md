# ♻️ Macro Principal – Restauração do Banco de Receitas

---

## 📌 Visão Geral

Esta **macro principal (`macro_command main`)** é responsável por **restaurar integralmente o banco de receitas** da memória **retentiva (RW)** para a **memória local de trabalho (LW)** da IHM.

Ela é executada tipicamente em **startup** ou em cenários de reinicialização controlada, garantindo que o sistema volte a um estado **coerente, íntegro e previsível**.

---

## 🎯 Objetivo da Macro

A rotina foi projetada para:

* ♻️ Reativar o banco completo de receitas após reboot
* 🔄 Sincronizar RW → LW de forma segura
* 📐 Respeitar apenas o espaço real ocupado pelo banco
* 🚫 Evitar qualquer seleção automática de receita

O resultado é uma **inicialização limpa e determinística** do sistema de receitas.

---

## 📊 Leitura da Quantidade de Receitas

A macro inicia recuperando a quantidade total de receitas armazenadas:

* **RW51** → Quantidade de receitas (memória retentiva)
* **LW51** → Espelho da quantidade na memória local

Essa informação define se o processo de restauração será executado.

* Banco vazio → nenhuma restauração ocorre
* Banco existente → restauração completa é iniciada

---

## 🔒 Condição de Execução

Toda a lógica de restauração **somente é executada se existir ao menos uma receita válida** no banco.

Isso impede:

* Leituras indevidas
* Cópias de áreas não utilizadas
* Escritas desnecessárias em LW

---

## ⚙️ Leitura Estrutural das Zonas

Com banco válido, a macro lê:

* **RW10** → Quantidade de zonas por receita

Esse valor é tratado como **parâmetro estrutural**, garantindo que toda a restauração respeite exatamente a configuração vigente do sistema.

---

## 📐 Cálculo do Stride

Cada receita ocupa um bloco fixo de memória composto por:

* 📝 **10 words** → Nome da receita
* ⚙️ **N words** → Zonas de processo

O **stride** é calculado como:

* `stride = 10 + zonas`

Esse valor permite navegação segura e previsível dentro do banco.

---

## 📦 Cálculo do Espaço Real do Banco

O tamanho total do banco é calculado dinamicamente:

* `total = quantidade_de_receitas × stride`

Com isso, a macro percorre **somente o espaço real ocupado pelo banco**, eliminando qualquer risco de overflow ou acesso fora de faixa.

---

## 🔁 Restauração RW → LW

A restauração é realizada por cópia sequencial:

* **Origem:** `RW1000 + offset`
* **Destino:** `LW1000 + offset`

Características do processo:

* Cópia **word a word**
* Preserva nomes e valores de zonas
* Mantém exatamente a estrutura original

Essa etapa **reativa completamente o banco na memória de trabalho** da IHM.

---

## 🚫 Reset do Índice Ativo

Ao final da execução:

* **LW52 (índice ativo)** é zerado
* Nenhuma receita permanece selecionada automaticamente

Isso garante:

* Prevenção de carregamentos acidentais
* Produção apenas sob comando explícito
* Decisão de contexto delegada a outras macros

---

## ✅ Resultado Final

Após a execução da macro:

* ♻️ Banco de receitas restaurado com segurança
* 📊 Quantidade de receitas sincronizada (RW ↔ LW)
* 📐 Estrutura de zonas preservada
* 🧠 Sistema pronto para seleção manual ou automática

---

✔️ Macro silenciosa, determinística e essencial para uma inicialização confiável do sistema de receitas.
