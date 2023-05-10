FROM biotechvana/singlepointrna-base:1.0.0
COPY ./shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY ./SinglePointRNA /srv/shiny-server/SinglePointRNA
RUN chmod -R 744 /srv/shiny-server/SinglePointRNA
RUN chown -R shiny:shiny /srv/shiny-server/SinglePointRNA
EXPOSE 3838
CMD ["/usr/bin/shiny-server"]