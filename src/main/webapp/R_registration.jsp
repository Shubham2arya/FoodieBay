<html>
	<head>
		<title>Admin Registration</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
            a{
				text-decoration:none;
			} 
		</style>
	</head>
	<body>
	
	<!-- we will get the status value from C_registrationServelet (suces or fail) -->
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	
		<h1>SignIn</h1>
		<form action="R_registrationServlet" target="_self" method="post" enctype="multipart/form-data">
			<label for="oname">Name:</label><br>
			<input type="text" id="oname" name="oname"><br><br>
			<label for="rname">Restaurant Name:</label><br>
			<input type="text" id="rname" name="rname"><br><br>
			<label for="email">Email:</label><br>
			<input type="email" id="email" name="email"><br><br>
			<label for="contact">Phone No.:</label><br>
			<input type="text" id="contact" name="contact"><br><br>
			<label for="pass">Enter Password:</label> <br>
			<input type="password" id="pass" name="pass"><br><br>
			<label for="rpass">Re-Enter Password:</label><br>
			<input type="password" id="rpass" name="rpass"><br><br>	
			<label for="country">Country:</label><br>
				<select id="country" name="country">
					<option value="America">America</option>
					<option value="Africa">Africa</option>
					<option value="Afganistan">Afganistan</option>
					<option value="Australia">Australia</option>
					<option value="India">India</option>
				</select><br><br>
			<label for="city">City:</label><br>
			<input type="text" id="city" name="city"><br><br>
			<label for="area">Area:</label><br>
			<input type="text" id="area" name="area"><br><br>
			<label for="pincode">Pin Code:</label><br>
			<input type="text" id="pincode" name="pincode"><br><br>
			<label for="image">Upload Image:</label>
			<input type="file" id="image" name="image"><br><br> 
			<input type="submit" value="Submit">	
		</form>
		<a href="R_login.jsp">Already Registered</a>
		
		<!-- we are using the librery sweetalert to get alert msg after completion of event -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
		
		<script type="text/javascript">
		var status=document.getElementById("status").value;
		if(status=="Success")
		{
			swal("Congrats","Account Created Sucessfully","success");
		}
		if(status=="invalidoname")
		{
			swal("Sorry","Name Is Empty","error");
		}
		if(status=="invalidrname")
		{
			swal("Sorry","Restaurant Name Is Empty","error");
		}
		if(status=="invalidemail")
		{
			swal("Sorry","Email Is Empty","error");
		}
		if(status=="invalidpass")
		{
			swal("Sorry","Password Is Empty","error");
		}
		if(status=="invalidrpass")
		{
			swal("Sorry","Password Does Not Match","error");
		}
		if(status=="invalidcontact")
		{
			swal("Sorry","Contact Is Invalid","error");
		}
		if(status=="invalidcity")
		{
			swal("Sorry","City Is Empty	","error");
		}
		if(status=="invalidarea")
		{
			swal("Sorry","Area Is Empty	","error");
		}
		if(status=="invalidpincode")
		{
			swal("Sorry","Pincode Is Empty	","error");
		}
		</script>
	</body>
</html>