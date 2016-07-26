##==========================================================================================================
## 00. 환경설정
##==========================================================================================================
options(warn=-1, encoding = "UTF-8")
source("code/from-excel-to-r.R")

##==========================================================================================================
## 01. 웹젠 글로벌 매출 데이터 전처리
##==========================================================================================================
library(reshape2)

xwMOOCRev_long <- melt(xwMOOCRev, id = "xwDate")

##==========================================================================================================
## 02. 웹젠 글로벌 매출 시각화
##==========================================================================================================

library(ggplot2)
library(scales)

xwMOOCRevPlot <- ggplot(xwMOOCRev_long, aes(x = xwDate, y = value/10^6)) +
  geom_line(aes(linetype = variable), show_guide = TRUE) +
  #scale_linetype_manual(values = c("solid", "longdash", "dashed")) +
  scale_x_date(date_breaks = "1 month", date_labels = "%Y-%m") + 
  scale_y_continuous(breaks = seq(0, 5, 1), limits = c(0, 5), expand = c(0, 0)) +
  labs(x = NULL, y = NULL) + 
  ggtitle(expression(atop(bold("xwMOOC 해외통합 매출"), 
                          atop("[단위]: 억원")))) +
  theme(panel.grid.major.y = element_line(colour = "grey60"), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(size = rel(1.5), face = "bold", vjust = 1.5),
        axis.title.y = element_text(face = "bold"),
        axis.text.x = element_text(angle = 90, hjust = 1),
        legend.position = "right",
        legend.title = element_blank(),
        legend.key.size = unit(0.4, "cm"))

xwMOOCRevPlot
