#' Calculate Alive or Dead Cells
#'
#' Function calculates which cells survive, are born or die over generations
#'
#' @param n_size one side of the grid (dimensions n_size * n_size).
#'
#' @param n_generations number of generations to simulate.
#'
#' @return List of cell values over generations.
#'
#' @examples
#' gol_100_10 <- calc_game_of_life(
#'   n_size=100,
#'   n_generations=10
#' )
#'
#' @export
calc_game_of_life <- function(n_size, n_generations) {

  # empty list of boards to start with
  boards_list <- list()

  # initial setting, randomly determined
  boards_list[[1]] <- floor(runif(n_size*n_size, min=0, max=2))

  # determines the 8 surrounding cells
  index_around <- c(-n_size -1,-n_size,-n_size + 1,-1,1, n_size-1,n_size,n_size+1)

  # main loop, over generations
  for (gen_num in 1:n_generations) {
    tmp_z <- vector(mode='double', length=0)

    # looping over all cells on current board
    for (cell_nr in seq_along(boards_list[[gen_num]])) {
      count_neighbor = 0

      # counting alive cells around a given cell
      for(i in index_around){
        if(cell_nr + i <= 0){
          count_neighbor = count_neighbor + boards_list[[gen_num]][cell_nr + i + n_size*n_size]
        } else if(cell_nr + i >= n_size*n_size +1) {
          count_neighbor = count_neighbor + boards_list[[gen_num]][cell_nr + i - n_size*n_size]
        } else {
          count_neighbor = count_neighbor + boards_list[[gen_num]][cell_nr + i]
        }
      }

      # determining if cell is alive or dead and storing in temporary variable
      if(boards_list[[gen_num]][cell_nr] == 1 & (count_neighbor == 2 | count_neighbor == 3)) {
        tmp_z <- append(tmp_z, 1)
      } else if (boards_list[[gen_num]][cell_nr] == 0 & count_neighbor == 3) {
        tmp_z <- append(tmp_z, 1)
      } else {
        tmp_z <- append(tmp_z, 0)
      }
    }

    # once all cells have been determined for next generation, save it to the list
    boards_list[[gen_num + 1]] <- tmp_z
  }

  return(boards_list)
}
