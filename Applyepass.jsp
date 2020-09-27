<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
    
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>

<%

String FullNameOfTheApplicant=request.getParameter("FullNameOfTheApplicant");
String DOB=request.getParameter("DOB");
String TypeOfApplicant=request.getParameter("TypeOfApplicant");
String MobileNo=request.getParameter("MobileNo");
String Email=request.getParameter("Email");
String HouseNo=request.getParameter("HouseNo");
String District=request.getParameter("District");
String PoliceStation=request.getParameter("PoliceStation");
String PinCode=request.getParameter("PinCode");
String LandMark=request.getParameter("LandMark");
String Teshil=request.getParameter("Teshil");
String PostOffice=request.getParameter("PostOffice");
String VehicleRegistrationNo=request.getParameter("VehicleRegistrationNo");
String VehicleType=request.getParameter("VehicleType");
String JourneyType=request.getParameter("JourneyType");
String PassFromDate=request.getParameter("PassFromDate");
String PassToDate=request.getParameter("PassToDate");
String PurposeOfTravel=request.getParameter("PurposeOfTravel");
String FromLocation=request.getParameter("FromLocation");
String ToLocation=request.getParameter("ToLocation");
String Remarks=request.getParameter("Remarks");
String Name1=request.getParameter("Name1");
String Age1=request.getParameter("Age1");
String MobileNo1=request.getParameter("MobileNo1");

String Name2=request.getParameter("Name2");
String Age2=request.getParameter("Age2");
String MobileNo2=request.getParameter("MobileNo2");

String Name3=request.getParameter("Name3");
String Age3=request.getParameter("Age3");
String MobileNo3=request.getParameter("MobileNo3");

String Name4=request.getParameter("Name4");
String Age4=request.getParameter("Age4");
String MobileNo4=request.getParameter("MobileNo4");




