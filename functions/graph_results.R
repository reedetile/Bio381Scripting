#######################################################
# FUNCTION: graph_results - needs ggplot
# Purpuse:graph data and fitted ols line
#input: x and y numeric vectors of same length
#output: create ggplot graph
#-----------------------------------------------------
graph_results <- function(x_var = runif(10),
                          y_var = runif(10)) {
  dframe <- data.frame(x_var,y_var)
  reg_plot <- ggplot(data=dframe) +
    aes(x=x_var,y=y_var)+
    geom_point()+
    stat_smooth(method=lm,se=0.95)
  print(reg_plot)
  message('regression data plotted')
  ggsave(filename='reg_plot.pdf',
         plot=reg_plot,
         device='pdf')
}

