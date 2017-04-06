shinyServer(function(input, output, session) {
  session$onSessionEnded(function() {
    dbDisconnect(con)
  })
  
  currentStage = reactivePoll(20000,session,
                              function(){
                                rs <- dbSendQuery(con, "SELECT `stage` FROM `stage` WHERE `id` = 1;")
                                data <- fetch(rs)
                                dbClearResult(rs)
                                return(data[['stage']])
                              },
                              function(){
                                rs <- dbSendQuery(con, "SELECT `stage` FROM `stage` WHERE `id` = 1;")
                                data <- fetch(rs)
                                dbClearResult(rs)
                                return(data[['stage']])
                              })
  
  output$generalHolder = renderUI({
    if(currentStage() == 0){
      column(12,
        div(h1('Registration is Upstairs'),align='center',class='text-danger'),
        div(h2('No one down here can register you!'),align='center'),
        hr(),
        div(h1('Event begins at 10:30am'),align='center',class='text-success')
      )
    } else if(currentStage() == 1){
      column(12,
             column(12,div(h1(paste0("Tri-Cities ASME Egg Drop ",year(Sys.Date()))),align='center')),
             column(6,
                    h2('Recent Drops:'),
                    DT::dataTableOutput('recentDrops'),
                    hr(),
                    h2('How many eggs have broken?'),
                    plotOutput('broken')
             ),
             column(6,
                    h2("To qualify for the final round, your score must be less than or equal to:"),
                    DT::dataTableOutput('score2beat'),
                    hr(),
                    div(
                      h2("Where have the eggs been landing?"),
                      plotOutput('dropmap'),
                      align='center'
                    )
             )     
      )
    } else if(currentStage() == 2){
      column(12,
             div(h1('We are currently determing the finalists'),align='center',class='text-success'),
             div(h2('Thank you everyone for participating in Round 1'),align='center')
      )
    } else if(currentStage() == 3){
      column(12,
             column(12,div(h1(paste0("Tri-Cities ASME Egg Drop ",year(Sys.Date())," Finals")),align='center')),
             column(8,
                    h2('Recent Drops:'),
                    DT::dataTableOutput('finalDrops'),
                    hr(),
                    h2('How many eggs have broken?'),
                    plotOutput('finalBroken')
             ),
             column(4,
                    div(
                      h2("Where have the eggs been landing?"),
                      plotOutput('finalMap'),
                      align='center'
                    )
             )     
      )
    } else if(currentStage() == 4){
      column(12,
             div(h1('Congratulations to the Winners!'),align='center',class='text-success'),
             div(h2('We look forward to seeing you next year!'),align='center')
      )
    }
  })
   
  recentDrops = reactivePoll(5000,session,
               function(){
                 if(currentStage() != 1) return(0)
                 rs <- dbSendQuery(con, "SELECT max(time) as `a` FROM `drops` where YEAR(time) = YEAR(current_date);")
                 data <- fetch(rs)
                 dbClearResult(rs)
                 data[['a']]
               },function()
               {
                 if(currentStage() != 1) return(0)
                 rs = dbSendQuery(con,
                      "select (case `tname` when '' then concat(`fname`,' ',`lname`) else `tname` end) as `Name`, 
                      `cat` as `catSort`,
                      `label` as `Category`, 
                      `score` as `Score`, 
                      `zone`,
                      `cracked` 
                      from (select uid, cracked,`zone`, `time`, (30.0*(`dweight`-`eweight`)/89.0+40.0*`zone`/10.0) as `score` from `drops` where `round` = 1 and year(`time`) = year(CURRENT_DATE)) as `s` 
                      left join `people` as `p` on `s`.`uid` = `p`.`uid` 
                      left join `categories` as `c` on `p`.`cat` = `c`.`cid`
                      order by `time` desc"
                      )
                 data = fetch(rs)
                 dbClearResult(rs)
                 return(data)
               })
  
  output$recentDrops = DT::renderDataTable({
    rd = recentDrops()
    rd %<>% 
      mutate(Score = ifelse(cracked == 0,base::sample(brokenEgg,nrow(.),replace=T),round(Score,1))) %>% 
      select(-cracked,-catSort,-zone)
    rd[1:min(nrow(rd),7),]
  },rownames=F,options=list(searching=F,paging=F))
  
  output$score2beat = DT::renderDataTable({
    rd = recentDrops()
    rd %<>%
      filter(cracked == 1) %>% 
      group_by(Category,catSort) %>% 
      mutate(n = n()) %>% 
      top_n(3,Score) %>% 
      summarise(Threshold = as.character(round(max(Score),2)), n = mean(n)) %>% 
      arrange(catSort) %>% 
      select(-catSort)
    data_frame(Category = c('Team','Elementary School','Middle School','High School','Adult')) %>% 
      left_join(rd,by="Category") %>% 
      mutate(Threshold = ifelse(is.na(Threshold) | n < 3,"Anybody's Game!",Threshold)) %>% 
      select(-n)
  },rownames=F,options=list(searching=F,paging=F))
  
  output$broken = renderPlot({
    rd = recentDrops() %>% 
      group_by(Category) %>% 
      summarise(percBroken = 1-mean(cracked))
    cats = data_frame(Category = c('Team','Elementary School','Middle School','High School','Adult')) %>% 
      left_join(rd,by="Category") %>% 
      mutate(Category = factor(Category,levels=c('Team','Elementary School','Middle School','High School','Adult'))) %>% 
      mutate(percBroken = ifelse(is.na(percBroken),0,percBroken))
    ggplot(cats,aes(x=Category,y=percBroken)) + 
      geom_col() +
      scale_y_continuous(labels = scales::percent, name = "Percent of Eggs Broken",breaks=seq(0,1,.2),limits=c(0,1))
  })
  
  output$dropmap = renderPlot({
    rd = recentDrops()
    zones = data_frame(zone = 1:12)
    pd = rd %>% 
      group_by(zone) %>% 
      summarise(n=n()/nrow(.)) %>% 
      ungroup()
    zones %<>%
      left_join(pd,by="zone") %>% 
      mutate(n = ifelse(is.na(n),0,n)) %>% 
      mutate(n = n/sum(n)) %>% 
      mutate(x0 = 0,y0 = 0,r=12:1)
    ggplot() +
      theme(axis.title = element_blank(),
            axis.ticks = element_blank(),
            axis.line = element_blank(),
            axis.text = element_blank(),
            panel.background = element_blank(),
            legend.key = element_blank()) +
      geom_circle(aes(x0=x0,y0=y0,r=r,fill=n),data=zones,color='grey') + 
      scale_fill_gradient(low = "#FFFFFF",high="#FF4500",guide=FALSE)
  },width=400)
  
  finalDrops = reactivePoll(5000,session,
                             function(){
                               if(currentStage() != 3) return(0)
                               rs <- dbSendQuery(con, "SELECT max(time) as `a` FROM `drops` where YEAR(time) = YEAR(current_date);")
                               data <- fetch(rs)
                               dbClearResult(rs)
                               data[['a']]
                             },function()
                             {
                               if(currentStage() != 3) return(0)
                               rs = dbSendQuery(con,
                                                "select (case `tname` when '' then concat(`fname`,' ',`lname`) else `tname` end) as `Name`, 
                      `cat` as `catSort`,
                      `label` as `Category`, 
                      `score` as `Score`, 
                      `zone`,
                      `cracked` 
                      from (select uid, cracked,`zone`, `time`, (30.0*(`dweight`-`eweight`)/89.0+30.0*`nparts`+40.0*`zone`/10.0) as `score` from `drops` where `round` = 2 and year(`time`) = year(CURRENT_DATE)) as `s` 
                      left join `people` as `p` on `s`.`uid` = `p`.`uid` 
                      left join `categories` as `c` on `p`.`cat` = `c`.`cid`
                      order by `time` desc"
                               )
                               data = fetch(rs)
                               dbClearResult(rs)
                               return(data)
                             })
  output$finalDrops = DT::renderDataTable({
    rd = finalDrops()
    rd %<>% 
      mutate(Score = ifelse(cracked == 0,base::sample(brokenEgg,nrow(.),replace=T),round(Score,1))) %>% 
      select(-cracked,-catSort,-zone)
    rd[1:min(nrow(rd),5),]
  },rownames=F,options=list(searching=F,paging=F))
  
  output$finalBroken = renderPlot({
    rd = finalDrops() %>% 
      group_by(Category) %>% 
      summarise(percBroken = 1-mean(cracked))
    cats = data_frame(Category = c('Team','Elementary School','Middle School','High School','Adult')) %>% 
      left_join(rd,by="Category") %>% 
      mutate(Category = factor(Category,levels=c('Team','Elementary School','Middle School','High School','Adult'))) %>% 
      mutate(percBroken = ifelse(is.na(percBroken),0,percBroken))
    ggplot(cats,aes(x=Category,y=percBroken)) + 
      geom_col() +
      scale_y_continuous(labels = scales::percent, name = "Percent of Eggs Broken",breaks=seq(0,1,.2),limits=c(0,1))
  })
  
  output$finalMap = renderPlot({
    rd = finalDrops()
    zones = data_frame(zone = 1:12)
    pd = rd %>% 
      group_by(zone) %>% 
      summarise(n=n()/nrow(.)) %>% 
      ungroup()
    zones %<>%
      left_join(pd,by="zone") %>% 
      mutate(n = ifelse(is.na(n),0,n)) %>% 
      mutate(n = n/sum(n)) %>% 
      mutate(x0 = 0,y0 = 0,r=12:1)
    ggplot() +
      theme(axis.title = element_blank(),
            axis.ticks = element_blank(),
            axis.line = element_blank(),
            axis.text = element_blank(),
            panel.background = element_blank(),
            legend.key = element_blank()) +
      geom_circle(aes(x0=x0,y0=y0,r=r,fill=n),data=zones,color='grey') + 
      scale_fill_gradient(low = "#FFFFFF",high="#FF4500",guide=FALSE)
  },width=400)
})
