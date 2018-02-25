saveData <- function(method="none") {
  if(method == "dropbox") saveDropboxData(saveDir) 
  if(method == "local") saveLocalData(saveDir) 
}

saveLocalData <- function(outputDir){
  fileName <- makeFileName()                 # file name
  filePath <- file.path(outputDir, fileName) # path to file
  writeData(filePath)                        # write file
}

saveDropboxData <- function(outputDir) {
  fileName <- makeFileName()                 # file name
  filePath <- file.path(tempdir(), fileName) # temporary directory
  writeData(filePath)                        # write to temp directory
  drop_upload(filePath, path = outputDir)    # upload to dropbox
}

makeFileName <- function() {
  timeStampString <- format(Sys.time(), "%Y-%m-%d-%H-%M-%S") # get system time
  fileName <- paste0("data-", timeStampString, ".csv")       # timestamped file name 
  return(fileName)
}

writeData <- function(filePath) {
  write.csv(
    x = responses,     # the data
    file=filePath,     # where to write it
    row.names = FALSE  # don't add row names to the csv
  )
}
