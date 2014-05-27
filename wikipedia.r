library("car")
library("MASS")
library("RJSONIO")

data <- read.csv("people.csv")

write(toJSON(sapply(data[-(1:5)],mean)), file="mean.json")
write(toJSON(sapply(data[-(1:5)],sd)), file="sd.json")

standardized = as.data.frame(scale(data[-(1:5)]))

ranking = prcomp(standardized)

screeplot(ranking, type="lines")


write(toJSON(ranking$rotation), file="pca.json")
write.csv(ranking$rotation, file="pca.csv")