<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="com.basic.ApiExamMemberProfile"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%
	String clientId = "RfGcCZnltonIYA14PB0U";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "C6wjkh1DR8";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8084/naverLoginAPI", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	String access_token = "";
	String refresh_token = "";
	String jsondata = "";
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(res.toString());
			JSONObject jsonObj = (JSONObject) obj;

			String token = (String) jsonObj.get("access_token");// 네이버 로그인 접근 토큰;

			ApiExamMemberProfile aemp = new ApiExamMemberProfile();
			jsondata = aemp.test(token);
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>	
	<script type="text/javascript">
		const data = <%=jsondata%>;
		
		$(document).ready(function() {
			$.ajax({
				url : "naverLoginAPI",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					
					return location.href="loginNaver";
				},
				error: function(){
					console.log("로그인 실패");
				}
			});
		});
	</script>
		
</body>
</html>