library(SITH)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
        pfix <<- prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
}

run <- function() {}

output <- function(outputfile) {
out <- simulateTumor(max_pop = as.integer(parameters["max_pop", 2]))
df <- randomBulkSamples(tumor = out, nsamples = as.integer(parameters["nsamples", 2]), cube.length = as.integer(parameters["cubelength", 2]), threshold = as.numeric(parameters["threshold", 2]))
visualizeTumor(out)
write.csv(df, outputfile)
}