try
{
	if(!FullNameOfTheApplicant.equals(""))
	{
		


File file ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = "C:\\Users\\SANDHYA\\eclipse-workspace\\covid19\\WebContent\\images";
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) {

   DiskFileItemFactory factory = new DiskFileItemFactory();
   factory.setSizeThreshold(maxMemSize);
   factory.setRepository(new File("c:\\temp"));
   ServletFileUpload upload = new ServletFileUpload(factory);
   upload.setSizeMax( maxFileSize );
   try{ 
      List fileItems = upload.parseRequest(request);
      Iterator i = fileItems.iterator();
     
      while ( i.hasNext () ) 
      {
         FileItem fi = (FileItem)i.next();
         if ( !fi.isFormField () )  {
             String fieldName = fi.getFieldName();
             String fileName = fi.getName();
             boolean isInMemory = fi.isInMemory();
             long sizeInBytes = fi.getSize();
             file = new File( filePath + "yourFileName") ;
             fi.write( file ) ;
             out.println("Uploaded Filename: " + filePath + fileName + "<br>");
         }
         else{
        	   
        	   out.println("No file uploaded"); 
        	}
      }
      out.println("</body>");
      out.println("</html>");
   }catch(Exception ex) {
      System.out.println(ex);
   }
}

		

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/covid19", "root", "sandhya");
	Statement st=conn.createStatement();
	
	
	int i=st.executeUpdate("insert into userdetails(FullNameOfTheApplicant,DOB,TypeOfApplicant,MobileNo,Email,HouseNo,District," +
							" PoliceStation,PinCode,LandMark,Teshil,PostOffice,VehicleRegistrationNo,VehicleType,JourneyType,PassFromDate," +
							" PassToDate,PurposeOfTravel,FromLocation,ToLocation,Remarks,Name1,Age1,MobileNo1 " +
							" ,Name2,Age2,MobileNo2,Name3,Age3,MobileNo3,Name4,Age4,MobileNo4 )values('"+ FullNameOfTheApplicant +"','"+ DOB +"','"+ TypeOfApplicant +"','"+ MobileNo +"','"+ Email +"'" +
							" ,'"+ HouseNo +"','"+ District +"','"+ PoliceStation +"','"+ PinCode +"','"+ LandMark +"'" +
							" ,'"+ Teshil +"','"+ PostOffice +"','"+ VehicleRegistrationNo +"','"+ VehicleType +"','"+ JourneyType +"','"+ PassFromDate +"'" +
							" ,'"+ PassToDate +"','"+ PurposeOfTravel +"','"+ FromLocation +"','"+ ToLocation +"','"+ Remarks +"'" +
							",'"+ Name1 +"','"+ Age1 +"','"+ MobileNo1 +"','"+ Name2 +"','"+ Age2 +"','"+ MobileNo2 +"','"+ 
							Name3 +"','"+ Age3 +"','"+ MobileNo3 +"','"+ Name4 +"','"+ Age4 +"','"+ MobileNo4 +"')");
	
	            
	        Statement st4=conn.createStatement();
			Statement st1=conn.createStatement();
			Statement st2=conn.createStatement();
			Statement st3=conn.createStatement();
			
			ResultSet result=st4.executeQuery("select Active from district_wise_data where District='"+ToLocation+"'");
			ResultSet resultCheck=st1.executeQuery("select Active from district_wise_data where District='"+FromLocation+"'");
			
			
			if(result.next() && resultCheck.next()) {
				if(result.getInt("Active") > 800 || resultCheck.getInt("Active") > 800) {
					out.println("Not Eligible");
					String notEligible = "Not Eligible";
					st2.executeUpdate("update userdetails set epassStatus='"+notEligible+"' where VehicleRegistrationNo='"+VehicleRegistrationNo+"'");
					response.sendRedirect("EpassStatus.jsp");
					return;
				} else {
					out.println("Eligible");
					String eligibleValue = "Eligible";
					st3.executeUpdate("update userdetails set epassStatus='"+eligibleValue+"' where VehicleRegistrationNo='"+VehicleRegistrationNo+"'");
					response.sendRedirect("status.jsp");
					return;
				}
			}
	}
	
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<title>E-Pass</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<h2>APPLY E-PASS</h2>
									
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
									<form id="contact-form" role="form" action="Applyepass.jsp" method="post">
									<header class="major">
										<h2>Applicant Details</h2>
									</header>
							       <div class="row">
						
						                    <div class="col-md-6 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              Full Name of The Applicant :
						                                    <input type="text" class="form-control" name="FullNameOfTheApplicant" >
						                    				<br>
						                    				Date Of Birth :
						                                   <input type="text" class="form-control" name="DOB" >
						                    				<br>           
						                    				Type Of Applicant :    
						                                    <select name="TypeOfApplicant"  class="form-control">
						                                   		<option>--Type Of Applicant--</option>
						                                   		<option>Individual</option>
						                                   		<option>Organization</option>
						                                   		
						                                   		
						                                   </select>
						                    				<br>               
						                              
						                                   
						                              </div>
						
						                            
						
						                         
						                    </div>
						
						                    <div class="col-md-6 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Mobile No:
						                                    <input type="text" class="form-control"  name="MobileNo" required="" >
						                    				<br>
						                    				E-mail
						                                   <input type="text" class="form-control" name="Email" required="">
						                    				<br>               
						                                   Aadhar Card
						                                   <input type="file" class="form-control" placeholder="" name="file" size="50" >
						                    				<br> 
						                                   
						                              </div>
						                    	
						                    </div>
						
						               </div>
						               
						            <header class="major">
										<h2>Address of the Applicant</h2>
									</header>   
						               
						                <div class="row">
						
						                    <div class="col-md-6 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              House No/Bylane No/Street Name :
						                                    <input type="text" class="form-control" placeholder="" name="HouseNo" required="" >
						                    				<br>
						                    				District :
						                    				<select name="District"  class="form-control">
						                                   		<option>--Choose District--</option>
						                                   		<option>Ariyalur</option>
						                                   		<option>Chengalpattu</option>
						                                   		<option>Chennai</option>
						                                   		<option>Coimbatore</option>
						                                   		<option>Cuddalore</option>
						                                   		<option>Dharmapuri</option>
						                                   		<option>Dindigul</option>
						                                   		<option>Erode</option>
						                                   		<option>Kallakurichi</option>
						                                   		<option>Kancheepuram</option>
						                                   		<option>Kanyakumari</option>
						                                   		<option>Karur</option>
						                                   		<option>Krishnagiri</option>
						                                   		<option>Madurai</option>
						                                   		<option>Nagapattinam</option>
						                                   		<option>Namakkal</option>
						                                   		<option>Nilgiris</option>
						                                   		<option>Perambular</option>
						                                   		<option>Pudukkottai</option>
						                                   		<option>Ramanathapuram</option>
						                                   		<option>Ranipet</option>
						                                   		<option>Salem</option>
						                                   		<option>Sivaganga</option>
						                                   		<option>Tenkasi</option>
						                                   		<option>Thanjavur</option>
						                                   		<option>Theni</option>
						                                   		<option>Thiruvallur</option>
						                                   		<option>Thiruvarur</option>
						                                   		<option>Thoothukkudi</option>
						                                   		<option>Trichy</option>
						                                   		<option>Tirunelveli</option>
						                                   		<option>Tirupathur</option>
						                                   		<option>Tiruppur</option>
						                                   		<option>Tiruvannamalai</option>
						                                   		<option>Vellore</option>
						                                   		<option>Viluppuram</option>
						                                   		<option>Virudhunagar</option>
						                                   		
						                                   		
						                                   		
						                                   </select>
						                    				<br>           
						                    				Police Station :    
						                                   <input type="text" class="form-control"  name="PoliceStation"  required="">
						                    				<br>           
						                    				Pin Code :    
						                                   <input type="text" class="form-control" name="PinCode" required="">
						                    				<br>               
						                              
						                                   
						                              </div>
						
						
						                         
						                    </div>
						
						                    <div class="col-md-6 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      LandMark/Locality/Ward No:
						                                    <input type="text" class="form-control" name="LandMark" required="" >
						                    				<br>
						                    				Tehsil :
						                                   <input type="text" class="form-control"  name="Teshil" required="" >
						                    				<br>   
						                    				Post Office :
						                                   <input type="text" class="form-control"  name="PostOffice" required="" >
						                    				<br>               
						                                   
						                                   
						                              </div>
						                    	
						                    </div>
						
						               </div>
						               <header class="major">
										<h2>Vehicle Pass Details</h2>
									</header>
						                <div class="row">
						
						                    <div class="col-md-6 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              Vehicle Registration No :
						                                    <input type="text" class="form-control" placeholder="" name="VehicleRegistrationNo" required="">
						                    				<br>
						                    				Journey Type :
						                    				<select name="JourneyType"  class="form-control">
						                                   		<option>--Choose Journey Type--</option>
						                                   		<option>Bike</option>
						                                   		<option>Car</option>
						                                   		<option>Van</option>
						                                   		<option>Bus</option>
						                                   		
						                                   		
						                                   </select>
						                                   
						                    				<br>           
						                    				Pass From Date :    
						                                   <input type="text" class="form-control" name="PassFromDate" required="">
						                    				<br>           
						                    				From (Source of Route) :  
						                    				<select name="FromLocation"  class="form-control">
						                                   		<option>--Choose District--</option>
						                                   		<option>Ariyalur</option>
						                                   		<option>Chengalpattu</option>
						                                   		<option>Chennai</option>
						                                   		<option>Coimbatore</option>
						                                   		<option>Cuddalore</option>
						                                   		<option>Dharmapuri</option>
						                                   		<option>Dindigul</option>
						                                   		<option>Erode</option>
						                                   		<option>Kallakurichi</option>
						                                   		<option>Kancheepuram</option>
						                                   		<option>Kanyakumari</option>
						                                   		<option>Karur</option>
						                                   		<option>Krishnagiri</option>
						                                   		<option>Madurai</option>
						                                   		<option>Nagapattinam</option>
						                                   		<option>Namakkal</option>
						                                   		<option>Nilgiris</option>
						                                   		<option>Perambular</option>
						                                   		<option>Pudukkottai</option>
						                                   		<option>Ramanathapuram</option>
						                                   		<option>Ranipet</option>
						                                   		<option>Salem</option>
						                                   		<option>Sivaganga</option>
						                                   		<option>Tenkasi</option>
						                                   		<option>Thanjavur</option>
						                                   		<option>Theni</option>
						                                   		<option>Thiruvallur</option>
						                                   		<option>Thiruvarur</option>
						                                   		<option>Thoothukkudi</option>
						                                   		<option>Trichy</option>
						                                   		<option>Tirunelveli</option>
						                                   		<option>Tirupathur</option>
						                                   		<option>Tiruppur</option>
						                                   		<option>Tiruvannamalai</option>
						                                   		<option>Vellore</option>
						                                   		<option>Viluppuram</option>
						                                   		<option>Virudhunagar</option>
						                                   		
						                                   		
						                                   		
						                                   </select>  
						                                   
						                    				<br>               
						                    				Additional Remarks :    
						                                   <input type="text" class="form-control" placeholder="" name="Remarks" >
						                    				<br>     
						                              </div>
						                         
						                    </div>
						
						                    <div class="col-md-6 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Vehicle Type:
														      <select name="VehicleType"  class="form-control">
						                                   		<option>--Choose Vehicle Type--</option>
						                                   		<option>Bike</option>
						                                   		<option>Car</option>
						                                   		<option>Van</option>
						                                   		<option>Bus</option>
						                                   		
						                                   </select>
						                                    
						                    				<br>
						                    				Purpose of Travel :
						                    				<select name="PurposeOfTravel"  class="form-control">
						                                   		<option>--Choose Purpose of Travel--</option>
						                                   		<option>Marriage</option>
						                                   		<option>Death</option>
						                                   		<option>Work</option>
						                                   		<option>Medical Emergency</option>
						                                   		
						                                   </select>
						                    				<br>   
						                    				Pass To Date :
						                                   <input type="text" class="form-control"  name="PassToDate" required="">
						                    				<br>        
						                    				To (Destination of Route) :
						                                  <select name="ToLocation"  class="form-control">
						                                   		<option>--Choose District--</option>
						                                   		<option>Ariyalur</option>
						                                   		<option>Chengalpattu</option>
						                                   		<option>Chennai</option>
						                                   		<option>Coimbatore</option>
						                                   		<option>Cuddalore</option>
						                                   		<option>Dharmapuri</option>
						                                   		<option>Dindigul</option>
						                                   		<option>Erode</option>
						                                   		<option>Kallakurichi</option>
						                                   		<option>Kancheepuram</option>
						                                   		<option>Kanyakumari</option>
						                                   		<option>Karur</option>
						                                   		<option>Krishnagiri</option>
						                                   		<option>Madurai</option>
						                                   		<option>Nagapattinam</option>
						                                   		<option>Namakkal</option>
						                                   		<option>Nilgiris</option>
						                                   		<option>Perambular</option>
						                                   		<option>Pudukkottai</option>
						                                   		<option>Ramanathapuram</option>
						                                   		<option>Ranipet</option>
						                                   		<option>Salem</option>
						                                   		<option>Sivaganga</option>
						                                   		<option>Tenkasi</option>
						                                   		<option>Thanjavur</option>
						                                   		<option>Theni</option>
						                                   		<option>Thiruvallur</option>
						                                   		<option>Thiruvarur</option>
						                                   		<option>Thoothukkudi</option>
						                                   		<option>Trichy</option>
						                                   		<option>Tirunelveli</option>
						                                   		<option>Tirupathur</option>
						                                   		<option>Tiruppur</option>
						                                   		<option>Tiruvannamalai</option>
						                                   		<option>Vellore</option>
						                                   		<option>Viluppuram</option>
						                                   		<option>Virudhunagar</option>
						                                   		
						                                   		
						                                   		
						                                   </select>  
						                                   
						                    				<br>               
						                                   
						                                   
						                              </div>
						                    	
						                    </div>
						
						               </div>           
									<header class="major">
										<h2>Members Travelling</h2>
									</header>           
									   <div class="row">
						
						                    <div class="col-md-4 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              Name  :
						                                    <input type="text" class="form-control"  name="Name1" >
						                    				<br>
						                              </div>                         
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Age :
						                                    <input type="text" class="form-control"  name="Age1" >
						                    				<br>
						                              </div>
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Mobile No:
						                                    <input type="text" class="form-control"  name="MobileNo1" >
						                    				<br>
						                              </div>
						                    </div>
						               </div>           
						           		 <div class="row">
						
						                    <div class="col-md-4 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              Name  :
						                                    <input type="text" class="form-control"  name="Name2" >
						                    				<br>
						                              </div>                         
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Age :
						                                    <input type="text" class="form-control"name="Age2" >
						                    				<br>
						                              </div>
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Mobile No:
						                                    <input type="text" class="form-control"  name="MobileNo2" >
						                    				<br>
						                              </div>
						                    </div>
						               </div>     
						                <div class="row">
						
						                    <div class="col-md-4 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              Name  :
						                                    <input type="text" class="form-control" name="Name3" >
						                    				<br>
						                              </div>                         
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Age :
						                                    <input type="text" class="form-control" name="Age3" >
						                    				<br>
						                              </div>
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Mobile No:
						                                    <input type="text" class="form-control"  name="MobileNo3" >
						                    				<br>
						                              </div>
						                    </div>
						               </div>     
						                <div class="row">
						
						                    <div class="col-md-4 col-sm-12">
						                              <div class="col-md-12 col-sm-12">
						                              Name  :
						                                    <input type="text" class="form-control"  name="Name4" >
						                    				<br>
						                              </div>                         
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Age :
						                                    <input type="text" class="form-control"  name="Age4" >
						                    				<br>
						                              </div>
						                    </div>
						                    <div class="col-md-4 col-sm-12">
												      <div class="col-md-12 col-sm-12">
														      Mobile No:
						                                    <input type="text" class="form-control" name="MobileNo4" >
						                    				<br>
						                              </div>
						                    </div>
						               </div>     				           
						           
						           
						           		<div class="row">
						           				<div class="col-md-12 col-sm-12">
						                              <input type="submit" class="form-control" name="Register" value="REGISTER">
						           				</div>
						           		</div>    
						               
									</form>
															
									
									
									</div>
									
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="Applyepass.jsp">Apply E-Pass</a></li>
										<li><a href="EpassStatus.jsp">E-Pass Status</a></li>
											<li><a href="index.jsp">Logout</a></li>
									</ul>
								</nav>


							

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>