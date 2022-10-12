---
layout: post
title: "[2022-10-12] Work Report" 
date: 2022-10-12
category: read 
excerpt: ""
---
# 2022년 10월 12일 수요일 

## 오늘의 공부 기록 
### jekyll

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
         ▸ 
         ▸ 
         ▸ 
        ```

[jekyllrb 블로그 참조]: https://jekyllrb-ko.github.io/docs/front-matter/ "Go jekyllrb"