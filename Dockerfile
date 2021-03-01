FROM python:3.6

RUN apt-get update && apt-get install -y default-libmysqlclient-dev

COPY requirements.txt /

RUN pip3 install -r /requirements.txt

COPY . /app

WORKDIR /app

ENV MYSQL_USERNAME=root
ENV MYSQL_PASSWORD=testpass
ENV MYSQL_INSTANCE_NAME=testdb
ENV MYSQL_PORT_3306_TCP_ADDR=mysql
ENV MYSQL_PORT_3306_TCP_PORT=3306


ENTRYPOINT ["gunicorn", "-w", "1","-b", "0.0.0.0:3000", "app:application"]