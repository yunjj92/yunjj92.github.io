---
layout: post
title: "[2022-10-21] WorkReport"
date: 2022-10-21
category: read
excerpt: ""
---
# 2022년 10월 20일 
> '세상을 이처럼 고통스럽게 만드는 것은 자신의 쓸모를 증명하기 위해 발버둥 치는 사람일지도 모른다.' <br>
이준형『물러서지 않는 마음』

## 공부기록
### java 
1. Collections. synchronizedMap
    - 1.1 synchronizedMap() method
        -  
2. thread?
    - 2.1 thread란 무엇인가?
        - 각 thread는 한 프로그램 내에서 서로 독립적으로 공존하는 실행 경로
        - 각 thread는 자신만의 stack, 프로그램 카운터, 로컬 변수를 보유
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

