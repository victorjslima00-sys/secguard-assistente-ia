#!/bin/bash
echo ""
echo " ==================================="
echo "  SecGuard — Iniciando..."
echo " ==================================="
echo ""

# Verifica Python
if ! command -v python3 &> /dev/null; then
    echo "[ERRO] Python 3 não encontrado."
    echo "Mac: brew install python3 | Linux: sudo apt install python3"
    exit 1
fi

# Instala dependências
echo "[1/3] Verificando dependências..."
pip3 install streamlit requests pandas -q

# Verifica Ollama
echo "[2/3] Verificando Ollama (opcional)..."
if curl -s http://localhost:11434/api/tags &>/dev/null; then
    echo "      Ollama detectado! Rodando com LLM local."
else
    echo "      Ollama não encontrado. Rodando em Modo Demo."
    echo "      Para ativar o LLM: https://ollama.com"
fi

echo "[3/3] Iniciando SecGuard..."
echo ""
echo " Acesse no navegador: http://localhost:8501"
echo " Para encerrar: Ctrl+C neste terminal"
echo ""

streamlit run src/app.py --server.headless true
