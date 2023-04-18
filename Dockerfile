ARG PYTHON_VERSION=3.9
FROM python:${PYTHON_VERSION}-slim
WORKDIR /app

# Install git
RUN apt-get update && \
    apt-get install -y git build-essential cmake && \
    apt-get clean

RUN python -m pip install --upgrade pip
RUN python -m pip install git+https://github.com/AwMalka/llama-server.git
RUN python -m pip install git+https://github.com/AwMalka/pyllamacpp.git --upgrade
RUN python -m pip cache purge

# Expose the port the app will run on
EXPOSE 8000

# Start the application
CMD ["llama-server", "--models-yml", "/models/models.yml", "--model-id", "gpt4all"]


# ARG PYTHON_VERSION=3.9
# FROM python:${PYTHON_VERSION}-slim
# WORKDIR /app

# # Install git
# RUN apt-get update && \
#     apt-get install -y git && \
#     apt-get clean

# # Copy the contents of the current folder into the Docker container
# COPY . /app

# RUN python -m pip install --upgrade pip
# # Install the llama-server package from the local directory
# RUN python -m pip install . && \
#     python -m pip cache purge

# # Expose the port the app will run on
# EXPOSE 8000

# # Start the application
# CMD ["llama-server", "--models-yml", "/models/models.yml", "--model-id", "gpt4all"]

# ARG PYTHON_VERSION=3.9
# FROM python:${PYTHON_VERSION}-slim
# WORKDIR /app

# RUN python -m pip install --upgrade pip
# RUN python -m pip install llama-server && \
#     python -m pip cache purge

# # Expose the port the app will run on
# EXPOSE 8000

# # Start the application
# CMD ["llama-server", "--models-yml", "/models/models.yml", "--model-id", "gpt4all"]
