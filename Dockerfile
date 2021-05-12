FROM ubuntu
RUN apt-get update
RUN apt install -y git
RUN apt-get update
RUN apt-get install git openjdk-8-jre-headless -y 
RUN apt install curl -y
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.16.5
RUN git clone https://github.com/Mayhoon/Minecraft-worlds.git
RUN cp -r ./Minecraft-worlds/* .
ENTRYPOINT ["java","-jar","spigot-1.16.5.jar"]
