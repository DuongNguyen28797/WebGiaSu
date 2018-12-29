<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>Giasu</div>
	<div class="courses_box1" style="font-family: arial; margin-bottom:10%;margin-left: 20%; margin-bottom: 10%">
	   <div class="container">
	                
		<div class="col-md-8 detail"  style="width: 95%">
		   <h3 style="margin-left: 10%; color: #f1b458">Messages</h3>
	       <h3>${LienHe.fullname}</h3>
	       <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${LienHe.phone}</p>
	       <p><span style="color: #1E90FF;"><b>Email:</b></span>${LienHe.email}</p>
	        <p><span style="color: #1E90FF;"><b>Nội dung:</b></span></p></br>
	        <textarea  style="border: solid;-moz-border-radius: 10px;-webkit-border-radius: 10px;font-family: arial; width: 40%; height: 30%">${LienHe.noidung}</textarea>	
	       <div class="lv-avatar pull-left" style="margin-left: 50%; margin-top: -23%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${LienHe.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	       </div>
	        <ul class="meta-post" style="margin-left: 77%; margin-top: -8%;" >
           </ul>
           </div> 
            <div class="clearfix"> </div>
			 	
	     

		 </div>
	     <div class="clearfix"> </div>
