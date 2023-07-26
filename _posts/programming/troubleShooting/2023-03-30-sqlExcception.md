---
layout: post
author: yunjj92 
categories: troubleShooting
---

<article>
    <section>
        <h4>sql구문 중 인수 사용 관련 에러</h4>
        <p>1. 지원하지 않는 토큰 <br>
        ![지원하지 않는 토큰](https://user-images.githubusercontent.com/81787195/228762812-31f5a588-3071-4581-839a-ab1c328f75fc.PNG)
        sql 구문 중 param을 사용할 때 #{파라미터이름}의 형식 혹은 ${파라미터이름}의 형식으로 사용하지 않을 경우 나타나는 에러이다. 
        </p>
        <h4>외부 플러그인 설치 후 db 드라이버 버전 충돌 발생</h4>
        <p> 1. jdk 버전과 맞지 않은 드라이브 버전 사용시 <br>
        jdk 버전과 상이한 버번의 db 드라이브 버전을 사용했을 때 기본적으로 해당 드라이브 버전을 jdk 버전과 맞춰야 한다. 라이브러리 변경에는 크게 두가지 방법이 있다. 첫 번째는 프로젝트의 properties 설정에서 libraries 탭에서 기존에 imported된 라이브러리 삭제후 다시 적합한 버전의 라이브러리를 추가하는 방법이다. 두 번째는 외부라이브러리 사용시 db driver을 따로 경로를 잡아주는 경우에 사용하는 방법이다. 기존에 imported된 라이브러리를 사용하지 않고, 새롭게 라이브러리 경로를 잡아주는 경우 첫번째 방법으로는 보이지 않을 수도 있다. 이때는  c:\Program files\java\jre1.8.0_221\lib\ext 경로에서  외부 라이브러리 사용시 추가된 드라이버를 삭제하고 다시 버전에 맞는 드라이버를 추가해준다. 기본적으로 프로젝트마다 jdk 버전이 상이하여 각 프로젝트마다 필요로 하는 드라이버 버전이 다를 수도 있다. 따라서 기본적으로 위 경로로 드라이버를 추가하기 보다, 프로젝트 자체에서 라이브러리를 관리하고 해당 라이브러리의 경로를 추가하여 외부 플러그인을 사용하는 것을 추천한다. <br>
        만약 위 두 가지 방법으로도 시도했지만 되지 않을 때에는 이클립스에서 preference 설정 창에서 해당 외부 플러그인 이름으로 된 탭을 찾으면 된다. 예를 들어 본인이 ERMaster라는 이름으로 외부 플러그인을 설치했다면, ERMaster라는 이름의 탭이 preference 창에 있을 것이다. 해당 탭을 클릭하면 세부 페이지에 oracle driver로 이전에 설치한 자신의 드라이버가 있다. 해당 드라이버를 삭제하거나 삭제가 불가능하면, 경로를 다시 잡아주면 된다. 
        </p>
        <h4>쿼리 조회 후 결과를 가져오지 못하는 경우</h4>
        <p>1. 컨트롤러에서 받는 최종 returnType으로 return하지 못하는 경우<br>
        아래 에러가 발생했을 경우의 에러 원인은 Getter어노테이션을 붙이지 않았기 때문에 쿼리는 정상적으로 조회가 되었어도 일단 service단에서부터 쿼리 조회 결과를 가져오지 못했을 것이다. 이에 따라 최종 ReturnType인 ResponseList 자료형에도 어떠한
        데이터도 들어있지 않을 것이기 때문에 실질적으로 serialize가 불가하며 null이 들어있어 오류가 발생하는 것이다. 따라서 
        아래와 같은 에러가 발생한다면 처음부터 sql 쿼리 조회 결과를 제대로 가져올 수 있는 상태인지 살펴보는 것이 해결의 첫걸음이다. 
        ReturnType인 RepsonseList 자료형에 
        </p>
        <pre class="codeblock">
        org.springframework.http.converter.HttpMessageConversionException: Type definition error: [simple type, class com.yunCompany.yun.store.fruit.dto.FruitNameDto]; nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class com.yunCompany.yun.store.fruit.dto.FruitNameDto and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: com.yunCompany.yun.application.common.ResponseList["data"]->java.util.ArrayList[0])
        </pre>
    </section>
</article>


