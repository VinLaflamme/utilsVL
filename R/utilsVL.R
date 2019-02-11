
#' Creates an hyperlink to resources used in the Rmd file
#' @param dirs Path to the file
#' @param exts extensions of the files being included in the archive
#' @param otherF vector of other files to include in the archive
#' @param textT (optional) text for the hyperlink
#' @return A string that can be printed in an html document
#' @export
#'

embedSourceVL<-function(dirs=".",exts=c("Rmd","R","txt","dat","csv","xls","xlsx","gz"),otherF=NULL,textT="Source"){
  filesToArchive<-c()
  for(iii in dirs){
    filesToArchive<-c(filesToArchive,tools::list_files_with_exts(dir = iii,exts = exts))
  }
  filesToArchive<-c(filesToArchive,otherF)
  utils::zip(zipfile = (TFile<-tempfile(fileext = ".zip")),files = filesToArchive)
  ttxt<-markdown:::.b64EncodeFile(inFile = TFile)
  unlink(TFile)
  ttxt<-paste0("<a href=\'",ttxt,"\'>",textT,"</a>")

}

#' @import tools
#' @import utils
#' @import markdown

NULL
