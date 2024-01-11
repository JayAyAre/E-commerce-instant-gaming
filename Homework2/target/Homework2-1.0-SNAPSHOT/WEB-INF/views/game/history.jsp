<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<body class="bg-[#272727] min-h-screen flex flex-col flex-grow">

    <jsp:include page="/WEB-INF/views/layout/header.jsp" />

    <div class="flex flex-col lg:flex-row gap-4 sm:gap-16 mx-[2rem] sm:mx-auto sm:max-w-5xl relative z-1">
        <div class="flex flex-col sm:flex-row gap-4 mt-12">
            <div class="flex flex-col lg:w-auto text-main-gray-medium bg-main-gray-light p-6 rounded-2xl">
                <h2 class="text-3xl font-semibold mb-4 text-white">Shopping Cart</h2>
                <c:if test="${not empty rentals}">
                    <c:forEach var="rental" items="${rentals}">
                        <c:forEach var="game" items="${rental}">
                            <div class="border border-0 rounded-lg text-white bg-gray-dark" style="backdrop-filter: blur(35px);">
                                <div class="flex flex-col sm:flex-row gap-8">
                                    <img class="flex flex-col w-full sm:flex-row w-4/6 sm:w-3/6 object-cover object-center rounded-xl" src="${pageContext.request.contextPath}/resources/img/${item.id}.jpg" alt="Game image">
                                    <div class="flex flex-col w-full sm:flex-col">
                                        <h3 class="text-xl font-semibold ">${game.name}</h3>
                                        <p class="text-base text-gray-300 mb-2">Console: 
                                            <c:forEach var="console" items="${consoles}">
                                                <c:if test="${game.consoleId eq console.id}">
                                                    ${console.name}
                                                </c:if>
                                            </c:forEach>
                                        </p>
                                        <p class="text-3xl font-bold mt-auto"><fmt:formatNumber value="${game.price}" pattern="0.00"/>$</p>    
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <h2 class="text-xl font-semibold ">Total for rent:${rental.price}</h3>
                        <h4 class="text-lg font-semibold ">Start date:${rental.startDate}</h3>
                        <h4 class="text-lg font-semibold ">Finla date:${rental.finalDate}</h3>
                        <div class="w-full h-1 bg-[#474747] my-8 "></div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty rentals}">
                    <p>Your history is empty.</p>
                </c:if>
            </div>      
        </div>
    </div>

    <div class='flex flex-col w-full mt-auto -mb-2'>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
    </div>
</body>
</html>
