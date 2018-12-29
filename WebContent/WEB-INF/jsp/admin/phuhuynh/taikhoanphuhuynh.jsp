<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>Phu Huynh</div>
	<div class="courses_box1" style="font-family: arial; margin-top: -4%;margin-left: 18%; margin-bottom: 20%">
	   <div class="container">
	   	  
		<div class="col-md-8 detail"  style="width: 95%">
		                 <h3 style="margin-left: 10%; color: #f1b458">Tài khoản Phụ Huynh</h3>
	       <h3>${PhuHuynh.fullname}</h3>
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span> ${PhuHuynh.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> ${PhuHuynh.diachi}</p>
	       <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${PhuHuynh.phone}</p>
	       <p><span style="color: #1E90FF;"><b>Email:</b></span>${PhuHuynh.email}</p>
	       <p><span style="color: #1E90FF;"><b>Web xu hiện tại:</b></span>${split.money(PhuHuynh.webxu)}  xu</p>
	       <ul class="meta-post" >
           </ul>
	       
	       <div class="lv-avatar pull-left" style="margin-left: 68%; margin-top: -20%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${PhuHuynh.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	       
            <div class="clearfix"> </div>
      <div class="clearfix"> </div>
     </div>
</div>
</div>