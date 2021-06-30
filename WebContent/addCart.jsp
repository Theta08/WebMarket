<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<!-- DB연결 -->
<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//주문한 제품을 (제품 ID가 파라메타로 넘어온다.) 카트리스트에 담아서
	//세션에 저장한다.
	
	String id = request.getParameter("id");
	//id가 널이거나 ""빈칸일때 상품목록 페이지로 되돌아감
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp"); //상품목록으로
		return; //여기서 끝낸다.
	}
	
	// dao 스태틱 객체를 가져온다.(제품의 리스트) 
	//ProductRepository dao = ProductRepository.getInstance();
	//아이드를 못찾았을 경우
	//Product goods = dao.getProductById(id);
	//if(goods == null){ //제품 아이디로 제품을 못찾았을때!
	//	response.sendRedirect("exceptionNoProductId.jsp");
	//}
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//DB에서 id를 입력하여 제품행을 가져온다.
	String sql = "select * from product where p_id=?";
	pstmt = conn.prepareStatement(sql); //sql문 준비
	pstmt.setString(1, id);
	rs = pstmt.executeQuery(); //만약 id에 맞는 상품이 있으면 결과가 있음
	if(!rs.next()){  //rs가 없을때(결국 찾는 아이디가 없다.)
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	//여기서 카트리스트에 추가해서 저장한다. 이때 먼저 카트리스트를 불러온다.
	//세션에 저장된 카트리스트를 꺼낸다.
	List<Product> items = (List<Product>)session.getAttribute("cartlist");
	//만약에 카트리스트가 없다면 새로 만든다.
	if(items == null){
		items = new ArrayList<Product>();
		session.setAttribute("cartlist", items);
	}
	
	// 만약 장바구니에 이미 담긴 상품이라면 갯수 + 1 
	
	boolean isNotInList = true; //리스트에 이미 담겨 있나?
	for(Product p : items){
		if(p.getProductId().equals(id)){ //같은 제품이 카트리스트에 담겨있다.
			p.setQuantity(p.getQuantity() + 1);
			isNotInList = false; //리스트에 담겨있다.
		}
	}
	
	// 장바구니에 없는 제품이라면 갯수 = 1
	if(isNotInList){
		//goods.setQuantity(1);
		//items.add(goods); //카트 리스트에 추가한다.
		Product newItem = new Product(); //빈 상품 객체를 만들기
		
		pstmt = conn.prepareStatement(sql); //sql문 준비
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); //만약 id에 맞는 상품이 있으면 결과가 있음
		if(rs.next()){  //rs가 있을경우
			newItem.setProductId(rs.getString(1));
			newItem.setPname(rs.getString(2));
			newItem.setUnitPrice(Integer.valueOf(rs.getString(3)));
			newItem.setDescription(rs.getString(4));
			newItem.setCategory(rs.getString(5));
			newItem.setManufacturer(rs.getString(6));
			newItem.setUnitsInStock(Long.valueOf(rs.getString(7)));
			newItem.setCondition(rs.getString(8));
			newItem.setFilename(rs.getString(9));
			newItem.setQuantity(1);
		}
		items.add(newItem);
		
	}
	
	//장바구니에 담은 다음에 다시 원래 페이지로 돌아간다.
	response.sendRedirect("product.jsp?id=" + id);
%>   








