#title-overview-widget img

library(rvest)
movie <- read_html("https://www.themoviedb.org/movie/567097-star-wars-goretech?language=nl-NL%22")

score <- 
  movie %>% 
  html_node(".user_score_chart") %>%
  html_attr("data-percent") %>%
  as.numeric()
score

omschrijving <- 
  movie %>%
  html_node(".overview") %>%
  html_text()

omschrijving

release <- 
  movie %>%
  html_node(".release") %>%
  html_text()
release

img <-
  movie %>% 
  html_nodes(".image_content img") %>% 
  html_attr("src")

img

download.file(paste0("https://themoviedb.org", img[1]), destfile = "moviestarwars.jpg")

session("https://www.themoviedb.org/movie/137106-the-lego-movie?language=nl-NL") %>% 
  session_jump_to(img[1])




