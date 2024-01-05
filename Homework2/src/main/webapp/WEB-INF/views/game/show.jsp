<%-- 
    Document   : show
    Created on : 5 ene 2024, 12:00:31
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
<body>
<%--        <jsp:include page="/WEB-INF/views/layout/navbar.jsp" />--%>

<div class="flex flex-col sm:flex-row gap-4">
    <div class="w-1/2 border border-1 border-gray-300 rounded-lg">
        A
    </div>
    <div class="w-1/2 border border-1 border-gray-300 mt-4 sm:mt-0 rounded-lg">
        <button class=" bg-gradient-to-r from-main-orange-light to-main-orange-dark text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow"
                onclick="location.href='https://www.google.com'" type="button"> Add to cart
            <!-- $mvc.uri('cart')} -->
        </button>
    </div>
</div>



<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>
