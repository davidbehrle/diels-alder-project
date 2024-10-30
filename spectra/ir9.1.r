library(ChemoSpec)
library(R.utils)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/ir9.1.png", # nolint: line_length_linter.
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "ir9.1",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = expression(Wavenumber ~ (cm^-1)),
    int.unit = "Percent Transmittance",
    out.file = "ir9.1"
)

spectrumtest <- loadObject("ir9.1.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = substitute(paste(italic(N), "-(4-chloro)maleanilic acid IR Spectrum")),
    xlim = c(4000, 500),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(10, 100)
)

text(3078, 58.5, "3078")
text(1895, 72.25, "1895")
text(1702, 41.5, "1702")
text(1629, 47.5, "1629")
text(1484, 20.5, "1484")
text(1398, 25, "1398")
text(1094, 34, "1094")

axis(1, 2,
    lwd = 1.5,
)
box(
    which = "plot",
    bty = "o",
    lwd = 1.5
)

dev.off()