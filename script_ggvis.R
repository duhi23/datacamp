##################################
#####  Cursos paquete ggvis  #####
##################################

# Welcome to your first interactive exercise on ggvis! ggvis is an R package, a collection of functions 
# and data sets that enhance the R language. You need to install and load ggvis before you can use it. 
# We already have ggvis installed for you, so you will just need to load ggvis.
# ggvis helps you visualize data sets. For example, the last command in the sample code on the right 
# visualizes the mtcars data frame that comes with R. It plots the wt variable (weight) of mtcars on the
# x axis and the mpg variable (miles per gallon) on the y axis, and it uses points to visualize the data.

# Load the ggvis package using the library() function.
library(ggvis)

# Change the sample code on the right to plot the disp variable of mtcars on the x axis. If you are not 
# familiar with the mtcars database, find out by typing ?mtcars in the console.
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()

# The ggvis interface is very intuitive. For example, check the first line of code on the right; you can 
# change the fill color of the points in your graph by adding fill := "blue". Or you can change the layer_points() 
# function in the second expression to the right to plot your data differently. You can even plot the same 
# data twice to make your graph more informative. The instructions below will give you a first idea of basic 
# plot manipulation; the exercises that follow will go into more detail.


# Change the first line of code to the right such that the resulting graph contains red points instead of 
# blue points.
mtcars %>% ggvis(~wt, ~mpg, fill := "red") %>% layer_points()

# Change the second line of code to draw smooths instead of points. A smooth is a smooth line that summarizes 
# the relationship between a set of points.
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Change the third line of code to draw the same information twice: once as points and once as a smoothed 
# summary line. You can do this by adding multiple layers to your plot.
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()

# ggvis recreates the grammar of graphics. You can combine a set of data, properties and marks with the 
# following format.
<data>  %>% 
      ggvis(~<x property>,~<y property>, 
            fill = ~<fill property>, ...) %>% 
      layer_<marks>()
# The next challenges depend on one another. Make sure you get the first assignment right before proceeding 
# to the next ones!

# Make a graph that uses the points mark to plot variables from the pressure data frame. The graph should 
# plot the temperature variable on the x axis, and the pressure variable on the y axis.
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points()

# Transform the plot you just created into a bar graph by changing the type of mark it uses.
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()

# Similarly, change the plot into a line graph, again by changing the type of mark it uses.
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# Again based on the solution to the first challenge, make an adaptation: map the fill property of your 
# scatterplot to the temperature variable
pressure %>% ggvis(~temperature, ~pressure, fill=~temperature ) %>% layer_points()

# Extend your solution to the previous challenge: map the size property to the pressure variable.
pressure %>% ggvis(~temperature, ~pressure, fill=~temperature, size=~pressure) %>% layer_points()



# You'll notice that ggvis uses the pipe operator, %>%, from the magrittr package. The pipe operator 
# passes the result from its left-hand side into the first argument of the function on its right-hand 
# side. So f(x) %>% g(y) is a shortcut for g(f(x), y).
# Next, ggvis uses both = and := to assign properties.
# = maps a property to a data value or a set of data values. This is how you visualize variation in your 
# data set. ggvis will scale the values to a pleasing range of colors (or sizes, widths, etc.) and add a 
# legend that explains how values are mapped to particular instances of the property.
# := sets a property to a specific color (or size, width, etc.). This is how you customize the appearance 
# of your plots. If you set a property to a number, ggvis will usually interpret the number as the number 
# of pixels. If you set a location property to a number, ggvis will usually interpret the number as the 
# number of pixels from the top left-hand corner of the plot. You can set the fill of points to any common 
# color name. ggvis passes your color selection to vega, a javascript library, so you can use any color 
# name recognized by HTML/CSS.


# The line of ggvis code on the right is valid, but is rather hard to read. Rewrite the code with the pipe 
# operator, %>%.
faithful %>% 
      ggvis(~waiting, ~eruptions) %>% 
      layer_points()

# Modify the second graph to map the size property to the pressure variable.
pressure %>% ggvis(~temperature, ~pressure, size = ~pressure) %>% layer_points()

