# 🔌 Macro de Leitura Modbus – HMI

---

## 📌 Descrição Geral

Esta macro é responsável pela **leitura de variáveis de processo via protocolo Modbus** a partir de equipamentos **CFW e COEL**, transferindo os dados para a **memória local da IHM (Local HMI)**.

Os valores lidos passam a estar disponíveis para uso em **telas de supervisão, alarmes, históricos e lógica interna**, garantindo integração direta entre comunicação de campo e aplicação HMI.

A comunicação utiliza **registradores Holding (4x)**, com armazenamento sequencial em **registradores do tipo `LW` (Local Word)**.

---

## ⚙️ Funcionamento da Macro

A macro opera de forma cíclica e estruturada:

* Utiliza variável temporária **`valor`** do tipo `short`
* O comando **`GetData`** realiza a leitura dos registradores Modbus
* O comando **`SetData`** grava os valores lidos na memória local da IHM
* Os dados são armazenados sequencialmente no intervalo:

```
LW100 a LW120
```

Essa abordagem garante **padronização de endereços**, simplicidade de manutenção e fácil expansão futura.

---

## 🌡️ Leitura de Temperaturas

A macro realiza a leitura de **17 zonas de temperatura**, conforme o mapeamento abaixo:

| Zona | Endereço Modbus | Registrador HMI |
| ---- | --------------- | --------------- |
| T01  | 1#6             | LW100           |
| T02  | 2#6             | LW101           |
| T03  | 3#6             | LW102           |
| T04  | 4#6             | LW103           |
| T05  | 5#6             | LW104           |
| T06  | 6#6             | LW105           |
| T07  | 7#6             | LW106           |
| T08  | 8#6             | LW107           |
| T09  | 9#6             | LW108           |
| T10  | 10#6            | LW109           |
| T11  | 11#6            | LW110           |
| T12  | 12#6            | LW111           |
| T13  | 13#6            | LW112           |
| T14  | 14#6            | LW113           |
| T15  | 15#6            | LW114           |
| T16  | 16#6            | LW115           |
| T17  | 17#6            | LW116           |

---

## 🔄 Leitura de RPM e Pressão

Além das temperaturas, a macro realiza a leitura de variáveis adicionais de processo:

| Variável      | Endereço Modbus | Registrador HMI |
| ------------- | --------------- | --------------- |
| Pressão       | 18#6            | LW117           |
| RPM Extrusora | 20#2            | LW118           |
| RPM Puxador   | 22#2            | LW119           |
| RPM Calandra  | 23#2            | LW120           |

---

## 🎯 Objetivo da Macro

Centralizar a leitura das **variáveis críticas do processo**, assegurando:

* Comunicação confiável via Modbus
* Padronização dos endereços na IHM
* Disponibilidade imediata dos dados para supervisão e lógica
* Facilidade de manutenção, diagnóstico e expansão

---

## 🛠️ Observações Técnicas

* Todos os dados utilizam **registradores Holding (4x)**
* A macro deve ser executada **ciclicamente** para atualização contínua
* Qualquer alteração de endereço Modbus deve ser **documentada neste arquivo**
* Recomenda-se validar tempos de varredura para não impactar a comunicação

---

## ✅ Resultado

✔️ Leitura Modbus centralizada e padronizada
✔️ Dados disponíveis em tempo real na IHM
✔️ Estrutura clara e auditável
✔️ Integração direta com telas, alarmes e históricos
