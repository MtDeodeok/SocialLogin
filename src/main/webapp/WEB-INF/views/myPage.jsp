<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>MY PAGE</h3>
	<div>
		<div>
			<label>email </label><input type="text" readonly value="${loginMember.email}">
		</div>
		<div>
			<label>name </label><input type="text" readonly value="${loginMember.name}">
		</div>
		<div>
			<label>provider </label><input type="text" readonly value="${loginMember.provider}">
		</div>
		<div>
			<label>registDate </label><input type="text" readonly value="${loginMember.registDate}">
		</div>
	</div>
</body>
</html>