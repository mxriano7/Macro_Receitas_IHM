# 📦 Macro de Receita – IHM Weintek / WEG CMT1106X

---

## 📌 Contexto Geral

Este sistema de **macros de receita** foi desenvolvido para a **IHM Weintek / WEG CMT1106X**, utilizando exclusivamente **`macro_command`** como núcleo de controle do banco de dados de receitas.

A implementação **substitui integralmente as funções nativas de receitas da IHM**, adotando uma abordagem explícita e determinística baseada em memória interna (`RW` e `LW`). O foco é garantir **controle total, previsibilidade operacional e liberdade estrutural**, requisitos essenciais em aplicações industriais críticas.

---

## 🎯 Objetivo da Estrutura de Receita

A estrutura de receitas foi projetada para:

* 📦 Criar um **banco de receitas dinâmico e escalável**
* 💾 Permitir **salvar, carregar, deletar e restaurar receitas**
* 🔢 Operar com **quantidade variável de zonas de processo**
* 🔒 Garantir **persistência em memória retentiva (RW)**
* 🔄 Sincronizar dados entre **IHM, operador e processo**

Toda a lógica permanece **explícita, rastreável e sob total domínio do programador**.

---

## 🧠 Organização do Banco de Receitas

Cada receita possui estrutura fixa e previsível em memória:

* 📝 **10 words** → Nome da receita
* ⚙️ **N words** → Zonas de processo (configurável)
* 📐 **Stride total:** `10 + N`

As receitas são armazenadas sequencialmente a partir de:

```
RW1000
```

Essa abordagem permite:

* 📏 Cálculo matemático direto de endereços
* ⚡ Acesso rápido por índice
* 🔁 Cópias e deslocamentos seguros
* 🧹 Reorganização do banco sem risco de corrupção

---

## 🗂️ Uso de Memória

| Memória | Função                                  |
| ------- | --------------------------------------- |
| `RW`    | Banco principal de receitas (retentivo) |
| `LW`    | Área de trabalho / receita ativa        |

Após reboot ou reinicialização, o sistema executa **restauração completa do banco (`RW → LW`)** por meio de macro dedicada.

---

## 🔄 Papel das Macros

As macros controlam **todo o ciclo de vida das receitas**, sendo cada uma especializada em uma função específica:

### 📥 Salvar

* Validação do nome
* Detecção de duplicidade
* Cálculo automático de offset
* Gravação segura em `RW`

### 📤 Carregar

* Validação do índice selecionado
* Leitura da receita ativa
* Envio apenas dos dados válidos para `LW`

### ❌ Deletar

* Remoção lógica da receita
* Deslocamento das receitas subsequentes
* Limpeza da última posição do banco

### ♻️ Restaurar

* Executada em startup ou comando manual
* Reconstrução completa do banco (`RW → LW`)
* Reset controlado do índice ativo

### 📋 Listagem

* Geração da lista de nomes das receitas
* Sincronização do nome da receita ativa

Cada macro é **atômica, previsível e fácil de depurar**.

---

## ⚙️ Funcionamento Técnico do Macro de Restauração

Fluxo lógico padrão:

1. Leitura da quantidade total de receitas
2. Leitura do número de zonas configuradas
3. Cálculo automático do stride
4. Cálculo do tamanho total do banco
5. Validação da integridade dos dados
6. Restauração ordenada para `LW`
7. Reset seguro do índice ativo

A execução ocorre **somente se o banco for considerado válido**, prevenindo leituras indevidas.

---

## 🚀 Por que Usar Macros em vez de Funções Prontas?

### 🔓 Liberdade Total

As funções nativas de receitas:

* Impõem estruturas fechadas
* Limitam o layout de dados
* Dificultam lógica customizada
* Tornam debug e manutenção opacos

Com macros:

* ✔️ Controle explícito de memória
* ✔️ Estrutura totalmente customizável
* ✔️ Validação antes da gravação
* ✔️ Nenhuma "caixa preta"

---

### 🛠️ Manutenção e Diagnóstico

A abordagem por macro permite:

* Inserção de comentários técnicos claros
* Visualização de variáveis intermediárias
* Diagnóstico direto em campo
* Ajustes de lógica sem retrabalho de telas

Resultado: **menos tempo parado e maior confiabilidade operacional**.

---

### 🔄 Integração com Produção

O sistema facilita:

* Integração direta com PLC, inversores e controladores
* Envio seletivo de parâmetros
* Bloqueio de edição durante produção
* Controle fino de estados operacionais

A receita deixa de ser um recurso gráfico e passa a ser **parte ativa da lógica do processo**.

---

## 🏭 Aplicações Indicadas

* Máquinas com múltiplas configurações de produto
* Processos com zonas independentes
* Ambientes industriais que exigem rastreabilidade
* Projetos onde a IHM atua como elemento lógico

---

## ✅ Resultado Final

Ao adotar este sistema de receitas por macro:

* ✔️ Banco robusto e previsível
* ✔️ Total domínio sobre a memória da IHM
* ✔️ Estrutura escalável e reutilizável
* ✔️ Código legível e auditável
* ✔️ Comportamento industrial real

---

## 🔧 Conclusão

**Macros não são apenas uma alternativa às receitas prontas.**
São a escolha correta quando o projeto exige **controle, segurança e inteligência operacional**.

---

## ✍️ Assinatura Técnica

**Desenvolvimento e Engenharia:**
**Paulo Cesar Euzebio Mariano Filho**

**Cargo:**
Encarregado de Automação Industrial

**Ano:**
2026
