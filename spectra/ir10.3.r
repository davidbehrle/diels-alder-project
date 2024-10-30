require(ChemoSpec)
library(ChemoSpec)
library(R.utils)
library(pracma)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/ir10.3.png",
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "ir10.3",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = expression(Wavenumber ~ (cm^-1)),
    int.unit = "Percent Transmittance",
    out.file = "ir10.3"
)

spectrumtest <- loadObject("ir10.3.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = "4,7-dimethyl-2-(p-tolyl)-3a,4,7,7a-tetrahydro-1H-4,7-epoxyisoindole-1,3(2H)-dione IR Spectrum",
    xlim = c(4000, 500),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(55, 100)
)

text(1701, 57.5, "1701")
text(1514, 76.5, "1514")
text(1389, 72.75, "1389")
text(1202, 74.25, "1202")
text(1152, 81, "1152")
text(1103, 82, "1103")

axis(1, 2,
    lwd = 1.5,
)
box(
    which = "plot",
    bty = "o",
    lwd = 1.5
)

dev.off()