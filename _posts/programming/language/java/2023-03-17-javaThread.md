---
layout: post
author: yunjj92 
categories: java
title: java Thead Class
---
<article>
<h4>
	thread란 무엇인가?
</h4>
<p>
	 한 개의 프로그램이 한 번 수행될 떄의 그 수행의 처음부터 끝까지의 흐름을  thread라고 할 수 있다. JVM은 사용자의 애플리케이션이 동시에 여러 번의 수행 thread를 가질 수 있도록 해준다. 
	 
	
</p>
<p>
	 본래 'thread'란 단어의 의미는 '책, 논의, 연설 등의 thread를 얘기할 때 주로 사용되는데, 이것은 주로 그것의 주된 이야기 혹은 그 이야기가 진행되어 마침내 한 파트가 다른 파트와 연결되어 가는 그 방식'이라고 할 수 있다. 
</p>
<p>
	> 'The thread of book, discussion, speech, etc. is its story or the way that it develops, one part connecting with another.'
</p>
<h4>
	thread의 우선순위?
</h4>
<p>
	 모든 thread가 우선권을 가지는데, 더 높은 우선순위를 가지는 Thread는 더 낮은 우선순위를 가진 thread보다 우선적으로 수행된다. 모든 thread는 아마도 daemon으로써 표시되어질수도 있고, 아닐수도 있다. 
</p>
<p>
 	일부 thread에서 수행되는 코드가 새로운 thread 객체를 만들면, 이 새로운 thread는 초기 설정 값으로 자신의 우선순위를 자신을 만든 thread의 우선순위와 동일한 수준으로 설정한다. 
</p>
<p>
 	기본적으로 새로 생성되는 thread는 항상 부모 thread의 속성을 상속받는다. 이 개념을 기반으로 하여 daemon thread에 대해 얘기하자면, 우선순위와 동일한 패턴으로 자신을 만든 thread가 daemon이여야만 그 새로운 thread도 daemon thread일 수 있다. 
</p>
<h4>
	JVM의 thread 수행 패턴
</h4>
<p>
	JVM이 시작할 때, 한 개의 'non-daemon' thread가 존재하고, 일반적으로 이 이 thread는 일부 지정된 클래스의 main method를 호출한다. JVM의 수행 패턴을 얘기하자면, 다음의 과정과도 같다. 

    1.  Runtime 클래스의  exit method가 호출된다. 
    2. security manager가 이 exit method 수행을 허가한다. 
    3. run method 호출이 이루어져 결과가 반환되든, 혹은 예외처리가 되든 이 두 과정 중의 하나라도 이루어진다면 daemon thread가 아닌 모든 thread의 경우 이로써 수명주기가 끝나게 된다. 
    4. JVM은 3번까지의 과정이 모두 일어날때까지 계속해서 thread를 수행한다. 	
</p>
<p>
- JVM이 시작할 때, 한 개의 'non-daemon' thread가 존재하고, 일반적으로 이 이 thread는 일부 지정된 클래스의 main method를 호출한다. JVM의 수행 패턴을 얘기하자면, 다음의 과정과도 같다. 
    1.  Runtime 클래스의  exit method가 호출된다. 
    2. security manager가 이 exit method 수행을 허가한다. 
    3. run method 호출이 이루어져 결과가 반환되든, 혹은 예외처리가 되든 이 두 과정 중의 하나라도 이루어진다면 daemon thread가 아닌 모든 thread의 경우 이로써 수명주기가 끝나게 된다. 
    4. JVM은 3번까지의 과정이 모두 일어날때까지 계속해서 thread를 수행한다. 
</p>
<h4>
	새로운 thread를 만드는 2가지 방법 
</h4>
<p>
	새로운 Thread를 만드는 첫번째 방법은 Thread 클래스를 상속받는 클래스를 선언하는 것이다. Thread 클래스를 상속받는 클래스를 선언하면, 해당 클래스는 run method를 override해야한다. 
</p>
<pre class="codeblock">
		import java.util.Date;

		public class ThreadTest extends Thread{

			static Thread thread;
			
			public void testThread() {
				
				thread = new Thread(this);
				thread.start();
				
			}
			
			
			@Override
			public void run() {
				Date now = new Date();
				String nowTime = now.toString();
				System.out.println(nowTime);
			}
			

		}
</pre>

<pre class="codeblock">
		package excelFileWithPidText;

		public class ThreadResultTest {

			static ThreadTest threadTest = new ThreadTest();
			
			public static void main(String[] args) {
				System.out.println("Thread Result Test : ");
				threadTest.testThread();
			}

		}
</pre>
<p>
 위의 ThreadResultTest를 수행하면, 결과는 아래와 같다. 덧붙여, 위의 소스에서 run method는 도대체 어디서 수행되는지 알려면, 5.1 start 부분을 참고하면 된다. 
> Thread Result Test : Fri Mar 17 13:03:46 KST 2023
</p>
<p>
 두 번째 방법은 Runnable 인터페이스를 구현하는 클래스를 선언하는 것이다. 이 경우 해당 클래스는 run method를 구현해야 한다. 
</p>
<h4>
	Theread 클래스의 start method
