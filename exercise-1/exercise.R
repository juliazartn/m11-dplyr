# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
#devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
#library(fueleconomy)

# You should have have access to the `vehicles` data.frame
vehicles <- read.csv("~/Desktop/INFO 201/m11-dplyr/exercise-1/vehicles.csv", stringsAsFactors = FALSE)
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- vehicles[vehicles$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.20.miles <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20, ]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy.mpg <- two.wheel.20.miles$id[two.wheel.20.miles$hwy == min(two.wheel.20.miles$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
YearMake <- function(year, make) {
  vehicles.year <- vehicles[vehicles$year == year & vehicles$make == make,]
  id <- vehicles.year$id[vehicles.year$hwy == max(vehicles.year$hwy)]
  return (id)
}

# What was the most efficient honda model of 1995?
honda.1995 <- YearMake(1995, 'Honda')


