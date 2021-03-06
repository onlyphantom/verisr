% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getenumSRC.R
\name{getenumSRC}
\alias{getenumSRC}
\title{Summarizes veris enumerations from verisr objects}
\usage{
getenumSRC(veris, enum, by = NULL, na.rm = NULL, unk = FALSE,
  short.names = TRUE, source.col = "source_id", sample.size = 31,
  ci.method = NULL, ci.level = 0.95, boot.r = 999, round.freq = 5,
  na = NULL, ...)
}
\arguments{
\item{veris}{A verisr object}

\item{enum}{A veris feature or enumeration to summarize}

\item{by}{A veris feature or enumeration to group by}

\item{na.rm}{A boolean of whether to include not applicable in the sample set.
This is REQUIRED if enum has a potential value of NA as there is no 
'default' method for handling NAs.  Instead, it depends on the 
hypothesis being tested.}

\item{unk}{A boolean referring whether to include 'unknown' in the sample.
The default is 'FALSE' and should rarely be overwritten.}

\item{short.names}{A boolean identifying whether to use the full enumeration
name or just the last section. (i.e. action.hacking.variety.SQLi vs
just SQLi.)}

\item{source.col}{Tthe name of the column containing the source of the
record.  Defaults to 'source_id'}

\item{sample.size}{The minimum sample size per partner to accept. Also
warning given when number of partners is less than this value. Defaults
to 31, (For n-1 or 30 degrees of freedom per student's T test.)}

\item{ci.method}{A confidence interval method to use.  Current supported
methods are any from boot::boot.ci.  If unsure which to use, 
use "bca". Failing that, use "perc".}

\item{ci.level}{A number from 0 to 1 representing the width of the 
confidence interval. (default = 0.95)}

\item{boot.r}{The number of bootstrap replicates to use. Defaults to 999}

\item{round.freq}{An integer indicating how many places to round
the frequency value to. (default = 5)}

\item{na}{DEPRECIATED! Use 'na.rm' parameter.}

\item{...}{A catch all for functions using arguments from previous
versions of getenum.}
}
\value{
A data frame summarizing the enumeration
}
\description{
WARNING: This function is incomplete and untested.  DO NOT USE.
}
\details{
This calculates the mean of the source percentages of the enumeration.
    This effectively treats each source as a sample and then finds the
    center (mean) of the samples.  While this is more statistically
    correct, it does not deal with the underlying bias of the samples.
    
Additionally, unlike getenumCI(), this does not provide a count of
    'unknown's and 'na's if they are filtered out as it only shows
    percentages which are meaningless for values not included in the 
    sample.
}