# Modify the third graph to set the size property to 100 pixels. Each point should appear 100 pixels wide.
pressure %>% ggvis(~temperature, ~pressure, size := 100) %>% layer_points()

# The fourth line of code on the right attempts to make the points red, but something goes wrong. ggvis 
# maps the fill property of each point to the single data value "red". (And adds a legend to explain the 
# mapping). Fix the code to set the fill property to "red".
pressure %>% ggvis(~temperature, ~pressure, fill := "red") %>% layer_points()


# You can manipulate many different properties when using the points mark, including x, y, fill, fillOpacity, 
# opacity, shape, size, stroke, strokeOpacity, andstrokeWidth.
# The shape property in turn recognizes several different values: circle (default), square, cross, diamond, 
# triangle-up, and triangle-down.

# The first lines of code on the right map the fill property of a graph to a default collection of colors 
# and adds a legend to map the default colors to the labels in pressure$black. Change the code to directly 
# set the fills to the colors saved in pressure$black.
pressure$black <- c("black", "grey80", "grey50", 
                    "navyblue", "blue", "springgreen4", 
                    "green4", "green", "yellowgreen", 
                    "yellow", "orange", "darkorange", 
                    "orangered", "red", "magenta", "violet", 
                    "purple", "purple4", "slateblue")
pressure %>% 
      ggvis(~temperature, ~pressure, 
            fill := ~black) %>% 
      layer_points()

# Plot the faithful data with the points mark. Put the waiting variable on the x axis and the eruptions 
# variable on the y axis. Map size to the eruptions variable. Set the opacity to 0.5 (50%), the fill to 
# blue, and the stroke to black.
faithful %>% 
      ggvis(~waiting, ~eruptions, 
            size = ~eruptions, opacity := 0.5, 
            fill := "blue", stroke := "black") %>% 
      layer_points()

# Plot the faithful data with the points mark. Put the waiting variable on the x axis and the eruptions 
# variable on the y axis. Map fill opacity to the eruptions variable. Set size to 100, the fill to red, 
# the stroke to red, and the shape to cross.
faithful %>% 
      ggvis(~waiting, ~eruptions, 
            fillOpacity = ~eruptions, size := 100,  
            fill := "red", stroke := "red", shape := "cross") %>% 
      layer_points()


# In the previous section, you learned that you can manipulate many different properties when using the 
# points mark. This mark type responds to, among others, x, y, fill, fillOpacity, opacity, shape, size, 
# stroke, strokeOpacity, andstrokeWidth.
# Similar to points, lines have specific properties; they respond to: x, y, fill, fillOpacity, opacity, 
# stroke, strokeDash, strokeOpacity, and strokeWidth. As you can see, most of them are common to the 
# properties for points, some are missing (e.g., no size property) and others are new (e.g., strokeDash).

# Change the first line of code on the right to use the lines mark.
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# Change the code for the second graph on the right: Use the lines mark, set the line color to red, the 
# line width to 2 pixels, and the line type to use dashes that are six pixels long.
pressure %>% ggvis(~temperature, ~pressure, stroke:="red", strokeWidth:=2, strokeDash:=6) %>% layer_lines()

# The lines mark will always connect the points in your plot from the leftmost point to the rightmost point. 
# This can be undesirable if you are trying to plot a specific shape.
# For example, the first lines of code on the right would plot a map of Texas if ggvis connected the points 
# in the correct order. You can do this with the paths mark, layer_paths(). The paths mark is similar to the 
# lines mark except that it connects points in the order that they appear in the data set. So the paths mark 
# will connect the point that corresponds to the first row of the data to the point that corresponds to the 
# second row of data, and so on — no matter where those points appear in the graph.
# The second challenge will teach how to create a polygon in ggvis by setting the fill property of a line or path.

# The texas data frame is arranged such that consequent observations should be connected. Change the code 
# chunk on the right to plot Texas with paths.
library("maps")
texas <- ggplot2::map_data("state", region = "texas")
texas %>% ggvis(~long, ~lat) %>% layer_paths()

