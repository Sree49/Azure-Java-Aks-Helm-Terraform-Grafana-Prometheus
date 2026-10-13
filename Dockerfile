FROM eclipse-temurin:17-jre-alpine

ENV APP_HOME=/usr/src/app

WORKDIR $APP_HOME

ARG AGENT_VERSION=3.5.1
RUN wget -q https://github.com{AGENT_VERSION}/applicationinsights-agent-${AGENT_VERSION}.jar -O applicationinsights-agent.jar


COPY app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-javaagent:applicationinsights-agent.jar","-jar","app.jar"]
