import tempfile
import unittest
from pathlib import Path

from tools.ppm_to_png import convert_file


class PpmToPngTests(unittest.TestCase):
    def test_convert_small_p6_ppm(self):
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            ppm = base / "img.ppm"
            ppm.write_bytes(b"P6\n2 1\n255\n\xFF\x00\x00\x00\xFF\x00")

            out = convert_file(ppm)
            data = out.read_bytes()
            self.assertEqual(data[:8], b"\x89PNG\r\n\x1a\n")
            self.assertTrue(out.exists())

    def test_convert_p6_with_space_first_pixel(self):
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            ppm = base / "img_space.ppm"
            ppm.write_bytes(b"P6\n1 1\n255\n \x10\x20")

            out = convert_file(ppm)
            data = out.read_bytes()
            self.assertEqual(data[:8], b"\x89PNG\r\n\x1a\n")
            self.assertTrue(out.exists())


if __name__ == "__main__":
    unittest.main()
