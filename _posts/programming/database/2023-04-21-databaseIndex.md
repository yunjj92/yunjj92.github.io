---
layout: post
author: yunjj92 
categories: database
title: About DB Index
---
<article>
<h4>
Index 개요    
</h4>
<p>
    Index 개요 <br>
    기본적으로 한 개의 인덱스는 해당 인덱스가 매겨진 칼럼의 값들을 저장하고 있다. 그리고 그 값들을 지닌 각 행들의 위치도 저장하고 있다. 이 위치 값을 가지고 있다는 것은 책 뒷편의 인덱스와 유사한 개념이라고 볼 수 있다. 즉 인덱스는 찾고자 바로 그 데이터를 타겟팅(특정짓기)할 수 있는 방법이라고 볼 수 있다. 인덱스를 만드는 방법은 아래와 같이 비교적 단순한데, 해당 테이블의 칼럼들이 어떻게 사용되는냐에 따라서 인덱스를 한 개의 칼럼에 매길 수도 있고, 여러 개의 칼럼에 매길 수도 있다. 
</p>
<pre class="codeblock">
create index [index_name] on [table_name] ( [column1], [column2], … );
create index toys_color_i on toys ( color );
create index toys_color_type_i on toys ( color, type )
</pre>
<h4>인덱스 타입</h4>
<p>
  Oracle 데이터베이스의 경우 다양한 형태의 인덱스를 제공하는데, 인덱스 타입 선택시 고려해야 할 주된 요소 중의 하나가 bitmap 인덱스를 사용할 것인지 혹은 B-tree 인덱스를 사용할 것인지이다. 기본적으로 대부분의 인덱스는 B-tree이고, B-tree 인덱스의 경우엔 모든 하위 노드가 동일한 depth를 가지게 되므로 각 값들에 접근하기 위한 작업량이 거의 비슷하다고 볼 수 있다. B-tree 구조의 경우 각 하위 노드와 연결된 인덱스 엔트리는 정확히 한 개의 행을 가리킨다. 여기서 엔트리는 일종의 저장된 하나의 데이터 단위를 말하는 것으로, 'Index entries'는 해당 인덱스가 매겨진 칼럼의 모든 데이터들을 말하고, 'a leaf index entry'는 가장 하위의 노드와 연결된 index entry를 지칭하는 것으로 한 개 행의 데이터를 가리킨다고 볼 수 있다. 다시 인덱스 타입으로 돌아와서, B-tree 구조의 인덱스를 기본으로 사용하는 것은 'lock'때문이라고 볼 수 있다. B-tree 구조의 인덱스를 사용하면, 데이터의 조작이 있을 때, 해당 데이터베이스는 인덱의 싱크를 자동으로 맞추게 된다. 즉 인덱스가 매겨진 칼럼의 특정 값이 변경될 때, 해당 값을 가진 하위 노드들도 변경도 함께 이루어진다. 그러나 bitmap의 경우 변경하려는 값을 포함하고 있는 범위의 모든 행들에 대해 lock을 걸게 된다. 따라서 bitmap의 경우 한번에 한 개의 값만을 처리하는 프로세스에 어울린다. 
</p>
<p>
    <br>
    B-tree 인덱스에선, 새로 입력되는 모든 값들은 지정된 올바른 위치에 들어가야하는데, 기본적으로 오름차순 정렬이 기준이 된다. 컬럼 바로 뒤에 내림차순이라고 바로 명시하면, 오라클 데이터베이스는 각 값들을 내림차순으로 정렬한다. 
</p>

<h4>구체적인 데이터 에러 및 수정이 필요한 데이터의 종류</h4>
<p>
    Data Cleansing은 손상된 데이터(그 외에도, 부정확하거나, 유효하지 않거나, 부합되지 않는 경우)를 포함하여, 각 data collections 내의 이슈들과 에러의 다루는 작업이라고 할 수 있다. 이러한 관점에서, 구체적으로 문제가 되는 부분들 중의 일부는 주로 data 초반 작업 동안의 human error에 속한다고 볼 수 있다. 이 외에도, 한 조직 내에서 각자 다른 시스템에 해당되는 전문용어, 형식, 데이터 구조등을 사용함으로써 일어나기도 한다. 수정이 필요한 데이터의 유형은 총 4가지이다. 더이상 유효하지 않거나 소실된 데이터. 일관되지 않은 데이터. 중복된 데이터. 무관한 데이터. 
</p>
<h4> data cleansing의 절차</h4>
<p>
    data cleansing 작업의 범위는 data collections 및 분석 요구에 따라서 그 범위가 달라진다. 예를 들어 신용카드 거래 상에서 사기 추적을 위한 분석을 수행하는 data scientist는 본래 이루어졌던 패턴과는 완전히 상이한 패턴의 거래 정보를 요구할 것이다. 그러나 데이터 cleansing은 일련의 다음과 같은 절차를 수행한다. 먼저, 전체 정보를 모두 조사하고 검증하야 각 데이터 품질의 수준 그리고 수정되어야 할 이슈들을 모두 식별한다. 이 단계는 일반적으로 data profiling을 포함하고, 이 data profiling은 데이터 요소들 간의 관계를 문서화하고 데이터 품질을 체크하고, 문제점을 찾기 위해 통계를 모은다. 두 번째는 Cleaning 작업으로, 핵심단계라고 할 수 있고, 데이터 에러르 모으고 문제가 되는 데이터들을 처리한다. 세 번째는 검증 단계이다. 앞선 단계가 마무리되면, 각 팀은 데이터를 검증하고 모두 재조사하여 내부의 데이터 품질 규정 및 기준들을 재확립 및 확인한다. 마지막은 Reporting  단계이다. 이 과정에서 수정된 데이터의 통계 및 수정되고 현행화가 이루어진 데이터 품질 수준에 대한 구조도 등을 업데이트한다. 
</p>
<h4></h4>
<p>
1. hone 
    1) to direct something such as an ability to make it more effective <br>
    e.g) He helps perfomers to hone their skills as dansers and singers.<br>
    2) to make something more sharper <br>
    e.g) To hone scissors <br>
    3) to make something perfect or completely suitable for its purpose <br>
    e.g) His physique was hone to perfection.

 <br>
</p>
</article>