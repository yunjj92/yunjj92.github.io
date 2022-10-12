---
layout: post
title: "[2022-10-12] Work Report" 
date: 2022-10-12
category: read 
excerpt: ""
---
# 2022년 10월 12일 수요일 
> 비판을 회피하려는 의식적∙무의식적 노력은 <br>
당신의 창조적 사고를 뒤엎거나 질식시키며,<br>
당신이 꿈을 성취하려고 시도해보기도 전에 출발을 방해한다.<br>
(스티븐 스코트)

## 오늘의 공부 기록 

### jekyll 머릿말 블록 
1. YAML 머릿말 블록 개요
    - YAML 머릿말 블록이란? 
        ```
         ▸ 시작과 끝을 대시문자 세개로 감싼 블록
         ▸ 해당 블록은 반드시 파일의 맨 첫 부분
         ▸ 블록안의 내용은 YAML 형식으로 작성
        ```
    - YAML 머릿말 블록이 필요한 이유?
        ```
         ▸ 블록 안에 사전 - 정의 변수 사용 가능
         ▸ 정의된 변수는 해당 파일 + 연결된 파일 + 레이아웃 + Liquid 태그에서 사용
         ▸ 변수 사용 안하면 비워두기
         ▸ 머릿말 블록 내 내용이 없어도 jekyll는 해당 파일을 처리
         ▸ 특히 CSS, RSS피드 같은 파일에 필요
        ```
2. YAML 머릿말 블록 사용 방법
    - 사전-정의 전역 변수 사용
    ```
        이어서....
    ```

[jekyllrb 블로그 참조]: https://jekyllrb-ko.github.io/docs/front-matter/ "Go jekyllrb"

### java
1. public interface CallableStatement 
    - 저장된 프로시저를 호출하여, sql문을 수행하기 위해 사용되는 인터페이스
    - JDBC API가 해당 프로시저에게 특수문자 처리 기능을 제공, <br> 모든 RDBMS에 맞는 일정한 형식으로 호출
2. NumberFormatException 오류 발생 원인 ?
    - 
    - 

### HTML
1. form elements onSubmit
    ```
     <form action="/submitTest.do" onsubmit="return false";>
     ```
    - onsubmit의 값을 return false라고 하는 이유는 ?
        -  중복 제출되는 것을 방지하고, <br> theForm.action 등의 코드로 <br> 한번만 수행되도록 하기 위하여


### RDMBS AND DBMS
1. 둘의 차이점 
    - 1.1 RDBMS: 관계형 데이터베이스 관리 시스템 <br> 데이터 베이스를 규정하고 만들고 유지하며 <br> 데이터에 제한된 접근을 제공
        - 1.1.1 특징
            - 표의 형태로 데이터 저장
            - 동시에 복수의 데이터 요소들에 접근 가능
            - 테이블이 형태로 저장된 데이터는 각기 관계성이 있음
            - 정규화 O
            - 분산된 데이터베이스 제공
            - headers(컬럼 이름)와 rows(상응하는 값)로 구성
            - 상당한 양의 데이터 처리 가능
            - 키와 인덱스가 데이터 중복성 방지
            - 동시에 여러 사용자 지원
            - 관련성 위주의 접근 덕분에 데이터 불러오기 속도 빠름
            - 데이터 보안을 위한 여러 계층 존재 
            - 고사양의 h/w, s/w 필요
            - MySQL, PostgreSQL, SQL server, Oracle, Microsrft Access 등 
    - 1.2 DBMS: 데이터 베이스 관리 시스템 : <br> DBMS의 향상된 버젼
        - 1.2.1 특징
            - 데이터를 파일로 저장
            - 데이서 요소는 각 개별적인 접근을 필요
            - 데이터간 관계 없음
            - 정규화 x
            - 분산된 데이터베이스 제공 X
            - 위치파악에 유리한 형태 및 계층적 형태로 데이터 저장
            - 작은 양의 데이터를 취급
            - 데이터 중복성 종종 존재
            - 작은 조직 및 적은 데이터를 다루기 위함
            - 단 하나의 사용자만을 지원
            - 데이터 조작처리와 관련하여 데이터의 보안수준 낮음
            - 저사양의 s/w, h/w에서도 가능
            - XML, window Reigistry, etc

#### SQL Procedure
1. OPEN FOR문
    - OPEN 커서변수 FOR SQL문 
        : SQL 문 SELECT 결과가 커서변수에 담김
2. INSTR
    - INSTR( [문자열], [찾을 문자열]) 
        : 찾을 문자열이 위치한 인덱스 반환 (0부터 시작)

