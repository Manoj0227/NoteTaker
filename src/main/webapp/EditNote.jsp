<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.query.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp" %>
    <title>Note Taker : Edit Note</title>
</head>
<body class="lightBlue">
  	
  	<div class="container">
  		<%@include file="Navbar.jsp" %>
  		
  		<h1>Edit Your Note</h1>
  		<br>
  		
  		<%
  		
  		//GETTING PARAMETER FROM FILE "all_notes.jsp"
  		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
  		
  		Session sessionEdit=FactoryProvider.getFactory().openSession();
		
		
		
		//LOADING NOTE ID FROM DATA BASE AND TYPE CAST IT TO "NOTE" CLASS TYPE
		Note note=(Note)sessionEdit.get(Note.class, noteId);
		
		sessionEdit.close();
  		
  		%>
  		
  		<!-- this is add form -->

		<form action="EditNoteServlet" method="post">
		
		<input type="hidden" value="<%= note.getId() %>" name="noteId"/>
			<div class="mb-3">
				<label for="noteTitle" class="form-label">Note Title</label> 
				<input required
				type="text" 
				class="form-control" 
				id="title"
				aria-describedby="title"
				name="noteTitle"
				placeholder="Enter title here"
				value="<%=note.getTitle() %>">

			</div>
			<div class="mb-3">
				<label for="Note-" class="form-label">Note Content</label>
				<textarea required
				aria-describedby="Content"
				name="noteContent"
				class="form-control"
				id="content" 
				style="height:200px"
				><%= note.getContent()%></textarea>
			</div>
			
			<div class="container text-center">
			<button type="submit" class="btn btn-success">Save</button>
			</div>
			
			
		</form>
  	
  	</div>
<br>  	
  	<footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 NoteTaker. All rights reserved.</p>
    </footer>
</body>
</html>