# Set the fill property of the texas map to dark orange ("darkorange"). You can start from the solution to 
# the first instruction. This additional property will color your map!
texas %>% ggvis(~long, ~lat, fill:="darkorange") %>% layer_paths() 

# compute_smooth() is a useful function to use with line graphs. It takes a data frame as input and returns 
# a new data frame as output. The new data frame will contain the x and y values of a smooth line fitted to 
# the data in the original data frame.
# For example, the code below computes a smooth line that shows the relationship between the eruptions and 
# waiting variables of the faithful data set.
faithful %>%
      compute_smooth(eruptions ~ waiting, model = "lm")

# Notice that compute_smooth() takes a couple of arguments. First we use the pipe operator to pass it the 
# data set faithful. Then we provide an R formula, eruptions ~ waiting. An R formula contains two variables 
# connected by a tilde, ~. compute_smooth() will use the variable on the left as the y variable for the smooth 
# line, and it will use the variable on the right as the x variable for the smooth line.
# Finally, compute_smooth() takes a model argument. This is the name of the R modelling function that 
# compute_smooth() should use to calculate the smooth line. lm() is R's function for building linear models. 
# If you do not supply a model value, compute_smooth() will generate a set of smoothed coordinates with loess.

# Use compute_smooth() to generate the x and y coordinates for a loess smooth line that predicts the mpg value 
# of mtcars with the wt value.      
mtcars %>% compute_smooth(mpg ~ wt)      

# compute_smooth() always returns a data set with two columns, one named pred_ and one named resp_. As a result, 
# it is very easy to use compute_smooth() to plot a smoothed line of your data. For example, you can extend your 
# code from the last exercise to plot the results of compute_smooth() as a line graph.
# Calling compute_smooth() can be a bit of a hassle, so ggvis includes a layer that automatically calls 
# compute_smooth() in the background and plots the results as a smoothed line. That layer is layer_smooths().      

# Extend the code on the right which you created in the last exercise to plot the results of compute_smooth() 
# with the lines mark. The plot should place pred_ on the x axis and resp_ on the y axis.
mtcars %>% compute_smooth(mpg ~ wt) %>% ggvis(~pred_, ~resp_) %>% layer_lines()

# Recreate the same graph by plotting mtcars with the smooths mark. Be sure to place wt on the x axis and mpg 
# on the y axis.
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Often you'll want to place the results of layer_smooths() on a points plot that contains the raw data. 
# Extend the code for the second plot on the right to use both layer_points() and layer_smooths().
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()


# A histogram - plotted using layer_histograms() - shows the distribution of a single continuous variable. 
# To do this, a histogram divides the x axis into evenly spaced intervals, known as bins. Above each bin, 
# the histogram plots a rectangle. The height of the rectangle displays how many values of the variable fell 
# within the range of the bin. As a result, the rectangles show how the frequency of values varies over the 
# range of the variable.
# You can change the appearance of a histogram by changing the width of the bins in the histogram. In fact, 
# you should explore different binwidths whenever you make a histogram because different binwidths can reveal 
# different types of information. To change the binwidth of a histogram, map the width argument of layer_histograms() 
# to a number.
# width is an argument of layer_histograms(). For best results, you should write the width argument in the 
# parentheses that follow layer_histograms(). Always map width to its value; This will ensure that it uses 
# the same units as the variable on the x axis.

# Make a histogram that shows the distribution of the waiting variable of the faithful data set. Look at the 
# plot to familiarize yourself with the structure of a histogram.
faithful %>% ggvis(~waiting) %>% layer_histograms()

# Starting from the solution to the first challenge, map the binwidth of this histogram to 5 units.
faithful %>% ggvis(~waiting) %>% layer_histograms(width = 5)

# Have you noticed that the histogram plots data that does not appear directly in your data set? Specifically, 
# it plots the counts of each bin on the y axis.
# Behind the scenes, layer_histograms() calls compute_bin() to calculate these counts. You can calculate the 
# same values by calling compute_bin() manually. compute_bin() requires at least two arguments: a data set 
# (which you will provide with the %>% syntax), and a variable name to bin on. You can also pass compute_bin() 
# a binwidth argument, just as you pass layer_histograms() a binwidth argument.
# compute_bin() returns a data frame that provides everything you need to build a histogram from scratch. 
# Notice the similarity with previous cases: combining compute_smooth() and layer_points() had the exact same 
# result as using layer_smooths() directly! Can you spot the analogy?

