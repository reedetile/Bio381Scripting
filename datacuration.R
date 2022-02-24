# Data curation
# 17 February 2022
#RCS
getwd()
pathRoot <- getwd()
pathRawData <- paste(pathRoot,'', '/rawdata', sep="")
pathCleanData <- paste(pathRoot,'/Clean_data', sep = "")
pathFigs <- paste(pathRoot,'', '/figure', sep = "")

setwd(pathCleanData)
my_data <- read.table(file = 'OriginalDatasheet.csv',
                      header = TRUE, 
                      sep = ',', 
                      comment.char = '#')
getwd()

#get structure#
str(my_data)

#add a new variable to the data frame
my_data$newVar <- runif(4)

#write to a new .csv file
write.table(x = my_data, file = 'dataPlusNewVar.csv',
            sep = ',')

# don't use "load()" and "save()" functions (hA)
#use RDS instead
setwd(pathRoot)
saveRDS(my_data, file = 'RDSObjects/my_data.RDS')
x <- readRDS("RDSObjects/my_data.RDS")
