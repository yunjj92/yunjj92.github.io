---
layout: post
author: yunjj92 
---
# oracle function 
## oracle function 개요
### 1.CREATE FUNCTION
#### 1.1 CREATE FUNCTION
- 1) 목적
    - 

### 2. 함수 구조 예시
#### 2.1 
```

```
### 기타 용어 및 개념 정리
- 1) Call Speicification
    - 자바 함수 혹은 c 언어 부프로그램(subprogram)을 선언하여, 
- 2) RETURNING clause
    - 추가, 수정, 삭제에 의해 변경된 컬럼의 값을 반환하기 위해 사용
    - 이 구문을 사용하지 않으면, DML 구문 수행이 완료된 후 변경된 값을 보기 위해서는 다시 SELECT 문을 수행해야 한다. 
    - 'RETURNING BULK COLLECT INTO'형식을 사용하면,  여러 행의 데이터를 리턴할 수 있다. 
- 3) Oracle PL/SQl 
    - a procedural language exteion to Structured Query Language
    -  절차지향 프로그래밍 언어와 데이터베이스 언어와의 결합을 목적으로 한다. 
    - 기본 단위는 'block'이고 기본적으로 3 파트로 나뉘어 진다. 
        - 선언부분, 수행 부분, 예외처리 부분
    - PL/SQl에선 사용자로 하여금 sql문과 'procedural constructs'를 혼합하여 사용 가능
        - sql문의 그룹화를 위해 PL/SQl 블록과 subprogram을 사용
        - sql문의 경우 한번에 한 개씩만 처리되기 때문에, 블록 사용을 하지 않으면 응답시간이 지연되거나 트래픽에 영향을 줄 수 있다. 
        - PL/SQl 블록은 여러개가 한번에 컴파일 되어 바로 수행가능한 형태로 저장된다. 
    - 데이터베이스에 컴파일된 형태로 저장되어 이름이 붙여진 PL/SQl 프로그램은 '저장된 프로시저'라고 볼 수 있다  
        - 이 프로시저의 경우 INSERT, UPDATE, DELETE가 이루어질때 반드시 수행되는 프로시저로 'a trigger'라고 불리는 관련 테이블에 
- 4) constructs
    - 좁은 의미로는 일반적으로 끝맺음이 필요한 반복문과 같은 작업을 수행하기 위해 프로그래밍 언어에 포함된 일부 특정 문법을 얘기한다. 
        - 예를 들어 loop문, if else문 등이 여기에 속한다. 
