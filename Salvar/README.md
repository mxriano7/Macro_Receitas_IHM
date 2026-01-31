# 💾 Macro de Salvamento de Receitas – HMI

---

## 📌 Visão Geral

Esta macro é responsável pelo **salvamento, atualização e gerenciamento persistente de receitas de processo** diretamente na IHM, utilizando memória **local (LW)** e **retentiva (RW)**.

A rotina foi projetada para operar de forma **determinística e segura**, suportando até **15 receitas**, cada uma composta por:

* 📝 Nome fixo da receita
* ⚙️ Conjunto variável de zonas de processo

---

## ▶️ Gatilho de Execução

A macro é executada quando o operador aciona o comando de salvamento:

* **LB10 = 1**

Ao término da execução:

* O bit de comando é **automaticamente resetado**

Isso evita reprocessamentos indevidos e garante controle total da operação.

---

## 🧠 Inicialização da Rotina

No início da execução:

* Todas as variáveis internas são inicializadas com valor zero

Esse procedimento assegura:

* Execução limpa
* Ausência de resíduos de ciclos anteriores
* Consistência total no processo de salvamento

---

## 📝 Validação do Nome da Receita

O nome da receita é **obrigatório** para que o salvamento seja permitido.

* Localização: **LW90 a LW99**
* Tamanho fixo: **10 words**

Regra de validação:

* Se **LW90 estiver vazio**, o processo é abortado
* Nenhuma gravação é realizada

Isso impede a criação de receitas inválidas ou anônimas.

---

## 📊 Registradores de Controle

A macro utiliza os seguintes parâmetros estruturais:

* **LW11** → Quantidade de zonas da receita
* **LW51** → Quantidade total de receitas armazenadas
* **LW52** → Índice da receita ativa

Esses registradores garantem sincronização entre interface, banco e lógica de processo.

---

## 🧱 Organização do Banco de Receitas

As receitas são armazenadas de forma **sequencial e contínua** em uma área fixa de memória:

1. Nome da receita (10 words)
2. Valores das zonas de processo

Essa estrutura facilita:

* Navegação matemática pelo banco
* Manutenção em campo
* Expansão futura sem reescrita de lógica

---

## 🔍 Verificação de Duplicidade

Antes de gravar uma nova receita, a macro:

* Compara o nome informado com os nomes já existentes
* Avalia correspondência completa dos 10 words

Comportamento:

* Nome existente → **sobrescrita da receita**
* Nome inexistente → busca por posição livre

Esse controle evita duplicidades e mantém o banco organizado.

---

## 📂 Busca por Espaço Livre

Caso o nome não exista:

* A macro percorre o banco em busca da **primeira posição livre**
* O limite máximo é de **15 receitas**

Uma posição é considerada livre quando não contém dados válidos gravados.

---

## 💾 Processo de Salvamento

Durante o salvamento:

* Nome da receita e zonas são copiados para **LW**
* Os mesmos dados são gravados em **RW**

Isso garante:

* Persistência após reboot
* Sincronização entre memória local e retentiva
* Integridade total dos dados

---

## ⭐ Definição da Receita Ativa

Após o salvamento bem-sucedido:

* A receita gravada passa a ser definida como **receita ativa**
* O índice correspondente é atualizado em **LW52**

Isso permite uso imediato da receita no processo.

---

## 🔒 Commit em Memória Retentiva

Ao final da gravação:

* A macro executa o comando de **commit da memória retentiva**

Esse passo assegura que todas as alterações sejam efetivamente preservadas.

---

## 🔄 Finalização

Ao concluir a execução:

* O comando **LB10** é resetado automaticamente
* A macro retorna ao estado de espera

---

## ✅ Resultado Final

Após a execução da macro:

* 💾 Receita salva ou atualizada com segurança
* 📊 Banco organizado e consistente
* 🔒 Dados preservados em memória retentiva
* ⚙️ Receita pronta para uso imediato

---

✔️ Macro robusta, previsível e adequada a aplicações industriais que exigem controle total sobre receitas.
