FROM nikolaik/python-nodejs:python3.10-nodejs19

# Avoid interactive tzdata prompts during apt install
ENV DEBIAN_FRONTEND=noninteractive

# Install ffmpeg + git (needed for GitHub pip installs)
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg ca-certificates git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/
WORKDIR /app/

# Upgrade pip + setuptools
RUN python3 -m pip install --upgrade pip setuptools

# Install dependencies
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

# Start the app
CMD ["python3", "-m", "BrandrdXMusic"]
