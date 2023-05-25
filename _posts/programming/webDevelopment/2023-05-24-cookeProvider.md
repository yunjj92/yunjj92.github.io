---
layout: post
author: yunjj92 
categories: java
title: cookie Provider
---
<article>
<h4>
	cookie provider란 무엇인가?
</h4>
<p>
	SSO(Single Sign - On) <br>
     cookie provider는 HTTP 프로토콜을 기반에서 작동하며, 기본적으로 세션 정보를 잡기 위해 사용되는 쿠키를 사용하고자 할 때 요구된다. 
     기본적으로 cookie provider는 쿠키를 재형성하고 그 결과 해당 쿠키는 해당 쿠키가 본래 생성된 도메인과 다른 또 하나의 도메인에서 유효하다. 
     cookie provider가 기능적으로 작동하기 위해서는, cookie provider url이 대상 클라이언트 web agent의 설정정보에 추가되어야 한다. 
     요약하잠면, web agent가 cookie provider로서 역할을 수행하여 SMSESSION 쿠키 값을 가져오면, 해당 쿠기 값은 본래 SMSESSION 쿠키의 사본을 만들기 
     위해 사용된다. 그렇게 만들어진 쿠키는 cookie provider domain이 사용한다. 

</p>


![20230427](https://user-images.githubusercontent.com/81787195/234815894-e7369321-4173-4020-ae7a-93c287ecfd84.png)
