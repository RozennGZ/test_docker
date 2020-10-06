FROM davidgohel/r4-baseapp

COPY Tsuki_0.1.0.tar.gz .

RUN R -e "install.packages('Tsuki_0.1.0.tar.gz',dependencies=TRUE, repos=NULL)"

RUN R -e "install.packages('cowsay',dependencies=TRUE)"
