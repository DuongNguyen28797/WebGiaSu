<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/taglib.jsp" %>
   <div>giasu</div>
	<div class="courses_box1" style="font-family: arial; margin-top: -2%; margin-left: 20%">
	   <div class="container">
	   	 
		<div class="col-md-8 detail"  style="width: 80%">
		  
	       <h3>${GiaSu.fullname}</h3>
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span> ${GiaSu.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Số năm kinh nghiệm:</b></span> ${GiaSu.sonamkinhnghiem} năm</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> ${GiaSu.diachi}</p>
	        <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${GiaSu.phone}</p>
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
	       <div style="margin-top: 2%">
	       <form action="${pageContext.request.contextPath}/admin/giasu/tangxu/${GiaSu.id_user}" method="post">
	       <p style="color: red;"><b>Web Xu:</b></p>
	       <input value="${split.money(GiaSu.webxu)}" name="webxu" required="required">
	       <input value="${GiaSu.webxu}" name="webxucu" style="display: none;">
	       <div style="margin-top: 1%; margin-left:0%">
						  <input class="templatemo-blue-button" name="submit" value="Sửa"
					type="submit"> <input class="templatemo-white-button"
					name="reset" value="Nhập lại" type="reset">
						</div>
		  </form>
		  </div>				
	       <h4 style="margin-top: 2%; color: #f1b458"><b>Tự giới thiệu bản thân:</b></h4>
	       <p>${GiaSu.gioithieubanthan}</p>
	       
	       <img src="${pageContext.request.contextPath}/files/${GiaSu.picture}" style="width: 22%; height: 20%; margin-left: 63%; margin-top: -80%;" alt=""/>
	       <img alt="" src="${pageContext.request.contextPath}/templates/public/images/1-star.png" style="width: 20%;margin-left: 64%; margin-top: -54%;"> 
	       
            <div class="clearfix"></div>
 </div>
 </div>
 </div>