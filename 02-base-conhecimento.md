# 📚 Base de Conhecimento — SecGuard

> **Princípio:** A base de conhecimento é o único oráculo de verdade do SecGuard.
> O que não está aqui, o agente **não responde** — ele admite a limitação.

---

## 1. Visão Geral dos Dados

O SecGuard utiliza **4 arquivos de conhecimento curados**, todos localizados na pasta `data/`. Os dados são **100% mockados e fictícios** — sem informações pessoais reais, sem credenciais, sem dados financeiros sensíveis.

Esta escolha está alinhada ao princípio de **minimização de dados da LGPD (Art. 6º, III)** e ao controle de **LLM02:2025 (Sensitive Information Disclosure)** do OWASP.

| Arquivo | Formato | Conteúdo | Para que serve no SecGuard |
|---|---|---|---|
| `ameacas_comuns.json` | JSON | Catálogo de ameaças cibernéticas | Identificar e explicar ataques |
| `boas_praticas.json` | JSON | Guia de boas práticas de segurança | Recomendar ações de proteção |
| `historico_atendimento.csv` | CSV | Histórico de consultas simuladas | Contextualizar interações recorrentes |
| `perfil_usuario.json` | JSON | Perfil de maturidade de segurança | Personalizar profundidade técnica das respostas |

---

## 2. Detalhamento dos Arquivos

### 📄 `ameacas_comuns.json`

Catálogo estruturado das principais ameaças cibernéticas que afetam usuários comuns e PMEs.

**Estrutura:**
```json
{
  "ameaca_id": "PHI-001",
  "nome": "Phishing por E-mail",
  "categoria": "Engenharia Social",
  "descricao": "...",
  "sinais_de_alerta": ["..."],
  "impacto": "Alto",
  "o_que_fazer": ["..."],
  "o_que_nao_fazer": ["..."],
  "fonte_referencia": "CERT.br"
}
```

**Ameaças catalogadas:**
- Phishing (e-mail, SMS/smishing, voz/vishing)
- Ransomware
- Fraude em PIX e aplicativos bancários
- Engenharia social por telefone
- Ataques a senhas (brute force, credential stuffing)
- Golpe do Falso Suporte Técnico

### 📄 `boas_praticas.json`

Base de recomendações de segurança verificadas e organizadas por domínio.

**Estrutura:**
```json
{
  "pratica_id": "BP-001",
  "titulo": "Autenticação de Dois Fatores (MFA)",
  "dominio": "Controle de Acesso",
  "nivel_dificuldade": "Básico",
  "descricao": "...",
  "como_implementar": ["..."],
  "ferramentas_sugeridas": ["..."],
  "impacto_esperado": "Reduz em 99% o risco de comprometimento de conta",
  "alinhamento_framework": ["NIST CSF", "CIS Controls v8"]
}
```

**Domínios cobertos:**
- Controle de Acesso e Autenticação
- Proteção de Dispositivos
- Segurança em E-mails
- Backup e Recuperação
- Resposta a Incidentes (primeiros passos)
- Privacidade e LGPD para pessoas físicas

### 📄 `historico_atendimento.csv`

Registro de consultas simuladas para contextualizar interações recorrentes de um perfil de usuário fictício.

**Colunas:**
```
data | tipo_consulta | tema | resolucao | satisfacao_usuario
```

**Uso no SecGuard:**
Permite ao agente identificar padrões de dúvidas recorrentes e adaptar o tom da resposta. Por exemplo: se o histórico mostra dúvidas frequentes sobre phishing, o agente pode oferecer conteúdo progressivo em vez de recomeçar do zero.

### 📄 `perfil_usuario.json`

Perfil de maturidade de segurança do usuário — permite personalização das respostas.

**Estrutura:**
```json
{
  "perfil_id": "USR-MOCK-001",
  "nome": "Carlos Fictício",
  "nivel_maturidade": "Iniciante",
  "areas_de_interesse": ["phishing", "senhas", "redes WiFi"],
  "historico_incidentes": ["recebeu e-mail suspeito", "clique em link malicioso"],
  "preferencia_comunicacao": "linguagem_simples"
}
```

---

## 3. Adaptação dos Dados

Os arquivos base foram estruturados especificamente para o **domínio de cibersegurança educacional**. As seguintes adaptações foram feitas em relação ao template original do lab:

| Template Original (Financeiro) | Adaptação SecGuard (Segurança) | Justificativa |
|---|---|---|
| `perfil_investidor.json` | `perfil_usuario.json` | Contexto de maturidade de segurança |
| `produtos_financeiros.json` | `boas_praticas.json` | "Produtos" → práticas e controles de segurança |
| `transacoes.csv` | `historico_atendimento.csv` | Transações → histórico de consultas |
| *(sem equivalente)* | `ameacas_comuns.json` | Adição necessária para o domínio |

---

## 4. Estratégia de Integração

### Como os dados são carregados

Os arquivos são carregados na inicialização da sessão e injetados no contexto do LLM:

```python
import json
import pandas as pd

# Carregamento da base de conhecimento
with open("data/ameacas_comuns.json", encoding="utf-8") as f:
    ameacas = json.load(f)

with open("data/boas_praticas.json", encoding="utf-8") as f:
    boas_praticas = json.load(f)

with open("data/perfil_usuario.json", encoding="utf-8") as f:
    perfil = json.load(f)

historico = pd.read_csv("data/historico_atendimento.csv")
```

### Como os dados são usados no prompt

O contexto é montado de forma **sintética e otimizada** — não injetamos os JSONs brutos (que desperdiçam tokens), mas sim um resumo estruturado:

```
=== CONTEXTO SECGUARD ===

PERFIL DO USUÁRIO:
- Nome: Carlos | Nível: Iniciante | Preferência: linguagem simples
- Histórico: recebeu e-mail suspeito, clicou em link malicioso

AMEAÇAS DISPONÍVEIS NA BASE (para referência):
- PHI-001: Phishing por E-mail (impacto: Alto)
- RAN-001: Ransomware (impacto: Crítico)
- FRP-001: Fraude em PIX (impacto: Alto)
[... outras ameaças ...]

BOAS PRÁTICAS DISPONÍVEIS:
- BP-001: Autenticação de Dois Fatores (MFA) | Nível: Básico
- BP-002: Gerenciador de Senhas | Nível: Básico
[... outras práticas ...]
```

> 💡 **Princípio de otimização de tokens:** Injetamos resumos, não dados brutos. Isso reduz custos de processamento (mesmo em modelos locais) e mantém o contexto limpo e relevante — alinhado à boa prática de **engenharia de prompts eficiente**.

### Duas estratégias de integração possíveis

**Estratégia A — Contexto Estático (implementada neste projeto):**
Todo o contexto é injetado no início da sessão. Simples, adequado para bases de conhecimento pequenas e estáveis.

**Estratégia B — RAG Dinâmico (evolução futura):**
Consulta dinâmica à KB baseada na pergunta do usuário via embeddings. Ideal para bases maiores. Ferramentas: LangChain, ChromaDB, FAISS.

---

## 5. Governança dos Dados

| Critério | Status | Fundamento |
|---|---|---|
| Dados pessoais reais | ❌ Ausentes | LGPD — Minimização de dados |
| Credenciais ou tokens | ❌ Ausentes | OWASP LLM02:2025 |
| Informações sensíveis financeiras | ❌ Ausentes | Fora do escopo do SecGuard |
| Dados verificados por fonte | ✅ Sim (CERT.br, NIST, CIS) | Confiabilidade das respostas |
| Dados atualizáveis sem alterar o código | ✅ Sim | Manutenibilidade da solução |
