import unittest

from tools.utils.snes_formats import decode_2bpp_tile, decode_4bpp_tile, decode_bgr555


class SnesFormatsTests(unittest.TestCase):
    def test_decode_bgr555(self):
        self.assertEqual(decode_bgr555(0x1F, 0x00), (248, 0, 0))

    def test_decode_2bpp_tile(self):
        tile = bytes([0x80, 0x00] + [0] * 14)
        pixels = decode_2bpp_tile(tile)
        self.assertEqual(pixels[0][0], 1)

    def test_decode_4bpp_tile(self):
        tile = bytearray(32)
        tile[0] = 0x80
        pixels = decode_4bpp_tile(bytes(tile))
        self.assertEqual(pixels[0][0], 1)


if __name__ == "__main__":
    unittest.main()
