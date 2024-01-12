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
<body class="bg-main-gray-dark">
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />
    <div class="relative hidden sm:block z-0 h-56 md:h-72 lg:h-96 xl:h-[30rem] bg-center xl:bg-cover" style="background-image: url('${pageContext.request.contextPath}/resources/img/banner.jpg')">
        <div class="absolute bottom-0 left-0 w-full h-16" style="background-image: linear-gradient(to top right, #272727 50%, transparent 50%);"></div>
    </div>
        
    <div class="flex flex-col items-center sm:flex-row justify-center gap-6 mt-6 md:px-0 px-8">
        <div class="relative flex flex-col w-full sm:w-5/6 md:w-1/4 2xl:w-2/12">
            <div class="dropdown-toggle-consoles block bg-main-gray-input rounded-md border-0 py-4 cursor-pointer text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                <div class="flex flex-row justify-between items-center mx-4">
                    <c:choose>
                        <c:when test="${not empty param.console}">
                            <p>${consoles.stream()
                                .filter(console -> console.getId().equals(Long.parseLong(param.console)))
                                .findFirst()
                                .orElse(null).name}
                            </p>
                        </c:when>
                        <c:otherwise>
                                <span>Consoles</span>
                        </c:otherwise>
                    </c:choose>                    
                    <i class="fa fa-chevron-down" aria-hidden="true"></i>
                </div>
            </div>
            <c:if test="${not empty param.console}">
                <form action="shop/remove-console" method="get">
                    <button type="submit" class="absolute top-0 right-0 w-6 h-6 rounded-full bg-main-orange text-white translate-x-1/2 -translate-y-1/2 flex justify-center items-center cursor-pointer hover:bg-main-orange-light">
                        <c:if test="${not empty paramValues.gameType}">
                            <c:forEach var="gameTypeId" items="${paramValues.gameType}">
                                <input type="hidden" name="gameType" value="${gameTypeId}" />
                            </c:forEach>
                        </c:if>
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
                </form>
            </c:if>
            <div class="dropdown-menu-consoles left-0 right-0 md:left-auto md:right-auto absolute bg-white bg-opacity-20 border border-0 rounded-md p-4 w-full top-full mt-2.5 hidden" style="backdrop-filter: blur(50px); z-index: 50;">
                <div class="flex flex-col items-start">
                    <c:forEach var="console" items="${consoles}">
                        <form class="w-full" action="shop" method="get">
                            <c:if test="${not empty paramValues.gameType}">
                                <c:forEach var="gameTypeId" items="${paramValues.gameType}">
                                    <input type="hidden" name="gameType" value="${gameTypeId}" />
                                </c:forEach>
                            </c:if>
                            <input type="hidden" name="console" value="${console.id}"/>
                            <input type="submit" value="${console.name}" class="text-white hover:bg-main-orange cursor-pointer w-full rounded-md font-light px-2 py-1 text-left"/>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
        
        <div class="relative flex flex-col w-full sm:w-5/6 md:w-1/4 2xl:w-2/12">
            <div class="dropdown-toggle-gameTypes block bg-main-gray-input rounded-md border-0 py-4 cursor-pointer text-white shadow-sm ring-2 ring-inset ring-main-gray-medium placeholder:text-gray-400 transition-colors hover:ring-2 hover:ring-inset hover:ring-main-orange focus:ring-2 focus:ring-inset focus:ring-main-orange sm:text-sm sm:leading-6">
                <div class="flex flex-row justify-between items-center mx-4">
                    <c:choose>
                        <c:when test="${not empty param.gameType}">
                            <div class="flex justify-start items-center gap-4">
                            <c:forEach var="gameTypeId" items="${paramValues.gameType}">
                                <form action="shop/remove-gametype">
                                    <div class="flex items-center gap-1">
                                        <button type="submit"><i class="fa fa-times cursor-pointer hover:text-main-orange-light" aria-hidden="true"></i></button>
                                        <input type="hidden" name="gameType" value="${gameTypeId}" />
                                        <span>${gameTypes.stream()
                                            .filter(gameType -> gameType.getId().equals(Long.parseLong(gameTypeId)))
                                            .findFirst()
                                            .orElse(null).name}</span>
                                        <c:if test="${not empty paramValues.gameType}">
                                            <c:forEach var="gameTypeId" items="${paramValues.gameType}">
                                                <input type="hidden" name="gameTypes" value="${gameTypeId}" />
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty param.console}">
                                            <input type="hidden" name="console" value="${param.console}" />
                                        </c:if>
                                    </div>
                                </form>
                            </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                                <span>Game types</span>
                        </c:otherwise>
                    </c:choose>

                    
                    <i class="fa fa-chevron-down" aria-hidden="true"></i>
                </div>
            </div>
            <c:if test="${not empty param.gameType}">
                <form action="shop/remove-gametypes" method="get">
                    <c:if test="${not empty param.console}">
                        <input type="hidden" name="console" value="${param.console}" />
                    </c:if>
                    <button type="submit" class="absolute top-0 right-0 w-6 h-6 rounded-full bg-main-orange text-white translate-x-1/2 -translate-y-1/2 flex justify-center items-center cursor-pointer hover:bg-main-orange-light">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
                </form>
            </c:if>
            <div class="dropdown-menu-gameTypes absolute bg-white bg-opacity-20 border border-0 rounded-md p-4 w-full top-full mt-2.5 hidden" style="backdrop-filter: blur(50px); z-index: 50;">
                <div class="flex flex-col items-start">
                    <c:forEach var="gameType" items="${gameTypes}">
                        <form class="w-full" action="shop" method="get">
                            <c:if test="${not empty param.console}">
                                <input type="hidden" name="console" value="${param.console}" />
                            </c:if>
                            <c:if test="${not empty param.gameType}">
                                <input type="hidden" name="gameType" value="${param.gameType}" />
                            </c:if>
                            <input type="hidden" name="gameType" value="${gameType.id}"/>
                            <input type="submit" value="${gameType.name}" class="text-white hover:bg-main-orange cursor-pointer w-full rounded-md font-light px-2 py-1 text-left"/>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="mx-auto px-8 2xl:w-2/3 w-full text-white mb-8">  
        <c:choose>
            <c:when test="${sessionScope.authUser != null}">
                <h2 class="font-bold text-3xl my-8">Recomendations for ${sessionScope.authUser.username}</h2>
            </c:when>
            <c:otherwise>
                 <h2 class="font-bold text-3xl my-8">Tendencies</h2>
            </c:otherwise>
        </c:choose> 
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <c:forEach var="game" items="${games}">
                <div>
                    <div onclick="location.href='game-details/${game.id}'" class="w-full h-[12.5rem] rounded-xl bg-cover bg-center hover:scale-105 transition transition-all cursor-pointer" style="background-image: url('${pageContext.request.contextPath}/resources/img/${game.image}.jpg')">

                    </div>
                    <div class="flex flex-row justify-between items-center mt-2">
                        <p class="text-sm">${game.name}</p>
                        <p class="text-2xl font-light">${game.price}$</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="flex flex-row justify-center gap-4">
            <c:if test="${currentPage > 1}">
                <form action="shop/previous-page" method="get">
                    <input type="hidden" name="currentPage" value="${currentPage}" />
                    <c:if test="${not empty param.console}">
                        <input type="hidden" name="console" value="${param.console}" />
                    </c:if>
                    <c:if test="${not empty paramValues.gameType}">
                        <c:forEach var="gameTypeId" items="${paramValues.gameType}">
                            <input type="hidden" name="gameType" value="${gameTypeId}" />
                        </c:forEach>
                    </c:if>
                    <button type="submit" class="bg-[#3D3D3D] hover:bg-main-orange cursor-pointer text-white font-semibold py-2 px-3 mt-6 rounded-lg shadow">
                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                    </button>
                </form>
            </c:if>

            <c:if test="${currentPage < totalPages}">
                <form action="shop/next-page" method="get">
                    <input type="hidden" name="currentPage" value="${currentPage}" />
                    <c:if test="${not empty param.console}">
                        <input type="hidden" name="console" value="${param.console}" />
                    </c:if>
                    <c:if test="${not empty paramValues.gameType}">
                        <c:forEach var="gameTypeId" items="${paramValues.gameType}">
                            <input type="hidden" name="gameType" value="${gameTypeId}" />
                        </c:forEach>
                    </c:if>
                    <button type="submit" class="bg-[#3D3D3D] hover:bg-main-orange cursor-pointer text-white font-semibold py-2 px-3 mt-6 rounded-lg shadow">
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </button>
                </form>
            </c:if>
        </div>
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