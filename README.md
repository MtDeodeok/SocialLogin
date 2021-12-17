# 소셜 로그인(구글, 네이버 카카오)
## 프로젝트 소개
대부분의 웹 혹은 앱에서 소셜 로그인을 사용함에 따라 해보지 않은 소셜 로그인 API 를 사용한 프로젝트를 진행함

## 진행 과정
### 프로젝트 생성 및 개발환경
개발 환경
 - Spring Boot 2.6.1
 - Maven
 - Library
    - Spring Boot DevTookls
    - Lombok
    - Spirng Web

### 처리 순서
1. 로그인 최초 요청 (소셜 로그인 별 버튼 클릭)
2. 첫번째 요청을 받아 특정 Social Login API Server로 부터 code 전달 받음
3. 두번째 요청을 통해 받게된 code를 이용하여 Social Login API Server로부터 access token 및 refresh token 발급
4. 3에서 발급 받은 access token을 이용하여 사용자 정보 요청

### 참고 사이트
> 지나가던 백엔드 개발자 : https://antdev.tistory.com/68?category=919963
  
> 구글 공식 디벨롭 사이트 : https://developers.google.com/identity/sign-in/web/reference
    
> 네이버 공식 디벨롭 사이트 : https://developers.naver.com/docs/common/openapiguide/apilist.md#%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%B0%A9%EC%8B%9D-%EC%98%A4%ED%94%88-api
 
> 카카오 공식 디벨롭 사이트 : https://developers.kakao.com/
