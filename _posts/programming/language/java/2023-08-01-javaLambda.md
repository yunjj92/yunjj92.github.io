---
layout: post
author: yunjj92
categories: java
title: Lambda Expression in Java
---
<article>
    <h4>
    자바에서 람다 표현식 사용하기
    </h4>
    <p>일반적인 자바 람다식 표현<br>
    자바에서의 람다 표현식은 오직 추상 함수만 구현하기 때문에 함수적 역할을 수행하는 인터페이스를 구현하게 된다. 
    이번 자바 8에서 추가된 람다표현식의 기능은 크게 3가지가 있다. 첫 번째는, method 인자 혹은 코드 자체를 데이터로 
    받음으로써 기능 수행을 할 수 있다는 점이다. 두 번째는, 하나의 기능은 어떤 클래스에도 구애받지 않고 만들어질 수 있다는 것이다. 
    세 번째는 람다 표현식의 경우 객체의 형태로, 요구사항에 따라서 수행되어야 한다면, 건너 뛰는 것도 가능하다. 
    </p>
    <pre class="codeblock">

    public class SupplierTestMainApplication &#123;

	public static void main&#40;String&#91;&#93; args&#41; &#123;

		//FuncInterface를 여기서 구현한다. 이 인터페이스의 경우 기본적으로 abstractFun&#40;&#41; 함수를 구현한다.
		FuncInterface fobj = &#40;int x&#41; -&gt; System.out.println&#40;2*x&#41;;

		//밑의 코드는 기본적으로 10을 인출할 것이다.
		fobj.abstractFun&#40;5&#41;;


		ArrayList&lt;Integer&gt; arrL =  new ArrayList&lt;Integer&gt;&#40;&#41;;
		arrL.add&#40;1&#41;;
		arrL.add&#40;2&#41;;
		arrL.add&#40;3&#41;;
		arrL.add&#40;4&#41;;

		arrL.forEach&#40;n -&gt; System.out.println&#40;n&#41;&#41;;

		arrL.forEach&#40;n -&gt;&#123;

			if&#40;n%2==0&#41; System.out.println&#40;n&#41;;

		&#125;&#41;;

        &#125;
    
    &#125;

</pre>

<pre class="codeblock">

    public interface FuncInterface &#123;

	void abstractFun&#40;int x&#41;;

	default void normalFunc&#40;&#41; &#123;

		System.out.println&#40;"Hello!!"&#41;;
	&#125;

    &#125;
</pre>

<p>Supplier 인터페이스 사용하여 람다식 사용하기<br>
    Supplier&lt;T&gt; 인터페이스는 미리 정의된 인터페이스로, 결과의 전달 역할을 수행한다.
</p>
<p>method reference란?<br>
    ClassName::MethodName 형식으로 입력하며, method를 호출하는 것이지만 괄호는 쓰지 않고 생략
</p>
</article>
