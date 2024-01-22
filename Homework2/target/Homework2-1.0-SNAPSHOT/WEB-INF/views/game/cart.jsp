<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png" type="image/x-icon">
    <link rel="icon" type="image/gif" href="/img/logo_icon.png">
    <title>Shopping cart</title>
    <script src="https://cdn.tailwindcss.com/?plugins=forms"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'main-gray-light': '#323232',
                        'main-gray-dark': '#272727',
                        'main-gray-input': '#242424',
                        'main-gray-medium': '#6d6d6d',
                        'main-orange': '#ff5400',
                        'main-orange-dark': '#FF4120',
                        'main-orange-light': '#FF7F00',
                        'main-black': '#101010'
                    }
                }
            }
        };
    </script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- FontAwesome -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous"/>
</head>
<body class="relative bg-[#272727] sm:pb-48">
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    <div class="flex flex-col lg:flex-row gap-4 sm:gap-16 mx-[2rem] sm:mx-auto sm:max-w-5xl relative z-1">
        <div class="flex flex-col sm:flex-row gap-4 mt-12">
            <div class="flex flex-col lg:w-auto text-main-gray-medium bg-main-gray-light p-6 rounded-2xl">
                <h2 class="text-3xl font-semibold mb-8 text-white">Shopping Cart</h2>
                <c:if test="${not empty sessionScope.cart.games}">
                    <c:set var="total" value="0.0" scope="page" />
                    <c:forEach var="item" items="${sessionScope.cart.games}">
                        <div class="border border-0 rounded-lg text-white bg-gray-dark" style="backdrop-filter: blur(35px);">
                            <div class="flex flex-col sm:flex-row gap-8">
                                <img class="flex flex-col w-full sm:flex-row w-4/6 sm:w-3/6 object-cover object-center rounded-xl" src="${pageContext.request.contextPath}/resources/img/${item.image}.jpg" alt="Game image">
                                <div class="flex flex-col w-full sm:flex-col">
                                    <h3 class="text-xl font-semibold ">${item.name}</h3>
                                    <p class="text-base text-gray-300 mt-2">Stock: ${item.stock}</p>
                                    <p class="text-base text-gray-300 mb-2">Console: 
                                        <c:forEach var="console" items="${consoles}">
                                            <c:if test="${item.consoleId eq console.getId()}">
                                                ${console.getName()}
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                    <div class="flex flex-row mt-auto">
                                        <p class="text-3xl font-bold"><fmt:formatNumber value="${item.price}" pattern="0.00"/>$</p>    
                                        <i class="fa fa-trash-o ml-auto sm:my-auto text-3xl cursor-pointer hover:text-white text-[#999999]" aria-hidden="true" onclick="location.href='${pageContext.request.contextPath}/Web/cart/${item.id}'" type="button"></i>
                                    </div>
                                    <c:set var="total" value="${total + item.price}" scope="page" />
                                </div>
                            </div>
                            <div class="w-full h-1 bg-[#474747] my-8 "></div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty sessionScope.cart.games}">
                    <p>Your cart is empty.</p>
                </c:if>
            </div>      
            <c:if test="${not empty sessionScope.cart.games}">
                <div class="sm:w-1/3 text-main-gray-medium">
                    <div class="border border-0 rounded-xl p-6 text-white bg-main-gray-light" style="backdrop-filter: blur(35px);">
                        <h2 class="text-3xl font-semibold mb-4">Total: <fmt:formatNumber value="${total}" pattern="0.00"/>$</h2>
                        <form action="${mvc.uri("new-rental")}" method="post">
                            <input class="total" type="hidden" name="total" value="${total}">
                            <button class="bg-gradient-to-r from-main-orange-light to-main-orange-dark text-white font-semibold py-2 px-4 border rounded border-0 shadow" type="submit">Proceed to rent</button>
                        </form>   
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <div class="pt-[45rem] sm:pt-[35rem] lg:pt-[2rem]"> <jsp:include page="/WEB-INF/views/layout/footer.jsp" /></div>
</div>
</body>
</html>
