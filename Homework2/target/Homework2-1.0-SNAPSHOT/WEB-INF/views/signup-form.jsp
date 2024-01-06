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
            'main-orange-light': '#FF7F00'
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
<body>
    <div class="flex flex-row">
        <div class="flex flex-col flex-1 w-full h-screen justify-center content-center bg-main-gray-light">
            <img class="w-56 h-56 mx-auto" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Logo de Garlic Games">
            <form action="${mvc.uri('sign-up')}" class="mx-auto w-3/4" method="POST"> 
                <input type="hidden" name="${mvc.csrf.name}" value="${mvc.csrf.token}"/>
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-6 sm:grid-cols-6">
                    <div class="sm:col-span-3">
                      <div>
                        <input type="text" name="username" value="${user.username}" placeholder="Username"
                               class="block bg-main-gray-input w-full rounded-md border-0 py-3.5 text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                      </div>
                    </div>

                    <div class="sm:col-span-3">
                      <div>
                          <input id="password" name="password" type="password" placeholder="Your password"
                               class="block bg-main-gray-input w-full rounded-md border-0 py-3.5 text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                      </div>
                    </div>
                    
                    <div class="sm:col-span-6">
                      <div>
                        <input id="email" name="email" type="email" value="${user.email}" placeholder="Your e-mail"
                               class="block bg-main-gray-input w-full rounded-md border-0 py-3.5 text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                      </div>
                    </div>
                </div>
                <c:if test="${not empty errors or not empty message}">
                    <div class="bg-[#512C37] rounded rounded-md mt-6 px-24 py-8">
                        <ul>
                            <c:if test="${not empty message}">
                                <li class='text-[#F00D4C]'><c:out value="${message}"/></li>
                                </c:if>
                            <c:forEach var="error" items="${errors.getErrors()}">
                                <li class='text-[#F00D4C]'><c:out value="${error.message}"/></li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <input class="bg-gradient-to-r from-main-orange-light to-main-orange-dark hover:from-main-orange-dark hover:to-main-orange-dark cursor-pointer w-full text-white font-semibold py-3 px-4 mt-6 rounded-lg shadow"
                type="submit"
                value="Submit"/>
            </form>
            <a href="sign-in" class="mx-auto w-3/4 mt-4 text-main-gray-medium underline cursor-pointer hover:text-white">
                Already have an account?
            </a>
        </div>
        <div class="flex-1 w-full bg-cover bg-center" style="background-image: url('${pageContext.request.contextPath}/resources/img/registro.jpg')">
        </div>
    </div>
    <!-- <jsp:include page="/WEB-INF/views/layout/footer.jsp" /> -->
</body>
</html>