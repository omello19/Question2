
FROM python:3.13-slim
WORKDIR /JenkinsPipeline
COPY Square.py .
CMD ["python3", "Square.py"]
