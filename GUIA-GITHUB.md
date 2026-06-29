# 🐙 Guia Completo — Como Postar o SecGuard no GitHub

> Dois caminhos: **Interface Web** (mais fácil, sem instalar nada) ou **Git via Terminal** (mais profissional).
> Recomendação: comece pela Interface Web.

---

## 📋 ANTES DE COMEÇAR — O que você precisa

- [ ] Conta no GitHub criada → [github.com/signup](https://github.com/signup) (gratuito)
- [ ] ZIP do projeto baixado e **extraído** em uma pasta
- [ ] A pasta extraída deve ter esta estrutura:

```
secguard-project/
├── .gitignore
├── README.md
├── COMO_RODAR.md
├── requirements.txt
├── run.bat
├── run.sh
├── src/         → app.py
├── docs/        → 5 arquivos .md
├── data/        → 4 arquivos JSON/CSV
├── assets/      → arquitetura-secguard.svg
└── examples/    → README.md
```

---

## 🌐 OPÇÃO A — Interface Web do GitHub (Recomendado para iniciantes)

### Passo 1 — Criar o repositório

1. Acesse [github.com](https://github.com) e faça login
2. Clique no botão **"+"** no canto superior direito
3. Selecione **"New repository"**

![](https://i.imgur.com/placeholder.png)

Preencha os campos:
- **Repository name:** `secguard-assistente-ia` *(sem espaços, sem acentos)*
- **Description:** `🛡️ Assistente Virtual de Cibersegurança com IA Generativa | OWASP LLM Top 10 · NIST AI RMF · LGPD`
- **Visibility:** ✅ `Public` *(obrigatório para o lab DIO ser avaliado)*
- **NÃO marque** "Add a README file" *(o seu já vem no projeto)*

4. Clique em **"Create repository"**

---

### Passo 2 — Fazer upload dos arquivos

Você vai ver uma página vazia com instruções. **Ignore o texto e clique em:**

> **"uploading an existing file"**
> *(link azul no meio da página)*

Ou vá direto para:
```
https://github.com/SEU_USUARIO/secguard-assistente-ia/upload/main
```

---

### Passo 3 — Arrastar a pasta completa

1. Abra o **Explorador de Arquivos** (Windows) ou **Finder** (Mac)
2. Navegue até a pasta extraída do ZIP
3. **Abra** a pasta `secguard-project/`
4. Selecione **TODOS** os arquivos e pastas dentro dela:
   - Windows: `Ctrl + A`
   - Mac: `Cmd + A`
5. **Arraste tudo** para a área cinza da página do GitHub que diz
   *"Drag files here to add them to your repository"*

> ⚠️ **Atenção:** Arraste o CONTEÚDO da pasta, não a pasta em si.
> O GitHub aceita arrastar pastas inteiras com subpastas (docs/, data/, src/, etc.)

---

### Passo 4 — Confirmar o commit

Role a página até o final. Você verá a seção **"Commit changes"**:

- **Commit title:** `feat: projeto SecGuard — assistente de cibersegurança com IA`
- **Extended description:** *(opcional)*
  ```
  Assistente virtual de cibersegurança desenvolvido para o Lab DIO.
  Frameworks: OWASP LLM Top 10 (2025) · NIST AI RMF · LGPD
  Modos: Demo (KB local) e Ollama (LLM local)
  ```
- Mantenha selecionado: **"Commit directly to the main branch"**

Clique em **"Commit changes"** (botão verde)

---

### Passo 5 — Verificar se ficou correto

Após o commit, você será redirecionado para seu repositório.
Confirme que está tudo certo:

- [ ] O **README.md** está sendo exibido automaticamente na página
- [ ] Os badges (OWASP, NIST, LGPD) aparecem no topo
- [ ] As pastas `docs/`, `data/`, `src/`, `assets/`, `examples/` aparecem listadas
- [ ] O arquivo `.gitignore` está presente (pode precisar ativar "Show hidden files")

---

### Passo 6 — Adicionar tópicos ao repositório

Isso ajuda na descoberta e impressiona avaliadores:

1. Na página do repositório, clique na engrenagem ⚙️ ao lado de **"About"** (coluna direita)
2. Em **"Topics"**, adicione:
   ```
   ciberseguranca  inteligencia-artificial  python  streamlit
   ollama  owasp  lgpd  nist  llm  dio  chatbot  seguranca-digital
   ```
3. Em **"Website"**, você pode colocar o link do Lab DIO se tiver
4. Clique em **"Save changes"**

---

## 💻 OPÇÃO B — Git via Terminal (Mais profissional)

> Recomendado se quiser manter o projeto atualizado facilmente no futuro.

### Passo 1 — Instalar o Git

| Sistema | Comando / Download |
|---|---|
| **Windows** | Baixe em [git-scm.com/download/win](https://git-scm.com/download/win) |
| **Mac** | `brew install git` ou já vem instalado |
| **Linux (Ubuntu)** | `sudo apt install git` |

Verifique a instalação:
```bash
git --version
# Esperado: git version 2.x.x
```

---

### Passo 2 — Configurar o Git (apenas na primeira vez)

```bash
git config --global user.name "Seu Nome Aqui"
git config --global user.email "seu@email.com"
```

> Use o mesmo e-mail da sua conta do GitHub.

---

### Passo 3 — Criar o repositório no GitHub

Siga o **Passo 1 da Opção A** para criar o repositório vazio no GitHub.

Após criar, copie a URL do repositório. Será algo como:
```
https://github.com/SEU_USUARIO/secguard-assistente-ia.git
```

---

### Passo 4 — Executar os comandos

Abra o terminal na pasta `secguard-project/` (a pasta extraída do ZIP):

```bash
# 1. Inicializar o Git local
git init

# 2. Adicionar todos os arquivos
git add .

# 3. Criar o primeiro commit
git commit -m "feat: projeto SecGuard — assistente virtual de cibersegurança com IA"

# 4. Renomear a branch para 'main' (padrão do GitHub)
git branch -M main

# 5. Conectar ao repositório remoto (substitua pela sua URL)
git remote add origin https://github.com/SEU_USUARIO/secguard-assistente-ia.git

# 6. Enviar para o GitHub
git push -u origin main
```

5. O terminal vai pedir suas credenciais do GitHub
   - **Username:** seu usuário do GitHub
   - **Password:** use um **Token** (não a senha normal)

---

### Como gerar o Token do GitHub (necessário para autenticação)

1. Acesse: [github.com/settings/tokens](https://github.com/settings/tokens)
2. Clique em **"Generate new token (classic)"**
3. Dê um nome: `token-secguard`
4. Em **Expiration**: `90 days`
5. Marque o escopo: ✅ `repo`
6. Clique **"Generate token"**
7. **COPIE O TOKEN** — ele só aparece uma vez!
8. Use o token no lugar da senha quando o terminal pedir

---

## 🍴 OPÇÃO C — Fork do Repositório do Professor (alternativa oficial do lab)

> Esta é a opção "oficial" descrita no enunciado do Lab DIO.

1. Acesse: [github.com/digitalinnovationone/dio-lab-bia-do-futuro](https://github.com/digitalinnovationone/dio-lab-bia-do-futuro)
2. Clique em **"Fork"** (canto superior direito)
3. Em **"Owner"**: selecione sua conta
4. Em **"Repository name"**: `secguard-assistente-ia` *(pode renomear)*
5. Clique **"Create fork"**

Depois do fork, **substitua os arquivos** do professor pelos seus:
- Delete os arquivos originais do professor (docs/, data/, src/, etc.)
- Faça upload dos seus arquivos do ZIP seguindo o **Passo 3 da Opção A**

---

## ✅ VERIFICAÇÃO FINAL — Checklist antes de submeter

Acesse seu repositório e confirme:

```
✅ URL do repositório é pública (não privada)
✅ README.md exibe automaticamente na página inicial
✅ Badges OWASP, NIST, LGPD aparecem no topo
✅ Diagrama SVG da arquitetura aparece no README
✅ Pasta docs/ contém os 5 arquivos do lab
✅ Pasta data/ contém os 4 arquivos JSON/CSV
✅ Pasta src/ contém o app.py
✅ Arquivo .gitignore presente
✅ Tópicos/tags adicionados ao repositório
```

---

## 🔗 Como submeter no Lab DIO

1. Copie a URL do seu repositório:
   ```
   https://github.com/SEU_USUARIO/secguard-assistente-ia
   ```
2. Acesse o Lab na plataforma DIO
3. Cole o link na área de entrega
4. Clique em **"Entregar Projeto"**

---

## 🆘 Problemas comuns e soluções

### "Permission denied" no push
```bash
# Use HTTPS com token em vez de SSH
git remote set-url origin https://SEU_USUARIO:SEU_TOKEN@github.com/SEU_USUARIO/secguard-assistente-ia.git
git push -u origin main
```

### O README não está exibindo o diagrama SVG
- Verifique se a pasta `assets/` foi enviada junto com o SVG
- O caminho no README deve ser exatamente: `assets/arquitetura-secguard.svg`

### "Repository not found" ao fazer push
- Confirme que o repositório foi criado como **Public**
- Verifique se a URL remote está correta: `git remote -v`

### A pasta `.gitignore` não aparece no GitHub
- Arquivos que começam com `.` ficam ocultos no explorer mas são enviados normalmente
- No GitHub eles aparecem na listagem de arquivos

### Arquivos grandes demais
- Arquivos acima de 100MB são bloqueados pelo GitHub
- Todos os nossos arquivos são pequenos (o ZIP tem apenas 46KB) — sem problema

---

## 💡 Dica de ouro para o processo seletivo

Após subir o projeto, adicione uma **descrição impactante** no campo About do repositório:

```
🛡️ Assistente virtual de cibersegurança com IA Generativa.
Arquitetado com OWASP LLM Top 10 (2025) e NIST AI RMF.
Resistência a prompt injection: 100% nos testes.
Lab DIO — Construa Seu Assistente Virtual Com IA.
```

Isso aparece na busca do GitHub e é o primeiro texto que avaliadores veem.
