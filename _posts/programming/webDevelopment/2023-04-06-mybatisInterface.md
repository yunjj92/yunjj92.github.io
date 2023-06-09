---
layout: post
author: yunjj92
categories: webDevelopment
title: Spring annotaion
---
<article>
    <h4>
    Spring annotation VO 클래스 관련 
    </h4>
    <p>
    @Data<br>
    @ToString, @EqualsAndHashCode, @Getter, @Setter @ReuqiredArgsCosntructor의 세트라고 보면 된다. 
    모든 필드의 getter, 그리고 final로 선언되지 않는 모든 변수들의 setter, https://projectlombok.org/features/Data
    </p>
    <pre class="codeblock"></pre>
    <h4>
    lombok 관련 annotaion
    </h4>
    <p>
        @RequiredArgsConstructor<br>
    각 필드에서 1개의 파라미터를 가진 생성자를 생성한다. 만약 해당 클래스에 final field 혹은 @NonNull annotation이 선언된
    field가 여러개 있다면, 해당 field 개수만큼 생성자를 만들어낸다. 
    </p>
    <pre class="codeblock"></pre>
    <h4>
    </h4>
    <p>
        <br>
    </p>
    <pre class="codeblock"></pre>
</article>


# Spring annotation
### 1. Spring annotation VO 클래스 관련 
##### 1.1 @Data
