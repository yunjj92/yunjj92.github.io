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
    <h4>
    lombok 관련 annotaion
    </h4>
    <p>
        @RequiredArgsConstructor<br>
    각 필드에서 1개의 파라미터를 가진 생성자를 생성한다. 만약 해당 클래스에 final field 혹은 @NonNull annotation이 선언된
    field가 여러개 있다면, 해당 field 개수만큼 생성자를 만들어낸다. 
    이 어노테이션 이해를 위해선 스프링에서 의존성 주입에는 여러 방법이 있다는 점을 알아야한다. 기본적으로 의존성 주입 방식은 크게 2가지로 나뉜다. 첫 번째는 생성자 기반의 의존성 주입과 두 번째는 'Setter' 기반의 의존성 주입이다. 생성자 기반의 의존성 주입방식에서는 빈으로 등록할 클래스에 @Component 어노테이션을 선언해서 스프링 컨테이너에 빈으로 등록하고, 
    </p>
    <p>
        @Transactional<br>
     이 어노테이션을 선언하고 별다른 롤백 룰을 설정하지 않으면, RuntimeException 혹은 Error 발생시 자동으로 롤백을 하게되어 있다. 롤백 룰의 경우 예외가 주어질 때마다 롤백의 수행 여부를 결정한다. 이 외에도 여러가지를 설정할 수 있는데, 예를 들면, Isolation 레벨 혹은 readOnly 값을 설정할 수 있다. readOnly의 경우 오직 한 개의 트랜젝션 내부에서만 연관이 있음을 주의해야 한다. 
    </p>
    <h4>
    Parameter, method, field 관련 사용되는 어노테이션
    </h4>
    <p>
        @Value<br>
     el문을 사용하여 해당 필드 혹은 파라미터에 값을 주입할 때 사용된다. 즉 시스템의 properties 값을 불러올 때 사용한다. 
     예를 들어 아래 코드와 같이 사용한다. 아래 코드와 같이 사용하면, *.properties 파일에서 systemProperties.url이라는 
     속성 명을 찾아서 해당 속성 명에 할당된 value를 리턴하여 url이라는 필드에 주입한다. 
    </p>
    <pre class="codeblock">
     @value("${systemProperties.url}")
     private String url; 
    </pre>

</article>
