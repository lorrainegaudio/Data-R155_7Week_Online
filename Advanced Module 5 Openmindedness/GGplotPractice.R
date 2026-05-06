#GGplot start typing theme... and you'll get a lot of options

library(ggplot2)
library(ggpubr)
library(RColorBrewer)

ggplot(mtcars, aes(x = wt, y = mpg, color = as.factor(cyl))) +
  geom_point() + 
  geom_smooth(method = "lm", fill = NA) + #fill = NA gets rid of SE shading
  stat_regline_equation(label.y = c(10, 11, 12), #c(10, 11, 12) offsets the R^2 of each group
                        aes(label = ..rr.label..), 
                        show.legend = F) + 
  labs(color = "Cylinders", y = "Miles per Gallon", x = "Weight")

ggplot(mtcars,
       aes(x = as.factor(cyl),
           y = mpg, 
           color = as.factor(am))) +
  geom_boxplot() +
  stat_compare_means(method = "t.test", show.legend = F) + 
  stat_summary(fun = "mean", 
               show.legend = F,
               geom = "text",
               position = position_dodge(width = 3), #Puts the mean label somewhere readable.
               aes(label = paste("mean = ", round(..y.., 2)))) #slapping on the mean ..y.. is used for labeling mean of y

ggplot(mtcars,
       aes(x = mpg, fill = as.factor(am))) + 
  geom_histogram(binwidth = 5, 
                 alpha = .6, position = "identity")#Alpha and "identity" make the colors see-through.

ggplot(PlantGrowth,
       aes(x = group, y = weight)) +
  geom_boxplot() +
  stat_compare_means(method = "anova")

ggplot(chickwts, aes(x = feed, y = weight, fill = feed)) + #color and fill can be a repeat to distinguish with colors.
         stat_summary(geom = "bar",
                      fun = mean,
                      show.legend = F,      #A legend becomes redundant here.
                      position = "dodge") + #another way to add bars
         stat_summary(geom = "errorbar",
                      fun.data = mean_se,
                      fun.args=list(mult=1.96), ##MAKING REAL ERROR BARS
                      position = "dodge",
                      width = .5) +              #Change width of error bars
         stat_summary(aes(label = round(..y.., 2)),
                      fun = mean,
                      geom = "text",
                      position = position_nudge(y = -100)) #Setting the mean label to below the error bars.

##INTERACTION PLOT
ggplot(mtcars, aes(x = factor(am),
                   y = mpg,
                   color = as.factor(cyl),
                   group = as.factor(cyl))) +
stat_summary(geom = "line",
             fun = "mean")


ggplot(Given_to_Co_Religionists, aes(x = Given_to, y = Number_of_coins, color = TREATMENT)) +
  geom_boxplot() +
  stat_summary(fun = "mean", show.legend = F, geom = "text", position = position_dodge(.7), vjust = 1.2,
               aes(label = paste("Mean = ", round(..y.., 2))))

