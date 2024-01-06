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
<body class="bg-main-gray-dark">
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    <div class="relative hidden sm:block z-0 h-56 md:h-72 lg:h-96 xl:h-[30rem] bg-center xl:bg-cover" style="background-image: url('${pageContext.request.contextPath}/resources/img/banner.jpg')">
        <div class="absolute bottom-0 left-0 w-full h-16" style="background-image: linear-gradient(to top right, #272727 50%, transparent 50%);"></div>
    </div>
    <div class="mx-auto px-8 w-2/3 text-white">  
        <h2 class="font-bold text-3xl mb-8">Tendencies</h2>
        <div class="grid grid-cols-3 gap-8">
            <c:forEach var="game" items="${games}">
                <div>
                    <div class="w-full h-[12.5rem] rounded-xl bg-cover bg-center hover:scale-105 transition transition-all cursor-pointer" style="background-image: url('${pageContext.request.contextPath}/resources/img/banner.jpg')">

                    </div>
                    <div class="flex flex-row justify-between items-center mt-2">
                        <p class="text-sm">${game.name}</p>
                        <p class="text-2xl font-light">${game.price}$</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
