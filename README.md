# homework

사용 프레임워크
1. springboot 2.0.4.RELEASE

사용 라이브러리
1. 로그인
   spring-security
2. IN-MEMORY DB
   H2
3. HANDLEAR
   JPA
   
 실행방벙
 (src/main/rsupport.war 있습니다.) 
 1. rsupport.war copy to  tomcat/webapp/
 2. address : http://localhost:8080/rsupport
 
 기능
 1. 로그인
 2. 공지 조회
 3. 공지 쓰기
 4. 공지 수정
 5. 공지 삭제
 6. 공지 검색 ( 제목,,작성자,등록일, 수정일)
 
 빌드방법
 1. jdk1.8 이상
 2. download > rsupport.zip
 3. eclipse > import > Exisiting Maven Projects > maven clean > maven install 
