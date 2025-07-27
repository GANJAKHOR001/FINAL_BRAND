FROM nikolaik/python-nodejs:python3.10-nodejs19

ENV DEBIAN_FRONTEND=noninteractive

# Install required tools safely
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install ffmpeg separately to isolate issues
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy code
COPY . /app/
WORKDIR /app/

# Python dependencies
RUN python3 -m pip install --upgrade pip setuptools
RUN pip3 install --no-cache-dir -r requirements.txt

# Run app
CMD ["python3", "-m", "BrandrdXMusic"]
