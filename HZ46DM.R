HZ46DM <- function(data,point,opoint,team){
  data[is.na(data)] <- 0
  total <- numeric(24)
  for(i in 1:24) total[i] <- data[i]+data[24+i]
  ratio <- total/sum(total)
  control <- data[1:24]/total
  control[is.na(control)] <- 0
  control[25] <- sum(data[1:24])/sum(total)
  Sdata <- c(ratio,control)
  teamname=team[,3]
  oteamname=team[,6]
  
  opar<-par()
  par(mai=c(0,0,0,0))
  plot(0,0,xlim=c(0,14),ylim=c(0,12),type="n",ann=FALSE,axes=F)
  lines(c(7,7),c(9.7,11.3))
  rect(1,1,13,9)
  rect(3,10,11,11)
  opponent.s <- 1-Sdata[49]
  swd <- 3+ 8*opponent.s
  text(7,12,paste(teamname,"vs",oteamname),adj=c(0.5,0.5))
  rect(3,10,swd,11,col=rgb(0,0,1))
  rect(swd,10,11,11,col=rgb(1,0,0))
  text(2.5,10.5,oteamname,adj=c(1,NA))
  text(2.5,11,point[2]+opoint[1],adj=c(0,NA))
  text(11.5,10.5,teamname,adj=c(0,NA))
  text(11.5,11,point[1]+opoint[2],adj=c(0,NA))
  text(3,9.5,paste(round((1-Sdata[49])*100,1),"%",sep=""),adj=c(0,NA))
  text(11,9.5,paste(round(Sdata[49]*100,1),"%",sep=""),adj=c(1,NA))
  zoneg <- Sdata[1:24]
  zg<-zoneg/max(zoneg)*0.5
  rect(1,1,3,3,col=gray(1-zg[1]))
  rect(1,3,3,5,col=gray(1-zg[2]))
  rect(1,5,3,7,col=gray(1-zg[3]))
  rect(1,7,3,9,col=gray(1-zg[4]))
  rect(3,1,5,3,col=gray(1-zg[5]))
  rect(3,3,5,5,col=gray(1-zg[6]))
  rect(3,5,5,7,col=gray(1-zg[7]))
  rect(3,7,5,9,col=gray(1-zg[8]))
  rect(5,1,7,3,col=gray(1-zg[9]))
  rect(5,3,7,5,col=gray(1-zg[10]))
  rect(5,5,7,7,col=gray(1-zg[11]))
  rect(5,7,7,9,col=gray(1-zg[12]))
  rect(7,1,9,3,col=gray(1-zg[13]))
  rect(7,3,9,5,col=gray(1-zg[14]))
  rect(7,5,9,7,col=gray(1-zg[15]))
  rect(7,7,9,9,col=gray(1-zg[16]))
  rect(9,1,11,3,col=gray(1-zg[17]))
  rect(9,3,11,5,col=gray(1-zg[18]))
  rect(9,5,11,7,col=gray(1-zg[19]))
  rect(9,7,11,9,col=gray(1-zg[20]))
  rect(11,1,13,3,col=gray(1-zg[21]))
  rect(11,3,13,5,col=gray(1-zg[22]))
  rect(11,5,13,7,col=gray(1-zg[23]))
  rect(11,7,13,9,col=gray(1-zg[24]))
  rect(1.3,1.3,3-0.3,3-0.3,col="white")
  rect(1.3,3.3,3-0.3,5-0.3,col="white")
  rect(1.3,5.3,3-0.3,7-0.3,col="white")
  rect(1.3,7.3,3-0.3,9-0.3,col="white")
  rect(3.3,1.3,5-0.3,3-0.3,col="white")
  rect(3.3,3.3,5-0.3,5-0.3,col="white")
  rect(3.3,5.3,5-0.3,7-0.3,col="white")
  rect(3.3,7.3,5-0.3,9-0.3,col="white")
  rect(5.3,1.3,7-0.3,3-0.3,col="white")
  rect(5.3,3.3,7-0.3,5-0.3,col="white")
  rect(5.3,5.3,7-0.3,7-0.3,col="white")
  rect(5.3,7.3,7-0.3,9-0.3,col="white")
  rect(7.3,1.3,9-0.3,3-0.3,col="white")
  rect(7.3,3.3,9-0.3,5-0.3,col="white")
  rect(7.3,5.3,9-0.3,7-0.3,col="white")
  rect(7.3,7.3,9-0.3,9-0.3,col="white")
  rect(9.3,1.3,11-0.3,3-0.3,col="white")
  rect(9.3,3.3,11-0.3,5-0.3,col="white")
  rect(9.3,5.3,11-0.3,7-0.3,col="white")
  rect(9.3,7.3,11-0.3,9-0.3,col="white")
  rect(11.3,1.3,13-0.3,3-0.3,col="white")
  rect(11.3,3.3,13-0.3,5-0.3,col="white")
  rect(11.3,5.3,13-0.3,7-0.3,col="white")
  rect(11.3,7.3,13-0.3,9-0.3,col="white")
  zs <- (Sdata[25:48]-0.5)*2
  gcol=matrix(rep(0,72),24,3)
  for(i in 1:24) if(zs[i]>0){ gcol[i,]=c(1,0,0) }else{ gcol[i,]=c(0,0,1) }
  rect(1.3,1.3,3-0.3,3-0.3,col=rgb(gcol[1,1],gcol[1,2],gcol[1,3],alpha=abs(zs[1])))
  rect(1.3,3.3,3-0.3,5-0.3,col=rgb(gcol[2,1],gcol[2,2],gcol[2,3],alpha=abs(zs[2])))
  rect(1.3,5.3,3-0.3,7-0.3,col=rgb(gcol[3,1],gcol[3,2],gcol[3,3],alpha=abs(zs[3])))
  rect(1.3,7.3,3-0.3,9-0.3,col=rgb(gcol[4,1],gcol[4,2],gcol[4,3],alpha=abs(zs[4])))
  rect(3.3,1.3,5-0.3,3-0.3,col=rgb(gcol[5,1],gcol[5,2],gcol[5,3],alpha=abs(zs[5])))
  rect(3.3,3.3,5-0.3,5-0.3,col=rgb(gcol[6,1],gcol[6,2],gcol[6,3],alpha=abs(zs[6])))
  rect(3.3,5.3,5-0.3,7-0.3,col=rgb(gcol[7,1],gcol[7,2],gcol[7,3],alpha=abs(zs[7])))
  rect(3.3,7.3,5-0.3,9-0.3,col=rgb(gcol[8,1],gcol[8,2],gcol[8,3],alpha=abs(zs[8])))
  rect(5.3,1.3,7-0.3,3-0.3,col=rgb(gcol[9,1],gcol[9,2],gcol[9,3],alpha=abs(zs[9])))
  rect(5.3,3.3,7-0.3,5-0.3,col=rgb(gcol[10,1],gcol[10,2],gcol[10,3],alpha=abs(zs[10])))
  rect(5.3,5.3,7-0.3,7-0.3,col=rgb(gcol[11,1],gcol[11,2],gcol[11,3],alpha=abs(zs[11])))
  rect(5.3,7.3,7-0.3,9-0.3,col=rgb(gcol[12,1],gcol[12,2],gcol[12,3],alpha=abs(zs[12])))
  rect(7.3,1.3,9-0.3,3-0.3,col=rgb(gcol[13,1],gcol[13,2],gcol[13,3],alpha=abs(zs[13])))
  rect(7.3,3.3,9-0.3,5-0.3,col=rgb(gcol[14,1],gcol[14,2],gcol[14,3],alpha=abs(zs[14])))
  rect(7.3,5.3,9-0.3,7-0.3,col=rgb(gcol[15,1],gcol[15,2],gcol[15,3],alpha=abs(zs[15])))
  rect(7.3,7.3,9-0.3,9-0.3,col=rgb(gcol[16,1],gcol[16,2],gcol[16,3],alpha=abs(zs[16])))
  rect(9.3,1.3,11-0.3,3-0.3,col=rgb(gcol[17,1],gcol[17,2],gcol[17,3],alpha=abs(zs[17])))
  rect(9.3,3.3,11-0.3,5-0.3,col=rgb(gcol[18,1],gcol[18,2],gcol[18,3],alpha=abs(zs[18])))
  rect(9.3,5.3,11-0.3,7-0.3,col=rgb(gcol[19,1],gcol[19,2],gcol[19,3],alpha=abs(zs[19])))
  rect(9.3,7.3,11-0.3,9-0.3,col=rgb(gcol[20,1],gcol[20,2],gcol[20,3],alpha=abs(zs[20])))
  rect(11.3,1.3,13-0.3,3-0.3,col=rgb(gcol[21,1],gcol[21,2],gcol[21,3],alpha=abs(zs[21])))
  rect(11.3,3.3,13-0.3,5-0.3,col=rgb(gcol[22,1],gcol[22,2],gcol[22,3],alpha=abs(zs[22])))
  rect(11.3,5.3,13-0.3,7-0.3,col=rgb(gcol[23,1],gcol[23,2],gcol[23,3],alpha=abs(zs[23])))
  rect(11.3,7.3,13-0.3,9-0.3,col=rgb(gcol[24,1],gcol[24,2],gcol[24,3],alpha=abs(zs[24])))
  par(opar)
}
