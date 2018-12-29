<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="courses_box1" style="font-family: arial; margin-top: -5%;">
	   <div class="container">
	   	 <form action="${pageContext.request.contextPath}/phuhuynh/suaPhuHuynh" method="post" enctype="multipart/form-data">
		<div class="col-md-8 detail"  style="width: 95%">
		                 <h3 style="margin-left: 40%; color: #f1b458">Tài khoản Phụ Huynh</h3>
		                  <h3><input value="${PhuHuynh.fullname}" name="fullname" required="required"></h3>   
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span> ${PhuHuynh.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> <input value="${PhuHuynh.diachi }" name="diachi" required="required"></p>
	      <p><span style="color: #1E90FF;"><b>Số phone:</b></span><input value="${PhuHuynh.phone}" name="phone" required="required"></p>
	        <p><span style="color: #1E90FF;"><b>Email:</b></span><input value="${PhuHuynh.email}" name="email" required="required"></p>
	       <img src="${pageContext.request.contextPath}/files/${PhuHuynh.picture}" style="width: 200px; height: 200px; margin-left: 68%; margin-top: -22%;" alt=""/>
	       <label class="control-label templatemo-block" style="color: #1E90FF; margin-left: 67%; margin-top: -3%"><b>Hình ảnh:</b></label>
	       <div>
	       <input style="margin-left: 76%; margin-top: -4%; margin-bottom: 10%" name="file" type="file">
	       </div>
	       <div class="form-group">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Cập Nhật">
		    </div>
            <div class="clearfix"> </div>
         
      <div class="clearfix"> </div>
      
     </div>
     </form>
</div>
</div>