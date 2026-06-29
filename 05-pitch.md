# 🎤 Pitch — SecGuard

> **Duração:** 3 minutos | **Formato:** Elevador / Demo Day
> **Estrutura:** Problema → Solução → Diferencial → Impacto

---

## Roteiro do Pitch (Cronometrado)

---

### ⏱️ 0:00 — 0:30 | ABERTURA COM O PROBLEMA

> *"Em 2024, o Brasil registrou mais de 60 bilhões de tentativas de ataques cibernéticos.
> Sessenta. Bilhões.*
>
> *Mas sabe qual foi a causa número 1 de incidentes bem-sucedidos?
> Não foi a falta de firewall. Não foi código malicioso sofisticado.*
>
> *Foi uma pessoa que clicou em um e-mail falso porque não sabia que era falso.*
>
> *O elo mais fraco da segurança digital é a informação — ou a falta dela."*

---

### ⏱️ 0:30 — 1:15 | A SOLUÇÃO

> *"Apresento o SecGuard — um assistente virtual inteligente especializado em cibersegurança,
> projetado para ser o guardião digital de quem não tem um time de segurança por trás.*
>
> *Você pode perguntar: 'Esse e-mail que recebi é phishing?' — e o SecGuard explica como
> identificar, o que fazer e o que evitar.*
>
> *Você pode perguntar: 'Fui invadido agora. O que faço?' — e o SecGuard entrega um plano
> de resposta imediata, claro e acionável.*
>
> *Ele conversa. Ele orienta. Ele educa. Sem jargões desnecessários.
> Com base apenas em informações verificadas — nunca inventa."*

---

### ⏱️ 1:15 — 2:00 | O DIFERENCIAL TÉCNICO

> *"Agora, por que o SecGuard é diferente de qualquer chatbot de IA que você já usou?*
>
> *Porque segurança não é só funcionalidade — é responsabilidade.*
>
> *O SecGuard foi construído seguindo o OWASP Top 10 para Aplicações LLM, o principal
> framework global de segurança para sistemas de IA.*
>
> *Isso significa que ele:*
> - *Resiste a tentativas de manipulação — testamos 9 tipos de ataque de prompt injection.
>   Resistência: 100%.*
> - *Nunca inventa informações técnicas — se não sabe, diz que não sabe.*
> - *Roda localmente — seus dados não saem da sua máquina.*
> - *Tem escopo restrito — não tenta ser tudo para todos.*
>
> *Um agente inseguro de segurança seria a pior ironia possível. O SecGuard não comete esse erro."*

---

### ⏱️ 2:00 — 2:40 | O IMPACTO

> *"Quem se beneficia do SecGuard?*
>
> *O colaborador que recebe um e-mail suspeito às 18h, depois do horário do TI.*
> *O dono da padaria que não tem CTO, mas tem dados dos seus clientes para proteger.*
> *O estudante de TI que quer aprender segurança com exemplos reais, não só teoria.*
>
> *O SecGuard não substitui especialistas em incidentes críticos — ele é o primeiro escudo.
> A diferença entre clicar e não clicar. Entre responder e não responder.*
>
> *E no mundo digital, essa diferença vale tudo."*

---

### ⏱️ 2:40 — 3:00 | FECHAMENTO COM CHAMADA PARA AÇÃO

> *"O SecGuard está disponível hoje, de graça, sem cadastro, sem enviar seus dados para
> nenhuma nuvem. É um protótipo, mas é um protótipo seguro.*
>
> *Porque se há uma coisa que aprendi construindo esse projeto, é que*
> ***segurança começa com informação — e informação precisa ser acessível.***
>
> *Obrigado."*

---

## Slides de Apoio (estrutura sugerida)

| Slide # | Título | Conteúdo Principal |
|---|---|---|
| 1 | Capa | Logo SecGuard + Tagline: *"Seu guardião digital"* |
| 2 | O Problema | Estatística: 60bi ataques + gráfico de vetores humanos |
| 3 | A Solução | Print da interface + 3 frases do que o agente faz |
| 4 | Arquitetura | Diagrama Mermaid simplificado (usuário → SecGuard → KB) |
| 5 | Diferenciais de Segurança | Tabela OWASP LLM Top 10 → Controles implementados |
| 6 | Resultados | Dashboard de métricas (todas as metas atingidas) |
| 7 | Impacto | Personas + números de público impactável |
| 8 | Próximos Passos | 3 melhorias prioritárias identificadas |
| 9 | Fechamento | QR Code para o repositório + frase de impacto |

---

## Perguntas e Respostas Preparadas

**"Por que usar LLM local e não uma API como o ChatGPT?"**
> Porque um assistente de segurança que envia suas perguntas para servidores externos cria exatamente o tipo de risco que deveria evitar. Dados do usuário ficam localmente — isso é um princípio de segurança, não uma limitação técnica.

**"Como garantir que o agente não vai dar orientações erradas?"**
> Duas camadas: (1) o agente só responde com base na KB curada — se não está lá, ele admite não saber; (2) há validação de output que detecta inconsistências antes de exibir a resposta. As métricas confirmam: 94% de taxa anti-alucinação nos testes.

**"Esse agente poderia ser usado por criminosos para aprender a atacar?"**
> Essa é exatamente a pergunta certa. O Edge Case 5 do nosso sistema lida com isso. Qualquer solicitação de técnicas ofensivas gera recusa automática — documentada e testada. O agente informa a legislação aplicável e redireciona.

**"Qual o próximo passo para este projeto?"**
> Integração com a API do CERT.br para alertas de ameaças em tempo real, e implementação de RAG dinâmico com ChromaDB para suportar uma base de conhecimento muito maior — com possibilidade de atualização contínua sem alteração do código.
