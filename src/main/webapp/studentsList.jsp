<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Students registered</title>
  <link rel="stylesheet" href="styleDashboard.css">
</head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<body>
	<%
		if(session.getAttribute("login") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="menuAdmin.jsp" />
	
	<div class="container" style="margin-left:25%;padding:1px 16px;height:1000px;">
		<h1>Liste des étudiants inscrits</h1><hr>
		<form method="post" action="studentsList">
			<div class="row">
			    <div class="col-25">
			      <label for="section">Filtrage selon la section</label>
			    </div>
			    <div class="col-75 form-group required">
			      <select id="section" name="section">
			        <option value="iatic 3">IATIC 3</option>
			        <option value="iatic 4">IATIC 4</option>
			        <option value="iatic 5">IATIC 5</option>
			      	<option value="all">TOUS</option>
			      </select>
			    </div>
			 </div>
			 <div class="row">
	    		<button type="submit" value="Submit">  Filtrer </button>
	  		 </div>
	   </form> <hr>
		<div>     
		  <table>
		    <thead>
		      <tr>
		        <th>Identifiant</th>
		        <th>Nom</th>
		        <th>Prénom</th>
		        <th>Contact</th>
		        <th>Date de naissance</th>
		        <th>Section</th>
		        <th>Mot de passe</th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="student" items="${students}">
				<tr>
					<td>${student.id}</td>
			        <td>${student.name}</td>
			        <td>${student.lastname}</td>
			        <td>${student.contact}</td>
			        <td>${student.birthday}</td>
			        <td>${student.section}</td>
			        <td>${student.password}</td>
		      </tr>
			</c:forEach>
		    </tbody>
		  </table>
		</div>
	</div>
</body>
</html>