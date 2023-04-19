---
layout: post
author: yunjj92 
categories: database
---
<article>
<!--     <header>
        oralce function 
    </header> -->
    <section>
    <h4>1. CREATE FUNCTION</h4>
    <p class="firstP">
        'CREATE FUNCTION'문은 사용자 정의 함수 혹은 'call speicification'을 만들 때 사용하며, 
        여기서 사용자 정의 함수라는 것은 PL/SQL 구문의 세트로 프로시저와 유사하다. 참고로, 함수와 
        프로시저의 차이는 결과 값 리턴의 여부로, 함수는 프로시저와 달리 결과 값을 리턴한다. 
    </p>
    <h4>2. OR REPLACE 사용 케이스</h4>
    <p>
        'OR REPLACE'는 해당 함수가 이미 존재하면 다시 만든다는 의미를 가진다. 특히 해당 함수에 
        접근 가능한 권한을 얻은 상태를 유지하면서도, 현재 존재하는 해당 함수의 정의를 변경하고자
        할 때 사용한다. 만약 해당 함수를 재정의한다면, Oracle Database는 해당 함수를 재컴파일한다. 
    </p>
    <h4>3. CREATE FUNCTION 사용 중 에러가 발생했다면</h4>
    <p>
        만약 함수 기반의 index가 있다면 Oracle Database는 해당 인덱스들을 'DISABLEE'처리 할 것이다. 
        'FUNCTION'을 만들었는데 만일 컴파일 에러가 있다면, Oracle Database는 에러를 뱉는다. 'SHOW 
        ERRORS' 명령어를 통해 관련 컴파일 에러 메시지를 보는 것이 가능하다. 
    </p>
    <h4>4. CREATE FUNCTION 사용 조건 </h4>
    <p>
        사용자 정의 함수가 모든 경우에 사용가능한 건 아니고, 불가능한 경우가 존재한다. 
        첫 번째,'CREATE TABLE' 혹은 'ALTER TABLE'에서의 'CHECK'절에서는 사용할 수 없다.
        두 번째, 'CREATE TABLE' 혹은 'ALTER TABLE'DPTJDML 'DEFAULT'절에서도 사용할 수 없다.

    </p>
    <h4>RETURN 절</h4>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>

#### 1.3 CREATE FUNCTION 상세 사용 가이드
##### 1.3.1 에러가 있다면
- 
- 
##### 1.3.2 사용 가능한 조건 
- 

##### 1.3.3 상세 사용 조건
- 쿼리문이나 혹은 DML문에서 FUNCTION은 다음과 같은 것들이 불가능하다. 
    - OUT 혹은 IN OUT 파라미터를 가지는 것이 불가능하다. 아래 예시처럼 IN은 가능
        - 'CREATE FUNCTION funcation_name(num IN VARCHAR2).... '
    - DDL 구문(DML처럼 데이터 자체를 조작하는 것이 아니라 테이블 자체를 다루는 구문)에서는 사용자 정의 함수를 사용하지 못한다. DDL문의 경우 반드시 현재 트랜젝션에서 COMMIT이 이루어져야 하기 때문이다. 

##### 1.3.4  RETURN 절
-  FUNCTION에서는 결과값에 대한 자료형을 반드시 명시해야 한다. 모든 FUNCTION은 반드시 반환하는 값이 존재하기 때문에, RETURN 절은 반드시 필요하다. 자료형의 경우 PL/SQL에서 지원가능한 자료형이면 모두 가능하다. 

### 2. 함수 구조 예시
![create_function](https://user-images.githubusercontent.com/81787195/225175571-1dae5b08-c3d5-4008-a364-b23121c365f3.gif)

#### 2.1 

<!-- <code class="codeblock"> -->
```sql
    CREATE FUNCTION GET_BAL(ACC_NO IN NUMBER) 
   RETURN NUMBER 
   IS ACC_BAL NUMBER(11,2);
BEGIN 
   SELECT ORDER_TOTAL
   INTO ACC_BAL
   FROM ORDERS
   WHERE CUSOTMER_ID = ACC_NO; 
   RETURN(ACC_BAL); 
 END;
 ```
<!-- </code>  -->
- FUNCTION을 호출할 때 위의 파라미터 acc_no를 명시해야 하고 해당 파라미터의 자료형은 NUMBER이다.
- 위의 함수가 반환하는 결과값은 NUMBER 자료형이고, acc_bal이 해당 결과값에 해당된다. 
- 실제 수행되어야 하는 구문은 다음과 같다.
- BEGIN '실제 FUNCTION이 호출되면 수행되어야 하는 SQL 구문' END
- 

### 기타 용어 및 개념 정리
- 1) Call Speicification
    - 자바 함수 혹은 c 언어 부프로그램(subprogram)을 선언하여, PL/SQL에서 해당 함수 (혹은 부프로그램) 호출을 가능하게 한다. sql문에서 'CALL'을 사용함으로써 method(subprogram)을 호출할 수 있다. 'call speicification'은 어떤  라이브러리의 java method 혹은 어떤 이름의 'subprogram'이 호출되어 수행되어야 하는지 알려주는 역할을 수행한다. 
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
    </section>
</article>