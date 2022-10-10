if(!require(tidyverse)) install.packages("tidyverse")
if(!require(remotes)) install.packages("remotes")
if(!require(ggplot2)) install.packages("ggplot2")
remotes::install_github("fndemarqui/reglin")

library(tidyverse)
library(broom)
library(reglin)
library(ggplot2)

rocket_propellant <- tibble(s_stg=c(2158.70,1678.15,2316,2061.30,2207.50,
                                    1708.30,1784.70,2575,2357.9,2256.7,2165.2,
                                    2399.55,1779.8,2336.75,1765.3,2053.5,2414.4,
                                    2200.5,2654.2,1753.7), 
                            age_of_propellant=c(15.5,23.75,8,17,5.5,19,24,2.5,
                                                7.5,11,13,3.75,25,9.75,22,18,6,
                                                12.5,2,21.5))


model <- lm(age_of_propellant~s_stg, data=rocket_propellant)

ggplot(rocket_propellant, mapping=aes(x=age_of_propellant, y=s_stg)) +
  geom_point() +
  scale_x_continuous(breaks=seq(min(rocket_propellant$age_of_propellant),
                                max(rocket_propellant$age_of_propellant),2)) +
  scale_y_continuous(breaks=seq(1600,2700,100))

model_fit <- augment(model, data=rocket_propellant)
