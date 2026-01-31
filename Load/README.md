# 📋 Macro Principal – Gestão Estrutural de Receitas

---

## 📌 Descrição Geral

Esta macro é responsável pela **gestão estrutural do banco de receitas**, atuando como elemento central de organização e sincronização do sistema.

Executada continuamente como **`macro_command main`**, ela garante que a **estrutura do banco**, a **lista de receitas** e o **nome ativo** permaneçam sempre coerentes com o estado real dos dados armazenados.

Suas responsabilidades incluem:

* 📐 Controle fixo da quantidade de zonas por receita
* 📋 Montagem e manutenção da lista fixa de nomes
* ⭐ Atualização do nome da receita ativa conforme o índice selecionado
* 🔒 Proteção estrutural do banco após a primeira gravação

---

## 📊 Leitura Inicial – Quantidade de Receitas

A macro inicia avaliando a **quantidade total de receitas cadastradas** no banco.

Esse valor define o comportamento estrutural da rotina:

* 📂 **Banco vazio** → Estrutura liberada para configuração
* 🔐 **Banco existente** → Estrutura travada e protegida

Essa lógica impede alterações estruturais após o início do uso operacional do banco.

---

## 🔒 Controle Estrutural das Zonas (`RW10`)

O número de zonas por receita é tratado como **parâmetro estrutural crítico**:

* Se **não existir nenhuma receita**, o operador pode definir livremente a quantidade de zonas
* Se **já existir ao menos uma receita**, o valor é automaticamente travado e forçado ao valor fixo original

Esse mecanismo evita **inconsistências estruturais** entre receitas criadas em momentos diferentes.

---

## 📐 Definição do Stride

Cada receita ocupa um **bloco contínuo de memória**, composto por:

* 📝 Nome da receita
* ⚙️ Valores das zonas de processo

Com base nessa estrutura, a macro calcula internamente o **stride da receita**, permitindo:

* Navegação segura no banco
* Cálculo determinístico de offsets
* Acesso direto por índice

---

## 🧹 Limpeza da Lista Fixa de Nomes

Antes de qualquer atualização visual:

* A área de memória destinada à **lista fixa de nomes** é completamente zerada
* Nenhum dado residual de receitas removidas é preservado

Características da lista:

* Suporte para até **15 receitas**
* Cada nome ocupa **10 words**

---

## 🧼 Limpeza do Nome Ativo

O campo responsável por exibir o **nome da receita atualmente selecionada** é limpo antes da atualização.

Essa etapa garante que:

* Nenhum nome inválido seja exibido
* A interface reflita apenas dados válidos do banco

---

## 🧱 Cópia dos Nomes para a Lista Fixa

Quando existir ao menos uma receita cadastrada:

* Os nomes são lidos diretamente do banco principal
* Cada nome é copiado sequencialmente para a lista fixa utilizada pela IHM

Essa etapa assegura que a **interface gráfica reflita fielmente** o conteúdo real do banco de receitas.

---

## ⭐ Definição do Nome Ativo

Após a montagem da lista:

* O índice ativo é lido
* Se o índice for válido, o nome correspondente é copiado para o campo de **nome ativo**
* Caso o índice seja inválido, o campo permanece limpo

Isso mantém a navegação da IHM **sempre coerente com o estado atual do banco**.

---

## ✅ Resultado Final

Ao final da execução contínua, a macro garante:

* 🔒 Estrutura de zonas protegida após a primeira gravação
* 📋 Lista de receitas sempre limpa e atualizada
* ⭐ Nome ativo coerente com o índice selecionado
* 🧱 Banco de receitas estável, previsível e seguro

---

✔️ Macro **silenciosa, determinística e robusta**, projetada para operação contínua e confiável em ambientes industriais de IHM.
