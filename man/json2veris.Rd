% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/verisr.R
\name{json2veris}
\alias{json2veris}
\title{Read in all the VERIS incidents (JSON files) in a given directory.}
\usage{
json2veris(dir = c(), files = c(), schema = NULL, progressbar = F)
}
\arguments{
\item{dir}{The directory to list through.  This may be a vector of 
directorites, in which case each all the matching files in each 
directory will be loaded.}

\item{files}{a chatacter vector of individual json files to be parsed.
These will be added to any files found in directories specified 
with 'dir'.  Any duplicates between files found in 'dir' and 'files'
will be removed.}

\item{schema}{a full veris schema with enumerations included.}

\item{progressbar}{a logical value to show (or not show) a progress bar}
}
\description{
This function will iterate through all the JSON files (regex pattern of "json$") in
the given directory and parse it as an encoded VERIS record.
}
\details{
It also provides the option of passing a vector of individual files.  R's
directory and file parsing functions (list.dirs and list.files) are relatively
slow and files are basically enumerated twice if you specify directories, (once
while you enumerated the directories and once while you enumerated the files).  
Specifying individual files should substantially decrease this time and allows 
the user to use OS-specific file enumeration processes that may be faster than R's.

This function requires that a JSON schema be available for the VERIS data.  
If the variable is not specified, it will attempt to grab the 
"verisc-merged.json" schema from
https://raw.githubusercontent.com/vz-risk/veris/master/verisc-merged.json.

This will return a verisr object, which is a data.table object and can be 
directly accesses as such.

Couple of unique things...  The returned object will have additional fields 
for convenience: 
  * *actor* will return top level actor categories
  * *action* will return top level action categories
  * *asset.variety* will return top level asset categories
  * *attribute* will return top level asset categories
  * *victim.industry2* will return the first 2 digits of the NAICS code
  * *victim.industry3* same, first 3 digits
  * *victim.orgsize* returns "Large" and "Small" enumerations
  * *discovery_method* will return top level discovery_method categories

The victim.secondary.victim_id, external.actor.region, and any other free
text field that can be repeated is being collapsed into a single string 
seperated by a comma at the moment.  If that poses a challnge, open an issue
on it.
}
\examples{
\dontrun{
# load up all the veris files in the "vcdb" directory
# grab the schema off of github.
veris <- json2veris(dir="~/vcdb")

# load up files from multiple directories
veris <- json2veris(dir=c("~/vcdb", "private_data"))

# specify a local schema with localized plus section.
veris <- json2veris(dir="~/vcdb", 
                    schema="~/veris/verisc-local.json")
}
}
\keyword{json}
