<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png" type="image/x-icon">
    <link rel="icon" type="image/gif" href="/img/logo_icon.png">

<title>Garlic Games - Los mejores juegos al mejor precio!</title>
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
    <h2 class="font-bold text-3xl my-8 text-white">Recomendations for ${sessionScope.authUser.username}</h2>
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