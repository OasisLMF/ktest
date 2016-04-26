# ktest

This is the extended test harness for ktools. It runs in Windows or Linux. 

The main tests are
1) Installer test.  This is the same test as the 'make check' test in ktools.  This repo holds the source control files for the md5 checksums.
2) ftest. This is an extended set of tests for the Financial Module (fmcalc).  It includes the worked examples library which can be found in the [ftest/data](ftest/data/) folder.  The list of worked examples is in [ftest/ftest.xlsx](ftest/ftest.xlsx)

### Instructions

If testing in Windows, Cygwin must be used for running the test. For Cygwin set-up instructions, please see ktools README.md

* Install ktools
* Download this repository
* cd into the ktest directory and use the command

``` sh
$ sh runtests.sh
```




