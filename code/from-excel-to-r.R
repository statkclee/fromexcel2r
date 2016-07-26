##==========================================================================================================
## 00. 환경설정
##==========================================================================================================
# 팩키지 설치
options(warn=-1, encoding = "UTF-8")

# 팩키지 설치
pkgs <- c("psych", "readr", "dplyr", "Amelia", "ROCR", "caret", "pscl", "AER", "doMC", "parallel", "mboost", 
          "earth", "gbm", "randomForest", "devtools", "readxl", "lubridate", "zoo", "scales")
new.pkgs <- setdiff(pkgs, rownames(installed.packages()))
if (length(new.pkgs)) install.packages(new.pkgs,  repos = "http://cran.us.r-project.org")

# 작업 디렉토리 설정
if(any(Sys.info() == "Windows")) {
  setwd("D:/webzen/fromexcel2r")
}
if(any(Sys.info() == "Darwin")) {
  setwd("/Users/statkclee/swc/fromexcel2r")
}

##==========================================================================================================
## 01. 데이터 가져오기
##==========================================================================================================
#
library(readxl)

xlsData <- read_excel("data/flexdashboard-data2.xlsx", sheet="Sheet1", skip=1)

##==========================================================================================================
## 02. 데이터 전처리
##==========================================================================================================
library(dplyr)

xwMOOCRev <- xlsData %>% select(`월`,
  `STAR`,
  `LOL`,
  `MU`) 

xwMOOCRev$월 <- NULL
xwMOOCRev <- xwMOOCRev[1:30,] 
xwMOOCRev$xwDate <- seq(as.Date("2003/1/1"), by = "month", length.out = 30)
