<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="all_js_css.jsp"%>
    <title>Search Result : NoteTaker</title>
    <script>
        // Function to fade out the alert after a few seconds
        function fadeOutAlert() {
            setTimeout(function () {
                let alertBox = document.getElementById("alertBox");
                if (alertBox) {
                    alertBox.style.transition = "opacity 1s ease-out";
                    alertBox.style.opacity = "0";
                    setTimeout(() => alertBox.style.display = "none", 1000);
                }
            }, 3000);
        }
    </script>
</head>
<body class="lightBlue" onload="fadeOutAlert()">
    <div class="container">
        <%@include file="Navbar.jsp"%>
        <br>
        <h1 class="text-uppercase text-center">Searched Notes</h1>

        <div class="row">
            <div class="col-12">
                <%
                    List<Note> list = (List<Note>) request.getAttribute("noteList");
                    if (list != null && !list.isEmpty()) {
                %>
                <div id="alertBox" class="alert alert-success text-center">Notes Found Successfully!</div>
                <%
                        for (Note note : list) {
                %>
                <div class="card mb-3 mt-3 shadow-lg">
                    <img src="Image/writing.png" style="max-width: 100px" class="card-img-top p-2 text-center" alt="Card image cap">
                    <div class="card-body">
                        <div class="card-header">
                            <p class="card-text">Date & Time: <%= note.getAddedDate() %></p>
                        </div>
                        <br>
                        <h5 class="card-title">Title: <%= note.getTitle() %></h5><br>
                        <p class="card-text"><%= note.getContent() %></p><br>
                        <div class="container text-center">
                            <a href="DeleteNoteServlet?noteId=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                            <a href="EditNote.jsp?noteId=<%= note.getId() %>" class="btn btn-primary">Edit</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div id="alertBox" class="alert alert-danger text-center">No Notes Found!</div>
                <div class="card bg-white mb-4 shadow-lg border border-rounded rounded-lg alert">
                    <br>
                    <h1 style='text-align: center'>No Notes Found!</h1>
                    <center>
                        <a href='all_notes.jsp'><button class="btn btn-block col-4 mt-4 mb-4 btn-primary">View All Notes</button></a>
                    </center>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 NoteTaker. All rights reserved.</p>
    </footer>
</body>
</html>
