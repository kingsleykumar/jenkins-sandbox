FROM jenkins/jenkins:lts-alpine
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY security.groovy /var/jenkins_home/init.groovy.d/security.groovy
COPY users.txt /tmp/users.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER jenkins
