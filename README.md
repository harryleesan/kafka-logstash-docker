# `docker-compose` for Kafka, Zookeeper and Logstash

### Author: Harry Lee

This set up is merely a demonstration for pushing logs to **Logstash**
which then pushes the logs to a **Kafka** topic.

This set up is based on
[kafka-docker](https://github.com/wurstmeister/kafka-docker) using the
**single-broker** configuration.

## Pre-requisites

- **Docker** needs to be installed.
- **docker-compose** needs to be installed.

## Usage

Ensure that the following ports are not in use:
- 2181
- 9092
- 10000

Run:

  ```bash
  docker-compose up -d
  ```

That's it! You are all set!

To see it in action:

- Open up a terminal session and run:

  ```bash
  docker exec -it kafka /opt/kafka/bin/kafka-console-consumer.sh --zookeeper
  zookeeper:2181 --topic logstash_logs
  ```
- Open up a second terminal session and run:

  ```bash
  echo "Hello world" | nc localhost 10000
  ```

  Ensure that `netcat` is installed

- You should be able to see **Hello world** in the first terminal session.

Now you can stream logs to **localhost:10000** and see it in kafka.

## Configuration

The configurations for **Logstash** can be found in _logstash_pipeline_ and
_logstash_settings_.

You can modify the settings before running `docker-compose up -d`.
