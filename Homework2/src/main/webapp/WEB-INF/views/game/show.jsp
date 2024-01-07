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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

<!-- FontAwesome -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous"/>
</head>
<body class="bg-[#272727]">
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    <div class="relative hidden sm:block z-0 h-56 md:h-72 lg:h-96 xl:h-[25rem] bg-center xl:bg-cover" style="background-image: url('${pageContext.request.contextPath}/resources/img/banner.jpg')">
        <div class="absolute bottom-0 left-0 w-full h-16" style="background-image: linear-gradient(to top right, #272727 50%, transparent 50%);"></div>
    </div>

        
    <div class="flex flex-col items-center sm:-mt-48 lg:flex-row gap-16 sm:mx-auto sm:max-w-5xl relative">
        <!-- Resto del contenido -->
        <img class="rounded-lg sm:w-1/2" src="${pageContext.request.contextPath}/resources/img/${game.getImage()}.jpg" alt="Game image">
      

        <div class="w-full sm:w-1/2 border border-0 rounded-lg p-6 text-white mt-4 sm:mt-0 bg-transparent sm:bg-gray-dark" style="backdrop-filter: blur(35px);">
            <div class="flex flex-col">
                <h2 class="text-2xl font-semibold mb-4">${game.getName()}</h2>
                <p class="mb-2">Stock: ${game.getStock()}</p>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold mb-2">Genres:</h3>
                    <div class="flex flex-wrap">
                        <c:forEach var="type" items="${types}">
                            <span class="mr-2 mb-2 bg-gray-700 px-2 py-1 rounded-md text-white">${type}</span>
                        </c:forEach>
                    </div>
                </div>

                <div class="mt-8">
                    <button class="bg-gradient-to-r from-main-orange-light to-main-orange-dark text-white font-semibold py-2 px-4 border rounded border-0 shadow" onclick="location.href='https://www.google.com'" type="button"> Add to cart </button>
                </div>
            </div>
        </div>
    </div>
        
    <div class='flex left-0 sm:mx-auto flex-col items-center mt-8 text-[#8A8A8A] '>
        <p class="mb-2">Stock: ${game.getDescription()}</p>
    </div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
