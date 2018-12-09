FROM python:3.6

RUN groupadd -r flasky && useradd -r -g flasky flasky
RUN mkdir -p /usr/flasky
WORKDIR /usr/flasky
COPY flasky .
RUN mkdir db
RUN pip install -r requirements.txt
RUN chown -R flasky:flasky .
USER flasky

CMD ["flask", "run", "--host", "0.0.0.0"]
