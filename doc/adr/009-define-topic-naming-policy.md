# Define a coherent naming policy for MQTT topics 

- Status: Proposed
- Date: 2019-09-30
- Deciders:
    - Everyone

## Context and Problem Statement
As our messaging system grows in complexity, we should define a clear naming policy for MQTT topics

## Decision Drivers <!-- optional -->
- We've many karts that send data from their sensors: speed, turn angle, LiDAR, etc.
- We need to send video stream for each kart
- MQTT RabbitMQ plugin handles MQTT topics using AMQP queues internally. More details could be found in [official
documentation](https://www.rabbitmq.com/mqtt.html). Here are some takeaways:
  * As said before, MQTT topics are backed up by AMQP queues. There is one AMQP topic for each TCP connection.
  * These AMQP topics are named randomly using this regexp: `mqtt-subscription-<random-id><QoS>`
  * MQTT plugin is compatible with version 3.1.1 version of MQTT protocol
  * MQTT plugin supports ONLY two type of QoS: `QoS0` (transient clients) and `QoS1` (durable clients). 
  `QoS2` are automatically downgraded to `QoS1` 
  * All these AMQP topics are bound to an `exchange` and this one is bound to a `vhost` 
  * When a client connects to a MQTT topic, RabbitMQ uses topic name as `routing key` on selected `exchange`
  * MQTT plugin allows to create a _topic hierarchy_ that allows to subscribe to many topics using only one TCP connection

- MQTT doesn't allow to use `fanout` model. This isn't a plugin limitation but a MQTT protocol's
- Using only one MQTT topic is not suitable
- To understand all the scenarios:
  * `<kartId>` is the kart id `[1-3]`
  At this moment, there is no scenario where backend must notify only one kart 
  
## Considered Options

- Using different topics for video and kart status

## Decision Outcome
TODO

## Pros and Cons of the Options <!-- optional -->

### Proposition 1

From kart's perspective:
- Every kart send his internal status on this topic `/kart/<kartId>/status`. This internal status is composed by internal
sensors: gyroscope, accelerometer, etc and external devices as LiDAR. This data sources must be aggregated in the kart itself
- Every kart send his video stream on this topic `/kart/<kartId>/video`
- Every kart subscribe to topic `/race/events` to receive race events from the backend

From the backend perspective:
- Backend reads kart statuses by subscribing to topic `/kart/+/status`. This regexp allows to receive all 
kart events
- Backend reads kart video streams
- When an important race event occurs, backend notifies all karts sending it to `/race/events`

Pros:
- Very straightforward naming strategy
- Karts only need to handle 3 TCP connections. This is important because karts have limited resources: CPU, battery, etc.
- Backend can consume all kart events using a single TCP connection
- Backend can notify any of the karts using a dedicated topic

Cons:
- Karts must aggregate LIDAR and internal sensors reading before publishing into MQTT topic. This could be problematic 
if kart send rate is too high
- Backend can be overwhelmed if karts send rate is too high. As described [here](https://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices/), using regex is not recommended
- This solutions is not suitable if backend needs to notify a subset of available karts


### Proposition 2

From kart's perspective:
- Every kart send his internal status on this topic `/events/kart/status/<kartId>`. The expected behaviour is the same 
that the previous proposition
- Every kart send his video stream on this topic `/video/<kartId>`
- Every kart subscribe to topic `/events/race/status` to receive race events from the backend

From the backend perspective:
- Backend reads kart statuses by subscribing to topic `/events/kart/status/+`. This regexp allows to receive all 
kart events
- Backend reads kart video streams
- When an important race event occurs, backend notifies all karts sending it to `/events/race/status`
