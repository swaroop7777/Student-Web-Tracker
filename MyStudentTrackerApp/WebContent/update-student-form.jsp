<!DOCTYPE html>
<html>

<head>
<title>Update Student Form</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
	<div class="container">
		<div class="header center-align indigo darken-1"
			style="margin-bottom: 20px; padding-bottom: 10px; padding-top: 10px; margin-top: 20px;">
			<h2>
				<span class="lime-text text-lighten-5">FooBar University</span>
			</h2>
		</div>
	</div>

	<div class="container">
		<div class="header left-align brown darken-2"
			style="margin-bottom: 20px; margin-right: 600px; padding-bottom: 2px; padding-top: 2px; margin-top: 20px;">
			<h4>
				<span class="lime-text text-lighten-5">Update Student Form</span>
			</h4>
		</div>
		<form action="StudentServlet">
			<input type="hidden" name="command" value="UPDATE"> <input
				type="hidden" name="id" value="${theStudent.id}">
			<div class="row">
				<div class="input-field col s6">
					<input placeholder="Enter first_name" name="first_name"
						value="${theStudent.first_name}" type="text" class="validate">
					<label for="first_name">First Name</label>
				</div>
				<div class="input-field col s6">
					<input placeholder="Enter last_name" name="last_name" type="text"
						value="${theStudent.last_name}" class="validate"> <label
						for="last_name">Last Name</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input placeholder="Enter Email" name="email" type="email"
						value="${theStudent.email}" class="validate"> <label
						for="email">Email</label>
				</div>
			</div>
			<div class="center-align">
			<button class="btn waves-effect waves-light" type="submit"
				value="Save" class="save">
				Submit <i class="material-icons right">send</i>
			</button>
			</div>
		</form>
		<p>
		<a class="waves-effect waves-brown waves-ripple btn-small" href="StudentServlet">Back To List</a>
		</p>
	</div>


	<%-- 
	
	WITHOUT MATERIALIZE
	
	<div id="header">
		<h2>FooBar University</h2>
	</div>

	<div id="container">
		<h3>Update Student</h3>

		<form action="StudentServlet">

			<input type="hidden" name="command" value="UPDATE" /> 
			<input type="hidden" name="id" value="${theStudent.id}" />

			<table>
				<tbody>
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="first_name"
							value="${theStudent.first_name}" /></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="last_name"
							value="${theStudent.last_name}" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><input type="text" name="email"
							value="${theStudent.email}" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save"/></td>
					</tr>

				</tbody>
			</table>
		</form>

		<div style="clear: both;"></div>

		<p>
			<a href="StudentServlet">Back to List</a>
		</p>
	</div> --%>
</body>

</html>











