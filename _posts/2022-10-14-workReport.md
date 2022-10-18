---
layout: post
title: "[2022-10-14] WorkReport"
date: 2022-10-14
category: read
excerpt: ""
---
# 2022년 10월 14일 금요일 
> 만약 불안해지지 않는다면 인생에서 무슨 일이 일어날지 다 보인다고 착각하는 것이다. (기시미 이치로)


## 공부기록 

### java
1. FIle 클래스 
    - 디스크 상의 실제 파일과 디렉토리를 보여주는 클래스
    - 파일과 디렉토리 생성이 가능하고, 파일을 찾거나 삭제하는 것등이 가능 
    ```
    String path = "C:\\Test\\2022";
    File file = new File(path);
    System.out.println(file.getName()); // 2022
    System.out.println(file.getPath()); // c:\Test\2022
    ```

    ```
    String path = "C:\\Test\\2022";
    File file = new File(path);
    File[] fileArr = file.listFiles();
    for(File f: array){
        System.out.println(file.getName());  
    }
    ```
    - 위 enhanced for문은 2022 디렉토리에 있는 파일목록과 디렉토리 목록을 차례로 보여줄 것이다. 
    - 그 외 method <br> ① public boolean isDirectory() 해당 경로가 디렉토리인지 아닌지 체크 
    <br> ②  <br>③

2. 향상된 for문
    - java 1.5부터 도입된 제어문으로 <br> 프로그램의 한 파트를 여러번 반복
    - 기본 형식을 아래와 같음
    ```
        for(dataType valueName : array | collections ){
            수행할 코드
        }
    ```
    - 향상된 for문의 경우, 컴퓨터가 자동으로 배열의 길이를 알고 있어, <br> 일반 for문 처럼  length가 쓰이지 않는다. 
    - 단 0부터 시작해서 1씩 늘어나는 index 규칙은 벗어날 수 없음 