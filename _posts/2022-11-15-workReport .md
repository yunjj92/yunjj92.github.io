---
layout: post
title: "[2022-11-15] WorkReport"
date: 2022-11-15
category: read
excerpt: ""
---
## 공부기록
### rabbit mq 
1. rabbit mq는 어떤 Message queue인지?
    - 자체 서버에 배치하기에도 쉽고, 클라우드 환경에서도 쉽게 배치할 수 있는 메시지 브로커
    - 다양한 개발자 도구를 제공 
2. rabbit mq 테스트하기
    - 2.1 일단 event streaming?
        - Event Streaming은 인간의 중추신경계와 유사, 
        - 
        - 한 프로세스 내의 thread는 서로 다른 프로세스 내에 있는 thread보다 덜 차단되있음
        즉, 서로의 메모리, file handle, 프로세스 상태를 공유
        - program counter: 다음에 실행될 명령어의 주소 값을 가지고 있는 레지스터
        - file handle: 사용자가 파일을 열어보고자 할 때, 운영체제가 해당 파일에 할당하는  임시 참조 번호
    - 2.2 multilple threads
        - 동일한 메모리 주소를 공유
            - 한 프로세스 내의 여러 개의 쓰레드가 같은 변수와 객체에 접근 가능
        
        - Java Memory Area
            - Heap Area | Method Area | JVM Stack | Natice Method Statck | PC Registers
            - Heap Area
                - 공유되는 런타인 데이터 영역으로 메모리에 실제 객체를 저장한다. 
                - 
            - Heap
                - 
            - Stack
                - 
            - Program Counter Register  
                - 
            - Native Method 
                - 

3. config 파일에서 특정 설정 값을 가져오기
    - 2.1 

