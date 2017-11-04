# `docker-compose` for Kafka, Zookeeper and Logstash

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
  curl -X POST -d @test.json http://localhost:10000 --header "Content-Type:application/json"
  ```

  Ensure that `curl` is installed.

- You should be able to see a concise HTTP request in the form of an _json_ object coming through in the first
  terminal session.

Now you can stream logs to **localhost:10000** and see it in **Kafka**.

## Configuration

The configurations for **Logstash** is in the _logstash_pipeline_ and
_logstash_settings_ folders.

You can modify the settings before running `docker-compose up -d`.

In this demonstration, a **Http input plugin** and a **Kafka output plugin** using
the _json codec_ are used.
