<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTag"%>
<!DOCTYPE html>

<html>
<head>
   <meta charset="UTF-8">
   <title>itemTagTest.jsp</title>
   <style>
   table, th, td {
   	border : 2px solid gray;
   	border-collapse: collapse;
   }
   
   th, td{
   	padding: 10px;
   }
   </style>
</head>

<body>
	<myTag:item title="상품 재고 현황" colName="상품명">item 사용자 태그 예제</myTag:item>
</body>
</html>