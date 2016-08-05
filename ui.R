load("HZ.RData")
#team <- read.csv("試合一覧表.csv",row.names=1)
shinyUI(
  pageWithSidebar(
    headerPanel("J-League Games"),
    sidebarPanel(
      selectInput("ID","GameID:",
                  choices = as.list(team[,7]),
                  selected = "2011091003 KASHIWA REYSOL vs NAGOYA GRAMPUS"
                  ,width="100%"),
      sliderInput("TIME",
                  "Timezone:",
                  1,6,1)
    ),
    mainPanel(
      plotOutput("HOTZONE"),
      plotOutput("POSSESSION"),
      tableOutput("GOALTIME")
    )
  )
)