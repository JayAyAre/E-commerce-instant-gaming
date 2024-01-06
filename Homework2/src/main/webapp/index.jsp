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
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
