<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.query.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp"%>
<title>Search Result : NoteTaker</title>
</head>
<body class="lightBlue">

	<div class="container">
		<%@include file="Navbar.jsp"%>
		<br>
		
		<h1 class="text-uppercase text-center ">Searched Notes</h1>
		
		<div class="row">
		
		<div class="col-12">
		<%
		
		Session sessionShow=FactoryProvider.getFactory().openSession();
		String titleSearch=request.getParameter("titleSearch");
		
		//out.print(titleSearch);
		
		
		
		Query qry=sessionShow.createQuery("from Note where title like ?1");
		qry.setParameter(1,titleSearch);
		List<Note> list=qry.list();
		
		
		//List list=request.getAttribute("list");
		for (Note note : list)
		{
		
		%>
			
			<div class="card mb-3 mt-">
				<img src="Image/writing.png" style="max-width: 100px" class="card-img-top p-2 text-center" alt="Card image cap">
				<div class="card-body">
					<div class="card-header"><p class="card-text">Date & time : <%=note.getAddedDate()%></p>
					</div><br>
					<h5 class="card-title">Title : <%= note.getTitle()%></h5><br>
					<p class="card-text"><%= note.getContent() %></p><br>
			
					<div class="container text-center">
						<a href="DeleteNoteServlet?noteId=<%=note.getId() %>" class="btn btn-danger ">Delete</a>
						<a href="EditNote.jsp?noteId=<%=note.getId() %>" class="btn btn-primary ">Edit</a>
					</div>
					
				</div>
			</div>
			
		<% 
		}
		
		
		sessionShow.close();
		
	
		
		
		%>
		
		<!-- col div -->
		</div>
		
		<!-- row div -->
		</div>

	<!-- NAVBAR div -->
	</div>
	
	<div>
	<br>
	<footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 NoteTaker. All rights reserved.</p>
    </footer>
	</div>

</body>
</html>