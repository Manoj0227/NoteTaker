<%@include file="all_js_css.jsp" %>

<body class="container lightBlue">
<div class="container">
<nav class="navbar navbar-expand-lg navbar-dark purple">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">NoteTaker</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="AddNote.jsp">Add Note</a>
        </li>
     
        <li class="nav-item">
          <a class="nav-link active" href="all_notes.jsp" tabindex="-1" >Show Notes</a>
        </li>
      </ul>
      <form action="TitleSearchServlet" method="post" class="d-flex">
        <input class="form-control me-2" name="titleSearch" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light " type="submit">Search</button>
      </form>
    </div>
  </div>
 </div>
</nav>
