---
layout: post
author: yunjj92 
categories: database
---
# Database and Instance
## 1. 기초 개요
### 1.1 오라클 데이터 베이스의 구성 요소 및 관련 설명
- 한 개의 데이터 베이스, 한 개 이상의 인스턴스로 오라클 데이터베이스가 구성되어 있다. 
    - 한 개의 인스턴스 혹은 데이터베이스 인스턴스는 수행 중인 기본 시스템 운영의 한 파트인 프로세스와 메모리의 조합을 지칭하고, 한 개의 데이터 베이스는 데이터를 저장하는 파일들의 모음이라고 할 수 있다. 아래 그림은 Oracle Database server architecture를 설명한 그림이다. 
       
         ![Segments-Extents-and-Data-Blocks-Within-a-Tablespace](https://user-images.githubusercontent.com/81787195/223882216-edd28757-9646-41e9-9784-ff43855bcf4a.gif)

## 2. Oracle Database server architecture
- 위의 Database server architecture 그림을 살펴보면, Client Application은 Dataserver로 연결하여 데이터를 packet으로 쪼갠다. 이를 Connect Packet이라고 한다. 이 packet을 Database Server의 Listener과 전달받는다. 그리고 이 Listner는 Database Instance와 연결되고, Database Instance는 SGA에 메모리 영역을 할당하고 백그라운드 프로세스를 수행한다. 
### 2.1  Database Instance와 Databasee의 차이 
1. 실제 데이터 베이스 파일에 접근할 필요 없이 데이터베이스 인스턴스를 수행 가능. 먼저 인스턴스를 수행하고 그 다음에 인스턴스 내에서 데이터베이스를 만드는 방식이 이 방식. 
2. 한 개의 인스턴스는 오직 한 개의 데이터베이스에만 접근 가능. 인스턴스가 수행되면, 다음 단계는 해당 인스턴스를 한 개의 데이터베이스에 올리는 것이 된다. 인스턴스는 오직 한 번에 한개의 데이터 베이스에만 mount될 수 있다. 
3. 여러 데이터베이스 인스턴스가 같은 데이터 베이스에 접근 할 수 있다. 클러스터링 환경에서, 여러 서버의 많은 인스턴스가 하나의 핵심 데이터 베이스에 접근할 수 있다. (즉, 인스턴스와 데이터베이스의 관계는 N:1의 관계이다. 인스턴스가 N이고, 데이터베이스가 1)

 
## 3. Oracle Database
### 3.1 개요
- 오라클 데이터베이스의 핵심 작업 중의 하나는 데이터를 저장하는 일. 오라클 데이터베이스 저장 구조에는 물리적 구조와 논리적 구조 2가지 유형이 존재
### 3.2 Physical storage structures
- Physical storage structures은 데이터를 저장하는 파일을 지칭. 만약 데이터베이스를 먼저 만들게 되면 오라클은 아래의 파일들을 만든다. 
    - Data Files
    - Control Files : metadata를 포함하고 있는 파일로, 이 metadata는 데이터 파일의 위치와 데이터 베이스 이름을 설명함
    - Online redo log files: 각 데이터베이스 인스턴스는 적어도 2개의 online redo log file을 가지고 있다. online redo log는 data에 이루어진 변경사항의 복사본을 저장한다. 만약 실패가 발생하여 복구를 위한 데이터 파일이 필요하다면, 재저장된 데이터 파일로 부터 유실된 가장 최근의 데이터 변경 사항은 바로 'online redo log file'로 부터 얻어질 수 있다(그래서 대부분의 작업은 절대 유실되지 않는다.) 'online redo log file'은 하드웨어, 소프트웨어, 그 외 미디어 파일의 작업수행 실패 이후 데이터베이스를 복구하기 위해 사용된다. 'online redo log file' 자체의 작업수행과 관련한 실패를 방지하기 위해 Oracle database는 online redo log file을 여러개 만들어서 2개 혹은 그 이상의 똑같은 복사본이 각각 다른 디스크에 관리될 수 있도록 유지하고 있다.
    
    한 개의 데이터베이스를 위한 'online redo log file'은 사실 'online redo log files'의 여러개 그룹으로 구성되어 있다. 한 개의 그룹은 각 파일의 여러 복사본과 하나의 원본 파일로 이루어져있다. 모든 동일한 복사본은 각기 그 그룹의 하나의 구성요소로 간주된다(똑같은 복사본 여러개라고 해서 하나의 복사본 요소1로 퉁치는게 아니라 복사본1, 복사본2, 복사본3 모두 각기 개별적인 요소로 간주된다는 의미이다). 각 'online redo log files' 그룹은 고유한 숫자에 의해 규정된다. 예를들어 Group1, Group2 이렇게 명칭이 붙여진다. 

    ![GUID-4A8A8808-1C28-4B70-A015-D501EBCBB589-default](https://user-images.githubusercontent.com/81787195/223899834-152e2268-db32-4e8b-85c4-78e1541fd44c.gif)

    위 그림은 데이터베이스의 설정사항을 설명하고 있다. 3개의 'online redo log' 그룹은 각각 모두 2개의 요소로 구성되어 있다. 각 그룹에서 이 2개의 요소는 각기 다른 디스크에 저장된다(가용성을 높이기 위함이다). 예를 들어 Group1의 요소 2개는 redo log file로 A_LOG1과 B_LOG2라고 할 수 있다. 

    [출처: https://docs.oracle.com/database/121/ADMQS/GUID-AC77A1A5-6633-4F21-BD82-CC75C660EC40.htm#ADMQS12049]

    (* online: 여기서의 online의 의미는 아마도 'connected to a system'의 의미에 가까울 듯 하다. 
    예를 들어, When will the new factory come online(=start production)?)
### 3.3 logical storage structures
    - Oracle Database는 디스크 공간 사용을 섬세하게 제어하기 위해 논리적 저장 구조(logical storage structure)를 사용한다. 다음은 오라클 데이터베이스의 logical storage stucture에 해당되는 것들이다. 
        1. Data blocks
            - 하나의 데이터 블록은 디스크 상에 2 바이트 이상에 상응하며, 오라클은 데이터를 다수의 데이터 블록에 저장한다. 다수의 데이터 블록은 'logical blocks', 'Oracle blocks' 혹은 Oracle pages'라고도 불린다. 
            (* a number of: more than two but fewer than many, serveral)
        2. Extents
            - 'extent'는 특정 유형의 정보를 저장하기 위해 사용되는 '다수의 데이터 블록'을 의미하며, 이 '다수의 데이터 블록'은 논리적으로 인접한 블록이여야 한다. 
            (* extent는 어떤 심각한 '정도'를 얘기할 때도 사용되지만, 여기서 사용된 의미는 'area or length'에 더 가깝다.
            * contiguous: next to or touching another, usually similar thing
            * a specific number of: '상당수의, 다수의'라고 해석했다)
        3. Segments
            - 'segments'는 'extents'의 한 묶음으로 데이터베이스 객체, 테이블, 인덱스와 같은 것들을 저장하기 위해 할당된다. 
        4. Tablespaces
            - 데이터베이스는 'tablespace'라는 논리적 저장 단위로 쪼개질 수 있다. tablespace는 segment를 담기 위한 논리적인 컨테이너에 해당된다. 각각의 tablespace는 적어도 하나의 파일 이상으로 이루어져있다. 
            
    - logical storage structure 요약
            → Data block  * n = Data Blocks
            → Data Blocks * n = Extent
            → Extent * n = Segment
            → Segment * n = Tablespace
            → Tablespace * n = Database
    
        - 데이터는 'Data block'에 담긴다. 
        - 'Data block'들이 모여 'Data blocks'가 된다. 
        - 'Data blocks'은 저장하는 정보 유형에 따라 각기 또 'Extents'로 묶인다. 
        - 'Extents'는 또 '다수의 데이터베이스 객체' 즉 예를 들자면 테이블과 인덱스와 같은 것들을 저장하기 위해 메모리가 할당되어 '여러 개의 Extents'가 묶여 하나의 'Segments'로 묶인다. 
        - 한 개의 'tablespace'는 한 개의 'segement'를 위한 하나의 논리적인 container 역할을 수행한다. 따라서 각 'tablespace'는 적어도 한 개의 데이터 파일로 구성되어 있다. 
        - 마침내 한 개의 'database'는 'tablespaces'라는 논리적인 저장 단위들로 쪼개질 수 있는 가장 큰 단위라고 할 수 있다. 
        - 참고
            - 아래 그림은 'logical storage structures'와 'physical storage structures' 사이의 관계를 설명한 그림이다. 
                 ![logical-and-physical-storage](https://user-images.githubusercontent.com/81787195/224207074-3382c855-f39c-423c-8d2e-bbef95b02bc4.gif)

 
## 4. Database Instance
- 하나의 데이터베이스 인스턴스는 최종 사용자 측(client applications)과 데이터베이스 간의 인터페이스라고 할 수 있다. 오라클 인스턴스는 'System GLobal Area' , 'Program Global Area', 'background processes' 이렇게 3가지 파트로 구성되어 있다. 

    ![Oracle-Database-Architecture-database-instance](https://user-images.githubusercontent.com/81787195/224207537-73fa1a5a-ec7e-40bf-af75-9702b6b5d8a0.png)

    - SGA는 공유 메모리 구조체로 데이터베이스 인스턴스가 데이터베이스 서버 상에 올라갈 때, 내려갈 때 할당되는 공간이다. 역할 상에서 SGA를 살펴보면, 한 개의 데이터베이스 인스턴스에 속한 정보를 제어하고 해당 데이터를 저장하는 하나의 그룹이라고도 볼 수 있다. (이때, 이 하나의 그룹은 공유되어진 메모리 구조체의 여러개로 구성되어 있다)


 
## 5. Major Oracle Database's background processes 
- 


 
### * 용어 및 개념 정리 
    1. DBMS 관점에서의 instance? 
        - 특정 순간에 하나의 데이터 혹은 정보가 데이터베이스에 저장되는 그 상황을 인스턴스라고 한다. 
        - 한 인스턴스는 또한 현재 상황 혹은 데이터베이스 상태를 뜻하기도 한다. 
        - 데이터베이스 스키마는 특정 데이터베이스에 속한 테이블의 변수를 정의하고, 
          특정 순간의 이 변수들의 기록은 데이터베이스의 인스턴스라고 불린다. 
        - 대부분의 인스턴스는 하나의 특정 데이터베이스 스키마에 상응하도록 구성되어 있다. 
          위의 테이블에서, 행이 인스턴스라고 불린다.  
            | std ID | Name | City | 
            | 100 | Lucky |  Hyderabad |
            | 101 | Pinky |  Delhi |
            | 102 | Bob |  Hyderabad |
        - 특정 시점의 데이터베이스의 컨텐트를 'database state' 혹은 'instance'라고 지칭한다. 
        - 데이터베이스 내에 존재하는 'state'에는 3가지 유형이 있다. 
            1) Empty state: 새로운 데이터 베이스가 정의될 때의 'state'
            2) Inital state: 데이터 베이스에 처음으로 데이터가 로드될 때의 'state'
            3) Current state: 현재의 동작이 데이터베이스에 적용될 때의 'state'
    2. Oracle instance? 
        - 한 개의 데이터베이스가 한 데이터베이스의 서버에 시작될 때, 오라클은 System Global Area(SGA)라고 불리는 메모리 영역을 할당하고, 한 개 혹은 그 이상의 오라클 프로세스 수행을 시작한다. 
        - Oracle 인스턴스는 이미 저장된 데이터 상에서 돌아가는 오라클 데이터베스 백그라운드 프로세스와 해당 백그라운드 프로세스 작업을 하기 위해서 해당 프로세스가 사용하는 공유 메모리, 이 2개의 모음을 오라클 인스턴스라고 한다. 
        - 데이터베이스의 메모리 관리는 데이터베이스의 변화에 따른 요청만큼 오라클 인스턴스 메모리 구조를 이상적인 사이즈로 유지하는 것과 관련이 있다. 반드시 관리되어야 하는 메모리는 System Gloabal Area(SGA) 메모리와 Program Global Area(PGA)이다. PGA 메모리 인스턴스는 모든 개개인의 PGA에게 할당된 메모리의 컬렉션을 의미한다. 
    3. Instance Memory 구조
        - System Global Area 
            - 공유되고 있는 메모리 구조체의 그룹으로 1개의 오라클 데이터베이스 인스턴스를 위한 정보와 데이터를 저장하고 제어한다. SGA는 모든 서버와 백그라운드 프로세스에 의해서 공유되고, SGA에 저장된 데이터의 예시는 cached data blocks와 SQL 공유 영역을 포함한다. 
            - 구성 요소
                1) Database buffer cache
                    : 데이터베이스에 저장된 데이터를 질의하거나 수정할 수 있는 단계 이전에, 해당 데이터는 반드시 디스크로 부터 읽혀지고 난 다음에 buffer cache로부터 저장부터 되어야 한다. 데이터베이스에 연결된 모든 사용자 프로세스는 buffer cache로의 접근을 공유한다. 최적의 수행을 위해서는 buffer cache가 빈번한 디스크 입출력 행위를 피할 수 있을 만큼 커야한다. 
                2) Shared pool
                    : 공유된 풀의 경우 정보를 캐시 메모리에 저장하고 해당 정보는 사용자들 사이에서 공유되어진다. 예를 들어, 재사용가능한 SQL문, 사용자 계정별 데이터와 테이블 그리고 인덱스 세부설명 및 권한과 같은 정보, 프로시저 등이 여기에 해당될 수 있다. 
                3) Redo log buffer
                    : 이 buffer는 redo 정보가 디스크에 저장된 redo log 파일에 저장되고 나서 해당 redo 정보를 캐시 메모리에 저장함으로써 성능을 향상시킨다.
                    (* buffer 데이터를 전달하는 도중 사용되는 임시 보관소
                    * cache 자주 사용되는 데이터를 임시로 저장하는 보관소
                    * redo log? 복구 작업을 위해 만들어진 가장 중요한 'stucture', 이 'structure'는 두 개 혹은 그 이상의 미리 할당된 파일들로 구성. 여기서 이 파일들은 데이터베이스 내에서 이루어진 모든 변화를 저장한 파일을 지칭. 오라클 데이터 베이스의 모든 인스턴스는 관련 redo log를 모두 가지고 있으며 이 보유의 목적은 한 인스턴스 실패에 대비에 따라 데이터 베이스를 보호하기 위한 목적
                    )
                4) Large pool 
                    : 이 수행 영역은 다양한 서버 프로세스에 의해 만들어진 대용량의 입출력 요청을 버퍼 메모리에 저장한다. 
                5) Java Pool
                    :Java Virtual Machine 내에 모든 session에 특화된 자바 코드와 데이터와 정보를 위해 사용되는 메모리 영역을 의미
                6) Streams pool
                    : Oracle Streams 기능에 의해 사용되는 메모리 영역
                7) Result cache
                    : reuslt cache가 쿼리 결과를 버퍼 메모리에 저장한다. 만약 한 개의 쿼리문이 수행되고, 해당 쿼리문의 결과가 result cache에 저장된다면 데이터베이스는 해당 쿼리문을 재수행하는 것 대신에 result cache를 반환한다.
    4. structure
        - 사용자 정의에 의해 묶여진 각기 다른 데이터 유형을 가진 데이터의 조합을 지칭한다. 이러한 조합은 각기 다른 데이터 유형을 인접한 하나의 메모리 청크안에 동일한 논리적 요소로 저장할 수 있는 기능을 제공한다. 
    5. chunk
        - 메모리의 한 번의 작업 수행으로 디스크에 쓰여질 수 있는 메모리의 연속된 하나의 조각을 지칭한다. 
    6. Result Cache
        - Shared Global Area 혹은 클라이언트 애플리케이션 메모리 내의 메모리 영역을 의미. 이 메모리 영역은 데이터베이스 쿼리의 결과와 재사용 목적의 쿼리 블록을 저장한다. 이미 캐시 메모리에 저장된 행들은 유시되기 전까지 SQL문 전체가 공유한다. 
    7. Oracle Streams feature
        - 한 개의 데이터베이스 안에서 혹은 하나의 데이터베이스에서 다른 데이터베이스로의 데이터 흐름 내에서 일어나는 이벤트 혹은 교환 혹은 데이터를 뿌리는 작업을 말함
    8. Namespace
        - 유사한 이름을 가진 다수의 객체들 중에서 각 객체들을 식별하기 위해서 사용되는 것이 'namespace'이다. Namespace는 유사한 이름을 가진 서로 다른 객체들을 구별할 수 있도록 한다. 
    9. Database schema
        - 각 사용자 게정은 고유의 스키마를 가지고 잇는데, 이 스키마는 사용자 이름과 동일한 명칭을 가지고 있다. 예를 들어 HR 사용자 계정은 HR 스키마를 가지고 있다. 
        - 데이터베이스 스키마는 데이터가 조직되는 방식 그리고 데이터간의 관계를 규정하고 있으며 데이터에 적용되는 모든 제한을 정의하고 있다. 
        - 데이터베이스의 다른 객체들(e.g. a table, an index)을 위한 container의 역할을 수행한다. tablespace 또한 segments를 위한 container이지만 이는 다른 객체들을 저장하는 것과 관련이 있으며, 스키마의 경우에는 다른 객체들을 위한 container역할을 수행하지만 논리적 연결과 관련되어 있다. 예를 들어 스키마가 수행하는 container의 역할에는 데이터베이스 관리자가 각 계정에게 역할과 권한을 부여하여 데이터베이스 내의 데이터 작업과 관련된 보안을 관리할 수 있도록 도와주는 것이 포함되어 있다. 
        - 즉 사용자 계정과 동일한 이름의 스키마가 부여됨으로써 관리자는 각 사용자 계정별로 각기 데이터베이스 내의 데이터 접근 권한을 달리 할 수 있게된다. 

            ![What_is_Database_Schema](https://user-images.githubusercontent.com/81787195/224235693-8f95c001-59f2-4991-aeaa-42e458290d4c.jpg)