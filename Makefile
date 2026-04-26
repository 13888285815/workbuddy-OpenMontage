.PHONY: setup install install-dev install-gpu test test-contracts lint clean preflight demo demo-list hyperframes-doctor hyperframes-warm

# ---- One-command setup ----

setup:
	@echo "==> 安装 Python 依赖..."
	pip install -r requirements.txt
	@echo ""
	@echo "==> 安装 Remotion composer..."
	cd remotion-composer && npm install
	@echo ""
	@echo "==> 安装免费离线 TTS (Piper)..."
	pip install piper-tts || echo "  [跳过] piper-tts 安装失败 — TTS 将使用云提供商"
	@echo ""
	@echo "==> 安装 HyperFrames 运行时 (通过 npx 预热缓存)..."
	@echo "    将 'hyperframes' npm 包拉取到本地 npx 缓存，这样"
	@echo "    首次渲染不会支付 30-60 秒的冷获取惩罚。约 20MB 磁盘。"
	@npx --yes hyperframes --version >/dev/null 2>&1 && echo "    HyperFrames CLI 已缓存 (npx)" || echo "  [跳过] HyperFrames 缓存预热失败 — 离线或 npm 不可用；首次渲染将按需获取"
	@python -c "from tools.video.hyperframes_compose import HyperFramesCompose; HyperFramesCompose._npm_resolve_cache=None; c=HyperFramesCompose()._runtime_check(); print(f'    HyperFrames runtime_available={c[\"runtime_available\"]}, npm={c.get(\"npm_package_version\") or c.get(\"npm_resolve_error\")}'); [print(f'    note: {r}') for r in c['reasons']]" || echo "  [跳过] HyperFrames 检查失败 — 运行时可以稍后设置"
	@echo ""
	python -c "import shutil, os; e=os.path.exists('.env'); shutil.copy('.env.example','.env') if not e else None; print('==> 已从 .env.example 创建 .env — 在那里添加你的 API 密钥。' if not e else '==> .env 已存在 — 跳过。')"
	@echo ""
	@echo "完成！在你的 AI 编程助手中打开这个项目并开始创作。"
	@echo "  可选：在 .env 中添加 API 密钥以解锁云提供商。"
	@echo "  可选：如果你有 NVIDIA GPU，运行 'make install-gpu'。"
	@echo "  可选：运行 'make hyperframes-doctor' 以完全验证 HyperFrames 运行时。"
	@echo "  可选：随时运行 'make hyperframes-warm' 以将 npx 缓存刷新到最新的 hyperframes 版本。"

# ---- Individual installs ----

install:
	pip install -r requirements.txt

install-dev:
	pip install -r requirements-dev.txt

install-gpu:
	pip install -r requirements-gpu.txt
	pip install diffusers transformers accelerate

# ---- Testing ----

test:
	python -m pytest tests/ -v

test-contracts:
	python -m pytest tests/contracts/ -v

# ---- Utilities ----

preflight:
	python -c "from tools.tool_registry import registry; import json; registry.discover(); print(json.dumps(registry.provider_menu(), indent=2))"

hyperframes-doctor:
	@echo "==> 检测 HyperFrames 运行时 (node/ffmpeg/npx + hyperframes doctor)..."
	python -c "from tools.video.hyperframes_compose import HyperFramesCompose; r=HyperFramesCompose().execute({'operation':'doctor'}); import json; print(json.dumps(r.data, indent=2)); print('OK' if r.success else f'FAIL: {r.error}')"

hyperframes-warm:
	@echo "==> 刷新 HyperFrames npx 缓存到最新版本..."
	@echo "    使用 --prefer-online 以便 npx 获取自上次运行以来的新版本。"
	npx --yes --prefer-online hyperframes --version
	@echo "==> 缓存预热完成。"

demo:
	@echo "==> 渲染零密钥演示视频（无需 API 密钥）..."
	@echo "    这些仅使用 Remotion 组件 — 动画图表、文本、数据可视化。"
	@echo ""
	python render_demo.py

demo-list:
	@python render_demo.py --list

lint:
	python -m py_compile tools/base_tool.py
	python -m py_compile tools/tool_registry.py
	python -m py_compile tools/cost_tracker.py
	python -m py_compile tools/composition_validator.py

clean:
	python -c "import pathlib, shutil; [shutil.rmtree(p) for p in pathlib.Path('.').rglob('__pycache__')]; [p.unlink() for p in pathlib.Path('.').rglob('*.pyc')]"
