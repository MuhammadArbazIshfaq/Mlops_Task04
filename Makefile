build:
    docker build -t my_flask_app .

run:
    docker run -p 5000:5000 my_flask_app

stop:
    docker stop $(docker ps -q --filter ancestor=my_flask_app)

clean:
    docker rm $(docker ps -a -q --filter ancestor=my_flask_app)
    docker rmi my_flask_app

