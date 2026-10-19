FROM node:20-slim
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg espeak-ng python3 && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY bundle.py .
RUN python3 bundle.py && npm install --omit=dev
ENV DATA_DIR=/app/data
EXPOSE 3000
CMD ["node","server.js"]
