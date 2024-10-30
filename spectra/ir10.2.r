library(ChemoSpec)
library(R.utils)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/ir10.2.png",
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "ir10.2",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = expression(Wavenumber ~ (cm^-1)),
    int.unit = "Percent Transmittance",
    out.file = "ir10.2"
)

spectrumtest <- loadObject("ir10.2.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = substitute(paste(italic(N), "-(4-methylphenyl)maleimide IR Spectrum")),
    xlim = c(4000, 500),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(65, 100)
)

text(1705, 75.5, "1705")
text(1515, 82.75, "1515")
text(1387, 81.75, "1387")
text(1151, 78.75, "1151")

axis(1, 2,
    lwd = 1.5,
)
box(
    which = "plot",
    bty = "o",
    lwd = 1.5
)

dev.off()