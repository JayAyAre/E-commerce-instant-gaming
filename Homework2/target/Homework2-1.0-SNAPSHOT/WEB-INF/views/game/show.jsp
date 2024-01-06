<%-- 
    Document   : show
    Created on : 5 ene 2024, 12:00:31
    Author     : Usuario
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
            tailwind.config = {
              theme: {
                extend: {
                  colors: {
                    'main-gray-light': '#323232',
                    'main-gray-dark': '#272727',
                    'main-orange-dark': '#FF4120',
                    'main-orange-light': '#FF7F00',
                  }
                }
              }
            }
    </script>
</head>
<body class="bg-main-gray-light">
<%--        <jsp:include page="/WEB-INF/views/layout/navbar.jsp" />--%>

<div class="flex flex-col sm:flex-row gap-4 m-8">
    <div class="flex justify-center w-1/2 border rounded-lg bg-white">
        <img class="" src="${pageContext.request.contextPath}/resources/img/game.png" alt="Game image">
    </div>
    
    <div class="flex justify-center w-1/2 border border-2 border-gray-500 mt-4 sm:mt-0 rounded-lg">
        <div class="flex-row">
            <div class="name">${game.getName()}</div>
            <div class="stock">${game.getStock()}</div>
            <div class="types">
                <c:forEach var="type" items="${types}">
                    <div class="type-name">${type}</div>
                </c:forEach>
            </div>



        </div>

        <div class="addToCart">
            <button class="my-auto bg-gradient-to-r from-main-orange-light to-main-orange-dark text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow"
                onclick="location.href='https://www.google.com'" type="button"> Add to cart
            </button>
        </div>
        
    </div>
</div>


            <!-- $mvc.uri('cart')} -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>
