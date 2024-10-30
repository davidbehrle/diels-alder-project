require(ChemoSpec)
library(ChemoSpec)
library(R.utils)
library(pracma)

png(
    file = "/home/david/Documents/school/chemistry/CHM3215L/diels-alder-project/spectra/uvvis10.2.png",
    width = 500,
    height = 250,
    units = "mm",
    res = 300
)

options(ChemoSpecGraphics = "base")
sp <- files2SpectraObject(
    gr.crit = "uvvis10.2",
    fileExt = "\\.(csv|CSV)$",
    header = TRUE,
    debug = TRUE,
    sep = ",",
    freq.unit = "Wavelength (nm)",
    int.unit = "Absorbance",
    out.file = "uvvis10.2"
)

spectrumtest <- loadObject("uvvis10.2.RData")

#spectrumtest <- baselineSpectra(spectrumtest, int = FALSE, method = "rfbaseline", retC = TRUE)

plotSpectra(
    spectrumtest,
    main = substitute(paste(italic(N), "-(4-methylphenyl)maleimide UV-Vis Spectrum")),
    xlim = c(220, 900),
    lab.pos = "none",
    showGrid = FALSE,
    lwd = 2,
    xaxs = "i",
    yaxs = "i",
    yrange = c(-0.075, 3)
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