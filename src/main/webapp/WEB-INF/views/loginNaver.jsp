<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후</title>
</head>
<body>
	네이버 로그인 완료
	<div>
		<a href="/myPage">MyPage</a> 
	</div>
	<div>
	<a href="/logout" onclick="naverLogout()">Sign out</a>
	</div>
	
	<script>
	function naverLogout(){
		window.open("http://nid.naver.com/nidlogin.logout","_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		setTimeout(function() {  
			window.close();
		}, 1000);
	}
	</script>
</body>
</html>