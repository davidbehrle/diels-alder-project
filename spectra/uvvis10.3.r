require(ChemoSpec)
library(ChemoSpec)
library(R.utils)
library(pracma)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/uvvis10.3.png",
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "uvvis10.3",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = "Wavelength (nm)",
    int.unit = "Absorbance",
    out.file = "uvvis10.3"
)

spectrumtest <- loadObject("uvvis10.3.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = "4,7-dimethyl-2-(p-tolyl)-3a,4,7,7a-tetrahydro-1H-4,7-epoxyisoindole-1,3(2H)-dione UV-Vis Spectrum",
    xlim = c(220, 900),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(-0.6, 0.5)
)

axis(1, 2,
    lwd = 1.5,
)
box(
    which = "plot",
    bty = "o",
    lwd = 1.5
)

dev.off()