from fontTools.ttLib import TTFont
from fontTools.otlLib import builder

"""
    Add a STAT table to the Designspace document as a preprocessing before
    using fontmake to compile the UFOs to the final binary font.
"""

path = "fonts/variable/NeoHanSansSC[wght].ttf"
font = TTFont(path)

axes = [
    dict(
        tag="wght",
        name="Weight",
        values=[
            dict(value=100, name='Thin'),
            dict(value=200, name='ExtraLight'),
            dict(value=300, name='Light'),
            dict(value=400, name='Regular', flags=0x2),
            dict(value=500, name='Medium'),
            dict(value=600, name='SemiBold'),
            dict(value=700, name='Bold'),
            dict(value=800, name='ExtraBold'),
            dict(value=900, name='Black'),
        ],
    )
]

builder.buildStatTable(font, axes)
font.save(path)