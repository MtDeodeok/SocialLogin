<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="533964162845-j21mqvso997dfk3hs4e558dfo3q23m0m.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<title>로그인</title>
</head>
<body>
	<!-- 네이버 로그인 -->
	<%
	String clientId = "RfGcCZnltonIYA14PB0U";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8084/naverLoginAPI", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>
	<a href="<%=apiURL%>"> <img height="50"
		src="http://static.nid.naver.com/oauth/small_g_in.PNG" />
	</a>
	<!-- 네이버로그인 끝 -->

	<!-- 구글 로그인  -->
	<div class="g-signin2" onclick="onSignIn()"></div>
	<form id="loginGoogle" action="googleLogin" method="post">
		<input type="text" id="googleName" name="name" style="display: none">
		<input type="text" id="googleEmail" name="email" style="display: none">
	</form>
	<script>
		function onSignIn() {
			var auth2 = gapi.auth2.getAuthInstance();
			
			if (auth2.isSignedIn.get()) {
				var profile = auth2.currentUser.get().getBasicProfile();

				console.log('Name: ' + profile.getName());
				console.log('Email: ' + profile.getEmail());

				$('input[id=googleName]').val(profile.getName());
				$('input[id=googleEmail]').val(profile.getEmail());
				$('#loginGoogle').submit();
			}
		}
	</script>
	<!-- 구글 로그인 끝 -->

	<!-- 카카오 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<a href="javascript:kakaoLogin();"> <img
		src="./img/kakao_login_medium_narrow.png" />
	</a>
	<form id="loginKakao" action="kakaoLogin" method="post">
		<input type="text" id="kakaoName" name="name" style="display: none">
		<input type="text" id="kakaoEmail" name="email" style="display: none">
	</form>
	<script>
		Kakao.init('77a8c1e6f93e4e2effee600a73336716'); //발급받은 키 중 javascript키를 사용해준다.
		//console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
							const email = response.kakao_account.email;
							const name = response.properties.nickname;
							console.log(email);
							console.log(name);

							$('input[id=kakaoName]').val(name);
							$('input[id=kakaoEmail]').val(email);
							$('#loginKakao').submit();

						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
	</script>

	<!-- 카카오 로그인 끝 -->
</body>
</html>