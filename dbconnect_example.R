library(RMySQL)
con <- dbConnect(MySQL(),
                 user="username", password="password",
                 dbname="db", host="remote_ip")
