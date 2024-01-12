<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .gradient{
        color: white;
    }
    .gradient:hover {
        background-image: linear-gradient(to bottom, #FF4120, #FF7F00);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        display: inline-block;
    }
</style>
<header class="sticky top-0 z-40">
    <div class="w-full bg-main-black flex flex-row justify-between pl-4 pr-8 bg-opacity-85" style="backdrop-filter: blur(30px);">
        <a href="${pageContext.request.contextPath}/Web/shop"><img class="w-24 h-24" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Logo de Garlic Games"></a>
            
        <div class="flex flex-row text-white items-center gap-6 text-3xl">
            <i class="fa fa-shopping-cart gradient cursor-pointer" onclick="location.href='/Homework2/Web/cart'" aria-hidden="true"></i>

            <c:choose>
                <c:when test="${sessionScope.authUser != null}">
                    <i class="dropdown-toggle-profile relative fa fa-user-circle-o gradient cursor-pointer" aria-hidden="true"></i>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/Web/sign-in" class="text-center text-[1rem] font-light hover:underline cursor-pointer">Log In</a>
                </c:otherwise>
            </c:choose>   
                    
            <div class="dropdown-menu-profile absolute bg-white text-[1rem] bg-opacity-20 border border-0 rounded-md p-4 w-48 top-full right-0 mr-2.5 mt-2.5 hidden" style="backdrop-filter: blur(50px); z-index: 50;">
                <div class="flex flex-col items-start">
                    <a href="history" class="hover:bg-main-orange rounded-lg w-full pl-1.5">History</a>
                    <a href="profile" class="hover:bg-main-orange rounded-lg w-full pl-1.5">Profile</a>
                    <a href="sign-out" class="hover:bg-main-orange rounded-lg w-full pl-1.5">Sign Out</a>
                </div>
            </div>        
        </div>
    </div>
</header>
        <div class="hidden profile-shadow opacity-80 fixed top-0 left-0 z-30 w-full h-full bg-main-black"></div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const dropdownToggleProfile = document.querySelector('.dropdown-toggle-profile');
    const dropdownMenuProfile = document.querySelector('.dropdown-menu-profile');    
    const shadowLayer = document.querySelector('.profile-shadow');

    
    dropdownToggleProfile.addEventListener('click', function() {
        dropdownMenuProfile.classList.toggle('hidden');
        shadowLayer.classList.toggle('hidden');
    });
});

</script>
