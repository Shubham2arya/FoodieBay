<%
	if(session.getAttribute("name")==null)
	{
		response.sendRedirect("C_login.jsp");
	}
%>
<html>
	<head>
		<title>FoodieBay Home</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png"> 
		<style>
			.R_rating{height:25px; width:25px; margin-left:px;}
			.R_name{border:; width:225px; height:35px;}
			.R_data{border:; height:75px; width:267px; margin:5px; display-column:flex;}
			.R_sub_data{height:35px; width:275px; display:flex;	}
			.R_img{border:; margin:5px; width:272px; height:267px;}
			.R_container{border:; margin:10px; width:283px; height:365px; display-column:flex;}
			.filters{width:100%; height:65px; border-bottom:1px solid black;}
			.lower_body{display:flex; flex-wrap:wrap; border:; padding-left:50px; padding-right:50px;}
            .main{height:100%; width:100%;}
            .header{height:75px; width:100%; border:; display:flex;}
            .features{height:48%; width:100%; border:; background-color:#282c3f; display:flex; border-bottom:1px solid black;}
            
            .R_container:hover{border:1px solid grey; decoration:none;}
            
            #logout{border:; height:25px; width:80px; text-decoration:none; color:black; font-family:Fantasy; font-size:25px; margin-top:22px; margin-left:15px;}
            #header1{border:; width:265px; height:75px;}
            #home_food:hover{transform: scale(1.07,1.07); transition-duration: .8s;}
            #Rrating{color:white; background-color:green; padding-left:3px; padding-right:3px;}
            #Rname{text-align:left; margin-left:5px;}
            #quick_view{codlor:transparent; text-align:center}
            #header2{border:; height:25px; width:310px; margin-top:22px; font-size:23px; margin-left:680px; text-align:right; display:flex; flex-direction:row-reverse;}
            #homefood{border:; height:240px; width:250px; margin-left:250px; margin-top:35px;}
            
            a{text-decoration:none; color:black;}
            
            img[id=home_food]{height:240px; width:250px;}
            img[id=logo]{height:75px; width:265px;}
            img[name=usericon]{height:25px; width:25px;}
            input[name=username]{border:none; background-color:white; font-size:25px; border:;}
            
            input[name=username]:hover{color:orange;}
		</style>
	</head>
	<body>
		<div class="main">
			<div class="header">
				<div id="header1">
					<img src="FoodieBay.jpg" id="logo">
				</div>
				<div id="header2">
				<form action="C_User.jsp"><b>
				<%
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?autoReconnect=true&useSSL=false","root","root");	
					String cmail=request.getParameter("EId");
					PreparedStatement pstmt=con.prepareStatement("SELECT name FROM Customers WHERE email=?;");
					pstmt.setString(1,cmail);
					ResultSet set=pstmt.executeQuery();
					while(set.next())
					{
						String cname=set.getString("name");%>
						<input type="submit" name="username" value="<% out.println(cname);%>">
						<input type="hidden" id="uname" name="uname" value="<%=cname %>">
						
				<%}%>
				<input type="hidden" id="cusmail" name="cusmail" value="<%=cmail %>">
				</b></form>
				</div>
				<div id="logout">
				<a href="C_login.jsp">Logout</a>
				</div>
			</div>
			<div class="features">
				<div id="homefood">
					<a href=" ">
					<img id="home_food" src="home_food.png" alt="try home food">
					</a>
				</div>
			</div>
			<div class="filters">
			</div>
			<div class="lower_body">
				<form action="menu.jsp" name="form" id="form">
				<input type="hidden" id="aa" name="aa" value="">
				<input type="hidden" name="cmail" id="cmail" value="<%=cmail %>"></form>
				<%@page import="java.sql.*" %>
				<%@page import="java.io.PrintWriter" %>
				<%
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("SELECT * FROM Restaurants;");
							
					while(rs.next())
					{
						String Rname=rs.getString("name");
						String rating=rs.getString("rating");
						String rid=rs.getString("id");
				%>
				
					<div class="R_container" onClick="valueSet(this); document.forms['form'].submit();" data-id="<%=rid %>">
					
						<div class="R_img">
							<% 
								String image=rs.getString("logo");
							%>
							<img style="height:267px; width:272px;"src="Restaurants_images/<%=image%>">
						</div>
						<div class="R_data">
							<div class="R_sub_data">
								<div class="R_name">
									<p id="Rname"><b><%=Rname %></b></p>
								</div>
								<div class="R_rating ">
									<p id="Rrating"><%=rating %></p>
								</div>
							</div>
							<div>
								<p id="quick_view">quick view</p>
							</div>
						</div>
					</div>
				<%}rs.close();%>
			</div>
			
		</div>
	</body>
	<script>
		function valueSet(obj){
			let id=obj.getAttribute('data-id')
			document.querySelector('#aa').value=id
		}
		
		
	</script>
</html>