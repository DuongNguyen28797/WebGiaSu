<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/taglib.jsp" %>
   <div>giasu</div>
	<div class="courses_box1" style="font-family: arial; margin-top: -2%; margin-left: 20%">
	   <div class="container">
	   	 
		<div class="col-md-8 detail"  style="width: 80%">
		  
	       <h3>${PhuHuynh.fullname}</h3>
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span> ${PhuHuynh.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> ${PhuHuynh.diachi}</p>
	        <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${PhuHuynh.phone}</p>
	       
	       <div style="margin-top: 2%">
	       <form action="${pageContext.request.contextPath}/admin/phuhuynh/tangxu/${PhuHuynh.id_user}" method="post">
	       <p style="color: red;"><b>Web Xu:</b></p>
	       <input value="${split.money(PhuHuynh.webxu)}" name="webxu" required="required">
	       <input value="${PhuHuynh.webxu}" name="webxucu" style="display: none;">
	       <div style="margin-top: 1%; margin-left:0%">
						  <input class="templatemo-blue-button" name="submit" value="Sửa"
					type="submit"> <input class="templatemo-white-button"
					name="reset" value="Nhập lại" type="reset">
						</div>
		  </form>
		  </div>				
	       <img src="${pageContext.request.contextPath}/files/${PhuHuynh.picture}" style="width: 200px; height: 200px; margin-left: 63%; margin-top: -30%;" alt=""/>
            <div class="clearfix"></div>
 </div>
 </div>
 </div>
  <div class="clearfix" style="margin-bottom: 20%"></div>
   