<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
	<div class="courses_box1" style="font-family: arial; margin-top: -5%;">
	   <div class="container">
	   	  <c:if test="${param['msg'] eq 'edit' }">
					           <h2 style="margin-left: 30%; color: #1E90FF">Sửa thành công</h2>
					  </c:if>
					  <c:if test="${param['msg'] eq 'add' }">
					           <h2 style="margin-left: 30%; color: #1E90FF">Thêm lịch thành công</h2>
					  </c:if>
		<div class="col-md-8 detail"  style="width: 95%">
		                 <h3 style="margin-left: 40%; color: #f1b458">Tài khoản Phụ Huynh</h3>
	       <h3>${PhuHuynhInfo.fullname}</h3>
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span> ${PhuHuynhInfo.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> ${PhuHuynhInfo.diachi}</p>
	       <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${PhuHuynhInfo.phone}</p>
	       <p><span style="color: #1E90FF;"><b>Email:</b></span>${PhuHuynhInfo.email}</p>
	       <p><span style="color: #1E90FF;"><b>Web xu hiện tại:</b></span>${split.money(PhuHuynhInfo.webxu)}  xu</p>
	       <ul class="meta-post" >
                <li>
                   <a href="${pageContext.request.contextPath}/phuhuynh/sua-tai-khoan"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true" style="color: #f1b458"></i></a>
                   <p style="display: inline;">Sửa</p>
                </li>                            
           </ul>
	       
	       <div class="lv-avatar pull-left" style="margin-left: 68%; margin-top: -20%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${PhuHuynhInfo.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	       
            <div class="clearfix"> </div>
           
      <div class="clearfix"> </div>
      
     </div>
</div>
</div>