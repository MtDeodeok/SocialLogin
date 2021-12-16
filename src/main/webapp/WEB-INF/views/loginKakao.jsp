<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/kakaoLoginout.js"></script>
<title>Insert title here</title>
</head>
<body>
	카카오 로그인 완료
	<div>
		<img src="${loginMember.profile}" width="64" height="64">	
		<span>${loginMember.name}</span>
	</div>
	<div>
		<a href="/myPage">MyPage</a> 
	</div>
	<div>
		<a href="#" onclick="kakaoLogout()">Sign out</a>
	</div>
	<div>
		<a href="#" onclick="kakaoOut()">탈퇴</a>
	</div>
</body>
</html>