# Use compute_bin() to calculate the counts displayed in the graph on the right. What does your output look like?
faithful %>% compute_bin(~waiting, width=5)

# Combine the output of the solution to the first instruction with ggvis() and layer_rects() to plot a histogram. 
# layer_rects() plots simple rectangles. To use it, you need to pass ggvis() four properties: x, x2, y, and y2. 
# These should correspond to the minimum and maximum x values for each rectangle and the minimum and maximum y 
# values for each rectangle, respectively. Make sure to keep the binwidth (specified using width) equal to 5.
faithful %>% compute_bin(~waiting, width=5) %>% ggvis(x=~xmin_, x2=~xmax_, y=0, y2=~count_) %>% layer_rects()

# Density plots provide another way to display the distribution of a single variable. A density plot uses a 
# line to display the density of a variable at each point in its range. You can think of a density plot as a 
# continuous version of a histogram with a different y scale (although this is not exactly accurate).
# compute_density() takes two arguments, a data set and a variable name. It returns a data frame with two 
# columns: pred_, the x values of the variable's density line, and resp_, the y values of the variable's 
# density line.
# You can use layer_densities() to create density plots. Like layer_histograms() it calls the compute function 
# that it needs in the background, so you do not need to worry about calling compute_density().

# Use compute_density() and layer_lines() to make a density plot of the waiting variable in the faithful data set.
faithful %>% compute_density(~waiting) %>% ggvis(~pred_, ~resp_) %>% layer_lines()

# Use layer_densities() to create a density plot of the waiting variable of the faithful data set. Set the 
# fill of the density to green.
faithful %>% ggvis(~waiting) %>% layer_densities(fill := "green")

# You do not need to use a compute function to transform the variables in your data set. You can directly 
# plot transformations of the variables. To do this, use the ~ syntax to pass a transformed variable to ggvis. 
# For example, the first line of code in the editor on the right will plot a version of cyl that has been 
# transformed into a factor (R's version of a categorical variable).

# Complete the first line of code to plot a bar graph of the cyl factor.
mtcars %>% ggvis(~factor(cyl)) %>% layer_bars()

# layer_bars() will automatically plot count values on the y axis when you do not provide a y variable. To do 
# this, it uses compute_count(). Use compute_count() to calculate the count values used in the graph that you 
# coded to solve the first challenge. Do not plot anything for this part of the exercise.
mtcars %>% compute_count(~factor(cyl))


# The first line of code on the right uses the group_by() function from the dplyr package to plot two grouped 
# smooth lines. ggvis plots a separate smooth line for each unique value of the am variable (0 = automatic 
# transmission; 1 = manual transmission). Since group_by() does not come with the ggvis package, it does not 
# use the ~ syntax (although this may change in the future). You should just pass group_by() a variable name 
# without quotes.
# group_by() uses a grouping variable to organize a data set into several groups of observations. It places 
# each observation into a group with other observations that have the same value of the grouping variable. 
# In other words group_by() will create a separate group for each unique value of the grouping variable. When 
# ggvis encounters grouped data, it will draw a separate mark for each group of observations. But which mark 
# corresponds to which group?
# The challenges below will show you how to plot grouped data and how to make grouped graphs clearer by 
# additionally mapping a property to the grouping variable.

# Change the code to plot a unique smooth line for each value of the cyl variable. Note that you will also 
# need to change the stroke property from am to cyl. Make sure to use categorical versions of the variables 
# where needed.
mtcars %>% group_by(cyl) %>% ggvis(~mpg, ~wt, stroke = ~factor(cyl)) %>% layer_smooths()

# Refactor the code of the second graph such that it contains a separate density for each value of cyl.
mtcars %>% group_by(cyl) %>% ggvis(~mpg) %>% layer_densities()

