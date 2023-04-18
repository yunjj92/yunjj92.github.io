---
layout: post
author: yunjj92 
categories: java
---
# java interface Executor 
## java API Document
### 1. 개요
- 이 Executor 인터페이스는 각각의 작업들이 수행되는 매커니즘 속에서 작업 수행 준비를 위한 지시 작업을 분리시키는 방법을 제공한다. Executor는 일반적으로 thread를 생성하는 것 대신에 사용된다. 예를 들어 새로운 Thread의 인스턴스를 생성하여 start method를 호출하는 것 대신에 아래와 같이 사용하는 것을 말한다. 
```
Executor executor = anExecutor;
executor.executre(new RunnableTask1());
executor.executre(new RunnableTask2());
```
- 그러나 Executor 인터페이스는 엄격히 비동기 방식의 수행을 요구한다. 즉, executor 인터페이스는 호출 method의 thread 내에 수행 준비가 되어있는 작업을 즉시 수행시킨다. 
```
 class DirectExecutor implements Executor {
   public void execute(Runnable r) {
     r.run();
   }
 }
```
- 위의 경우와 달리 새로운 thread를 생성하는 경우도 있다. 
```
 class ThreadPerTaskExecutor implements Executor {
   public void execute(Runnable r) {
     new Thread(r).start();
   }
 }
```
- 대부분의 Executor의 구현은 작업 수행 시기와 방법에 대한 일종의 제한을 두는데 도움이 된다. 아래의 Executor의 경우 수행되어야 할 작업들을 줄세우는 작업을 수행하고 있다. 
```
 class SerialExecutor implements Executor {
   final Queue<Runnable> tasks = new ArrayDeque<Runnable>();
   final Executor executor;
   Runnable active;

   SerialExecutor(Executor executor) {
     this.executor = executor;
   }

   public synchronized void execute(final Runnable r) {
     tasks.offer(new Runnable() {
       public void run() {
         try {
           r.run();
         } finally {
           scheduleNext();
         }
       }
     });
     if (active == null) {
       scheduleNext();
     }
   }

   protected synchronized void scheduleNext() {
     if ((active = tasks.poll()) != null) {
       executor.execute(active);
     }
   }
 }
```
- 위의 로직에 관해 간단히 설명하자면, 수행이 필요한 Excutor
 -> https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/Executor.html
### 추가 개념 사항 파악 
1. interface Runnable
- thread에 의해 작업이 수행되어야 하는 클래스가 구현하는 인터페이스가 Runnable 인터페이스이다. Thread 작업이 필요한 클래스는 반드시 파라미터가 없는 run이라는 method를 반드시 override 해야한다. 
- Runnable 인터페이스는 active 상태의 코드 수행의 임무를 맡은 객체를 위한 공통 프로토콜을 제공한다. 여기서 active 상태라는 것인 thread가 이미 시작되어 아직 멈추지 않았다는 것을 의미한다. 
- Runnable 인터페이스의 run method
 - Runnable 인터페이스를 구현한 객체는 thread를 만들기 위해 사용되고, 이때, thread를 시작하는 것은 개별적으로 수행되는 thread 내에서 객체의 run method를 호출한다는 것을 의미한다. 
 2. submit,submission
- 일종의 지시 혹은 명령으로 무언가가 프로세스 상에서 처리될 수 있도록 'ready' 상태를  지시하는 것을 의미한다. 

