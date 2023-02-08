# Conway's Game Of Life

This package is a fun project as part of my first attempt to create a R package using [roxygen2](https://roxygen2.r-lib.org).
I decided to do so by implementing the famous [Conway's Game Of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

I decided to tackle it slightly differently than what I've done in the past. Instead of using a matrix that gets updated at every step, I decided to just update the "Z" values, meaning to calculate the cells as being part of a simple list (in the future I might optimize it by using vectors instead). That's because the "X" and "Y" coordinates stay the same.

In the package, there are two functions:
- calc_game_of_life
- draw_game_of_life

The calc_game_of_life calculates the Z values by specifying n_size (rectangular, so that determines both X and Y coordinates),
over desired number of iterations (n_generations).

The draw_game_of_life one than takes the output calculated by calc_game_of_life and draws simple graphs (potentially
to do, create an animation instead).
