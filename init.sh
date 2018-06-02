pip3 install --upgrade tensorflow

curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
mv protoc3/bin/* /usr/local/bin/
mv protoc3/include/* /usr/local/include/
curl -OL https://pythonprogramming.net/static/downloads/machine-learning-data/object-detection-macaroni.zip
unzip object-detection-macaroni.zip
cp -R models/research/object_detection/. object_detection
python3 ./xml_to_csv.py
python3 ./generate_tfrecord.py
protoc object_detection/protos/*.proto --python_out=.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
curl -OL http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_11_06_2017.tar.gz
tar -xzf ssd_mobilenet_v1_coco_11_06_2017.tar.gz
#cp object_detection/train.py ./train.py
cp -R ssd_mobilenet_v1_coco_11_06_2017/. data
