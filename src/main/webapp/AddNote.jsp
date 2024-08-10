
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- including bootstrap file  -->
<%@include file="all_js_css.jsp"%>
<title>Note Taker : Add Notes</title>
</head>
<body class="lightBlue">

	<div class="container">
		<%@include file="Navbar.jsp"%>
		<br>

		<h1>Please fill your note details</h1>
		
		<br>

		<!-- this is add form -->

		<form action="SaveNote" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> 
				<input required
				type="text" 
				class="form-control" 
				id="title"
				aria-describedby="title"
				name="title"
				placeholder="Enter title here">

			</div>
			<div class="mb-3">
				<label for="Note-" class="form-label">Note Content</label>
				<textarea 
				name="content"
				class="form-control"
				id="content" 
				placeholder="write Content Here"
				style="height:200px"></textarea>
			</div>
			
			<div class="container text-center">
			<button type="submit" class="btn btn-primary">Add</button>
			</div>
			
			
		</form>

	</div>
	
	<br>
	
	<footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 NoteTaker. All rights reserved.</p>
    </footer>

</body>
</html>