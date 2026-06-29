@echo off
echo.
echo  ===================================
echo   SecGuard — Iniciando...
echo  ===================================
echo.

:: Verifica Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Python nao encontrado.
    echo Baixe em: https://www.python.org/downloads/
    echo Marque "Add Python to PATH" durante a instalacao.
    pause
    exit /b 1
)

:: Instala dependencias se necessario
echo [1/3] Verificando dependencias...
pip install streamlit requests pandas -q

echo [2/3] Verificando Ollama (opcional)...
curl -s http://localhost:11434/api/tags >nul 2>&1
if errorlevel 1 (
    echo       Ollama nao encontrado. Rodando em Modo Demo.
    echo       Para ativar o LLM: https://ollama.com
) else (
    echo       Ollama detectado! Rodando com LLM local.
)

echo [3/3] Iniciando SecGuard...
echo.
echo  Acesse no navegador: http://localhost:8501
echo  Para encerrar: Ctrl+C neste terminal
echo.
streamlit run src/app.py --server.headless false
pause
