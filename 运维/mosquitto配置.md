```bash
#使用每个侦听器的安全设置。
#
#建议先设置此选项。
#
#如果此选项设置为true，则所有身份验证和访问控制
#选项是根据每个侦听器控制的。以下选项是
#受影响的有：
#
# password_file acl_file psk_file auth_plugin auth_opt_* allow_anonymous
# auto_id_prefix allow_zero_length_clientid
#
# 请注意，如果设置为true，则断开连接的持久客户端（即，干净会话设置为false）将使用为其最近连接的侦听器定义的ACL设置.
# 默认行为是将其设置为false，这将保持以前版本的mosquitto的设置行为。
#per_listener_settings false


# 如果客户端订阅了多个重叠的订阅，例如foo /＃和foo / + / baz，然后MQTT期望，
# 当代理收到与两个订阅都匹配的主题消息，例如foo / bar / baz时，客户端应该只接收一次消息。
# Mosquitto跟踪邮件已发送到哪些客户，以满足此要求。 allow_duplicate_messages选项允许禁用此行为，
# 如果您有大量的客户端订阅了同一主题集并且非常关注，则此选项可能很有用。
# 最小化内存使用。如果您事先知道客户端永远不会有重叠的订阅，则可以将其安全地设置为true，
# 否则即使QoS = 2，客户端也必须能够正确处理重复的消息。

#allow_duplicate_messages false

# 此选项控制是否允许客户端使用长度为零的客户端ID连接。此选项仅影响使用MQTT v3.1.1和更高版本的客户端。
# 如果设置为false，将断开连接长度为零的客户端ID的客户端。
# 如果设置为true，则代理将为客户端分配客户端ID。
# 这意味着它仅对将干净会话设置为true的客户端有用。

#allow_zero_length_clientid true

# 如果allow_zero_length_clientid为true，则此选项允许您为自动生成的客户端ID设置前缀，以帮助查看日志。
# 默认 'auto-'

#auto_id_prefix auto-

# 当客户端订阅已保留邮件的主题时，此选项会影响方案。
# 向主题发布保留消息的客户端在发布时可能具有访问权限，但是该访问权限随后已被删除。
# 如果将check_retain_source设置为true（默认值），则将在重新发布保留消息的源之前检查其访问权限。
# 设置为false时，将不进行检查，并且保留的消息将始终被发布。这会影响所有听众。

#check_retain_source true

# 在超过此限制之前，将允许每个客户端 inflight QoS 1和2消息。默认为0。（无最大值）
# 另请参见max_inflight_messages
#max_inflight_bytes 0

# 每个客户端当前正在运行的QoS 1和2消息的最大数量。
# 这包括握手过程中和正在重试的消息。默认值为20。设置为0（无最大值）。设置为1将保证按顺序传送QoS 1和2消息。

#max_inflight_messages 20

# 对于MQTT v5客户端，可以让服务器发送“服务器keepalive”值，该值将覆盖客户端设置的keepalive值。
# 旨在用作一种机制，表示服务器将比预期的更早断开客户端的连接，并且客户端应使用新的keepalive值。
# max_keepalive选项允许您指定客户端只能使用小于或等于此值的keepalive进行连接，
# 否则，将向它们发送服务器keepalive通知它们使用max_keepalive。
# 这仅适用于MQTT v5客户端。允许的最大值为65535。请勿设置为10以下。

#max_keepalive 65535

# 对于MQTT v5客户端，可以让服务器发送“最大数据包大小”值，该值将指示客户端它将不接受大小大于max_packet_size字节的MQTT数据包。
# 这适用于完整的MQTT数据包，而不仅仅是有效负载。将此选项设置为正值会将最大数据包大小设置为该字节数。
# 如果客户端发送的数据包大于此值，它将被断开连接。这适用于所有客户端，无论它们使用的协议版本如何，
# 但是v3.1.1和更早版本的客户端当然不会收到最大数据包大小信息。默认为无限制。
# 禁止将其设置为低于20个字节，因为即使有效负载很小，它也可能会干扰普通的客户端操作。

#max_packet_size 0

# 超过当前运行中的QoS 1和2消息将在每个客户端排队，直到超过此限制。默认为0。（无最大值）
# 另请参见max_queued_messages。
# 如果同时指定了max_queued_messages和max_queued_bytes，则数据包将排队直到达到第一个限制。

#max_queued_bytes 0

# 每个客户端要在队列中保留的QoS 1和2消息的最大数量高于当前正在运行的QoS 1和2消息的数量。
# 默认值为100。设置为0表示没有最大值（不建议）。
# 另请参阅queue_qos0_messages。
# 另请参见max_queued_bytes。

#max_queued_messages 100

# 此选项设置代理将分配的最大堆内存字节数，因此对代理使用的内存设置硬限制。
# 超过此值的内存请求将被拒绝。效果会因被拒绝的内容而异。如果正在处理传入消息，则该消息将被丢弃，
# 并且发布客户端将断开连接。如果正在发送外发消息，则单个消息将被丢弃，接收方客户端将被断开连接。
# 默认为无限制

#memory_limit 0

# 此选项设置代理允许的最大发布有效负载大小。
# 接收到的超出此大小的消息将不会被代理接受。
# 缺省值为0，表示接受所有有效的MQTT消息。 MQTT施加的最大有效负载大小为268435455字节(256M)。
#message_size_limit 0

# 如果持久客户端（未将干净会话设置为false的持久客户端）在特定时间内未重新连接，则此选项允许将其删除。
# 这是MQTT V3.1中的非标准选项，但在MQTT v3.1.1中允许。
# 设计不当的客户端可能会在使用随机生成的客户端ID时将clean session设置为false。
# 这导致持久的客户端永远不会重新连接。此选项允许删除这些客户端。
# 有效期应为整数，然后分别为小时，日，周，月和年的 h d w m y 之一。例如
# persistent_client_expiration 2m
# persistent_client_expiration 14d
# persistent_client_expiration 1y
# 如果未设置，则默认为永不使持久客户端失效。

#persistent_client_expiration

# 将进程ID写入文件。默认值为空字符串，这意味着不应写入pid文件。
# 如果mosquitto在启动时使用初始化脚本和start-stop-daemon或类似程序自动运行，
# 则应将其设置为/var/run/mosquitto.pid。
# 配置说明中出现的地址例如：“/var/run/mosquitto”，“/var/log/messages”，都是相对路径，相对于系统盘根目录
# 例如“/var/run/mosquitto”表示的是“c:\var\run\mosquitto”

#pid_file

# 设置为true后 可以在持久客户端断开连接时将QoS 0的消息排队。
# 这些消息包含在max_queued_messages和max_queued_bytes施加的限制中
# 默认为false。
# 这是MQTT v3.1规范的非标准选项，但在v3.1.1中允许。

#queue_qos0_messages false

# Set to false to disable retained message support. If a client publishes a
# message with the retain bit set, it will be disconnected if this is set to
# false.
# 是否禁用保留的消息支持。设置为falsk可以禁用.
# 将其设置为false后, 如果客户端发布消息时设置保留消息, 则会被断开连接

#retain_available true

# 在客户端套接字上禁用Nagle的算法。这具有减少单个消息的等待时间的效果，但潜在的代价是增加了发送数据包的数量。

#set_tcp_nodelay false

# $SYS树更新之间的时间（以秒为单位）。
# 设置为0禁用$SYS树的发布。

#sys_interval 10

# The MQTT specification requires that the QoS of a message delivered to a
# subscriber is never upgraded to match the QoS of the subscription. Enabling
# this option changes this behaviour. If upgrade_outgoing_qos is set true,
# messages sent to a subscriber will always match the QoS of its subscription.
# 这是规范明确禁止的非标准选项。

#upgrade_outgoing_qos false

# 以root用户身份运行时，请对该用户及其主要组授予特权。
# 设置为root以保持root身份，但是不建议这样做。
# 如果以非root用户身份运行，则此设置无效。
# 请注意，在Windows上这没有任何作用，因此mosquitto应该由希望以其身份运行的用户启动。

#user mosquitto

```