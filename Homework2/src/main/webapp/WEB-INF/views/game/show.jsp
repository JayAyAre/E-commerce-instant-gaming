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
</head>
<body>
<%--        <jsp:include page="/WEB-INF/views/layout/navbar.jsp" />--%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Contact info</div>
                <div class="card-body">
                    <div class="d-flex justify-content-center">
                        <img class="profile_picture" src="{{Storage::url($contact->profile_picture)}}">
                    </div>
                    <p>Name: {{ $contact->name }}</p>
                    <p>Phone:<a class="text-decoration-none text-light" href="tel:{{ $contact->phone_number }}"> {{ $contact->phone_number }}</a></p>
                    <p>Email:<a class="text-decoration-none text-light" href="mailto:{{ $contact->email }}"> {{ $contact->email }}</a></p>
                    <p>Age: {{ $contact->age }}</p>
                    <a>Created at: {{ $contact->created_at }}<br></a>
                    <a><br>Updated at: {{ $contact->updated_at }}<br></a>
                    @
                    <div class="d-flex justify-content-center">
                        <a href="${mvc.uri("add-cart")}" class="btn btn-secondary me-2">Add cart</a>
                        <button class="bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">
                            Button
                        </button>
                        <form action="{{route(" contacts.destroy
                        ",$contact->id)}}" method="POST">
                        <button type="submit" class="btn btn-danger">Delete contact</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
<h1>Hello World!</h1>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>
