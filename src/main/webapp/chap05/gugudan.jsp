<%@ page  contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <style>
   		table, td{
   			border: 2px solid gray;
   			border-collapse:collapse;
   		}
   		
   		td{
   			padding:5px;
   			text-align:center;
   		}
   </style>
</head>

<body>

	<table>
	
	<% for(int i = 2; i<=9; i++) { %>
	  <td><%= i  %>단</td>
	<% } %>
	 <%
        for (int i = 1; i <= 9; i++) {
    %>
        <tr>
            <% for (int j = 2; j <= 9; j++) { %>
                <td><%= j +" * "+ i +" = "+ i*j %></td>
            <% } %>
        </tr>
    <% } %>
	</table>


</body>
</html>

