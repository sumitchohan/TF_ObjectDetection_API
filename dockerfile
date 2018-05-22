FROM gcr.io/tensorflow/tensorflow:1.3.0-devel-py3
RUN apt-get update && apt-get install -y git-core tmux wget protobuf-compiler 
RUN git clone https://github.com/sumitchohan/TF_ObjectDetection_API.git /notebooks/object
RUN git clone https://github.com/sumitchohan/models.git /notebooks/object/models
WORKDIR "/notebooks/object"
RUN pip install -r ./requirements.txt
CMD ["/run_jupyter.sh"]
