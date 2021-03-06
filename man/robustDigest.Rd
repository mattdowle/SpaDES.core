% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cache.R
\docType{methods}
\name{.robustDigest,simList-method}
\alias{.robustDigest,simList-method}
\alias{Cache}
\title{\code{.robustDigest} for \code{simList} class objects}
\usage{
\S4method{.robustDigest}{simList}(object, objects,
  length = getOption("reproducible.length", Inf), algo = "xxhash64",
  quick = getOption("reproducible.quick", FALSE),
  classOptions = list())
}
\arguments{
\item{object}{an object to digest.}

\item{objects}{Optional character vector indicating which objects are to
be considered while making digestible. This argument is not used
in the default cases; the only known method that uses this
in the default cases; the only known method that uses this
argument is the \code{simList} class from \code{SpaDES.core}.}

\item{length}{Numeric. If the element passed to Cache is a \code{Path} class
object (from e.g., \code{asPath(filename)}) or it is a \code{Raster} with
file-backing, then this will be
passed to \code{digest::digest}, essentially limiting the number of bytes
to digest (for speed). This will only be used if \code{quick = FALSE}.
Default is \code{getOption("reproducible.length")},
which is set to \code{Inf}.}

\item{algo}{The algorithms to be used; currently available choices are
    \code{md5}, which is also the default, \code{sha1}, \code{crc32},
    \code{sha256}, \code{sha512}, \code{xxhash32}, \code{xxhash64} and
    \code{murmur32}.}

\item{quick}{Logical. If \code{TRUE},
little or no disk-based information will be assessed, i.e., mostly its
memory content. This is relevant for objects of class \code{character},
\code{Path} and \code{Raster} currently. For class \code{character}, it is ambiguous
whether this represents a character string or a vector of file paths. The function
will assess if it is a path to a file or directory first. If not, it will treat
the object as a character string. If it is known that character strings should
not be treated as paths, then \code{quick = TRUE} will be much faster, with no loss
of information. If it is file or directory, then it will digest the file content,
or \code{basename(object)}. For class \code{Path} objects, the file's metadata
(i.e., filename and file size)
will be hashed instead of the file contents if \code{quick = TRUE}.
If set to \code{FALSE} (default),
the contents of the file(s) are hashed.
If \code{quick = TRUE}, \code{length} is ignored. \code{Raster} objects are treated
as paths, if they are file-backed.}

\item{classOptions}{Optional list. This will pass into \code{.robustDigest} for
specific classes. Should be options that the \code{.robustDigest} knows what
to do with.}
}
\description{
This is intended to be used within the \code{Cache} function, but can be
used to evaluate what a \code{simList} would look like once it is
converted to a repeatably digestible object.
}
\details{
See \code{\link[reproducible]{robustDigest}}. This method strips out stuff
from a simList class object that would make it otherwise not
reproducibly digestible between sessions, operating systems,
or machines. This will likely still not allow identical digest
results across R versions.
}
\seealso{
\code{\link[reproducible]{robustDigest}}
}
\author{
Eliot McIntire
}
