FROM ghcr.io/buggtb/unity-sps-prototype/hysds-core:main

ARG HOME /root
WORKDIR $HOME

ENV WORKERS 4
ENV THREADS 1

RUN pip3 install 'Flask<2.0.0' && \
  pip3 install 'Werkzeug<2.0.0' && \
  pip3 install 'flask-cors'

RUN git clone https://github.com/hysds/mozart.git && \
  cd mozart/ && \
  python3 setup.py install

WORKDIR /root/mozart

CMD ["sh", "-c", "gunicorn \
  --workers $WORKERS --threads $THREADS \
  -b 0.0.0.0:8888 -k gevent \
  --timeout=3600 --graceful-timeout=3600 --log-level=debug --limit-request-line=0 \
  mozart:app"]
