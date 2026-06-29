#!/bin/bash

echo ""
echo " ==================================="
echo " SecGuard — Iniciando..."
echo " ==================================="
echo ""

# Verifica Python
if ! command -v python3 &> /dev/null; then
  echo "[ERRO] Python 3 não encontrado."
  echo "Mac: brew install python3 | Linux: sudo apt install python3"
  exit 1
fi

# Instala dependências
echo "[1/4] Verificando dependências..."
pip3 install streamlit requests pandas -q

# Verifica / instala Ollama
echo "[2/4] Verificando Ollama..."
if ! command -v ollama &> /dev/null; then
  echo " Ollama não encontrado. Instalando..."
  curl -fsSL https://ollama.com/install.sh | sh
else
  echo " Ollama já está instalado."
fi

# Garante que o servidor do Ollama está rodando
echo "[3/4] Verificando serviço do Ollama..."
if ! curl -s http://localhost:11434/api/tags &>/dev/null; then
  echo " Iniciando o serviço do Ollama em segundo plano..."
  nohup ollama serve > /tmp/ollama.log 2>&1 &
  sleep 3
fi

if curl -s http://localhost:11434/api/tags &>/dev/null; then
  echo " Ollama detectado! Rodando com LLM local."
  # Garante que o modelo usado pelo SecGuard está disponível
  if ! ollama list | grep -q "llama3.2"; then
    echo " Baixando modelo llama3.2 (primeira execução pode demorar)..."
    ollama pull llama3.2
  fi
else
  echo " Não foi possível conectar ao Ollama. Rodando em Modo Demo."
  echo " Para investigar: https://ollama.com"
fi

echo "[4/4] Iniciando SecGuard..."
echo ""
echo " Acesse no navegador: http://localhost:8501"
echo " Para encerrar: Ctrl+C neste terminal"
echo ""
streamlit run src/app.py --server.headless true
