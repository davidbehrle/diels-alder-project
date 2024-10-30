require(ChemoSpec)
library(ChemoSpec)
library(R.utils)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/ir9.3.png",
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "ir9.3",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = expression(Wavenumber ~ (cm^-1)),
    int.unit = "Percent Transmittance",
    out.file = "ir9.3"
)

spectrumtest <- loadObject("ir9.3.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = "2-(4-chlorophenyl)-4,7-dimethyl-3a,4,7,7a-tetrahydro-1H-4,7-epoxyisoindole-1,3(2H)-dione IR Spectrum",
    xlim = c(4000, 500),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(75, 100)
)

text(1702, 79.5, "1702")
text(2980, 94.25, "2980")
text(1494, 87.8, "1494")
text(1385, 86.35, "1385")
text(1200, 83.8, "1200")
text(1090, 87.5, "1090")

axis(1, 2,
    lwd = 1.5,
)
box(
    which = "plot",
    bty = "o",
    lwd = 1.5
)

dev.off()