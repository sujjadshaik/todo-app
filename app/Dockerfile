FROM maven:3.5-jdk-8
COPY ../artifacts/todo-app/*.war app.war
ENTRYPOINT [ "java","-jar","app.war" ]