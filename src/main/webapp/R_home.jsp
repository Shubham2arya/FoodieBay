<%
	if(session.getAttribute("name")==null)
	{
		response.sendRedirect("R_login.jsp");
	}
%>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<html>
	    <%
	    	String rname="";
	    	String oname="";
	    	String rid="";
	    	String img="";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?autoReconnect=true&useSSL=false","root","root");
			String rmail=request.getParameter("EId");
			PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Restaurants WHERE email=?");
			pstmt.setString(1,rmail);
	 		ResultSet rs=pstmt.executeQuery();
	 		while(rs.next())
	 		{
	 			rname=rs.getString("name");
	 			oname=rs.getString("owner_name");
	 			rid=rs.getString("id");
	 			img=rs.getString("wallpaper");
	 		}	
		%>
	<head>
		<title>Restaurants Dashboard</title>
		<link rel="icon" type="image/x-icon" href="FoodieBay_logo.png">
		<style>
			.dashboard{width:100%; height:350px; border:1px solid black; 
			background-image:url('Restaurants_dashboard/<%=img %>');background-repeat: no-repeat; background-size:100% 380px;}
			.dashboard_img{border:; height:20px; width:45px; margin-right:5px; display:flex;}
			.main_body{height:; width:100%; border:;}
			.owner_name{border:; height:20px; width:320px; text-transform:uppercase; padding-top:2px;}
			.container1{border:; height:22px; width:1320px; display:flex; margin:5px;}
			.res_name{border:; height:65px; width:525px; font-size:55px; text-align:right; margin-top:250px; margin-left:780px;}
			.logout{border:; margin-left:900px; margin-top:2px;}
			.static_menu{border:; weidth:100%; height:55px; display:flex;}
			.add_menu{border:; width:100%; height:100px; padding-top:25px; border-bottom:1px solid grey;}
			.menu_detail2{border:; margin-left:100px; height:px; width:950px; margin-bottom:100px;}
			
			#i_am_detail{width:250px;}
			#sm1{border:; height:50px; width:150px; margin-left:55px; }
			#sm2{border:; width:100px; height:50px; margin-left:1050px;}	
			#md1{border:; height:50px; width:100px; margin-left:55px;}	
			#menu_details1{border:; width:100%;}	
			#table1{border:1px solid black; margin-left:100px; border-collapse: collapse;}
			
			a{text-decoration:none; color:black; }
			tr{border:1px solid black;}
			th{border:1px solid black; padding-top:5px; height:5px; width:150px;}
			
			input[name=add]{margin-left:953px; margin-top:3px;}
			img[name=addimg]{width:20px; height:20px;}
			td[name=td]{border-bottom:1px solid grey;}
			table[name=i_am_table]{text-align:center;}
			input[name=dimg]{width:20px; height:20px; display:none;}
			input[name=set]{width:20px; height:20px; display:none;}
		</style>
	</head>
	<body>
	<!-- we will get the status value from C_registrationServelet (suces or fail) -->
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	
		<div class="main_body">
			<div class="dashboard">
				<div class="container1">
					<div class="dashboard_img">
						
						<form action="RD_saverServlet" target="_self" method="post" enctype="multipart/form-data">
							<label for="dimg"><img name="addimg" src="3.png"></label>
							<input type="file" id="dimg" name="dimg">
							<label for="set"><img src="set.png" name="addimg"></label>
							<input type="submit" id="set" name="set">
						</form>
						
					</div>
					<div class="owner_name">
						WELCOME <%=oname %>
					</div>
					<div class="logout">
						<a href="R_login.jsp">Logout</a>
					</div>
				</div>
				<div class="res_name">
					<b>
						<%=rname %>
					</b>
				</div>
			</div>
			<div class="static_menu">
				<div id="sm1">
					<p><b>- Add Menu Here -</b></p>
				</div>
				<div id="sm2">
					<p>RID: <%=rid %></p>
				</div>
			</div>
			<div class="add_menu">
				<table id="table1">
						<tr>
							<th><label for="food">Food Name</label></th>
							<th><label for="detail">Detail</label></th>
							<th><label for="quantity">Quantity</label></th>
							<th><label for="price">Price</label></th>
							<th><label for="category">Category</label></th>
						</tr>
						<tr> 
						
							<td><input type="text" id="food" name="food"></td>
							<td><input type="text" id="detail" name="detail"></td>
							<td><input type="text" id="quantity" name="quantity"></td>
							<td><input type="text" id="price" name="price"></td>
							<td><input type="text" id="category" name="category"></td>
						</tr>
					</table>
					<input type="submit" onclick="addMenu(this)" value="ADD" name="add" data-rid="<%=rid%>">
			</div>
			<div id="menu_details1">
				<div id="md1">
					<p><b>- Your Menu -</b></p>
				</div>
				<div class="menu_detail2">
					<table name="i_am_table">
						<tr>
							<th>Food ID</th>
							<th>Food Name</th>
							<th id="i_am_detail">Detail</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Category</th>
						</tr>
						<%
							pstmt=con.prepareStatement("SELECT * FROM Restaurants WHERE email=?;");
							pstmt.setString(1,rmail);
							rs=pstmt.executeQuery();
							while(rs.next())
							{
								
								PreparedStatement ps=con.prepareStatement("select * from Menu where rid=? Order by category;");
								ps.setString(1,rid);
								ResultSet rss=ps.executeQuery();
								while(rss.next())
								{
						%>
						<tr>
							<td name="td">
								<%
									String fid=rss.getString("id");
									out.println(fid);
								%>
							</td>
							<td name="td">
								<%
									String fname=rss.getString("food");
									out.println(fname);
								%>
							</td>
							<td name="td">
								<%
									String detail=rss.getString("detail");
									out.println(detail);
								%>
							</td>
							<td name="td">
								<%
									String qnt=rss.getString("quantity");
									out.println(qnt);
								%>
							</td>
							<td name="td">
								<%
									String price=rss.getString("price");
									out.println(price+" /-");
								%>
							</td>
							<td name="td">
								<%
									String category=rss.getString("category");
									out.println(category);
								%>
							</td>
						</tr>
						<%} }%>
					</table>
				</div>
			</div>
		</div>
		
	</body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function addMenu(obj)
		{
			let rid=obj.getAttribute('data-rid');
			let food=$("#food").val();
			let detail=$("#detail").val();
			let quantity=$("#quantity").val();
			let price=$("#price").val();
			let category=$("#category").val();
			if(food==null || food=="")
			{
				alert("Food name Cann't be null.");
			}
			else if(detail==null || detail=="")
			{
				alert("detail column can not be null.");
			}
			else if(quantity==null || quantity=="")
			{
				alert("quantity column cann't be null.");
			}
			else if(price==null || price=="")
			{
				alert("price cann't be null");
			}
			else if(category==null || category="")
			{
				alert("category cann't be null");
			}
			
		}
	</script>
</html>