FROM nikolaik/python-nodejs:python3.10-nodejs19

# Ensure non-interactive mode to avoid tzdata or similar prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN python3 -m pip install --upgrade pip setuptools
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

CMD ["python3", "-m", "BrandrdXMusic"]
