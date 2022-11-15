#' DNA methylation Beta values of various Gastric Cancer Patients.
#'
#' DNA Methylation Beta values collected from various methylation sites of
#' Gastric Cancer Patients.
#'
#' @source The Cancer Genome Atlas. TCGA
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{ID}{The identity of the Methylation site of the DNA}
#'  \item{TCGA-BR-4184-11A}{Identifier of sample used by TCGA.}
#'  \item{TCGA-BR-4253-11A}{Identifier of sample used by TCGA.}
#'  \item{TCGA-BR-4184-01A}{Identifier of sample used by TCGA.}
#'  \item{TCGA-BR-4187-01A}{Identifier of sample used by TCGA.}
#'  \item{TCGA-CG-4474-01A}{Identifier of sample used by TCGA.}
#'  \item{TCGA-BR-4201-01A}{Identifier of sample used by TCGA.}
#'  \item{TCGA-BR-4370-11A}{Identifier of sample used by TCGA.}
#' }
#' @examples
#' \dontrun{
#'  methylationData
#' }
"methylationData"

#' Significant DNA methylation sites of various Gastric Cancer Patients.
#'
#' Significant sites were determined using cox regression analysis.
#'
#' @source Changhai Hospital, Navy Military Medical University, Shanghai 200433, China
#'
#' @references
#'    Li, T., Chen, X., Gu, M., Deng, A., & Qian, C. (2020).
#'    Identification of the subtypes of gastric cancer based on DNA methylation
#'    and the prediction of prognosis. Clinical Epigenetics, 12(1), 161–161.
#'    https://doi.org/10.1186/s13148-020-00940-3
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{ID}{First condition, under which least light was provided
#'    to plants.}
#'  \item{Hazard ratio}{Hazard ratio calculated using survival analysis.}
#'  \item{Low.95% Confidence interval}{The low 95% confidence Interval}
#'  \item{High.95% Confidence interval}{High 95% confidence Interval}
#'  \item{pvalue}{p-value}
#' }
#' @examples
#' \dontrun{
#'  significantSites
#' }
"significantSites"

# [END]
