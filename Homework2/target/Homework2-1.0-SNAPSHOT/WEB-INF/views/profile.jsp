<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png" type="image/x-icon">
    <link rel="icon" type="image/gif" href="/img/logo_icon.png">
<!-- FontAwesome -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous"/> 
<title>Garlic Games - Edit profile</title>
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

<body class="bg-main-gray-dark relative pb-[42rem] lg:pb-48 min-h-screen">
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    <div class="flex flex-col items-center h-auto justify-center mb-6">
        <h2 class="font-bold text-3xl my-8 text-white">${sessionScope.authUser.username}</h2>
        <form action="${mvc.uri('profile')}" class="w-full" method="POST"> 
                <input type="hidden" name="${mvc.csrf.name}" value="${mvc.csrf.token}"/>
                    <div class="flex flex-col gap-6 items-center justify-center w-full">
                    <div class="w-4/5 md:w-1/2 xl:w-1/4">
                        <label class="text-white font-bold text-lg">Username</label>
                        <input type="text" name="username" value="${user != null ? user.username : sessionScope.authUser.username}" placeholder="Username"
                               class="block bg-main-gray-input w-full rounded-md border-0 py-3.5 text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                    </div>
                    
                    <div class="w-4/5 md:w-1/2 xl:w-1/4">
                        <label class="text-white font-bold text-lg">E-mail</label>
                        <input id="email" name="email" type="email" value="${sessionScope.authUser.email}" placeholder="Your e-mail"
                               class="block bg-main-gray-input rounded-md w-full border-0 py-3.5 text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                    </div>
                               
                    <div class="w-4/5 md:w-1/2 xl:w-1/4">
                        <label class="text-white font-bold text-lg">Password</label>
                        <input id="password" name="password" type="password" placeholder="Your password"
                            class="block bg-main-gray-input w-full rounded-md border-0 py-3.5 text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
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
                    <input class="bg-gradient-to-r w-4/5 md:w-1/2 xl:w-1/4 from-main-orange-light to-main-orange-dark hover:from-main-orange-dark hover:to-main-orange-dark cursor-pointer w-full text-white font-semibold py-3 px-4 mt-6 rounded-lg shadow"
                    type="submit"
                    value="Update profile"/>
                </div>
                
            </form>
    </div>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const dropdownToggleConsoles = document.querySelector('.dropdown-toggle-consoles');
    const dropdownMenuConsoles = document.querySelector('.dropdown-menu-consoles');
    const dropdownToggleGametypes = document.querySelector('.dropdown-toggle-gameTypes');
    const dropdownMenuGametypes = document.querySelector('.dropdown-menu-gameTypes');
    
    dropdownToggleConsoles.addEventListener('click', function() {
        dropdownMenuConsoles.classList.toggle('hidden');
    });
    
    dropdownToggleGametypes.addEventListener('click', function() {
        dropdownMenuGametypes.classList.toggle('hidden');
    });
});

</script>