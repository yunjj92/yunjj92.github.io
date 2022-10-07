# 2022년 10월 05일 수요일 

## 오늘의 공부 기록 
### java
    - File.class
        - 정의 
            ```
                ▹ 디렉토리 내 파일+디렉토리명의 문자열을 반환  
                ▹ 만약 경로명이 (/부터 포함된) 어떠한 디렉토리도 가리키지 않거나, <br> 입출력 에러가 일어난다면 빈 배열이 반환됨 
                ▹ 해시주소값이든 문자열 형태의 디렉토리명이든 상관없이 하나의 경로명은 상대경로일 수도 절대경로일 수도 있다. 
                ▹ 상대경로의 경우 prefix '/'은 없고, 현재 사용자의 디렉토리를 기준으로 설정된다. 
            ```
        - method
            ```
                ▹ listFiles() 해시주소값의 경로를 문자열로 반환한다. 
            ```

    - JNLP(Java Network Launcher Protocl)
        - 사용법
            ```
                ▹ client application에 WebSphereClientLauncher.jar 파일이 포함되어야 함 
                ▹ 위 jar 파일은 com.ibm.websphrer.client.launcher.ClientLauncher 클래스 포함
                ▹ 서버의 jar 파일을 받아 실행 
                ▹ 실질적으로 실행되는 바이너리의 경로 및 파일명은 "c:/Program Files/Java/jdk1.8.0_221/bin/javaws.exe 
            ```
        - 사용 중 발생한 에러 케이스 
            ```
                java.lang.UnsatisfiedLinkError:Cannot load 32-bit SWT libraries on 64-bit jVM
                ▹ swt-win.jar 파일이 32 bit 기준이기 때문에 일어나는 일 
                ▹ swt-win.jar 파일을 64 bit 기준으로 다시 다운받아서 import 해줄 것 
            ```
    - jar 파일 인증
        - 인증되지 않은 jar 파일 배포 전 서명하는 법
            ```
                ▹ 사용 실행 파일 : Java\jdk1.8.0_221\bin\jarsigner.exe
                ▹ jarsigner 명령어 바로 cmd에 사용하여, 인증 여부 확인 가능
                ▹ jarsigner 명령어 이용시, keystore 필요
                ▹ keystore는 keytool 사용해서 생성 가능
            ```


### linux
    - 명령어 
        - 파일 관리
            ```
                ▹ 빈파일 생성 ▸ touch /tmp/test/index.html ▸ /tmp/test/ 디렉토리에 index.html 빈 파일을 생성한다.  
            ```
        - 운영체제 정보
            ```
                ▹ uname -a ▸ 현재 시스템의 운영체제 관련 전체 정보
                ▹ uname -r ▸ 현재 시스템 커널 버전 확인 가능 
                ▹ uname -n ▸ 리눅스 운영체제가 네트워크 상에서 다른 노드와 연결하고자 사용하는 '호스트 이름' 확인
                ▹ uname -m p -i ▸ 차례대로, 현재 기기 하드웨어 이름>프로세서 타입>운영 체제 
            ```


## 추후 진행될 작업 리스트 
    ### 이번달 
        - 10월
            ```
                1. MY보관함 기능 수정
                2. 위 기능 수정시 SWT jar 파일 keystore 생성 및 인증
                3. 위 기능 수정 후 로컬에서 테스트
                4. 기능 수정 jar 파일 떠서 사용자가 화면까지는 볼 수 있도록 만들기
            ```

    ### 1달~2달 사이 
        - 12월 상용작업
            ```
                ▹ jsp를 제외한 모든 파일의 경우 상용 전날에 미리 올려둘 것 
                  1. 전날에는 본래파일명_tobe20221210.확장자 2. 당일에는  본래파일명.확장자
                ▹ jsp의 경우 tobe 파일로 바꾸어야 하는 파일의 경우 (방법1)
                  1. 본래파일명_origin_221005.확장자  + 본래파일명_tobe_221005.확장자 
                  2. 당일 rm 본래파일명.확장자
                  3. 당일 rename 본래파일명_tobe_221005.확장자  본래파일명.확장자  본래파일명_tobe_221005.확장자
                ▹  jsp의 경우 tobe 파일로 바꾸어야 하는 파일의 경우 (방법2: 초반 리스크있지만, 원복가능한 방법)
                  1. 전날에 jsp의 경우 바꿔야 하는 디렉토리만 따로 추려서 '본래디렉토리명_tobe' 만들기
                  2. 당일 작업날 낮에는 해당 jsp 디렉토리 '본래디렉토리명_origin'으로 복사해두기
                     이 작업의 경우 아주아주 중요하니까!! tobe가 있는 모든 jsp 디렉토리를 복사해두기!! 
                     작업이 필요한 jsp를 담은 모든 디렉토리가 포함되어야 함
                  3. 당일 작업 시간에는 '본래디렉토리명_origin'이 있는 디렉토리만 '본래 디렉토리명' 삭제하고 
                  4. '본래디렉토리명_tobe'를 '본래디렉토리명'으로 이름 변경

            ```