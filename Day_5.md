# Day_5

### 오늘 할 내용

- CRUD 중에 CR
- 자료가 저장되는 곳은 DB가 아니라 CSV 파일로 저장한다.
- 사용자의 입력을 받아서 간이 게시판을 만들 예정



### 미니 과제

- 사용자의 입력을 받는 form 태그로 이루어진 '/new' 액션과 erb 파일
  - form의 action 속성은 /create로 간다.
  - method는 'post'를 이용합니다.
  - 게시판 글의 제목(title)과 본문(contents) 두가지 속성을 저장
- 전체 목록을 보여주는 table태그로 이루어진 /boards 액션과 erb 파일



- /create 액션을 만들고  작성 후에는 /boards 엑션으로 돌아가도록 구성
  - /create  액션이 동작한 이후에는 본인이 작성한 글을 보는 곳으로 이동
- 각 글(1 개의 글을 보는 페이지)을 볼 수 있는 페이지는 `/board/글번호`의 형태로 작성



## Create 와 Read

1. /new
2. /create
3. /boards
4. /board/:id

- board라고 하는 게시판이 하나만 존재하고 있다.
- user라고 하는 CRUD 기능을 해야하는 DB Table 만든다고 가정한다면?
- 새로운 유저를 등록한다면?



## 미니 과제

- User를 등록할 수 있는 CSV 파일을 만드세요

- id, password, password confirmation

- 조건 1

  - password와 password_confirmation을 받는데 회원을 등록할 때 

    이 두 문자열이 다르면 회원 등록이 안된다.

- Route(라우팅)

  - get		/user/new  -> new_user.erb
  - post 	/user/create
  - get 	       /users      -> users.erb
  - get        /user/:id   -> user.erb

### 추가과제

- 이미 존재하는 회원일 때도 error페이지로 이동

























