FROM rapporteket/dev:nightly

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# hadolint ignore=DL3008

# add registry dev config and R pkg dependencies
COPY --chown=rstudio:rstudio db.yml /home/rstudio/rap_config/
RUN cat /home/rstudio/rap_config/db.yml >> /home/rstudio/rap_config/dbConfig.yml \
    && rm /home/rstudio/rap_config/db.yml \
    && R -e "install.packages(c('bookdown',\
                                'covr',\
                                'dplyr',\
                                'DT', \
                                'gridExtra', \
                                'janitor',\
                                'kableExtra',\
                                'knitr',\
                                'lintr',\
                                'lubridate',\
                                'magrittr',\
                                'readr',\
                                'revealjs',\
                                'rlang',\
                                'rmarkdown',\
                                'shiny',\
                                'shinyalert',\
                                'shinycssloaders',\
                                'stringr',\
                                'testthat',\
                                'tidyr',\
                                'yaml',\
                                'zoo'))" \
    && R -e "remotes::install_github(c('Rapporteket/rapbase'))"
