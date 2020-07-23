FROM ubuntu

ENV TZ=Asia

ADD firmware.bin ./home/testing_files

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install binwalk -y && \
    apt-get install apache2 -y && \
    apt-get install nginx -y && \
    apt-get clean

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
