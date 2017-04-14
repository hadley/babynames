## Test environments
* local OS X install, R 3.3.2
* ubuntu 12.04 (on travis-ci), R 3.3.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 notes

* Checking installed package size:
  installed size is  8.7Mb
  sub-directories of 1Mb or more:
    data   8.6Mb

  This is a data package that will be rarely update.

## Reverse dependencies

I ran R CMD check on the 2 revdeps. I couldn't install one, but the other was fine. (Given that this is a data package with a minor update, it seems unlikely that this would break any existing code anyway.)