# Copy and alter the solution to the second challenge to map the fill property to a categorical version of cyl. 
# This addition clarifies which density corresponds to which group of observations.
mtcars %>% group_by(cyl) %>% ggvis(~mpg, fill=~factor(cyl)) %>% layer_densities()

# group_by() can also group data based on the interaction of two or more variables. To group based on the 
# interaction of multiple variables, give group_by() multiple variable names, like this:
# <data> %>% group_by(<var1>, <var2>, <var3>, ...)
# group_by will create a separate group for each distinct combination of values within the grouping variables. 
# group_by() does not change the raw values of the data set. The grouping information is saved as an attribute 
# (e.g., metadata). You can remove the grouping information from a data set with ungroup() (e.g., mtcars %>% ungroup()).
#You can also map properties to unique combinations of variables. To do this, use the interaction() function. 
# For example,
#stroke = ~interaction(<var1>, <var2>, <var3>)
# will map stroke to the unique combinations of <var1>, <var2>, and <var3>.

# Alter the first graph in the editor so that it displays a separate density for each unique combination of cyl and am.
mtcars %>% group_by(cyl, am) %>% ggvis(~mpg, fill = ~factor(cyl)) %>% layer_densities()

# Update the second graph to map fill to the unique combinations of the grouping variables.
mtcars %>% group_by(cyl, am) %>% ggvis(~mpg, fill = ~interaction(cyl,am)) %>% layer_densities()


# The basics of interactive plots

# The first lines of code on the right make a basic interactive plot. The plot includes a select box that you 
# can use to change the shape of the points in the plot. If you ran this code inside the RStudio IDE, you'd get 
# an interactive plot, with visualizations that change on the fly. For the moment, the DataCamp editor only 
# supports static plots, with the interactions removed. The dynamic versions of this code - as they would appear 
# in RStudio - can be found on DataCamp's Shiny Server.
# You can make your plots interactive by setting a property to the output of an input widget. ggvis comes with 
# seven input widgets: input_checkbox(), input_checkboxgroup(), input_numeric(), input_radiobuttons(), input_select(), 
# input_slider(), and input_text(). By default, each returns their current value as a number or character string.


# Inspect the output of the first code chunk on the right. Visit the shiny app hosted at shiny.datacamp.com to 
# see and experiment with the interactive plot by changing the point shape.
faithful %>% 
      ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
            shape := input_select(label = "Choose shape:", 
                                  choices = c("circle", "square", "cross", "diamond", 
                                              "triangle-up", "triangle-down"))) %>% 
      layer_points()

# The first chunk of code sets shape to a select box created with input_select(). Copy this code and add a fill 
# property; set it equal to a select box that has the label "Choose color:" and provides the choices black, red, 
# blue, and green. The resulting interactive plot should look like this.
faithful %>% 
      ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
            shape := input_select(label = "Choose shape:", 
                                  choices = c("circle", "square", "cross", "diamond", 
                                              "triangle-up", "triangle-down")),
            fill:= input_select(label="Choose color:",
                                choices = c("black", "red", "blue", "green"))) %>% 
      layer_points()

# Add a group of radiobuttons to the last code chunk that controls the fill of the plot. Give the group the label 
# "Choose color:", and provide the choices black, red, blue, and green. You want to end up with this plot.
mtcars %>% 
      ggvis(~mpg, ~wt, fill:= input_radiobuttons(label="Choose color", choices=c("black", "red", "blue", "green"))) %>% 
      layer_points()


# Some input widgets provide choices for the user to select from. Others allow the user to provide their own 
# input. For example, input_text() provides a text field for users to type input into. Instead of assigning 
# input_text() a choices argument, you assign it a value argument: a character string to display when the plot 
# first loads.
# By default, input widgets return their values as character strings and numbers. To have a widget return its 
# value as a variable name, you need to add the extra argument map = as.name.
# For example, the text widget in the first challenge will pass the character string "black" to the fill argument, 
# which is useful for setting. If we add map = as.name to the arguments of input_text(), the widget would return 
# ~black which is useful for mapping (or would be if black were a real variable in mtcars):


# Change the radiobuttons widget in the first command on the right to a text widget that displays the initial 
# value "black". The wanted resulting plot can be found here.
mtcars %>% 
      ggvis(~mpg, ~wt, 
            fill := input_text(label = "Choose color:", value = "black")) %>% 
      layer_points()