</h4>
<p>
	start method는 thread 수행을 시작하기 위해 사용하는 method로 , JVM은 수행 대상 thread의 run method를 호출한다. 즉 위의 4번에서 run method만 override하는 이유는 start를 통해서 thread를 수행하기 시작하면 run method가 자동으로 호출되기 떄문이다.  thread가 어느 지점에서 수행되는지를 소스에서 찾고자 한다면, run method가 아닌 start() method를 중심으로 찾아야 한다.Thead클래스의 start method 내부를 살펴보면, group.add가 수행되고 나서, start0 이라는 native method가 수행된다. 이 start0이라는 method는 새로운 thread의 수행을 만들어내고, 이 새로운 thead의 Thread 객체의 run method를 호출한다.  
	요약: 이 native method start method가 호출되면, 새로운 thead가 생성되고, 생성된 새로운 thread를 서버에 올리고, 그 새로운 thread는 run method를 호출한다. 그렇게 해서 사용자가 구현한 run method내의 코드가 수행된다. 해당 작업이 완료되면, thread는 수명을 다하게 된다. 참고로 thread가 만들어지고, 초기에 runnable 상태에 놓이게되면, 그것은 곧 run을 할 준비가 되어있다는 의미가 된다. 그러나 이 상태는 운영체제에 의해 작업수행이 이루어지도록 등록된 것은 아님을 유념해야 한다. 운영체제가 추후 어느 시점에, thread 수행을 작업 스케줄에 등록하고, 해당 thread가 나타나게 되면, 그 때, 운영체제는 새로운 thread의 run method를 수행한다. 
</p>
<h4>
	참고 native method?
</h4>
<p>
	Thread 클래스에서, 몇 개의 method들은 native로 선언이 되어 있다. 예를 들어 yield, start0, isActive, 등등. c/c++의 언어로 정의되어 있는 method일 때, native를 사용한다. Java Native Interface는 JVM이  c 혹은 c++ 언어로 쓰여진 native library를 호출하도록 도와준다. 
</p>
<pre class="codeblock">

</pre>
<p>
	이 start method 수행의 결과로 2개의 thread가 동시에 수행된다. 한 개는 run method를 수행하는 thread와 start method로 부터 호출되어 반환되는 thread가 그 2개의 thread에 해당된다. 주의할 것은 하나의 thread는 한 번 start되면 그것으로 수명주기가 시작되어 위에서 말한대로의 과정을 거치면 수명을 다한다. 두 번 시작할 수 없다는 이야기이다. 해당 thread가 완전히 수행을 완료하면 수명을 다하고 그 도중에 재시작은 불가하다. (지양해야 한다.)
</p>
<h4>
	Theread 클래스의 setName method
</h4>
<pre class="codeblock">
	public final synchronized void setName(String name) {
			checkAccess();
			if (name == null) {
				throw new NullPointerException("name cannot be null");
			}

			this.name = name;
			if (threadStatus != 0) {
				setNativeName(name);
			}
		}

</pre>
<p>
	매개변수인 name과 동일한 이름으로 해당 thread의 이름을 변경한다. 
</p>
<h4>
	그 외 class: SecurityManager 
</h4>
<p>
 	애플리케이션이 안전하지 않을 수도 있거나 보안에 민감한 작업 수행을 하기 전에, 보안과 관련하여 안전하게 수행될 수 있는 작업인지 아닌지 혹은 어떤 작업 수행을 하려는 것인지에 대해 결정을 내릴 수 있도록 관리하는 것이 Security manager이다.  Security Manager의 겨우 'check'라는 이름으로 시작하는 method를 포함하고 있는데, 이 method의 경우 java libraries 내에서 특정 보안에 취약한 작업을 method들이 수행하기 전에 호출하는 method라고 볼 수 있다. 일반적으로 아래와 같이 코드를 작성한다. 
</p>
<pre class="codeblock">
      SecurityManager security = System.getSecurityManager();
      if (security != null) {
          security.check<i>XXX</i>(argument, &nbsp;.&nbsp;.&nbsp;.&nbsp;);
      }

</pre>
<p>
security manager의 기본 역할은 예외를 뱉기 전에, 작업 수행의 완료를 막는 것이다. 일반적으로 그 작업이 허가되었는지 아닌지에 대해서만 리턴하지만 만약 작업이 허가되지 않았다면,'SecurityException' 예외를 뱉는다. java libraries 외에 클래스에 개인적으로 적용하고자 한다면 아래처럼 사용할 수 있다. (기본적으로 예시 클래스는 바로 4.1 예시의 소스와 이어진다.)
</p>
<pre class="codeblock">
	public class ThreadResultTest {

		static ThreadTest threadTest = new ThreadTest();
		static SecurityManager security= new SecurityManager();
		
		public static void main(String[] args) {
			
			System.setSecurityManager(security);
			SecurityManager security = System.getSecurityManager();
			if(security != null) {
				System.out.println("Thread Result Test : ");
				threadTest.testThread();
			} else {
				System.out.println(security);
				System.out.println("it is not permitted");
			}
			
			
		}

	}
</pre>
<p>
	주의할 점은, 만약 system에 securityManager가 세팅되어 있지 않아도 security는 null이 되기 때문에 setting 후 사용해야 한다. 
</p>
</article> 
   

