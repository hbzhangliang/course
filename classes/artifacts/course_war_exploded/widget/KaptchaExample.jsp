<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kaptcha Example</title>
</head>
<body>

Enter in the <a href="http://code.google.com/p/kaptcha/">Kaptcha</a> to see if it matches what is stored in the session
attributes.

<table>
    <tr>
        <td><img src="${base}/Kaptcha.jpg" width="80px" height="30px"></td>
        <td valign="top">

            <form method="POST">
                <br>sec code:<input type="text" name="kaptchafield"><br/>
                <input type="submit" name="submit">
            </form>
        </td>
    </tr>
</table>
<br/><br/><br/><br/>
<%
    String c = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    String parm = request.getParameter("kaptchafield");
    out.println("Parameter: " + parm + " ? Session Key: " + c + " : ");
    if (c != null && parm != null) {
        if (c.equals(parm)) {
            out.println("<b>true</b>");
        } else {
            out.println("<b>false</b>");
        }
    }
%>
</body>
</html>
