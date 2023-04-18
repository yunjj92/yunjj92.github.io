---
layout: post
author: yunjj92 
categories: network
---
# Http Request and Response
## HTTP 개요
- 웹 페이지를 사용자가 방문할 때 어떤 일이 벌어지는가?
    - 간단히 말하면, 사용자의 브라우저가 서버를 대상으로 HTTP 통신 규약에 따라 요청사항을 만들어내면, 서버는 해당 요청사항을 본인이 가지고 있는 HTML 웹 페이지와 영상 그리고 이미지 등의 자원을 이용하여 응답하고, 사용자는 해당 응답사항을 받아 사용자의 화면에 보여준다. 
- HTTP란 대체 무엇인가?
    - HyperText Transfer Protocol의 약자로, www의 모든 사용자가 웹 페이지 상에서 발견되는 모든 정보를 교환할 수 있도록 하기 위하여 지켜야 하는 기준 혹은 규칙 사항이라고 할 수 있다. 
    - 만약 주소창에 "http://"로 시작하는 주소를 이용하여 웹 페이지에 접근하려고 한다면, 해당 주소가 의미하는 바는 웹 브라우저가 HTTP 통신 규약에 따라 통신을 하겠다는 의미가 된다. 참고로, 이제는 더이상 주소를 입력할 때 앞에 http://를 입력하지 않는데, 이는 HTTP 통신 규약이 통신의 기본 설정으로 고정되었기 때문이다. 참고로 HTTP 통신 규약은 FTP 통신규약과 분리할 필요성이 있기 때문에 브라우저 상에서만 기본 통신 설정으로 되어있다는 것을 인지해야 한다. 
    - 참고로 OSI 계층에 대해 간략한 설명을 하자면 Application 비롯하여 상위 3계층은 하위계층으로 데이터를 전달하기만 하는데에만 자원을 활용하며, 아래 4계층은 데이터를 받아 목적지 확인, 오류체크, 실질적인 전송이 이루어지기 위한 작업을 수행한다. 이중 4계층이 상위 계층와 하위 계층 사이에서 데이터의 순서와 정합성을 보장하고 에러 발생에 따른 처리와 같이 데이터의 전송 전 체크 과정을 담당하고 있다. 
        7. Application 
        6. Presentation
        5. Session
        4. Transport
        3. Network
        2. Data Link
        1. Physical
    - 위의 OSI 모델을 참고로 하여 TCP/IP 모델을 정리하면, 다음과도 같다. 
        4. Application (Apllcation, Presentation, Session)
            - 4.1) SMTP, FTP, HTTP, POP3, SNMP 
        3. Transport Layer(Transport)
            - 3.1) TCP, UDP
                 - 두 개 모두 하위 계층에 의해 ip 프로토콜을 기반으로 구현
                 - TCP: 데이터 전송 및 연결 지향형 프로토콜이 주된 특징. 인터넷 상에서 패킷을 전달하고 네트워크 상 메시지와 데이터의 성공적인 전달을 보장. 연결 지향형 프로토콜이란, 수신자와 송신자 간의 연결이 확립된 후 데이터가 전송되는 방식을 말한다. 
                 ![10-2](https://user-images.githubusercontent.com/81787195/226246513-f2b4b260-b510-44f2-a38c-0aa3cc745e46.png)
                 ![what-is-a-tcp-3-way-handshake-process-tcp-header-b4e17a1675ac1e86](https://user-images.githubusercontent.com/81787195/226247290-9cf85144-6af0-437b-8228-004c4a6a1c28.jpg)
                 - 1. Sequence Number: 데이터의 첫번째 bit에 할당되는 숫자로, 1 개의 연결에서 한 번만 사용이 갸능. 같은 연결 상에서 다른 데이터의 전송을 할 경우, 각기 다른 랜덤의 sequence number를 사용
                 - 2. Acknowledgement Number: receiver가 sender로부터 받은 패킷을 인지하기 위해 사용되는 숫자. 전송 기기를 인지하기 위해 sender로 부터 받 일반적으로 sender로 부터 받은 sequence number보다 1이 큼

        2. Internet Layer(Network)
            - 2.1) IP
        1. Network Access Layer(Data link, Physical)
            - Device Driver
