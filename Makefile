help:
	@echo "###"
	@echo "# Build targets for Neo Han Sans SC"
	@echo "###"
	@echo
	@echo "  make build:  Builds the fonts and places them in the fonts/ directory"
	@echo "  make zip:  Zip all fonts into a zip"
	@echo

init: requirements.txt
	pip install -Ur requirements.txt
	touch init.stamp

build: build.stamp

# fontmake -m "fonts-temp/master-ufo/InterNumeric.designspace" -o variable --output-path "fonts/variable/InterNumeric[wght,RDNS].ttf" --filter DecomposeTransformedComponentsFilter --verbose DEBUG
# fontmake -m "fonts-temp/master-ufo/InterNumeric.designspace" -o variable-cff2 --output-path "fonts/variable/InterNumeric[wght,RDNS].otf"


build.stamp: init.stamp
	fontmake -g "src/NeoHanSans-Variable.glyphspackage" -o variable --output-path "fonts-temp/variable/NeoHanSansSC[wght].ttf"
#	fontmake -g "src/NeoHanSans-Variable.glyphspackage" -o variable-cff2 --output-path "fonts/variable/NeoHanSansSC[wght].otf"
	mkdir fonts
	mkdir fonts/variable
	gftools fix-nonhinting "fonts-temp/variable/NeoHanSansSC[wght].ttf" "fonts/variable/NeoHanSansSC[wght].ttf"
	python scripts/stat.py
	touch build.stamp

zip: build.stamp
	cp -rf fonts NeoHanSansSC
	zip -r NeoHanSans.zip NeoHanSansSC
	rm -rf NeoHanSansSC


# fontbakery check-adobefonts "fonts/variable/InterNumeric[wght,RDNS].ttf"

test: build.stamp
	fontbakery check-universal "fonts/variable/NeoHanSansSC[wght].ttf" -x com.google.fonts/check/gpos_kerning_info -x com.google.fonts/check/tabular_kerning -x com.google.fonts/check/monospace

test-google: build.stamp
	fontbakery check-googlefonts "fonts/variable/NeoHanSansSC[wght].ttf" -x com.google.fonts/check/gpos_kerning_info -x com.google.fonts/check/tabular_kerning -x com.google.fonts/check/monospace -x com.google.fonts/check/render_own_name -x com.google.fonts/check/glyphsets/shape_languages -x com.google.fonts/check/glyph_coverage

clean:
	rm -rf fonts
	rm -rf fonts-temp
	rm build.stamp

update:
	pip install -Ur requirements.txt
