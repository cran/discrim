% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/discrim_linear.R
\name{discrim_linear}
\alias{discrim_linear}
\title{Linear discriminant analysis}
\usage{
discrim_linear(
  mode = "classification",
  engine = "MASS",
  penalty = NULL,
  regularization_method = NULL
)
}
\arguments{
\item{mode}{A single character string for the type of model. The only
possible value for this model is "classification".}

\item{engine}{A single character string specifying what computational engine to use
for fitting.}

\item{penalty}{An non-negative number representing the amount of
regularization used by some of the engines.}

\item{regularization_method}{A character string for the type of regularized
estimation. Possible values are: "\code{diagonal}", "\code{min_distance}",
"\code{shrink_cov}", and "\code{shrink_mean}" (\code{sparsediscrim} engine only).}
}
\description{
\code{discrim_linear()} defines a model that estimates a multivariate
distribution for the predictors separately for the data in each class
(usually Gaussian with a common covariance matrix). Bayes' theorem is used
to compute the probability of each class, given the predictor values.

There are different ways to fit this model. See the engine-specific pages
for more details:

\Sexpr[stage=render,results=rd]{parsnip:::make_engine_list("discrim_linear", "discrim")}

More information on how \pkg{parsnip} is used for modeling is at
\url{https://www.tidymodels.org/}.
}
\details{
This function only defines what \emph{type} of model is being fit. Once an engine
is specified, the \emph{method} to fit the model is also defined.

The model is not trained or fit until the \code{\link[=fit.model_spec]{fit.model_spec()}} function is used
with the data.
}
\examples{
parabolic_grid <-
  expand.grid(X1 = seq(-5, 5, length = 100),
              X2 = seq(-5, 5, length = 100))

lda_mod <-
  discrim_linear(penalty = .1) \%>\%
  set_engine("mda") \%>\%
  fit(class ~ ., data = parabolic)

parabolic_grid$lda <-
  predict(lda_mod, parabolic_grid, type = "prob")$.pred_Class1

library(ggplot2)
ggplot(parabolic, aes(x = X1, y = X2)) +
  geom_point(aes(col = class), alpha = .5) +
  geom_contour(data = parabolic_grid, aes(z = lda), col = "black", breaks = .5) +
  theme_bw() +
  theme(legend.position = "top") +
  coord_equal()
}
\references{
\url{https://www.tidymodels.org}, \href{https://www.tmwr.org}{\emph{Tidy Models with R}}
}
\seealso{
\Sexpr[stage=render,results=rd]{parsnip:::make_seealso_list("discrim_linear", "discrim")}
}
