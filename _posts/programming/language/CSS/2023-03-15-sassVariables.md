---
layout: post
author: yunjj92 
categories: css
---
<article>
<h4>
Sass Variables 개요
</h4>
<p>
Sass 변수는 모든 Sass 식별자처럼 하이픈과 언더바를 식별자로 취급한다. 즉 $font-size 와 $font_size 모두 똑같이 취급한다. variable은 사용자가 이후에 재사용가능한 정보를 저장하기 위한 방법으로, Sass에는 다음과 같은 변수에 정보를 저장할 수 있다. <br>
     - strings, numbers, colors, booleans, lists, nulls<br>
     - 변수를 선언하고자 할 때에는 $ 표시 뒤에 이름을 쓰면된다. <br>
        - e.g ) $variablename : value;<br>
      - 이미 선언된 변수의 값을 다른 변수 선언시 사용하고자 한다면 다음과 같이 하면 된다. <br>
</p>
<pre class="codeblock">
                $base-color: #c6538c;
                $border-dark: rgba($base-color, 0.88);
</pre>
<h4>
Sass 기본값
</h4>
<p>
 일반적으로 변수에 값을 할당할 때, 변수가 이전에 값을 가지고 있었다면, 이전의 값은 덮어씌어지게 된다. 만일 Sass 라이브러리를 가지고 있을 때, library내 변수의 값을 새로 설정하고자 할 때에는 !default flag를 사용하면 된다. !default flag를 사용하면, 해당 변수가 미리 정의되어 있지 않거나 해당 값이 null일 경우에, 사용자가 설정한 값을 해당 변수에 할당하게 된다.!default flag를 사용하지 않으면 이전에 존재하던 값이 사용된다. 
</p>
<h4>
Scope
</h4>
<p>
스타일시트에 가장 상위 레벨에 선언된 변수는 전역변수로, 이는 이 변수가 어느 곳에서든 접근이 가능하다는 의미이다. 그러나 모든 변수가 그런 것은 아니다. scss 내에서 중괄호로 묶여 해당 부분 안에 선언된 변수들은 기본적으로 해당 변수들이 선언된 블록 내에서만 접근이 가능하다. 
- !global flag는 오직 file내 가장 상단에 선언된 변수가 존재해야만 사용 가능한 부분이다. !global flag는  새로운 변수를 선언하기 위해 사용되는 것이 아니다. 
</p>
<pre class="codeblock">
$global-variable: global value;

.content {
  $local-variable: local value;
  global: $global-variable;
  local: $local-variable;
}

.sidebar {
  global: $global-variable;

  // This would fail, because $local-variable isn't in scope:
  // local: $local-variable;
}
</pre>
<h4>
Shadowing
</h4>
<p>
로컬 변수들은 전역 변수와 동일한 이름으로 선언될 수 있다. 만일 그렇게 선언이 이루어지면, 사실상 같은 이름을 가진 다른 변수가 여러개가 있는 것이다. 이런 방식은 로컬 변수를 선언한 사람이 일부러 의도하지 않는 한 같은 이름의 전역변수의 값을 변경할 수 없게 된다는 뜻이다. 만일 본인이 전역변수의 값을 한 파일 내에서라도(within a local scope) 변경하고 싶다면, !global flag 를 사용하면 된다. !global로 선언 표기가 된 변수는 항상 전역 범위 내에서 해당 값이 의도한 전역변수에 할당될 것이다. 
</p>
<pre class="codeblock">
$variable: global value;

.content {
  // 여기서 $variable 변수는 위에서 선언한 variable이 아니라 
// local scope 내에서 선언된 local variable이라고 볼 수 있다. 
  $variable: local value;
  value: $variable;
// 여기서의 value는 local value
}

.sidebar {
// 여기서의 value는 'local value'가 아니라, 상단에 선언된 전역변수의 값인
// global value가 맞다. 
  value: $variable;
}
</pre>
<pre class="codeblock">
$variable: first global value;

.content {
  $variable: second global value !global;
  value: $variable;
}

