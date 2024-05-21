<%@page import="java.io.PrintWriter"%>
<%@page import="bbsb.BbsDAOB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbsb" class="bbsb.Bbsb" scope="page" />
<jsp:setProperty name="bbsb" property="bbsTitle" />
<jsp:setProperty name="bbsb" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한남 사내 커뮤니티 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('먼저 로그인을 해주세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			if(bbsb.getBbsTitle() == null || bbsb.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				BbsDAOB bbsDAOB = new BbsDAOB();
				int result = bbsDAOB.write(bbsb.getBbsTitle(), userID, bbsb.getBbsContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패하였습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공!')");
					script.println("location.href='bbsb.jsp'");
					script.println("</script>");
				}
			}
		}
	
	%>
</body>
</html>