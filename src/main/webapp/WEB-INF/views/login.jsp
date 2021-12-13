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
<meta name="google-signin-client_id" content="533964162845-j21mqvso997dfk3hs4e558dfo3q23m0m.apps.googleusercontent.com">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/js/kakaoLoginout.js"></script>
<script type="text/javascript" src="/js/googleLoginout.js"></script>
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
	<a href="<%=apiURL%>">
		<img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" />
	</a>
	<!-- 네이버로그인 끝 -->

	<!-- 구글 로그인  -->
	<div class="g-signin2" onclick="javascript:onSignIn()"></div>
		<form id="loginGoogle" action="googleLogin" method="post">
			<input type="text" id="googleName" name="name" style="display: none">
			<input type="text" id="googleEmail" name="email" style="display: none">
			<input type="text" id="googleProfile" name="profile" style="display: none">
		</form>
	<!-- 구글 로그인 끝 -->

	<!-- 카카오 로그인 -->
	<a href="javascript:kakaoLogin()">
		<img src="./img/kakao_login_medium_narrow.png" />
	</a>
	<form id="loginKakao" action="kakaoLogin" method="post">
		<input type="text" id="kakaoName" name="name" style="display: none">
		<input type="text" id="kakaoEmail" name="email" style="display: none">
		<input type="text" id="kakaoProfile" name="profile" style="display: none">
	</form>
	<!-- 카카오 로그인 끝 -->
</body>
</html>