FROM mono:latest
COPY bin/ App/
WORKDIR /App
ENTRYPOINT ["mono", "./server.exe"]
