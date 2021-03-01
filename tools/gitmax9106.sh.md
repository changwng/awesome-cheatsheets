Git
Version Control System

원격저장소 등록
git remote add 별칭 원격저장소 주소 
```code
ex) git remote add origin https://github.com/KJunseo/test.git
```
Clone
이미 존재하는 원격 저장소 복사

git clone 원격저장소 주소
```code
ex) git clone https://github.com/KJunseo/test.git
```
Add
저장하고 싶은 파일들을 묶는 행위.
스테이지에 파일을 올린다고 한다.

git add 파일이름
```code
ex)
git add test1.html
git add test2.js
// ...
```

git add * // 변경된 모든 파일을 묶겠다는 뜻 
Commit
묶은 파일들을 하나의 버전으로 save하는 기능.
저장하고 싶은 파일들을 묶어서(Add) 하나의 commit을 실행할 수 있다.
commit 시 내 로컬 컴퓨터에 저장된다.

git commit -m "한 줄 요약" // 묶은 파일을 하나의 commit으로 실행

ex) git commit -m "test1 생성"
Push
내 로컬에 저장된 commit한 파일을 Github에 업로드하는 것.

git push 서버이름 브랜치이름 // 서버이름에 해당하는 원격 저장소에 현재 로컬 컴퓨터의 브랜치의 commit을 업로드 하겠다는 뜻

ex) git push origin master
Pull
원격 저장소에 등록되어 있는 파일의 최신 버전을 로컬에 적용하기 위한 것

git pull 
branch
독립적으로 작업을 하기 위해 파일의 현재 버전에서 여러 가지로 나눠 작업하기 위한 것.

마스터 브랜치에는 최종본만 올려주고 실제 작업은 브랜치를 나눠서 한다.

git branch 브랜치이름

ex) git branch js
checkout
특정 브랜치나 커밋으로 돌아가는 것

git checkout 브랜치이름

ex) git checkout js
merge
하나의 브랜치를 다른 브랜치와 합치는 것.
현재 작업중인 브랜치를 HEAD 브랜치라고한다.

다른 브랜치를 만들어 새로운 기능을 구현 후 git checkout master로 master브랜치로 돌아온 후 git merge 브랜치이름 명령어를 통해 다른 브랜치에서 구현한 기능을 master브랜치에 합칠 수 있다.

HEAD 브랜치에 아무 변경 사항이 없는 경우 위의 merge 상황에 아무런 문제가 발생하지 않는다.(fast-forward)

하지만 만약 master브랜치와 브랜치 A, 브랜치 B가 있다고 가정하자. 이때 브랜치 A를 master에 merge 한 후, 브랜치 B도 merge하려고 할 때 만약 A와 B가 같은 부분의 코드를 건든 경우 충돌이 발생할 수 있다.

충돌이 발생할 경우 충돌난 부분을 없애줘야한다. 충돌이 나면 코드가 아래와 같이 바뀐다.

<<<<<<< HEAD(현재 변경 사항)

// 코드

=======

// 코드

>>>>>>> 브랜치(수신 변경 사항)
이 때 코드를 확인하여 불필요한 부분을 삭제 후 commit 하고 push 해주면 된다.

이렇게 merge를 완료하고 나면 merge한 브랜치는 삭제해줘도 된다.

reset
작업을 되돌리고 싶을 때 사용 ~뒤에 숫자를 적어주는 만큼 이전 커밋으로 이동. 혼자 작업하는 브랜치인 경우 사용

git reset HEAD~2
revert
이전 커밋 내용을 남겨둔 채 새로운 커밋 생성. 커밋 히스토리 변경 없이 커밋 내용을 삭제할 수 있다. 다른 사람과 공유하는 브랜치에서 커밋을 수정해야할 경우 사용한다.

git revert 커밋
rebase
merge와 같이 한 브랜치와 다른 브랜치를 합치는 것.
merge는 커밋 히스토리가 남아있지만 rebase는 커밋 히스토리가 한 줄로 정리된다.

git checkout step1
git rebase master
cherry-pick
특정 브랜치에서 원하는 커밋을 가져올 때 사용.
step1에서 작업해야할 것을 master 브랜치에서 작업해놓은 경우. master 브랜치의 커밋을 step1브랜치로 옮기는 과정을 살펴보자

git checkout 원하는_커밋 // master 브랜치에서 옮기기 원하는 커밋으로 checkout
git branch step1 // step1 브랜치 생성 
git checkout step1 // step1 브랜치로 checkout  
git cherry-pick 가져오기_원하는_커밋_시작_부분^..가져오기_원하는_커밋_끝_부분 // master브랜치에서 원하는 커밋 cherry pick. 이때 ^를 붙여주지 않으면 시작 부분은 포함 x
git checkout master // master 브랜치로 checkout
git reset 옮긴_커밋 --hard// master 브랜치에서 옮겨준 커밋 삭제