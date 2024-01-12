<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
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
<body class="bg-[#272727] relative pb-[44rem] md:pb-[26rem]">
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    <div class="relative hidden sm:block z-0 h-56 md:h-72 lg:h-96 xl:h-[25rem] bg-center xl:bg-cover" style="background-image: url('${pageContext.request.contextPath}/resources/img/banner2.png')">
        <div class="absolute bottom-0 left-0 w-full h-16" style="background-image: linear-gradient(to top right, #272727 50%, transparent 50%);"></div>
    </div>

        
    <div class="flex flex-col items-center sm:-mt-48 lg:flex-row gap-4 sm:gap-12 mx-[2rem] sm:mx-auto sm:max-w-5xl relative">
        <!-- Resto del contenido -->
        <img class="rounded-lg sm:w-full sm:h-[22rem]" src="${pageContext.request.contextPath}/resources/img/${game.getImage()}.jpg" alt="Game image">

        <div class="w-full h-full sm:w-1/2 border border-0 rounded-lg p-10 text-white mt-4 sm:mt-0 sm:bg-transparent" style="backdrop-filter: blur(35px);">
            <div class="flex flex-col">
                <h2 class="text-2xl font-semibold mb-4">${game.name}</h2>
                <p class="mb-2">Stock: ${game.stock}</p>
                <p class="mb-2">Console: ${console.name}</p>
                <div class="mb-4">
                    <h3 class="text-lg font-semibold mb-2">Genres:</h3>
                    <div class="flex flex-wrap">
                        <c:forEach var="type" items="${types}">
                            <span class="mr-2 mb-2 bg-gray-700 px-2 py-1 rounded-md text-white">${type}</span>
                        </c:forEach>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${game.stock > 0}">              
                        <form action="/Homework2/Web/cart" method="post">
                            <input class="gameId" type="hidden" name="gameId" value="${game.id}">
                            <button class="bg-gradient-to-r from-main-orange-light to-main-orange-dark text-white font-semibold py-2 px-4 border rounded border-0 shadow" type="submit"> Add to cart </button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <button class="bg-gray-500 text-white font-semibold py-2 px-4 border rounded border-0 shadow cursor-not-allowed" disabled>Out of stock</button>
                    </c:otherwise>
                </c:choose>
                    
            </div>
        </div>
    </div>
        
    <div class='flex flex-col items-center mt-8 lg:flex-row gap-16 p-10 mx-auto max-w-5xl relative text-[#8A8A8A]'>
        <p class="">${game.getDescription()}</p>
    </div>

    <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
