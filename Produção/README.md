# ⚙️ Macro Principal – Envio de Produção ao COEL

---

## 📌 Visão Geral

Esta macro é responsável por **enviar os valores das zonas ativas da IHM** para o equipamento **CFW / COEL**, colocando o sistema efetivamente em **modo de produção**.

Ela é acionada de forma **pontual**, por gatilho, a partir do **botão PRODUÇÃO** da IHM, com reset automático ao final da execução.

---

## ▶️ Gatilho de Execução – Botão PRODUÇÃO

A execução da macro ocorre exclusivamente quando:

* Um **bit de botão** associado ao comando PRODUÇÃO é ativado
* A macro detecta o estado ativo do comando

Após a conclusão do envio:

* O bit de comando é **automaticamente resetado**

Esse comportamento garante:

* Prevenção de reenvios acidentais
* Controle preciso do momento de entrada em produção
* Execução determinística da rotina

---

## 🔄 Transferência das Zonas para o COEL

Os valores configurados na IHM são enviados diretamente ao equipamento de campo conforme mapeamento fixo:

### Origem – IHM

* Zonas ativas armazenadas em **LW200 até LW217**

### Destino – COEL

* Registradores **1#6 até 18#6**

Cada zona é tratada individualmente, garantindo:

* 📐 Correspondência direta entre origem e destino
* 🔢 Ordem correta de escrita
* 🔒 Total compatibilidade com o protocolo e o equipamento

---

## 🧠 Estrutura de Escrita

Para cada zona configurada, a macro executa a seguinte sequência lógica:

1. Leitura do valor da zona ativa na IHM
2. Escrita do valor no registrador correspondente do COEL
3. Avanço para a próxima zona

Esse modelo de escrita sequencial facilita:

* Diagnóstico em campo
* Validação de comunicação
* Manutenção futura do sistema

---

## 🟢 Indicação de Produção Online

Após o envio bem-sucedido de todas as zonas:

* Um **indicador interno de “Produção Online”** é ativado
* A IHM passa a refletir o estado ativo de produção

Esse sinal pode ser utilizado para:

* 🔒 Bloqueio de edição de parâmetros
* 👁️ Feedback visual ao operador
* 🔗 Intertravamentos lógicos do processo

---

## 🔁 Reset Automático

Ao final da execução da macro:

* O comando do botão PRODUÇÃO é resetado
* Nenhum estado transitório permanece ativo

Isso assegura:

* Execução limpa
* Ausência de retriggers involuntários
* Comportamento previsível da rotina

---

## ✅ Resultado Final

Com a macro concluída:

* ⚙️ Todas as zonas são corretamente enviadas ao COEL
* 🏭 O sistema entra em modo de produção
* 🖥️ A IHM permanece sincronizada com o estado real do processo

---

✔️ Macro direta, segura e orientada à operação industrial contínua.
