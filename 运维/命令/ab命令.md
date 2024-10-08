```bash
[root@vic html]# ab --help
ab: wrong number of arguments
Usage: ab [options] [http[s]://]hostname[:port]/path
Options are:
    -n requests     Number of requests to perform
	# 在测试会话中所执行的请求个数
	
    -c concurrency  Number of multiple requests to make
	# 一次产生的请求个数
	
    -t timelimit    Seconds to max. wait for responses
    # 测试所进行的最大秒数
    
    -b windowsize   Size of TCP send/receive buffer, in bytes
    -p postfile     File containing data to POST. Remember also to set -T
    -u putfile      File containing data to PUT. Remember also to set -T
    -T content-type Content-type header for POSTing, eg.
                    'application/x-www-form-urlencoded'
                    Default is 'text/plain'
    -v verbosity    How much troubleshooting info to print
    -w              Print out results in HTML tables
    -i              Use HEAD instead of GET
    -x attributes   String to insert as table attributes
    -y attributes   String to insert as tr attributes
    -z attributes   String to insert as td or th attributes
    -C attribute    Add cookie, eg. 'Apache=1234. (repeatable)
    -H attribute    Add Arbitrary header line, eg. 'Accept-Encoding: gzip'
                    Inserted after all normal header lines. (repeatable)
    -A attribute    Add Basic WWW Authentication, the attributes
                    are a colon separated username and password.
    -P attribute    Add Basic Proxy Authentication, the attributes
                    are a colon separated username and password.
    -X proxy:port   Proxyserver and port number to use
    -V              Print version number and exit
    -k              Use HTTP KeepAlive feature
    -d              Do not show percentiles served table.
    -S              Do not show confidence estimators and warnings.
    -g filename     Output collected data to gnuplot format file.
    -e filename     Output CSV file with percentages served
    -r              Don't exit on socket receive errors.
    -h              Display usage information (this message)
    -Z ciphersuite  Specify SSL/TLS cipher suite (See openssl ciphers)
    -f protocol     Specify SSL/TLS protocol (SSL2, SSL3, TLS1, or ALL)
```

```bash
[root@vic html]# ab -c 10 -n 100 http://www.myvick.cn/index.php
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking www.myvick.cn (be patient).....done


Server Software:        nginx/1.13.6   #测试服务器的名字
Server Hostname:        www.myvick.cn  #请求的URL主机名
Server Port:            80             #web服务器监听的端口

Document Path:          /index.php　　  #请求的URL中的根绝对路径，通过该文件的后缀名，我们一般可以了解该请求的类型
Document Length:        799 bytes       #HTTP响应数据的正文长度

Concurrency Level:      10　　　　　　　　# 并发用户数，这是我们设置的参数之一
Time taken for tests:   0.668 seconds   #所有这些请求被处理完成所花费的总时间 单位秒
Complete requests:      100 　　　　　　  # 总请求数量，这是我们设置的参数之一
Failed requests:        0　　　　　　　　  # 表示失败的请求数量，这里的失败是指请求在连接服务器、发送数据等环节发生异常，以及无响应后超时的情况
Write errors:           0
Total transferred:      96200 bytes　　　 #所有请求的响应数据长度总和。包括每个HTTP响应数据的头信息和正文数据的长度
HTML transferred:       79900 bytes　　　　# 所有请求的响应数据中正文数据的总和，也就是减去了Total transferred中HTTP响应数据中的头信息的长度
Requests per second:    149.71 [#/sec] (mean) #吞吐率，计算公式：Complete requests/Time taken for tests  总请求数/处理完成这些请求数所花费的时间
Time per request:       66.797 [ms] (mean)   # 用户平均请求等待时间，计算公式：Time token for tests/（Complete requests/Concurrency Level）。处理完成所有请求数所花费的时间/（总请求数/并发用户数）
Time per request:       6.680 [ms] (mean, across all concurrent requests) #服务器平均请求等待时间，计算公式：Time taken for tests/Complete requests，正好是吞吐率的倒数。也可以这么统计：Time per request/Concurrency Level
Transfer rate:          140.64 [Kbytes/sec] received  #表示这些请求在单位时间内从服务器获取的数据长度，计算公式：Total trnasferred/ Time taken for tests，这个统计很好的说明服务器的处理能力达到极限时，其出口宽带的需求量。

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        1    2   0.7      2       5
Processing:     2   26  81.3      3     615
Waiting:        1   26  81.3      3     615
Total:          3   28  81.3      6     618

Percentage of the requests served within a certain time (ms)
  50%      6
  66%      6
  75%      7
  80%      7
  90%     10
  95%    209
  98%    209
  99%    618
 100%    618 (longest request)#Percentage of requests served within a certain time（ms）这部分数据用于描述每个请求处理时间的分布情况，比如以上测试，80%的请求处理时间都不超过7ms，这个处理时间是指前面的Time per request，即对于单个用户而言，平均每个请求的处理时间
```