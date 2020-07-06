<!DOCTYPE html>
<html>

<head>
<title>Add Student Form</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
 <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">           
</head>

<body>
	<div class="container">
		<div class="header center-align indigo darken-1" style="
		margin-bottom:20px;padding-bottom:10px;padding-top:10px;margin-top:20px;">
		<h2><span class="lime-text text-lighten-5">FooBar University</span></h2>
	</div>
	</div>

	<div class="container">
		<div class="header left-align brown darken-2"
		style="
		margin-bottom:20px;margin-right:650px;padding-bottom:2px;padding-top:2px;margin-top:20px;"><h4><span class="lime-text text-lighten-5">Add Student Form</span></h4>
		</div>
		<form action="StudentServlet">
			<input type="hidden" name="command" value="ADD">
			<div class="row">
				<div class="input-field col s6">
					<input placeholder="Enter Student ID" name="id" type="number"
						class="validate"> <label for="id"><b><i>Student ID</i></b></label>
				</div>
				<div class="input-field col s3">
					<input placeholder="Enter first_name" name="first_name" type="text"
						class="validate"> <label for="first_name"><b><i>First
						Name</i></b></label>
				</div>
				<div class="input-field col s3">
					<input placeholder="Enter last_name" name="last_name" type="text"
						class="validate"> <label for="last_name"><b><i>Last Name</i></b></label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input placeholder="Enter Email" name="email" type="email"
						class="validate"> <label for="email"><b><i>Email</i></b></label>
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
		<a class="waves-effect waves-light btn-small" href="StudentServlet">Back To List</a>
		</p>
	</div>
	
	<!-- 
	
	WITHOUT MATERIALIZE
	
	<div id="wrapper">
		<div id="header">
			<h2>FooBar University</h2>
		</div>
	</div>

	<div id="container">
		<h3>Add Student</h3>

		<form action="StudentServlet">

			<input type="hidden" name="command" value="ADD" />

			<table>
				<tbody>
					<tr>
						<td><label>Id:</label></td>
						<td><input type="number" name="id" /></td>
					</tr>
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="first_name" /></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="last_name" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><input type="text" name="email" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				</tbody>
			</table>
		</form>

		<div style="clear: both;"></div>

		<p>
			<a href="StudentServlet">Back to List</a>
		</p>
	</div> -->
</body>

</html>











