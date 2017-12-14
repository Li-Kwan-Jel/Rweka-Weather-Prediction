hello <- read.csv("xdata.csv",TRUE)


library(RWeka)
WPM("refresh-cache")
WPM("list-packages","available")
WPM("install-package", "simpleEducationalLearningSchemes") 
WPM("load-package", "simpleEducationalLearningSchemes")
ID3 <- make_Weka_classifier("weka/classifiers/trees/Id3")

model <- ID3(play~. , data = hello)
e <- evaluate_Weka_classifier(model,
                              cost = matrix(c(0,2,1,0),ncol = 2),
                              numFolds = 10 ,complexity = TRUE,
                              seed = 123 ,class = TRUE)
e$details
        
                               


