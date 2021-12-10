<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
</head>
<body>
	카카오 로그인 완료
	<a href="/login" onclick="kakaoLogout();">Sign out</a>
	<script>
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	        Kakao.API.request({
	          url: '/v1/user/unlink',
	          success: function (response) {
	          	console.log(response)
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	        Kakao.Auth.setAccessToken(undefined)
	      }
	    }  
	  </script>
</body>
</html>