<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- FontAwesome -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous"/>
</head>
<body class="bg-[#272727]">
    <div class="z-10">
        <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    </div>

    <div class="flex flex-col lg:flex-row gap-4 sm:gap-16 mx-[2rem] sm:mx-auto sm:max-w-5xl relative z-1">
        <div class="flex flex-col sm:flex-row gap-4 sm:w-full mt-12">
            <div class="sm:w-full text-main-gray-medium bg-main-gray-light p-6 rounded-xl">
                <h2 class="text-3xl font-semibold mb-4 text-white">Shopping Cart</h2>
                <c:if test="${not empty sessionScope.cart.games}">
                    <c:forEach var="item" items="${sessionScope.cart.games}">
                        <div class="border border-0 rounded-lg p-6 text-white mt-4 bg-gray-dark" style="backdrop-filter: blur(35px);">
                            <div class="flex flex-row gap-4">
                                <img class="w-2/6 object-cover object-center rounded-lg" src="${pageContext.request.contextPath}/resources/img/${item.id}.jpg" alt="Game image">
                                <div class="flex flex-col gap-2">
                                    <h3 class="text-xl font-semibold">${item.name}</h3>
                                    <p class="">Stock: ${item.stock}</p>
                                    <p class="text-3xl font-bold">${item.price}0$</p>
                                </div>
                            <i class="fa fa-trash-o ml-auto my-auto text-3xl cursor-pointer hover:text-white text-[#999999]" aria-hidden="true" onclick="location.href='${pageContext.request.contextPath}/Web/cart/${item.id}'" type="button"></i>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty sessionScope.cart.games}">
                    <p>Your cart is empty.</p>
                </c:if>
            </div>       
            <div class="sm:w-1/3 text-main-gray-medium">
                <div class="border border-0 rounded-xl p-6 text-white bg-main-gray-light" style="backdrop-filter: blur(35px);">
                    <h2 class="text-3xl font-semibold mb-4">Info</h2>
                    <!-- Puedes agregar información adicional aquí, como el precio total, etc. -->
                    <button class="bg-gradient-to-r from-main-orange-light to-main-orange-dark text-white font-semibold py-2 px-4 border rounded border-0 shadow" onclick="location.href='https://www.google.com'" type="button">Proceed to rent</button>
                </div>
            </div>
        </div>
    </div>

    <div class='flex flex-col items-center z-1'>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
    </div>
</body>
</html>
