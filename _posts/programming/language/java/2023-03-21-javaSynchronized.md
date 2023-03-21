---
layout: post
author: yunjj92 
---
# java - synchronized

#  Process Synchronization in OS
## 1. 개요
- Process Synchronization, Synchronization
    - 동일한 메모리 스페이스를 공유하는 프로세스들이 운영체제 안에서 관리되는 방식이라고 할 수 있다. 
    - 이 방식은 한번에 하나의 프로세스만이 공유된 메모리에 변경을 할 수 있고, 이는 데이터의 일관성을 유지하는데 도움이 된다. 
    - semaphores, mutex locks, synchronization hardware 등과 같은 동일한 방식의 다양한 솔루션이 존재하긴 한다. 
- 중점적으로 이번 페이지에서 다룰 부분은 크게 2가지
    - 운영체제 내에서의 Process Synchronization
    - synchronization, Semaphores, Mutex, Synchronization Hardware, Peterson's Solution 등의 솔루션
## 2. 그래서 OS의 Process Synchronization는 뭐지?
- 운영체제는 한 개 기기의 모든 애플리케이션들을 관리하고 컴퓨터 상의 부드러운 기능 작동을 도우는 역할을 수행하는 소프트웨어라고 할 수 있다. 이러한 이유때문에, 운영체제는 많은 작업들을 수행하며 때때로 동시에 수행하기도 한다. 이러한 작업 수행은 서로 다른 프로세스가 동시에 공통된 자원을 사용하는 일만 일어나지 않으면 보통 문제는 되지 않는다. 
- 예를 들어, 은행을 생각해보자. 은행은 동일한 데이터베이스에서 각기 다른 고객들의 잔고 계좌를 저장하고 있다. 만약 당신이 지금 당신의 계좌를 x루피(ruppee: 인도 파키스탄의 화폐 단위) 가지고 있다고 해보자. 현재 당신은 당신의 은행 계좌에서 일정 부분의 돈을 인출하고자 한다. 그리고 동시에 다른 누군가가 당신 계좌에서 당신 통장 계좌의 잔고를 보려고 한다. 만약 당신이 본인 계좌에서 일정 부분의 현금을 인출 중이라면, 거래 후에, 총 잔고는 아마 인출한 x 루피만큼 적어질 것이다. 그러나 거래는 시간이 걸리고 거기에 더하여 잔고를 확인하려는 사람은 당신의 계좌에서 x가 포함된 잔고를 볼 것이고 이는 데이터의 불일치를 일으키게 된다. 만약 이러한 경우에, 우리는 오직 한 번에 한 사람만이 작업을 수행할 수 있다는 점을 확실히 해두어야 하고, 그렇게 함으로써 데이터의 일관성을 유지할 수 있게된다. 
![what-is-process-synchronization-in-os](https://user-images.githubusercontent.com/81787195/226501220-f4e87f59-f1f9-4a08-afad-6d05945ac9ac.PNG)
- 위의 이미지에서 Process1, Process2기 동시에 일어난다면, user2 Y로서의 계좌 잔고 보게되므로 잘못된 데이터를 보게된다. user1이 일정 금액의 돈을 자신의 계좌에서 인출하여 잔액은 x가 되어야 하지만 해당 거래 Process1이 진행 중이었기 때문에 그렇다. 
- 다양한 프로세스가 한 개의 시스템에서 공통된 자원을 공유할 때, 데이터의 일관성은 무너질 수 있고, 이것이 바로 운영체제에서 'Process Synchronization'이 필요한 이유이다. 

## 3. OS의 Process Synchronization은 어떻게 작동하는가?
-  Process Synchronization이 필요한 정확한 이유를 한 번 살펴보자. 만약 Process1이 
![working-of-process-synchronization-in-os](https://user-images.githubusercontent.com/81787195/226501794-1f2f5d7f-d61a-49ab-a345-1a72f1e265b8.PNG)



[출처: https://www.scaler.com/topics/operating-system/process-synchronization-in-os/]

##  
### Memory Locations
- Memory locations과 address는 컴퓨터 메모리가 구성되는 방식을 규정하고, 그렇게 함으로써 사용자가 효과적으로 컴퓨터에 정보를 저장하고 불러올 수 있도록 한다. 컴퓨터의 메모리는 실리콘 칩으로 만들어졌고, 해당 칩은 수백만개의 저장 셀을 가지고 있다, 그 칩의 각각의 저장 셀은 1bit의 정보를 저장할 수 있고, 이 때 저장되는 값은 0 혹은 1 둘 중의 하나이다. 
- 사실 컴퓨터 메모리는 데이터와 명령어 둘 다 가지고 있다. 1bit는 이 정보를 저장하기에는 너무 작다. 그래서 각 bit가 개별적으로 쓰일 일은 거의 없다. 따라서 'the bits'는 고정된 n bits 사이즈가 묶인 하나의 덩어리라고 볼 수 있다. 컴퓨터의 메모리는 이 덩어리가 저장되고, 쉽게 또 반환될 수 있도록 구성되어 있다. 
-  n bit으로 이루어진 하나의 그룹. 여기서 n이라는 것은 단어의 길이를 얘기하는 것이다. 컴퓨터가 저장하는 단어의 길이는 8bits에서 64bits까지 발전했다. 현재 일반적인 목적의 컴퓨터는 32bits 혹은 64bits이고, 8bit의 그룹이 바로 1 byte이다. 
![Memory-Locations-and-Addresses](https://user-images.githubusercontent.com/81787195/226502926-ffc0ff31-6db5-4c03-8d9f-9c1fe05ca99b.jpg)
- 만약 본인이 어떤 형태의 지시어든 데이터든 저장하려고 할 때는 언제든지, 하나의 메모리 위치에 접근해야 한다. 그리고 그 메모리 위치에 접근하기 위해서는, 본인이 해당 메모리의 고유한 이름을 통해 메모리 위치를 알고 있거나, 혹은 각각의 메모리 위치에 따른 고유한 주소가 필요하다. 
- 메모리 위치는 0부터 2^k^-1
