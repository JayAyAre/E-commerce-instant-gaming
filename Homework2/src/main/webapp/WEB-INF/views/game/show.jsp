<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <div class="relative">
        <div class="hidden sm:flex h-30vh">
            <div class="absolute inset-0 bg-cover bg-center bg-no-repeat">
                <img class="w-11/12 h-full mx-auto object-cover" src="${pageContext.request.contextPath}/resources/img/${game.getImage()}.jpg" alt="Game image">
            </div>
        </div>

        <div class="flex flex-col sm:flex-row gap-4 m-8 relative z-10">
            <!-- Resto del contenido -->
            <div class="flex justify-center w-full sm:w-1/2 border border-0 rounded-lg">
                <img class="w-full h-auto" src="${pageContext.request.contextPath}/resources/img/${game.getImage()}.jpg" alt="Game image">
            </div>
            
            <div class="w-full sm:w-1/2 border border-0 rounded-lg p-6 text-white mt-4 sm:mt-0 bg-transparent sm:bg-gray-dark" style="backdrop-filter: blur(15px);">
                <div class="flex flex-col">
                    <h2 class="text-2xl font-semibold mb-4">${game.getName()}</h2>
                    <p class="mb-2">${game.getStock()}</p>

                    <div class="mb-4">
                        <h3 class="text-lg font-semibold mb-2">Game Types:</h3>
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
    </div>
<div> 
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
      
</body>
</html>
