<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="533964162845-j21mqvso997dfk3hs4e558dfo3q23m0m.apps.googleusercontent.com">
<script type="text/javascript" src="/js/googleLoginout.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<title>Insert title here</title>
</head>
<body>
	구글 로그인 완료
	<div>
		<img src="${loginMember.profile}" width="64" height="64">	
		<span>${loginMember.name}</span>
	</div>
	<div>
		<a href="/myPage">MyPage</a> 
	</div>
	<div>
		<a href="#" onclick="signOut()">Sign out</a>
	</div>
	<a href="#" onclick="googleOut()">탈퇴</a>
</body>
</html>