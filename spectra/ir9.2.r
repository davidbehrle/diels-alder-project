library(ChemoSpec)
library(R.utils)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/ir9.2.png", # nolint: line_length_linter.
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "ir9.2",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = expression(Wavenumber ~ (cm^-1)),
    int.unit = "Percent Transmittance",
    out.file = "ir9.2"
)

spectrumtest <- loadObject("ir9.2.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = substitute(paste(italic(N), "-(4-chlorophenyl)maleimide IR Spectrum")),
    xlim = c(4000, 500),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(65, 100)
)

text(1710, 74.5, "1710")
text(1496, 80.6, "1496")
text(1385, 80.25, "1385")
text(1146, 79.25, "1146")
text(1094, 81.25, "1094")

axis(1, 2,
    lwd = 1.5,
)
box(
    which = "plot",
    bty = "o",
    lwd = 1.5
)

dev.off()