.sidebar {
  value: $variable;
}
</pre>

<h4>
Flow Control Scope
</h4>
<p>
'flow control rules' 안에 선언된 변수는 적용되는 특정 범위가 있다. 이 변수들은 'flow controle rule'에 따라 동일한 레벨에서 선언된 변수보다 우선순위가 높다. 즉 한 변수에 조건적으로 하나의 값을 할당하는 작업을 수월하게 만들어주거나 하나의 반복문의 로컬 값을 할당할 수 있도록 한다. 
- 당연한 얘기이지만 flow control scope 내에서 할당된 변수들은 이 scope 밖에서 사용할 수 있다. 그러니까, null로 선언할 필요가 있다고 하더라도, 해당 변수에 값을 할당하기 전에, 반드시 사용하고자 하는 해당 변수를 선언했는지 확인해야 한다. 
</p>
<pre class="codeblock">
$dark-theme: true !default;
$primary-color: #f8bbd0 !default;
$accent-color: #6a1b9a !default;

@if $dark-theme {
  $primary-color: darken($primary-color, 60%);
  $accent-color: lighten($accent-color, 60%);
}

.button {
  background-color: $primary-color;
  border: 1px solid $accent-color;
  border-radius: 3px;
}
</pre>
<h4>
Advanced Variable Functions
</h4>
<p>
Sass의 핵심 라이브러리는 여러 향상된 기능을 제공한다. meta.variable-exists()라는 함수는 주어진 이름의 변수가 현재 범위 내에 존재하는지 아닌지를 리턴한다.  meta.global-variable-exists() 함수는 동일한 기능을 띄지만, 전역범위라는 점이 다르다. 
</p>
<pre class="codeblock">
</pre>
<h4>
font 관련
</h4>
<p>
font를 변경하기 위해서는 크게 2가지를 알아야 한다. 첫 번째는 font를 설정하는 방법 그 자체이다. scss 디렉토리에 _variable.scss 파일을 생성하고 해당 파일에 폰트를 정의한다. 두 번째는 첫 번째에서 만들어진 파일을 main.scss에서 전체 기본 글꼴로 설정한다. 각 단계별로 더 상세히 설명하자면, 첫 번째 font를 설정방법은 기본적인 변수 정의 및 value 할당 순서대로 수행하면 된다. 즉, 이렇게! '$변수이름: 글꼴이름 !default;' 두 번째, main.scss 파일에서 앞에서 정의한 변수를 사용하기 위해 해당 파일을 import한다. import하기 위해선 main.scss 파일 상단에 @use, @import를 사용하면 된다. 상세 코드는 아래를 참조하면 된다. 
</p>
<p>
참고로 scss 파일에서 css의 기본적인 요소들은 원하는 변수들의 속성 값을 설정할 수 있지만, _variable.scss 파일에서 선언된 변수를 사용하려면, 해당 변수를 전역변수로 선언하고 그 변수가 포함된 파일을 현재 사용하고자 하는 scss 파일에 import 해줘야 한다. 또한 font 설정에서 여러개의 font가 설정되어 있는 경우가 대부분인데, 이는 사용자 환경에 따라 지원불가한 글씨체가 있을 경우 우선순위에 따라 다음의 글씨체를 적용할 수 있도록 하기 위함이다. 글씨체 변경 방법은 여러가지가 있을 수 있으며, 아래의 코드는 단순히 하나의 예시에 불과하다. 참고로 글꼴 중에 sans-serif가 있고, serif가 있는데, 여기서 serif는 삐침이 있는 글자라는 의미로, sans가 붙게되면 삐침이 없는 글자라는 의미이다. 
</p>
<pre class="codeblock">
  @use "path/filename"
  @import "path/filename"
   
  @font-face{
    font-family: $myCustomFont;
    src: url("../font/NanumhandWriteMongdol.ttf");
  }
