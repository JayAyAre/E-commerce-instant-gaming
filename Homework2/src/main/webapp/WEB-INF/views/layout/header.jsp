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
<header class="sticky top-0 z-20">
    <div class="w-full bg-main-black flex flex-row justify-between pl-4 pr-8 bg-opacity-85" style="backdrop-filter: blur(30px);">
        <a href="${pageContext.request.contextPath}/Web/shop"><img class="w-24 h-24" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Logo de Garlic Games"><a/>

        <div class="flex flex-row text-white items-center gap-4">
            <c:forEach var="console" items="${consoles}">
                <a class="cursor-pointer gradient">${console.name}</a>
            </c:forEach>
            <div class="group flex justify-center items-cente r cursor-pointer">
                <div class="group bg-gradient-to-b from-main-orange-dark to-main-orange-light rounded-full p-5 inline-flex justify-center items-center"> <!-- Fondo circular naranja -->
                    <i class="fa fa-search scale-125 text-white transition-transform duration-300 group-hover:scale-150" aria-hidden="true"></i> <!-- Icono con efecto de crecimiento en hover -->
                </div>
            </div>
        </div>
            
        <div class="flex flex-row text-white items-center gap-6 text-3xl">
            <i class="fa fa-shopping-cart gradient cursor-pointer" aria-hidden="true"></i>

            <c:choose>
                <c:when test="${sessionScope.authUser != null}">
                    <i class="fa fa-user-circle-o gradient cursor-pointer" aria-hidden="true"></i>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/Web/sign-in" class="text-center text-[1rem] font-light hover:underline cursor-pointer">Loge In</a>
                </c:otherwise>
            </c:choose>   
        </div>
    </div>
</header>

