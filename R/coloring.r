new_coloring <- function(
  vertex_color_i,
  vertex_color_j,
  vertex_alpha_i,
  vertex_alpha_j,
  mix
  ) {

  function(e, i, j, n) {

    # Adjusting alpha levels
    col_i <- grDevices::adjustcolor(vertex_color_i[i], alpha.f = vertex_alpha_i[i])
    col_j <- grDevices::adjustcolor(vertex_color_i[j], alpha.f = vertex_alpha_j[j])

    # Linear combination between i and j
    mix <- mix[e]
    mix <- polygons::colorRamp2(c(col_i, col_j))(mix)

    # Returning
    grDevices::rgb(mix, alpha = mix[,4], maxColorValue = 255)

  }


}




get_vertex_gpar <- function(x, par, type, element) {

  if (missing(element))
    element <- c("line", "arrow")

  if (missing(idx))
    idx <- seq_len(x$.M)

}

get_gpar <- function(x, par, element, type, idx) {

  sapply(
    sprintf("%.%i", idx),
    function(i) {

      # Getting the component
      v <- x$children$graph$children[[i]]

      # If it exists
      if (!length(v))
        return(NA)

      if (!length(v$children[[element]]))
        return(NA)

      # And it has the element
      v <- v$children[[element]]$gp[[par]]

      if (length(v))
        return(v)

      NA


    }
  )

}

# N <- 20
# M <- 50
# X <- new_coloring(
#   viridis::viridis(N),
#   viridis::viridis(N),
#   rep(.5, N),
#   rep(.8, N),
#   rep(.5, M)
#   )
#
# # Updating to set a path from i to j
# barplot(1:5, col = X$col(4, 1, 1, 5))
# body(X$col)[[4]] <- bquote(mix <- seq(0, 1, length.out = n))
# barplot(1:5, col = X$col(4, 1, 1, 5))
#
# exists(as.character(substitute(x)))
#
# netplot_formulas <- new.env()
# netplot_formulas$ego <- function(x, alpha, prop, coloring) {
#
#   if (1 && is.character(x))
#     return(1)
#
#   0
#
# }
#
# body(X$col)[[2]][[3]] <- "blue"
# X
#
# netplot_formulas$ego(a)