# In the second graph on the right, map fill to a select box that returns variable names. The select box should 
# use the label "Choose fill variable:" and should offer the choices created by names(mtcars), as shown here. 
# Use the map argument inside input_select() to map the selection instead of setting it.
mtcars %>% 
      ggvis(~mpg, ~wt, 
            fill = input_select(label = "Choose fill variable:", 
                                choices = names(mtcars), map = as.name)) %>% 
      layer_points()


# The previous exercises all manipulated properties of the ggvis plots, such as the shape and fill of points 
# in scatterplots. As you will recall from earlier exercises, ggvis often needs additional parameters to build 
# the correct graphs. You can also use widgets to control these parameters. Typically, you want to use the 
# input_numeric() and input_slider() widgets to set numerical parameters.

# Change the first graph coded on the right to map the binwidth to a numeric field that uses the label "Choose 
# a binwidth:" and has a starting value of 1. The resulting plot should look like this.
mtcars %>% 
      ggvis(~mpg) %>% 
      layer_histograms(width = input_numeric(1, label = "Choose a binwidth:"))

# Change the second graph to map binwidth to a slider bar that uses the label "Choose a binwidth:" and has a 
# min value of 1 and a max value of 20. input_slider will place the initial value at (min + max) / 2. The plot 
# you want to create can be found here.
mtcars %>% 
      ggvis(~mpg) %>% 
      layer_histograms(width = input_slider(1, 20, value = 11, label="Choose a binwidth:"))


# Multi-layered plots and their properties

# You can create multi-layered plots by adding additional layers to a graph with the %>% syntax.
# If you set or map a property inside ggvis() it will be applied globally , every layer in the graph will use 
# the property. If you set or map a property inside a layer_<marks>() function it will be applied locally: 
# only the layer created by the function will use the property. Where applicable, local properties will override 
# global properties.

# Add a layer of points to the first graph on the right.
pressure %>% 
      ggvis(~temperature, ~pressure, stroke := "skyblue") %>% 
      layer_lines() %>% layer_points()

# Starting from the solution to the first instruction, build a second graph in which only the lines layer 
# uses a skyblue stroke.
pressure %>% 
      ggvis(~temperature, ~pressure) %>% 
      layer_lines(stroke := "skyblue") %>% layer_points()

# Global properties can cause trouble when you use multiple layers. For example, the code for the third graph 
# on the right causes an error since it applies the shape property to layer_lines, which does not use the shape 
# property. Rewrite the code so that only the points layer uses the shape property.
pressure %>% 
      ggvis(~temperature, ~pressure) %>% 
      layer_lines(stroke := "skyblue") %>% 
      layer_points(shape := "triangle-up")

# If you like, you can define every property at the local level, including the x and y mappings. However, your 
# code would not be very concise. As an example, consider the last graph that is coded on the right. Rewrite 
# it to use global properties where possible. Make the code as concise as possible, but make sure that it still 
# plots the same graph.
pressure %>% 
      ggvis(~temperature, ~pressure, stroke := "skyblue", strokeOpacity := 0.5, strokeWidth := 5) %>% 
      layer_lines() %>% 
      layer_points(fill = ~temperature, 
                   shape := "triangle-up", size := 300)

# layer_model_predictions() plots the prediction line of a model fitted to the data. It is similar to 
# layer_smooths(), but you can extend it to more models than just the "loess" or "gam" model.
# layer_model_predictions() takes a parameter named model; it should be set to a character string that contains 
# the name of an R model function. layer_model_predictions() will use this function to generate the model 
# predictions. So for example, you could draw the model line of a linear model with
# layer_model_predictions(model = "lm").
# Notice that model is a parameter, not a property. This means that you do not need to worry about setting vs. 
# mapping. You can always set parameters with the equal sign, =.

