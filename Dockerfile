FROM python:3.8
RUN python -m pip install pytest pytest-benchmark
COPY test.py ./

RUN apt-get -qy autoremove

ENTRYPOINT ["python","./test.py"]