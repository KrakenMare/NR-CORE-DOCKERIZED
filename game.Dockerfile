FROM mono:latest
COPY bin/ App/
WORKDIR /App
ENTRYPOINT ["mono", "./wServer.exe"]
