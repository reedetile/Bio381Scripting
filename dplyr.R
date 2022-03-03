# dplyr
# RCS
#  03/02/22

#What is dplyr?
#newish. provides tool for manipulatingdata in R
# part of tidyverse package
#fast!
#individual functions correspond to most common operations

###Core Verbs

#filter(): pixk/subset observation by their values (rows)
#arrange(): reorders rows
# select(): choose variables(colums) by names
# mutate(): creates new variables w/ functions of existing vars
#summarise() and grou_by(): collapses many values down to a single summary

library(tidyverse)
data("starwars")
class(starwars)

#tbl = tibble. A modern take on dataframes. Which keeps great aspects of data frames, and drops frustrating ones
glimpse(starwars)
head(starwars)
starwarsClean <- starwars[complete.cases(starwars[,1:10]),]
is.na(starwarsClean)
anyNA(starwars)
anyNA(starwarsClean) #tells you if there are any NAs in your dataset

head(starwarsClean) #no nas

########filter()
#filter() subsets by rows
#can use <, >, >=, <=, !=, ==
#uses logical operators &, |, and !
#filter automatically excludes NAs

filter(starwarsClean, gender == 'masculine' & height < 180)
filter(starwarsClean, gender == 'masculine', height < 180) #commas can also be used

filter(starwarsClean, eye_color %in% c('blue', 'brown')) # %in% tells you what variable to look in?

########arrange()
# reorders rows
arrange(starwarsClean, by=desc(height))
arrange(starwarsClean, height, desc(mass))
tail(arrange(starwars, by = height)) #shows that NAs are put at end

####### select()
#chooses variables by their names (columns)
#these all do the same thing

starwarsClean[,1:10]
select(starwarsClean, 1:10)
select(starwarsClean, name:homeworld) #can use names of columns instead of number
select(starwarsClean, -(films:starships))
select(starwarsClean, !(films:starships)) #shows all columns except films:starships

##rearranging columns
select(starwarsClean, name,gender,species,everything())
#everything() #everything helper function: everything else goes after
select(starwarsClean, contains('color')) #reads column name and displays all columns that match contains criteria

#other helper functions: ends_with(),starts_with(),matches(),num_range()

##can use select to rename columns
select(starwarsClean, haircolor = hair_color, everything())

#mutate()
#creates new variables w/ functions of existing variables
mutate(starwarsClean, ratio = height/mass)
starwars_lbs <- mutate(starwarsClean, mass_lbs = mass*2.2)
select(starwars_lbs, 1:3, mass_lbs, everything())

#transmute
transmute(starwarsClean, mass_lbs = mass*2.2)

##################
#summarize() and group_by() collapses values and provides summary
summarize(starwarsClean, meanheight = mean(height))
summarize(starwars, meanheight = mean(height, na.rm = TRUE), totalN = n())

#group_by
starwarsGender <- group_by(starwars, gender)
head(starwarsGender)
summarize(starwarsGender, meanheight = mean(height, na.rm=T), N = n())

###########
#Piping!!!
#used to emphasize a sequence of actions
#lets you pass an intermediate result onto the next function- it takes the output of one statement/function and uses it as the input of the next statement/function
#avoid when manipulating more than one object or if you have meaningful intermediate objects
#formatting always have a space before pipe %>% and usually followed by a new line (with auto indent)
starwarsClean %>%
  group_by(gender) %>%
  summarize(meanheight = mean(height), number = n())
#case_when() useful for multiple ifelse statements
ifelse(starwarsClean$gender == 'feminine','F','M')

starwarsClean %>%
  mutate(sp = case_when( species == 'Human' ~ 'Humanoid', TRUE ~ 'Non-human')) %>%
  select(name,sp,everything())


#####Converting long to wide and vice versa
glimpse(starwarsClean)
#what if we wanted to seperate 
wideSW <- starwarsClean %>%
  select(name,sex,height) %>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)

wideSW %>% 
  pivot_longer(cols = male:female, names_to = 'sex', values_to = 'height', values_drop_na = TRUE)

#### one more example
starwars %>% 
  select(name,homeworld) %>%
  group_by(homeworld) %>%
  mutate(rn = row_number())%>%
  ungroup()%>%
  pivot_wider(names_from = homeworld, values_from = name)%>%
  select(-rn)
