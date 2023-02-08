#' Plot the different generations
#'
#' Function that displays a number of plots equal to the generations.
#' It requires the output generated from calc_game_of_life.
#'
#' @param n_size one side of the grid (dimensions n_size * n_size).
#'
#' @param n_generations number of generations of cells.
#'
#' @param board_list of values (alive or dead cells) obtained from calc_game_of_life.
#'
#' @return Number of plots equal to the number of generations.
#'
#' @examples
#' draw_game_of_life(
#'   n_size=100,
#'   n_generations=10,
#'   board_list= gameoflife:::calc_game_of_life(
#'     n_size=100,
#'     n_generations=10
#'     )
#' )
#'
#' @export
draw_game_of_life <- function(n_size, n_generations, board_list) {
  x <- 1:n_size
  y <- 1:n_size
  data <- expand.grid(X=x, Y=y)

  for (i in 1:n_generations) {
    print(ggplot2::ggplot(data, ggplot2::aes(X, Y, fill=board_list[[i]])) +
            ggplot2::geom_tile(show.legend = FALSE) +
            ggplot2::scale_fill_gradient(low="white", high="blue"))
  }
}
