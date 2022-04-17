## install revdepcheck with:
## devtools::install_github('r-lib/revdepcheck')
## to reset: revdepcheck::revdep_reset()

revdepcheck::revdep_check()
devtools::revdep_check_save_summary()
revdepcheck::revdep_check_print_problems()
