---
 layout: post
 author: yunjj92
 categories: java
---
# File Class
## 1. File Class 개요
- 사용자 인터페이스와 운영체제는 파일과 디렉토리명을 뽑아낼 때 시스템 기준의 경로명을 사용하는데, File 클래스의 경우에는 상대경로를 사용한다.
    - 선택적으로 절대경로 사용이 가능하고, 디스크 드라이브를 특정지을 때 사용하는데 이때 unix 기반에서는  "/"를 사용하고, Microsoft Windows UNC 에서는 '\\\'를 사용한다. 
## 2. File Class의 method
- list(FileFilter filter)
    - 상대 경로에 의한 파일 경로의 배열을 반환하고, 특정화된 필터를 만족하는 경로만 배열에 추가된다.
    - 왜 list method만 수행했는데, 필터링 결과가 반환될 수 있는가?
    ```
     public String[] list(FilenameFilter filter) {
        String names[] = list();
        if ((names == null) || (filter == null)) {
            return names;
        }
        List<String> v = new ArrayList<>();
        for (int i = 0 ; i < names.length ; i++) {
            if (filter.accept(this, names[i])) {
                v.add(names[i]);
            }
        }
        return v.toArray(new String[v.size()]);
     }
    ```
    - 위의 소스를 보면 알 수 있다. 
        - for문에서 각 파일의 이름을 체크하는데, 이때, if문으로 FilenameFilter의 accept 구문으로 필터링 체크를 해서 True 결과가 나온 부분만 list에 추가하여 사용자에게 반환한다. 

## 3. interface FilenameFilter
- 파일 이름을 필터링하기 위해서는 FilenameFilter를 구현하는 클래스를 만들어야 한다. 해당 클래스의 인스턴스는 File 클래스의 list method를 통해서 파일 경로를 필터링할 수 있다. 
- FilenameFilter의 method: accept()
    - param으로 들어온 파일경로에 필터링 키워드가 포함되어 있으면 True, 없으면 False를 반환한다. 