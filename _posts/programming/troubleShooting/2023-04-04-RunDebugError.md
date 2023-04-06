---
layout: post
author: yunjj92
---
# Run/Debug 관련 오류
### 1. Run on Server / Debug on Server 실행 중 오류 
##### 1.1  기본 클래스를 찾거나 로드할 수 없습니다. 
- 기본 클래스는 'PrjectNameApplication.java'를 지칭.
    - 서버를 올리게 되면 위 기본 클래스에서 프로젝트에 관한 설정사항을 가져오는데, 위와 같은 오류 발생시 해당 클래스를 로드하지 못하는 경우로, Run/Debug Setting을 다시 해준다. 
    - 프로젝트의 properties > Run/Debug Settings > 해당 프로젝트의 기본클래스 삭제 > NEW 버튼 클릭후 해당 기본 클래스 추가 
    - 추가로, 프로젝트의 properties > Java Build Path > Libraires > JRE System Library 클릭 > Edit > JRE 설정이 jdk 1.8로 설정이 되어있는지 확인 후 > 되어있지 않다면, jdk1.8로 설정해준다. 
    - 나의 경우에는 프로젝트의 Run/Debug Setting보다는 jdk 설정이 안되어 있어서 발생하는 경우가 많았다. 
### 2. Database driver 관련 오류 
##### 2.1 지원되지 않는 문자 집합(클래스 경로에 orai18n.jar 추가):... 
- pom.xml에 orai18n.jar 라이브러리가 추가되지 않아 발생하는 오류
    - ojdbc8.jar
         : JDK8, 11, 12, 13, 14, 15 지원
    
    - orai18n.jar
        : NLS 아키텍쳐 사용을 지원하는 라이브러리. 

    - 참고
        - NLS: Native Language Support, 사용자의 지역 및 해당 지역의 언어에 맞추어 데이터를 처리. 구체적으로, 데이터를 저장하고, 처리하고 반환하는 모든 과정을 해당 사용자의 언어로 처리하며, 그 외에도 데이터베이스 사용 및 에러메시지, 문자 정렬, 날짜 및 시간, 화폐, 숫자, 달력과 같은 부분도 해당 사용자의 지역에 따라 달리 설정된다. 
        - ojdbc10.jar: JDK10, 11 사용과 동시에 Oracle 19c version만을 지원하는 라이브러리
        - ojdb11.jar: JDK11, 12, 13, 14, 15 지원(보통 JDK 버전에 따라서 ojdb11 혹은 ojdbc8 로 나뉜다.)  

  
### 3  한글깨짐 현상
##### 3.1 콘솔창 한글깨짐 현상 
    - 실행 중인 프로젝트 중단 
    - Project ▸ properties ▸ run as ▸ run configurations ▸ common
        - Encoding ▸ others ▸ MS949
    - apply ▸ run 
    