</pre>
<pre class="codeblock">
  $myCustomFont: 'NanumhandWriteMongdol' !default;
  $serif: $myCustomFont , Georgia, Times, serif !default;
  $sans-serif: $myCustomFont  "Roboto", "Segoe UI",
  "Helvetica Neue", "Lucida Grande", Arial, sans-serif !default;
</pre>

<h4>주의사항</h4>
<p>
CSS는 자체 변수를 가지고 있고, 이 변수는 Sass 변수와는 완전히 다르므로 그 차이를 알아두어야 한다. <br>
  - Sass 변수는 모두 Sass에 의해 컴파일되고, CSS 변수는 CSS 결과에 그대로 포함되어 있다. <br>
  - CSS 변수는 다른 요소들마다 다른 값을 가지고 있지만, Sass 변수는 오직 한번에 한 개의 값만 가지고 있다. <br>
  - Sass 변수는 명령적인 성격을 띄기 때문에, 한 개의 변수를 사용하고자 하면 해당 변수의 값이 변하지만, 이전의 사용된 값은 똑같이 머물러 있을 것이다. <br>
  - 반면에 CSS 변수는 선언적인 성격을 띄기 때문에, 값을 변경할 경우에는 이전에 사용된 부분과 후에 사용될 부분 두 부분 모두 영향을 끼친다. <br>
</p>
<h4>용어 정리</h4>
<p>
  1. Flow Control Rules<br>
Sass는 수많은 at-rule을 제공하여 스타일이 영향을 받는 정도와 빈도와 받는 여부를 제어할 수 있도록 해준다. 이 외에도, 적은 알고리즘으로 Sass를 더 쉽게 사용할 수 있도록 해준다. Sass는 4개의 flow control rules를 제공한다. <br>
        - @if 하나의 블록이 수행 여부의 판단 과정을 거칠지 아닐지에 대한 여부를 제어하기 위한 목적의 at-rule<br>
        - @each 하나의 맵 안의 각각의 페어 혹은 한 리스트의 각 요소에 대해 하나의 블록의 수행 여부를 판단한다. <br>
        - @for 한 블록이 몇번 수행될 것인지를 판단한다. <br>
        - @while 한 개의 특정 조건이 충족될 때까지 한 블록의 수행을 계속한다.<br>
</p>
<p>
  2. At-rules<br>
- CSS 선언 방식으로 CSS가 무엇을 해야할지 지시하는 역할을 한다. @identifier의 형식으로 사용되며, 다음 세미콜론 전까지 모든 것이 포함된다. <br>
- @font-face font에 대한 이름을 규정하고, 이 font 파일의 url을 지정한다. html element에서 이 폰트를 사용하기 위해서는 font-family 속성에 본인이 지정한 font에 대한 이릉을 넣으면 된다. 예시는 다음과 같다. <br>
- 몇 가지 at-rule 종류<br>
  - @use 'URL for other stylesheet'<br>
</p>
<h4></h4>
<pre class="codeblock">
/* General structure */
@identifier (RULE);

/* Example: tells browser to use UTF-8 character set */
@charset "utf-8";

@font-face {
  font-family: myFirstFont;
  src: url(sansation_light.woff);
}
</pre>
<pre class="codeblock">
div {
  font-family: myFirstFont;
}
</pre>
<p>
  variable.scss 파일 분석<br>
- SASS는 CSS로 변환되거나 컴파일이 이루어질 전처리기로, SCSS는 SASS에서 사용되는 문법으로 CSS 문법을 기반으로 만들어졌다. <br>
- [출처] https://github.com/mmistakes/minimal-mistakes/blob/master/_sass/minimal-mistakes/_variables.scss<br>
- import url은 @import "path/filename";<br>
        - filename 적을 때, _post.scss이면 post만 쓰면 된다. <br>
</p>
<h4>단어정리</h4>
<p>
1. interpolation <br>
- the addition of something different in the middle of a text,piece of music, etc. or the thing that is added
(e.g An Actor reads the poems in English translation, with brief musical interpolations)<br>
- a remark that interrupts somemone or something
(e.g They were not amused by his comical interpolation)
</p>

</article>