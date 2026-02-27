import unittest


class QtViewerImportTests(unittest.TestCase):
    def test_module_import_or_skip(self):
        try:
            import tools.qt_asset_viewer as mod  # noqa: F401
        except SystemExit as exc:
            self.skipTest(str(exc))


if __name__ == "__main__":
    unittest.main()
