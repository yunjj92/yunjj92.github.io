---
layout: post
title: "[2022-10-07] javascript" 
date: 2022-10-07 
category: read 
permalink: /diary/javascript
excerpt: ""
---

### 구분기호를 이용하여 문자열 자르기 
```

```

### 개행
```

```

### 특정 문자열 포함 여부 
- includes(valueToFind, fromIndex)'
    - 하나의 배열 안에서 '특정 문자열'이 해당 배열 안에 포함되어 있는지 확인할 수 있습니다. 
    - valueToFind: '특정 문자열' 
    - fromToIndex:  option사항으로, 해당 index부터 체크합니다. 

```
'kangaroo'.includes( 'k' ) //kangaroo가 k를 포함 > return true

const arrAnimal = ['bat', 'kangaroo', 'cat'];

arrAnimal.includes( 'kangaroo', 1 )// arrAnimal의 index = 1에 위치한 요소는 'kangaroo' > return true

```