# Create a scatterplot of the pressure data set that has the temperature variable on the x axis and the pressure 
# variable on the y axis. Connect the points with a black line that has 50% opacity. Then add a linear model line 
# to the data that is navy in color. Then add a smooth line that is skyblue in color.
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points() %>% 
      layer_lines(stroke:="black", opacity := 0.5) %>% layer_model_predictions(model = "lm", stroke := "navy") %>%
      layer_smooths(stroke:="skyblue")


# Axes

# As Garrett explained in the video, axes help you to customize the plots you create with ggvis. add_axis() 
# allows you to change the titles, tick schemes and positions of your axes. The example code below clarifies:
      add_axis("x", 
               title = "x axis title", 
               values = c(1,2,3), 
               subdivide = 5,
               orient = "top")
# The title argument is rather straightforward, as it simply sets the title of the axis you specified in the 
# first argument.
# You can use the values argument of add_axis to determine where labelled tick marks will appear on each axis. 
# You can use the subdivide argument to insert unlabelled tick marks between the labelled tick marks on an axis.
# To control where an axis appears, use the orient argument. For example, the above code makes the x axis appear 
# on the "top" (and not on the "bottom") side of the graph. Similarly, you can have the y axis appear on the 
# "left" or "right" side of the graph.

# The code for the first graph on the right changes the title of the Y axis to "Duration of eruption (m)". Add to the code to change the title of the x axis to "Time since previous eruption (m)".
faithful %>% 
      ggvis(~waiting, ~eruptions) %>% 
      layer_points() %>% 
      add_axis("y", title = "Duration of eruption (m)") %>%
      add_axis("x", title = "Time since previous eruption (m)")
      
# The second code chunk places a labelled tick mark at each integer on the y axis and then inserts nine subdividing tickmarks between each integer. Add to the code to place a labelled tick mark at 50, 60, 70, 80, 90 on the x axis. Place nine subdividing tick marks between each labelled tick mark.
faithful %>% 
      ggvis(~waiting, ~eruptions) %>% 
      layer_points() %>% 
      add_axis("y", title = "Duration of eruption (m)", 
               values = c(2, 3, 4, 5), subdivide = 9) %>% 
      add_axis("x", title = "Time since previous eruption (m)",
               values = c(50, 60, 70, 80, 90), subdivide = 9)

# Change the sample code for the last graph: move the y axis to the right side of the plot. Move the x axis 
# to the top of the plot.
faithful %>% 
      ggvis(~waiting, ~eruptions) %>% 
      layer_points() %>%
      add_axis("y", orient = "right") %>%
      add_axis("x", orient = "top")


# Legends

# add_legend() works similarly to add_axis(), except that it alters the legend of a plot. Instead of specifying 
# which axis to change, you have to specify the property you want to add to the legend. For example
pressure %>% 
      ggvis(~temperature, ~pressure, fill = ~pressure) %>%
      layer_points() %>%
      add_legend("fill", title = "~ pressure")

# adds a legend to the graph that gives more information about the color of the points in the scatterplot.
# ggvis will create a separate legend for each property that you use. Often the results can be confusing. 
# For example, the second chunk of code on the right creates three separate legends. One for fill, one for shape, 
# and one for size - and it draws them each on top of each other.
# You can use add_legend() to combine multiple legends into a single legend. To do this, give add_legend() a 
# vector of property names as its first argument. For example, to combine a stroke legend with an opacity legend, 
# call add_legend(c("stroke", "opacity")). Similarly, you can specify the values property inside add_legend() to 
# explicitly set the visible legend values.

# Use add_legend() to change the title of the legend in the first plot on the right to "~ duration (m)" and to 
# orient the legend to the left side of the graph.
faithful %>% 
      ggvis(~waiting, ~eruptions, opacity := 0.6, 
            fill = ~factor(round(eruptions))) %>% 
      layer_points() %>%
      add_legend("fill", title = "~ duration (m)", orient = "left")

# Use add_legend() to combine the legends in the second plot. Also set the legend title to "~ duration (m)" and 
# specify that only the values 2, 3, 4, and 5 should receive a labelled symbol.
faithful %>% 
      ggvis(~waiting, ~eruptions, opacity := 0.6, 
            fill = ~factor(round(eruptions)), shape = ~factor(round(eruptions)), 
            size = ~round(eruptions)) %>% 
      layer_points() %>% 
      add_legend(c("fill", "shape", "size"), 
                 title = "~ duration (m)", values = c(2, 3, 4, 5))


