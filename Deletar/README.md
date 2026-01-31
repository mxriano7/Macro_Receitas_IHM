# 🗑️ Macro de Exclusão de Receitas – HMI

---

## 📌 Descrição

Esta macro é responsável pela **exclusão de receitas armazenadas na IHM**, garantindo a **reorganização automática do banco de dados** após a remoção.

Ao deletar uma receita, as receitas subsequentes são deslocadas, o banco é compactado e os índices são atualizados de forma **determinística e segura**, preservando a integridade da memória local (`LW`) e retentiva (`RW`).

---

## ▶️ Acionamento

A execução ocorre mediante comando do operador:

* **LB20 = 1** → Solicitação de exclusão de receita

Ao final da rotina, o comando é **automaticamente resetado**, evitando reexecuções indevidas.

---

## 🧠 Inicialização

No início da execução, todas as variáveis internas são **explicitamente inicializadas**, garantindo:

* Estado limpo de execução
* Isolamento entre ciclos de macro
* Prevenção de interferência de execuções anteriores

---

## 📊 Leituras de Controle

Registradores utilizados pela macro:

* **LW52** → Índice da receita selecionada
* **LW51** → Quantidade total de receitas armazenadas
* **RW10** → Quantidade de zonas por receita

A exclusão **somente é executada** se:

* Existir ao menos uma receita no banco
* O índice selecionado estiver dentro do intervalo válido

---

## 🧱 Organização do Banco de Receitas

As receitas são armazenadas de forma **sequencial e contínua** em memória, sendo cada uma composta por:

* 📝 Nome da receita
* ⚙️ Valores das zonas de processo

Essa organização permite **compactação automática** do banco após a exclusão, sem geração de lacunas.

---

## 🔄 Reorganização do Banco

Quando uma receita é excluída:

* Todas as receitas posicionadas acima são deslocadas **uma posição para baixo**
* A ordem lógica do banco é preservada
* Os dados são copiados simultaneamente para `RW` e `LW`

Esse procedimento garante **sincronização completa** entre memória local e retentiva.

---

## 🧹 Limpeza da Última Posição

Após o deslocamento das receitas:

* A última posição do banco é **explicitamente zerada**
* Nenhum dado residual permanece armazenado

Essa etapa evita inconsistências e leituras indevidas futuras.

---

## 🔢 Atualização do Contador de Receitas

Com a exclusão concluída:

* O total de receitas armazenadas é **decrementado**
* Os registradores de quantidade são atualizados em `LW` e `RW`

O banco permanece coerente com o novo estado de dados.

---

## ⭐ Ajuste do Índice Ativo

Após a exclusão, o índice da receita ativa é ajustado automaticamente:

* Se não restarem receitas, o índice ativo é zerado
* Se o índice excluído for maior que o novo total, o último índice válido passa a ser o ativo
* Caso contrário, o índice selecionado é mantido

Esse ajuste garante que **nenhum índice inválido permaneça ativo**.

---

## 🔒 Commit da Memória Retentiva

Para garantir a persistência das alterações, a macro executa um **pulso de commit na memória retentiva**, assegurando que todas as modificações sejam gravadas de forma definitiva.

---

## 🔄 Finalização

Ao final da execução:

* O comando **LB20** é resetado automaticamente
* A macro retorna ao estado de espera
* O sistema permanece pronto para nova solicitação do operador

---

## ✅ Resultado

✔️ Exclusão de receitas **segura e determinística**
✔️ Banco de dados compactado e organizado
✔️ Índices sempre válidos e consistentes
✔️ Integração direta com a lógica operacional da máquina
