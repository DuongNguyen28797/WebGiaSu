<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>

   
	<div class="courses_box1" style="font-family: arial; margin-top: -5%;">
	   <div class="container">
	   	 
		<div class="col-md-8 detail"  style="width: 95%">
		         <h3 style="margin-left: 30%; color: #f1b458">Sửa tài khoản</h3>
		    <form action="${pageContext.request.contextPath}/giasu/suaGiaSu" enctype="multipart/form-data" method="post">  
		   <h3><input value="${GiaSu.fullname}" name="fullname" required="required"></h3>   
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span> ${GiaSuInfo.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Số năm kinh nghiệm:</b></span><input value="${GiaSu.sonamkinhnghiem}" name="sonamkinhnghiem" required="required">năm </p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> <input value="${GiaSu.diachi}" name="diachi" required="required"></p>
	        <p><span style="color: #1E90FF;"><b>Số phone:</b></span><input value="${GiaSu.phone}" name="phone" required="required"></p>
	       <p><span style="color: #1E90FF;"><b>Dạy các môn:</b></span></p>
	       <div style="margin-left: 13%; margin-top: -2%">
	       <c:forEach items="${listMon}" var="objMon">
                     <c:if test="${objMon.id_mon == dangky1.id_mon}">
                        <p style="display: inline;">- ${objMon.name_mon} : </p>
                     </c:if>
               </c:forEach>
	       <c:forEach items="${listLop}" var="objLop">
                     <c:if test="${objLop.id_lop == dangky1.id_lop}">
                        <p style="display: inline;"> ${objLop.lop}</p></br>
                     </c:if>
            </c:forEach>
            <c:forEach items="${listMon}" var="objMon">
                     <c:if test="${objMon.id_mon == dangky2.id_mon}">
                        <p style="display: inline;">- ${objMon.name_mon} : </p>
                     </c:if>
               </c:forEach>
	       <c:forEach items="${listLop}" var="objLop">
                     <c:if test="${objLop.id_lop == dangky2.id_lop}">
                        <p style="display: inline;"> ${objLop.lop}</p></br>
                     </c:if>
            </c:forEach>
            <c:forEach items="${listMon}" var="objMon">
                     <c:if test="${objMon.id_mon == dangky3.id_mon}">
                        <p style="display: inline;">- ${objMon.name_mon} : </p>
                     </c:if>
               </c:forEach>
	       <c:forEach items="${listLop}" var="objLop">
                     <c:if test="${objLop.id_lop == dangky3.id_lop}">
                        <p style="display: inline;"> ${objLop.lop}</p>
                     </c:if>
            </c:forEach> 
	       </div>
	       <h4 style="margin-top: 2%; color: #f1b458"><b>Tự giới thiệu bản thân:</b></h4>
	       <p><input value="${GiaSu.gioithieubanthan}" name="gioithieubanthan" style="width: 100%" required="required"></p>
	       <div class="lv-avatar pull-left" style="margin-left: 68%; margin-top: -36%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${GiaSu.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	       <label class="control-label templatemo-block" style="color: #1E90FF; margin-left: 67%; margin-top: -29%"><b>Hình ảnh:</b></label>
	       <div>
	       <input style="margin-left: 76%; margin-top: -17%; margin-bottom: 15%" name="file" type="file">
	       </div>
	       <div class="form-group">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Cập Nhật">
		    </div>
	      </form>   
            <div class="clearfix"> </div>
            <div style="clear: both;"></div>
 </div>
 </div>
 </div>
