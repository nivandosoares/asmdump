#!/usr/bin/env python3
"""Qt UI para exploração de cenas, sprites e pistas extraídas."""

from __future__ import annotations

import sys
from pathlib import Path

from tools.scene_visualizer import RoadVisualizer, SceneVisualizer, SpriteViewer

try:
    from PySide6.QtCore import Qt
    from PySide6.QtGui import QAction, QImage, QPixmap
    from PySide6.QtWidgets import (
        QApplication,
        QCheckBox,
        QComboBox,
        QFileDialog,
        QFormLayout,
        QGraphicsPixmapItem,
        QGraphicsScene,
        QGraphicsView,
        QGroupBox,
        QHBoxLayout,
        QLabel,
        QLineEdit,
        QMainWindow,
        QMessageBox,
        QPushButton,
        QSpinBox,
        QTabWidget,
        QTextEdit,
        QVBoxLayout,
        QWidget,
    )
except ImportError as exc:  # pragma: no cover - depende do ambiente
    raise SystemExit(
        "PySide6 não está instalado. Instale com `pip install PySide6` para usar a UI Qt."
    ) from exc


class ClickableGraphicsView(QGraphicsView):
    def __init__(self, click_cb, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._click_cb = click_cb

    def mousePressEvent(self, event):  # noqa: N802
        if event.button() == Qt.MouseButton.LeftButton:
            point = self.mapToScene(event.position().toPoint())
            self._click_cb(int(point.x()), int(point.y()))
        super().mousePressEvent(event)


class AssetViewerWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("The Duel - Asset Viewer (Qt)")
        self.resize(1200, 760)

        self.data_root = Path("output")
        self.scene_viz = SceneVisualizer(self.data_root)
        self.sprite_viz = SpriteViewer(self.data_root)
        self.road_viz = RoadVisualizer(self.data_root)

        self._scene_qimage: QImage | None = None
        self._sprite_qimage: QImage | None = None
        self._road_qimage: QImage | None = None

        self.tabs = QTabWidget()
        self.setCentralWidget(self.tabs)
        self.tabs.addTab(self._build_scene_tab(), "Scenes")
        self.tabs.addTab(self._build_sprite_tab(), "Sprites")
        self.tabs.addTab(self._build_road_tab(), "Road")

        self._build_menu()

    def _build_menu(self) -> None:
        bar = self.menuBar()
        file_menu = bar.addMenu("File")

        set_root = QAction("Set data root", self)
        set_root.triggered.connect(self._pick_data_root)
        file_menu.addAction(set_root)

        reload_action = QAction("Reload data", self)
        reload_action.triggered.connect(self._reload_data)
        file_menu.addAction(reload_action)

    def _build_scene_tab(self) -> QWidget:
        widget = QWidget()
        layout = QHBoxLayout(widget)

        left = QVBoxLayout()
        self.scene_combo = QComboBox()
        self.scene_combo.addItems(sorted(self.scene_viz.scenes.keys()))

        load_btn = QPushButton("Load scene")
        load_btn.clicked.connect(self._load_scene)

        self.layer_box = QGroupBox("Layers")
        self.layer_layout = QVBoxLayout(self.layer_box)

        export_btn = QPushButton("Export PNG")
        export_btn.clicked.connect(self._export_scene_png)

        header_btn = QPushButton("Generate C header")
        header_btn.clicked.connect(self._export_scene_header)

        self.tile_info = QTextEdit()
        self.tile_info.setReadOnly(True)
        self.tile_info.setPlaceholderText("Tile info aparece aqui ao clicar na cena")

        left.addWidget(QLabel("Scene"))
        left.addWidget(self.scene_combo)
        left.addWidget(load_btn)
        left.addWidget(self.layer_box)
        left.addWidget(export_btn)
        left.addWidget(header_btn)
        left.addWidget(QLabel("Tile metadata"))
        left.addWidget(self.tile_info)
        left.addStretch(1)

        self.scene_graphics = QGraphicsScene()
        self.scene_view = ClickableGraphicsView(self._on_scene_click)
        self.scene_view.setScene(self.scene_graphics)
        self.scene_view.setDragMode(QGraphicsView.DragMode.ScrollHandDrag)

        layout.addLayout(left, 0)
        layout.addWidget(self.scene_view, 1)
        return widget

    def _build_sprite_tab(self) -> QWidget:
        widget = QWidget()
        layout = QHBoxLayout(widget)

        left = QVBoxLayout()
        self.sprite_car = QLineEdit("car_model_0")
        self.sprite_angle = QLineEdit("rear")
        self.sprite_scale = QLineEdit("near")

        form = QFormLayout()
        form.addRow("Car", self.sprite_car)
        form.addRow("Angle", self.sprite_angle)
        form.addRow("Scale", self.sprite_scale)

        render_btn = QPushButton("Render sprite")
        render_btn.clicked.connect(self._render_sprite)
        export_btn = QPushButton("Export PNG")
        export_btn.clicked.connect(self._export_sprite_png)

        left.addLayout(form)
        left.addWidget(render_btn)
        left.addWidget(export_btn)
        left.addStretch(1)

        self.sprite_graphics = QGraphicsScene()
        self.sprite_view = QGraphicsView(self.sprite_graphics)

        layout.addLayout(left, 0)
        layout.addWidget(self.sprite_view, 1)
        return widget

    def _build_road_tab(self) -> QWidget:
        widget = QWidget()
        layout = QHBoxLayout(widget)

        left = QVBoxLayout()
        self.road_track = QLineEdit("bank13")
        self.road_start = QSpinBox()
        self.road_start.setRange(0, 65535)
        self.road_angle = QSpinBox()
        self.road_angle.setRange(-200, 200)

        form = QFormLayout()
        form.addRow("Track", self.road_track)
        form.addRow("Start", self.road_start)
        form.addRow("Camera angle", self.road_angle)

        render_btn = QPushButton("Render road")
        render_btn.clicked.connect(self._render_road)
        export_btn = QPushButton("Export PNG")
        export_btn.clicked.connect(self._export_road_png)

        left.addLayout(form)
        left.addWidget(render_btn)
        left.addWidget(export_btn)
        left.addStretch(1)

        self.road_graphics = QGraphicsScene()
        self.road_view = QGraphicsView(self.road_graphics)

        layout.addLayout(left, 0)
        layout.addWidget(self.road_view, 1)
        return widget

    def _qimage_from_rgb(self, width: int, height: int, rgb: bytes) -> QImage:
        img = QImage(rgb, width, height, width * 3, QImage.Format.Format_RGB888)
        return img.copy()

    def _load_scene(self) -> None:
        scene_name = self.scene_combo.currentText()
        try:
            self.scene_viz.load_scene(scene_name)
            width, height, rgb = self.scene_viz.render_scene()
            self._scene_qimage = self._qimage_from_rgb(width, height, rgb)
            self.scene_graphics.clear()
            self.scene_graphics.addItem(QGraphicsPixmapItem(QPixmap.fromImage(self._scene_qimage)))
            self.scene_view.fitInView(self.scene_graphics.itemsBoundingRect(), Qt.AspectRatioMode.KeepAspectRatio)
            self._refresh_layer_toggles()
        except Exception as exc:  # pragma: no cover - gui path
            self._error(str(exc))

    def _refresh_layer_toggles(self) -> None:
        while self.layer_layout.count():
            item = self.layer_layout.takeAt(0)
            widget = item.widget()
            if widget is not None:
                widget.deleteLater()

        for name, state in self.scene_viz.layer_state.items():
            chk = QCheckBox(name)
            chk.setChecked(state.enabled)
            chk.stateChanged.connect(lambda _, n=name: self._toggle_layer(n))
            self.layer_layout.addWidget(chk)

    def _toggle_layer(self, layer_name: str) -> None:
        try:
            self.scene_viz.toggle_layer(layer_name)
            width, height, rgb = self.scene_viz.render_scene()
            self._scene_qimage = self._qimage_from_rgb(width, height, rgb)
            self.scene_graphics.clear()
            self.scene_graphics.addItem(QGraphicsPixmapItem(QPixmap.fromImage(self._scene_qimage)))
        except Exception as exc:  # pragma: no cover - gui path
            self._error(str(exc))

    def _on_scene_click(self, x: int, y: int) -> None:
        try:
            info = self.scene_viz.show_tile_info(x, y)
            self.tile_info.setPlainText("\n".join(f"{k}: {v}" for k, v in info.items()))
        except Exception as exc:
            self.tile_info.setPlainText(str(exc))

    def _render_sprite(self) -> None:
        tmp = self.data_root / "previews" / "_qt_sprite_preview.png"
        try:
            out = self.sprite_viz.render_car(
                self.sprite_car.text().strip(),
                tmp,
                self.sprite_angle.text().strip(),
                self.sprite_scale.text().strip(),
            )
            self._sprite_qimage = QImage(str(out))
            self.sprite_graphics.clear()
            self.sprite_graphics.addItem(QGraphicsPixmapItem(QPixmap.fromImage(self._sprite_qimage)))
            self.sprite_view.fitInView(self.sprite_graphics.itemsBoundingRect(), Qt.AspectRatioMode.KeepAspectRatio)
        except Exception as exc:  # pragma: no cover - gui path
            self._error(str(exc))

    def _render_road(self) -> None:
        tmp = self.data_root / "previews" / "_qt_road_preview.png"
        try:
            self.road_viz.load_track(self.road_track.text().strip())
            out = self.road_viz.render_road_perspective(
                tmp,
                self.road_start.value(),
                self.road_angle.value(),
            )
            self._road_qimage = QImage(str(out))
            self.road_graphics.clear()
            self.road_graphics.addItem(QGraphicsPixmapItem(QPixmap.fromImage(self._road_qimage)))
            self.road_view.fitInView(self.road_graphics.itemsBoundingRect(), Qt.AspectRatioMode.KeepAspectRatio)
        except Exception as exc:  # pragma: no cover - gui path
            self._error(str(exc))

    def _export_scene_png(self) -> None:
        path, _ = QFileDialog.getSaveFileName(self, "Export scene PNG", str(self.data_root / "previews" / "scene.png"), "PNG (*.png)")
        if not path:
            return
        try:
            self.scene_viz.export_png(path)
        except Exception as exc:
            self._error(str(exc))

    def _export_scene_header(self) -> None:
        path, _ = QFileDialog.getSaveFileName(self, "Export C header", str(self.data_root / "previews" / "scene_tilemap.h"), "Header (*.h)")
        if not path:
            return
        try:
            self.scene_viz.generate_c_code(path)
        except Exception as exc:
            self._error(str(exc))

    def _export_sprite_png(self) -> None:
        path, _ = QFileDialog.getSaveFileName(self, "Export sprite PNG", str(self.data_root / "previews" / "sprite.png"), "PNG (*.png)")
        if not path:
            return
        try:
            self.sprite_viz.render_car(
                self.sprite_car.text().strip(),
                path,
                self.sprite_angle.text().strip(),
                self.sprite_scale.text().strip(),
            )
        except Exception as exc:
            self._error(str(exc))

    def _export_road_png(self) -> None:
        path, _ = QFileDialog.getSaveFileName(self, "Export road PNG", str(self.data_root / "previews" / "road.png"), "PNG (*.png)")
        if not path:
            return
        try:
            self.road_viz.load_track(self.road_track.text().strip())
            self.road_viz.render_road_perspective(path, self.road_start.value(), self.road_angle.value())
        except Exception as exc:
            self._error(str(exc))

    def _pick_data_root(self) -> None:
        path = QFileDialog.getExistingDirectory(self, "Escolha data root", str(self.data_root))
        if not path:
            return
        self.data_root = Path(path)
        self._reload_data()

    def _reload_data(self) -> None:
        try:
            self.scene_viz = SceneVisualizer(self.data_root)
            self.sprite_viz = SpriteViewer(self.data_root)
            self.road_viz = RoadVisualizer(self.data_root)
            self.scene_combo.clear()
            self.scene_combo.addItems(sorted(self.scene_viz.scenes.keys()))
            self.tile_info.clear()
            self.scene_graphics.clear()
            self.sprite_graphics.clear()
            self.road_graphics.clear()
        except Exception as exc:
            self._error(str(exc))

    def _error(self, message: str) -> None:
        QMessageBox.critical(self, "Erro", message)


def run() -> int:
    app = QApplication(sys.argv)
    window = AssetViewerWindow()
    window.show()
    return app.exec()


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(run())
