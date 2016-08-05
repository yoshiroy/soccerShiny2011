shinyServer(function(input,output){
  #team      <- read.csv("試合一覧表.csv",row.names=1)
  #AG2       <- read.csv("移動支配率_全時間.csv")
  #FG2       <- read.csv("移動支配率_前半.csv")
  #SG2       <- read.csv("移動支配率_後半.csv")
  #GT2       <- read.csv("ゴール時間.csv")
  #ST2       <- read.csv("シュート時間.csv")
  #gt        <- read.csv("ゴール表.csv")
  #soccer    <- read.csv("HZ2011.csv")
  #goal      <- read.csv("累積得点.csv")
  #owngoal   <- read.csv("累積自滅得点.csv")
  # 上記のように、各種データを取り込み、計算、グラフ作成しているが
  # データを公開できないため、以下のように読み込み済みのデータを用いている。
  load("HZ.RData")

  ID <- function(){
    return(row.names(team[team[,7]==input$ID,]))
  }
  output$POSSESSION <- reactivePlot(
    function(){
      ID <- ID()
      AG <- AG2[AG2[,1]==ID,-1]
      FG <- FG2[FG2[,1]==ID,-1]
      SG <- SG2[SG2[,1]==ID,-1]
      
      plot(as.numeric(AG[3,AG[4,]!=0]),AG[4,AG[4,]!=0],type="l",xlim=c(0,90),ylim=c(0,1),xlab="",ylab="")
      points(as.numeric(FG[3,FG[4,]!=0]),FG[4,FG[4,]!=0],type="l",col="red")
      points(as.numeric(SG[3,SG[4,]!=0]),SG[4,SG[4,]!=0],type="l",col="blue")
      abline(h=0.5)
      
      GT <- GT2[GT2[,1]==ID,-1]
      if(!is.na(GT[1,1])) 
        for(i in 1:nrow(GT)){
          if(GT[i,1]==1)
            abline(v=GT[i,2],col="red")
          else
            abline(v=GT[i,2],col="blue")
        }
      
      ST <- ST2[ST2[,1]==ID,-1]
      if(!is.na(ST[1,1]))
        for(i in 1:nrow(ST)){
          if(ST[i,1]==1)
            points(ST[i,2],0,col="red",pch=4)
          else
            points(ST[i,2],0,col="blue",pch=4)
        }
    }
  )

  GOALTIME <- function(){
    gt <- gt[gt[,1]==ID(),3:6]
    if(is.na(gt[1,1])) return()
    rownames(gt) <- 1:nrow(gt)
    colnames(gt) <- c("TEAM","F or S","TIME","GOAL or OWN")
    return(gt)
  }
  output$HOTZONE <- reactivePlot(
    function(){
      data <- soccer[soccer[,1]==ID(),]
      vs <- team[row.names(team)==ID(),]
      goal <- goal[goal[,1]==ID(),]
      owngoal <- owngoal[owngoal[,1]==ID(),]
      data <- rbind(data[4:9],goal[3:8],owngoal[3:8])
      hotzone <- data[,input$TIME]
      point <- hotzone[49:50]
      opoint <- hotzone[51:52]
      source("HZ46DM.R")
      HZ46DM(hotzone,point,opoint,vs)
    })
  output$GOALTIME <- renderTable(
    GOALTIME()
  )
})
