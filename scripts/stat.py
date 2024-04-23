from fontTools.designspaceLib import DesignSpaceDocument, AxisLabelDescriptor

"""
    Add a STAT table to the Designspace document as a preprocessing before
    using fontmake to compile the UFOs to the final binary font.
"""

path = "fonts-temp/master-ufo/NeoHanSansSC.designspace"
dsfile = DesignSpaceDocument.fromfile(path)

wghtAxisLabels = [
    AxisLabelDescriptor(name="Thin", userValue=100, userMinimum=100, userMaximum=150),
    AxisLabelDescriptor(name="ExtraLight", userValue=200, userMinimum=150, userMaximum=250),
    AxisLabelDescriptor(name="Light", userValue=300, userMinimum=250, userMaximum=350),
    AxisLabelDescriptor(name="Regular", userValue=400, userMinimum=350, userMaximum=450),
    AxisLabelDescriptor(name="Medium", userValue=490, userMinimum=450, userMaximum=550),
    AxisLabelDescriptor(name="SemiBold", userValue=580, userMinimum=550, userMaximum=650),
    AxisLabelDescriptor(name="Bold", userValue=670, userMinimum=650, userMaximum=750),
    AxisLabelDescriptor(name="ExtraBold", userValue=780, userMinimum=750, userMaximum=850),
    AxisLabelDescriptor(name="Black", userValue=900, userMinimum=850, userMaximum=900),
]
dsfile.getAxisByTag("wght").axisLabels = wghtAxisLabels


dsfile.write(path)
