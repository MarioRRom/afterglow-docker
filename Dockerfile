FROM python:3.13-alpine

LABEL org.opencontainers.image.title="afterglow" \
      org.opencontainers.image.description="PS4 kernel exploit served from the console's browser" \
      org.opencontainers.image.source="https://github.com/well0nez/afterglow-web"

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    AFTERGLOW_PORT=8000

COPY --chown=65532:65532 . /app

USER 65532:65532

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD python3 -c "import os, urllib.request; urllib.request.urlopen('http://127.0.0.1:' + os.environ.get('AFTERGLOW_PORT', '8000') + '/', timeout=3)"

CMD ["./serve.sh"]
