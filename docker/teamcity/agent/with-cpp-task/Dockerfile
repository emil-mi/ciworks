FROM ciworks-agent
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>
USER root

RUN apt-get update \
    && apt-get install -y curl default-jdk ant ant-contrib rpm binutils \
    && rm -rf /var/lib/apt/lists/* \
    && echo "teamcity ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/teamcity

ADD http://central.maven.org/maven2/io/trygvis/usb/cpptasks-parallel/1.0-beta-5-parallel-1-trygvis-1/cpptasks-parallel-1.0-beta-5-parallel-1-trygvis-1.jar /home/teamcity/.ant/lib/
#ADD https://github.com/emil-mi/cpptasks-parallel/releases/download/cpptasks-parallel-2.0.0/cpptasks-parallel-2.0.0.jar /home/teamcity/.ant/lib/

ADD bootstrap-agent.sh \
    https://raw.githubusercontent.com/emil-mi/ciworks/master/cvm/cvm \
    https://raw.githubusercontent.com/emil-mi/ciworks/master/cvm/cvm-exec /usr/local/bin/

RUN echo "export CLASSPATH=\$(ls -1 ~/.ant/lib | paste -sd ':')" > /home/teamcity/.ant/ant.conf \
    && chown -R teamcity:teamcity /home/teamcity \
    && chmod +rx /usr/local/bin/*

USER teamcity
CMD ["/usr/local/bin/my_init", "/usr/local/bin/bootstrap-agent.sh"]
