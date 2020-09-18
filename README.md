# To build the image

docker image build --tag etl:dev .

# To debug the image

docker run --rm -it etl:dev

# To run the image process

docker run --rm etl:dev
