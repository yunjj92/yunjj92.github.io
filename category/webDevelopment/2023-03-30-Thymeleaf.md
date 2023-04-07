---
layout: post
author: yunjj92
title: Let's learn about 'Thymeleaf'
comments: true
cateogires: [webDevelopment]
tags: [webDevelopment]
---
# Thymeleaf?
## 1. Server-Side Rendering?
### Server-Side Rendering이란 서버에 올려진 HTML 파일을 완전히 랜더링이 완료된 HTML 페이지로 전환하는 애플리케이션의 기능을 의미.
- 웹 브라우저가 서버 출처의 정보를 요청하면, 서버는 즉시 한 개의 완전히 랜더링이 완료된 페이지로 클라이언트 측에 응답을 내놓는다. 
- 서버 사이드 랜더링의 경우 서버가 사용자를 위한 컨텐트를 랜더링 하는 것에 대한 완전한 책임을 지기 때문에, 여러 제반 비용이 높다고 할 수 있다. 
- 정적 HTML 서버사이드를 랜더링 하는 것은 효율적인데, 더 크고 더 복잡한 애플리케이션의 서버사이드를 랜더링 하는 것은 병목현상으로 인하여 로드 시간을 더 늘리게 된다. 
- 서버 사이드 사용시, 빈번한 서버 요청과 완전한 페이지 리로드는 전체적으로 더 느린 속도의 페이지 랜더링을 야기한다. 
- Server side Template 사용시 보안을 위해 사용자로부터 필요사항을 입력 받을 때 반드시 문자열로만 받아, 해당 구문이 해석되어 사용자에게 출력되는 것이 아니라 문자열 그대로 출력되도록 해야한다. 
    - 또 필요사항을 입력받을 때 모두 필요한 문자만 사용되도록 하며, 그 외 문자와 특수문자는 입력받지 못하도록 한다. 
## 2. Thymeleaf?
### 2.1 정의
- THML5 JVM 웹 개발에 이상적인 서버사이드 자바 템플릿 엔진
### 2.2 라이브러리 설치 전 확인 사항
-  라이브러리 설치 전spring 버전 확인 필요
- spring version 확인 방법 
- 1) maven 기준으로 pom.xml에서 다음 부분을 ctrl + '마우스 왼 클릭'
```
    <groupId> org.springframework.boot</grouId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.2.5.RELEASE<version>
```
- 2) org.springframeowrk.boot:spring-boot-starter-parent:2.2.5.RELEASE.pom에서 다음을 ctrl+'마우스 왼 클릭'
```
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-dependencies</artifactId>
    <version>2.2.5.RELEASE</version>
```
- 3) org.springframework.boot:spring-boot-dependencies:2.2.5.RELEASE.pom에서 다음 부분을 확인
```
<spring-framework.version>5.2.4.RELEASE</spring-framework.version>
```
### 2.3 라이브러리 설치
- pom.xml에 다음과 같이 추가
```
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-thymeleaf</artifactId>
		</dependency>
```
- 라이브러리 추가시 주의사항
    - 아래와 같이 추가하면 thymeleaf 버전 충돌로 오류가 발생하니 반드시 위의 의존성만 추가
        ```
            <dependency>
                <groupId>org.thymeleaf</groupId>
                <artifactId>thymeleaf</artifactId>
                <version>3.1.1.RELEASE</version>
            </dependency>
        ```
    - 만약 위와 같이 의존성을 추가하면, thymeleaf와 spring 간 버전 충돌로 아래와 같은 에러화면이 발생
        - ![thymeleafErrorCapture](https://user-images.githubusercontent.com/81787195/229447755-8077f234-929a-49a9-bb34-f5abdb6a3a25.PNG)
    