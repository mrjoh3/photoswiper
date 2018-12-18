
#' Title
#'
#' @param data data.frame with columns
#'  \itemize{
#'  \item{src}{: path to image}
#'  \item{w}{: width}
#'  \item{h}{: height}
#'  \item{msrc}{: path to image thumbnail}
#'  \item{title}{: image caption}
#' }
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
psr <- function(data, ...) {


  x <- list(
    slides = data,
    opt = opts
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'psr',
    x,
    width = width,
    height = height,
    package = 'photoswiper',
    sizingPolicy = htmlwidgets::sizingPolicy(
      #viewer.padding = 0,
      #viewer.paneHeight = 500,
      browser.fill = TRUE,
      viewer.fill = TRUE,
      knitr.defaultWidth = 800,
      knitr.defaultHeight = 400
    )
  )
}


photoswiper_html <- function() {
  htmltools::htmlTemplate('htmlwidgets/template.html')
}


#' Shiny bindings for photoswiper
#'
#' Output and render functions for using photoswiper within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a photoswiper
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name psr-shiny
#'
#' @export
PSROutput <- function(outputId, width = '100%', height = '100%'){
  htmlwidgets::shinyWidgetOutput(outputId, 'psr', width, height, package = 'photoswiper')
}

#' @rdname psr-shiny
#' @export
renderPSR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, PSROutput, env, quoted = TRUE)
}
