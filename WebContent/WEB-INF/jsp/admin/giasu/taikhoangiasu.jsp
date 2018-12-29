<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>Giasu</div>
	<div class="courses_box1" style="font-family: arial; margin-bottom:10%;margin-left: 20%">
	   <div class="container">
	                
		<div class="col-md-8 detail"  style="width: 95%">
		  
	       <h3>${GiaSu.fullname}</h3>
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span>${GiaSu.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Số năm kinh nghiệm:</b></span> ${GiaSu.sonamkinhnghiem} năm</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> ${GiaSu.diachi}</p>
	       <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${GiaSu.phone}</p>
	       <c:if test="${index == null}">
	       <p><span style="color: red;"><b>Tài khoản:</b></span>${split.money(GiaSu.webxu)} xu</p>
	       </c:if>
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
	       <p>${GiaSu.gioithieubanthan}</p>
	         <div class="lv-avatar pull-left" style="margin-left: 57%; margin-top: -23%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${GiaSu.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	      <c:if test="${GiaSu.sobauchon <= 10}">
	          <img alt="" src="${pageContext.request.contextPath}/templates/public/images/1-star.png" style="width: 20%;margin-left: 57%; margin-top: -5%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>11 && GiaSu.sobauchon <=30}">
	          <img alt="" src="${pageContext.request.contextPath}/templates/public/images/two-star-rating.png" style="width: 20%;margin-left: 57%; margin-top: -5%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>30 &&  GiaSu.sobauchon<= 50}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/3star-1.png" style="width: 20%;margin-left: 57%; margin-top: -5%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>50 && GiaSu.sobauchon<= 80}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/4star.png" style="width: 20%;margin-left: 57%; margin-top: -5%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon >80}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/RiAB776MT.png" style="width: 20%;margin-left: 68%; margin-top: -19%;"> 
	       </c:if>
	       
	        <ul class="meta-post" style="margin-left: 77%; margin-top: -8%;" >
                                       
           </ul>
           </div> 
            <div class="clearfix"> </div>
	        <div class="comment_section" style="margin-top: 5%">
			 		 <div style="width: 40%">
			 	<h3><b>Bình luận của Phụ Huynh</b></h3>
			 <div class="dabinhluan">
			 	<ul class="comment-list">
			 	<c:forEach items="${listBinhLuanGiaSu}" var="obj" >
                   <li style="margin-bottom: -6%">
				     <div class="author-box">
				     <div class="lv-avatar pull-left" style="margin-top: -1%;margin-left-5%; display: inline;">
			            	<img src="${pageContext.request.contextPath}/files/${obj.picture}" style="width: 5%px; height: 5%px;" alt=""/>
			        </div>
				       <div class="author-box_right">
				       <p style="display: inline;">${obj.name}</p>
			            <span class="m_1" style="display: inline;">${obj.time}</span>
			            <p>${obj.comment}</p>
				      </div> 
				     </div>
				  </li>
				  </c:forEach>
              </ul>
             </div>
			 </div>
			 </div>
			<div>
	     

		 </div>
	     <div class="clearfix"> </div>
	   </div>
</div>