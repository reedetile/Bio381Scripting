#Description-----------------------------------------
#Organizing source files
#  12 Apr 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
library(logger)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------


# Global Variables-------------------------------------


# Program Body------------------------------------------
log_layout(layout_glue_colors) #use colors in console output. changes colors depending on output
log_threshold(TRACE) #set low threshold for showing all messages
mylog <- tempfile() #setup a temporary file to record the log
log_appender(appender_tee(mylog)) # append log statements

log_info()
log_trace()
log_debug()

log_info('add your message here')
log_info('mix messages and code.','pi =', pi)
for (i in 1:5){
  log_debug('running file#',i)
  Sys.sleep(1) #puts are to 'sleep' for one second
}

#consider using log statements as annottion to code
z <- function(x=NULL){log_info(x)}

#could create a snippet
#--------------------------------
z('source functions')

#close the log file
cat(readLines(mylog), file ='logfile.txt', sep='\n')

#write the entire logfile once to the screen
cat('#-----------------',
    'logfile.txt:',readLines(mylog),sep='\n',
    '#----------------')
#clean up and reomve temp file from memory
unlink(mylog)
rm(mylog)

#using a progress bar
for( i in 1:100){
  Sys.sleep(0.1)
  #if(i%%10==0) cat(i) else cat('.')
  if(i%%10==0) cat(i) else if(i%%5==0) cat('.')
}

library(progress)
for(i in 0:101){
  progress(i)
  Sys.sleep(0.05)
  if(i==101) message("DONE!")
}


library(plyr)
laply(1:75,function(i) {Sys.sleep(0.05);i},.progress='text')

#measuring elapsed tim of partso f your code
log_tictoc('start loop')
for(i in 1:100) {
  Sys.sleep(0.1)
}
log_tictoc('end loop')

library(pracma)
tic()
for(i in 1:100{
  Sys.sleep(0.1)
}
toc()