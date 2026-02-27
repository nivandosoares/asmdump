# Asset Visualization Workflow

## Objetivo
Validar visualmente os assets extraídos antes da implementação em C/SDL.

## Pré-requisito
Rode a extração primeiro:

```bash
python tools/extract_all.py --rom game.smc --output /tmp/asmdump_extract_check
```

## 1) Visualização de cenas

```bash
python visualize_scene.py --scene gameplay_cockpit --data-root /tmp/asmdump_extract_check --export /tmp/asmdump_extract_check/previews/cockpit.png
```

Inspecionar metadados de tile:

```bash
python visualize_scene.py --scene gameplay_cockpit --data-root /tmp/asmdump_extract_check --tile-info 120 180
```

Gerar header C da cena atual:

```bash
python visualize_scene.py --scene gameplay_cockpit --data-root /tmp/asmdump_extract_check --generate-c-header /tmp/asmdump_extract_check/previews/cockpit_tilemap.h
```

## 2) Visualização de sprites

```bash
python visualize_sprites.py --car car_model_0 --angle rear --scale near --data-root /tmp/asmdump_extract_check --export /tmp/asmdump_extract_check/previews/car.png
```

## 3) Visualização de pista

```bash
python visualize_track.py --track bank13 --start 0 --output /tmp/asmdump_extract_check/previews/road.png --data-root /tmp/asmdump_extract_check
```

## 4) Dashboard web local

```python
from tools.scene_visualizer import WebExplorer
WebExplorer('/tmp/asmdump_extract_check').launch_dashboard(port=8080)
```

Depois abra: `http://127.0.0.1:8080`.

## Validação recomendada
- Comparar preview renderizado com screenshot de emulador (Mesen-S).
- Conferir `--tile-info` em regiões críticas (HUD, cockpit, menus).
- Se houver divergência, revisar `tilemaps/*.json` e bancos em `graphics/bankXX`.

## 5) Interface Qt (desktop, completa)

Instale dependência:

```bash
pip install PySide6
```

Abra a interface:

```bash
python visualize_qt.py
```

Recursos disponíveis na UI:
- Aba **Scenes**: carregar cena, zoom/pan, clicar para `tile info`, toggles de layers, export PNG e header C.
- Aba **Sprites**: renderizar carro por `car/angle/scale` e exportar PNG.
- Aba **Road**: renderizar pista com `track/start/camera angle` e exportar PNG.
- Menu **File**: trocar `data root` e recarregar dados extraídos.
