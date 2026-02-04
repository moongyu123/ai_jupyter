#!/usr/bin/env bash
set -euo pipefail

mkdir -p  "$HOME/.jupyter" \
          "$JUPYTER_DATA_DIR" "$JUPYTER_RUNTIME_DIR"

# Lab 빌드 금지
cat > "$HOME/.jupyter/jupyter_config.py" <<'PYCONF'
c.LabBuildApp.minimize = False
c.LabBuildApp.dev_build = False
PYCONF

# JupyterLab 설정 파일 생성
echo "⚙️ JupyterLab 설정 생성 중..."
cat > "$HOME/.jupyter/jupyter_server_config.py" <<PYTHON
c.ServerApp.default_url = '/lab'
c.ServerApp.open_browser = False
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 8888
c.ServerApp.allow_origin = "*"
c.ServerApp.allow_credentials = True
c.Application.log_level = 'INFO'
c.ServerApp.jpserver_extensions = {
  "jupyterlab": True,
  "jupyter_lsp": True,
  "jupyterlab_code_formatter": True,
}
PYTHON

#KERNEL_DIR="$HOME/.local/share/jupyter/kernels/pysparkkernel"

# kernel.json 수정
PYTHON_BIN=$(which python)
#jq --arg vpy "$PYTHON_BIN" '.argv[0]=$vpy' "$KERNEL_DIR/kernel.json" > "$KERNEL_DIR/kernel.json.tmp"
#mv "$KERNEL_DIR/kernel.json.tmp" "$KERNEL_DIR/kernel.json"

# 확장 기능 상태 확인
echo ""
echo "=== 📊 설치 완료 결과 ==="
echo "JupyterLab 버전: $(jupyter lab --version)"
echo "Python 버전: $(python --version)"
echo "Node.js 버전: $(node --version)"

echo "🔌 Jupyter server extension 활성화 중..."
jupyter server extension enable --py jupyter_lsp --user || true
jupyter server extension enable --py jupyterlab_code_formatter --user || true

echo ""
echo "🔍 설치된 확장 기능:"
jupyter labextension list
echo "✅ jupyter lab 로컬 환경 설정 완료!"