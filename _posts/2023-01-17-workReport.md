---
layout: post
title: "[2023-01-17] Work Report" 
date: 2023-01-17
category: read 
excerpt: ""
---
# 2023년 01월 17일 화요일 

## 오늘의 공부 기록 
### DataTable()
- DataTable 활용
    - 전체 행의 수 가져오기
        ```
            var editTable = $('#tableId').DataTable();
            var editRow = editTable.rows().data();
            var tableRow = editTable.data().count();

            console.log("행의 수: " + tableRow);
            console.log("행의 수: " + tableRow);
        ```
    - Controller 단에서  List<VO> 자료형으로 반환을 했을 때 데이터 가져오는 법
        - 예를 들어 VO 클래스에 선언된 변수가 다음과 같다고 했을 때 
        ```
            @Data
            @AllArgsConstructor
            @ToString
            @NoArgsConstructor
            public class VO{

                private String fruitType;
                private String price;
                private String brix;

            }
        ```
        - jsp 단에서 아래와 같이 받는다고 했을 때
        ```
            var detailTBL = null;
            detailTBL = $('#listTable').DataTable({

                "ajax": {

                    "ursl": "/main/selectFruiltDetail",
                    "data": {
                        fruitType: "pineApple"
                    },
                    "dataSrc": "",
                },
                "columns":[

                    {"data" : "price", name : "price"},
                    {"data" : "brix", name : "brix"}

                ]

            });

            $("#selectBrixBtn").on('click', function(){

                var tempTable = $('#listTable').DataTable();
                var dataArr = tempTable.rows().data();
                var tableRows = tempTable.data().count();

                for(int i = 0; i<tableRows; i ++;){
                    console.log("fruitType[" + i +"]: " + dataArr[i].fruitType);
                    console.log("price[" + i +"]: " + dataArr[i].price);
                    console.log("brix[" + i +"]: " + dataArr[i].brix);
                }

            })

        ```