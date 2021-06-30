<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<html>
<head>
<link rel="stylesheet" 	href="resources/css/bootstrap.min.css">
<!-- 자바스크립트 링크 -->
<script src="resources/js/validation.js"></script>
<title>상품 등록 정보</title>
</head>
<body>
	<%  		
		String lang = request.getParameter("lang");
		if(lang == null) lang = "ko";
	%>
	<fmt:setLocale value="<%=lang %>"/>
	<!-- 다국어 처리(ko , en)를 위해 번들패키지의 메세지를 지정 -->
	<fmt:setBundle basename="bundle.message" />	
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>		
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?lang=ko">Korean</a> | <a href="?lang=en">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success">로그아웃</a>
		</div>
		<form name="newProduct" enctype="multipart/form-data" action="./processAddProduct.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New " > <fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="Old" > <fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="Refurbished" > <fmt:message key="condition_Refurbished"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" onclick="CheckAddProduct();" class="btn btn-primary" value="<fmt:message key="button"/>" >
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>
