---
layout: post
author: yunjj92
categories: database
---
<article>
<h4>1. Oracle JOIN 유형</h4>
<P>
    1번부터 3번까지 모두 JOIN 키워드와 ON 조건절로 조인을 명확히 명시한 경우에 속한다. 
</P>
<p>1) INNER JOIN<br>
    두 테이블 간의 조인이고, JOIN 키워드와 ON 조건절로 조인을 명확히 명시한 경우(ON 조건절에 따라 같은 행이 2번 반복되어 결과가 
    도출될 수 있다. 따라서 조인하려는 테이블의 PK칼럼 혹은 인덱스 칼럼이 조인의 조건으로 되어있지 않거나, 되어 있어도 동일하게
    중복이 되어 나타난다면, 다른 PK칼럼 혹은 인덱스 칼럼을 이용한 조인의 조건을 추가하여 중복을 없애자. GROUP BY로 중복을 
    제거할 수는 있으나, 해당 부분은 이미 중복되어 나타난 조회 결과에서 중복을 제거하는 것이기에 근본적은 해결책은 아니고, 
    또한 GROUP BY를 기재함으로써 이미 조회된 데이터의 결과를 DB 서버의 메모리에 올려두어야 하므로 DB 메모리를 상당부분
    차지하므로 되도록이면 지양하자)
</p>
<p>2) LEFT OUTER JOIN<br>
    조인 조건에 부합하지 않아도, 첫번째 테이블의 행들은 모두 출력되는 것이 특징
</p>
<p>3) RIGHT OUTER JOIN<br>
     조인 조건에 부합하지 않아도, 두번째 테이블의 행들이 모두 출력되는 것이 핵심
</p>
<p>4) CROSS JOIN <br>
    JOIN 키워드와 ON 조건절을 사용하지 않는 조인 쿼리를 지칭
</p>
<p>
    그 외 NATURAL JOIN 조인도 존재한다. 
</p>

<h4>모르는 개념 살펴보기</h4>
<p>
  Cartesian product <br>
</p>

<h4>2. foreach </h4>
<p>
    
</p>
</article>
