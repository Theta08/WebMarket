<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--코어 태그 lib  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//로그인시 ㅣ저장한 sessionId를 불러온다. 이것의 값이 없으면 비회원
	//String sessionId=(String)session.getAttribute("sessionId");
	String sessionId="test";
%>


	<nav class="navbar navbar-expand  navbar-redbeen bg-bark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="<c:url value="/index.jsp"/>">
					<img width="35%" src="./resources/images/중고닷컴.png">
				</a>
			</div>
			
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원가입</a>
							</li>
							
						</c:when>
						<c:otherwise>
							<li style="padding-top: 7px; color: white;">
							[<%=sessionId %>님]
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원정보 수정</a>
							</li>
						</c:otherwise>
							
					</c:choose>
				
				
					<li class="nav-item">
						<a class="nav-link" href="<c:url value="/products.jsp"/>">상품목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<c:url value="/addProduct.jsp"/>">상품등록</a>
					</li><li class="nav-item">
						<a class="nav-link" href="<c:url value="/editProduct.jsp?edit=update"/>">상품수정</a>
					</li>
					</li><li class="nav-item">
						<a class="nav-link" href="<c:url value="/editProduct.jsp?edit=delete"/>">상품삭제</a>
					</li>
					</li><li class="nav-item">					<!--서블릿 mapping 주소로 만듬  -->
						<a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>