# Scale types

# You can change the color scheme of a ggvis plot by adding a new scale to map a data set variable to fill 
# colors. The first chunk of code on the right creates a new scale that will map the numeric disp variable 
# to the fill property. The scale will create color output that ranges from red to yellow. Copy the code to 
# console, run it and be amazed.
# ggvis provides several different functions for creating scales: scale_datetime(), scale_logical(), scale_nominal(), 
# scale_numeric(), scale_singular(). Each maps a different type of data input to the visual properties that ggvis 
# uses. For example, the first two challenges below require scale_numeric() because the code maps a numeric variable 
# to a visual property.

# Add to the first chunk of code to make the stroke color range from "darkred" to "orange".
mtcars %>% 
      ggvis(~wt, ~mpg, fill = ~disp, stroke = ~disp, strokeWidth := 2) %>%
      layer_points() %>%
      scale_numeric("fill", range = c("red", "yellow")) %>%
      scale_numeric("stroke", range = c("darkred", "orange"))

# Change the second graph to make the fill colors range from green to beige.
mtcars %>% ggvis(~wt, ~mpg, fill = ~hp) %>%
      layer_points() %>%
      scale_numeric("fill", range = c("green", "beige"))

# The third code chunk on the right maps a categorical (e.g., nominal variable) to fill. Create a scale that will 
# map factor(cyl) to a new range of colors: purple, blue, and green. Since factor(cyl) has three unique values, 
# the range of your scale will need three unique color names.
mtcars %>% ggvis(~wt, ~mpg, fill = ~factor(cyl)) %>%
      layer_points() %>%
      scale_nominal("fill", range = c("purple", "blue", "green"))


# You can adjust any visual property in your graph with a scale (not just color). Let's look at another property 
# that you may frequently want to adjust.
# Often when you map a variable to opacity some data points will end up so transparent that they are hard to see, 
# as in the first plot in the editor on the right.
# Just as you can change the range of visual values that your scales produce, you can also change the domain of 
# data values that they consider. For example, you can expand the domain of the x and y scales to zoom out on 
# your plot. The second plot on the right will expand the y axis to cover data values from 0 to the largest y 
# value in the data set.

# Consider the first code chunk in the editor. Add a scale that limits the range of opacity from 0.2 to 1. Be 
# sure to consider whether hp is a datetime, logical, nominal, numeric, or singular value.
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), opacity = ~hp) %>%
      layer_points() %>%
      scale_numeric("opacity", range = c(0.2, 1))

# Read the code for the second graph carefully. Add a second scale that will expand the x axis to cover data 
# values from 0 to 6.
mtcars %>% ggvis(~wt, ~mpg, fill = ~disp) %>%
      layer_points() %>%
      scale_numeric("y", domain = c(0, NA)) %>%
      scale_numeric("x", domain = c(0, 6))

# Scales help explain the difference between = and :=. Variables tend to contain values in the data space, 
# things such as numbers measured in various units, datetimes, and so on. But properties need visual values, 
# things such as numbers measured in pixels, colors, opacity levels, and so on.
# Whenever you use = to map a variable to a property, ggvis will use a scale to transform the variable values 
# into visual values. Whenever you set a value (or variable) to a property with :=, ggvis will pass the value 
# on as is, without transforming it. For example, the code below passes "red" straight through to the visual 
# space to create a red fill:
      mtcars %>% 
      ggvis(x = ~wt, y = ~mpg, 
            fill := "red") %>% 
      layer_points()

# This can work nicely if the value passed through makes sense in the visual space, but it can have unfortunate 
# consequences if the value does not.

# The code on the right adds a new column to mtcars that contains valid color names. If you map fill to the 
# color column, ggvis transforms the color names into a new set of colors in the visual space. What would 
# happen if you set the fill value to the color variable? Make a prediction and then change and run the code 
# to find out.
mtcars$color <- c("red", "teal", "#cccccc", "tan")
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill := ~color) %>% layer_points()









