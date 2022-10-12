---
layout: post
title: "[2022-10-11] Work Report" 
date: 2022-10-11
category: read 
excerpt: ""
---
# 2022년 10월 11일 화요일 

## 오늘의 공부 기록 
### scss
 1. css-lcurlyexpected error 발생
   - 아래 코드에서, @import 부분에서 에러가 발생, 원인이 뭘까? 
   ```
    ---
    ---
    @import "style"; 
   ```
    - 위의 코드에서, 머릿말 블록에 어떤 것도 쓰이지 않았기 때문에, 
    - 만약 md파일 작성시 설정사항 기재가 필요없다면 --- --- 은 생략 가능 
    - 이렇게 하면 import 부분에 발생된 오류는 없어진다.
    - 그러나 다른 문제가 발생 
        ```
        ▸ default.html파일에서  <link> 태그 사용하여 main.scss를 참조하고 있음 
        ▸ 그러나 머릿말 블록을 없애버리면, 다른 파일에서 main.scss를 참조하지 못한다. 주의!!
        ```

        
### java
  1. DAOFactory클래스에서의 java.lang.NullPointerException 발생 원인 중 하나
    ```
        private String testDAO = proeprtyResource.getDAOName("Test");
        DAOFactory factory = DAOFactory.getDAOFactory();
        TestDAO dao = (TestDAO) factory.getComponentDAO(this.testDAO); //오류발생
    ```
     - line 3 오류발생 원인
        ```
            public class  ProepertyResource{

                public statidc String getDAOName(String key) {
                    return Resource.getInstatnce().getProperty(BundleFile.DAO_NAME, key);
                }

            }
        ```
        ```
            public interface BundleFile{
                public final static String DAO_NAME = "/dao.properties"
            }
        ```
     - FLOW 정리: 
        - dao.properties 에 dao클래스 정의
        - BundleFile 인터페이스에서 dao클래스가 정의된 <br> dao.proeprties 경로/파일이름 변수에 저장
        - PropertyResource의 method에서, bundleFile 클래스의 변수를 이용하여  <br>  dao.properties에 저장된 dao 클래스 정보 가져옴
        - 일반 Wrapper클래스에서 사용하고자 하는 DAO클래스의 인스턴스를  <br>  ProeprtyResource의 method를 이용해서 가져옴


## 추후 진행될 작업 리스트 
### 이번달 
- 10월 첫 주
    - 진행 사항 결과: MY보관함 ip 설정 및 수정 사항 제외하고 개발 완료  
         ```
             1. MY보관함 기능 수정 90% 
                1.1 10%: 로컬에서 수행시, 설정된 개발기의 디렉토리 접근 불가하여 해당사항 설정 필요
                1.2 10%: 개발기에 올릴 때는, 원래 설정 사항을 원복 혹은 localhost로 설정
             2. 위 기능 수정시 SWT jar 파일 keystore 생성 및 인증 100% 
             3. 위 기능 수정 후 로컬에서 테스트 100%
             4. 기능 수정 jar 파일 떠서 사용자가 화면까지는 볼 수 있도록 만들기 100%
         ```
- 10월 두 번째 주
    - 진행 사항 요약:
         ```
             1. DCMF 구조개선(아래 사항 파일로 정리)
                1.1 APACHE(WEB SERVER) + TOMCAT(WAS) > DCMF APP 변경 사항 
                1.2 SPRING BOOT + JAVA VERSION 8 OR 9 이상 > APP 변경 사항 및 ORACLE과 장비 설정 사항
                1.3 DCMF APP MESSAGE QUEUE 자체 사용 점검 후 TOBE 버전 방안
                1.4 SOURCE TO BE 버전 정리
                    1.4.1 ASIS 버전에서 그대로 가져갈 것 
                    1.4.2 ASIS 버전에서 응용 및 개선해서 적용할 것 
                    1.4.3 TOBE 틀만 그대로고, TOBE 버전으로 완전히 개발해야 할 것 
                1.5 TOBE 버전의 SOURCE LOGIC + 연동 + 장비 관련 사항 그림+설명으로 정리
             2. DCMF APP 소스 개발 
                2.1 MY보관함 IP 접근 허용 불가 설정
                2.2 위 사항 설정 후 보안 관련 이슈 정리하여 적용
                2.3 영구보관함 기능 복원
                2.4 일반컨텐트 삭제 기능 추가 
         ``` 
    

### 1달~2달 사이 
- 12월 상용작업
    - jsp를 제외한 모든 파일의 경우 상용 전날에 미리 올려둘 것 
        ```
            1. 전날에는 본래파일명_tobe20221210.확장자 2. 당일에는  본래파일명.확장자
        ```
    - jsp의 경우 tobe 파일로 바꾸어야 하는 파일의 경우 (방법1)
        ```
            1. 본래파일명_origin_221005.확장자  + 본래파일명_tobe_221005.확장자 
            2. 당일 rm 본래파일명.확장자
            3. 당일 rename 본래파일명_tobe_221005.확장자  본래파일명.확장자  본래파일명_tobe_221005.확장자
        ```
    - jsp의 경우 tobe 파일로 바꾸어야 하는 파일의 경우 (방법2: 초반 리스크있지만, 원복가능한 방법)
        ```
             1. 전날에 jsp의 경우 바꿔야 하는 디렉토리만 따로 추려서 '본래디렉토리명_tobe' 만들기
             2. 당일 작업날 낮에는 해당 jsp 디렉토리 '본래디렉토리명_origin'으로 복사해두기
                이 작업의 경우 아주아주 중요하니까!! tobe가 있는 모든 jsp 디렉토리를 복사해두기!! 
                작업이 필요한 jsp를 담은 모든 디렉토리가 포함되어야 함
             3. 당일 작업 시간에는 '본래디렉토리명_origin'이 있는 디렉토리만 '본래 디렉토리명' 삭제하고 
             4. '본래디렉토리명_tobe'를 '본래디렉토리명'으로 이름 변경
        ```  