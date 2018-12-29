<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
    
<!-- banner -->
  <div class="courses_banner">
  	<div class="container">
  		<h3>Student</h3>
  		<p class="description">
             Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis. Pellentesque cursus arcu id magna euismod in elementum purus molestie.
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">Home</a></li>
                <li class="current-page">Student</li>
            </ul>
        </div>
  	</div>
  </div>
    <!-- //banner -->
   <c:choose>
      <c:when test="${listTimKiem.size()==0}">
              <div style="margin-top: -1%">  
   	               <p style="font-family: arial;font-size:325%;margin-left: 20%; margin-top: 3%; color: #1E90FF"><b>Có vẻ chưa có Gia Sư nào dạy</b></p>
   	  			   <p style="font-family: arial;font-size:225%;margin-left: 26%;color: #f1b458; margin-bottom: 10%"><b>Môn ${mon.name_mon} ${lop.lop} Khu vực ${quanhuyen.name_quanhuyen}</b></p>
   	          </div>
      </c:when>
      <c:otherwise>
             <div style="margin-top: -1%">  
   	 <p style="font-family: arial;font-size:325%;margin-left: 25%; margin-top: 3%; color: #1E90FF"><b>Kết quả tìm kiếm Gia Sư</b></p>
   	 <p style="font-family: arial;font-size:225%;margin-left: 24%;color: #f1b458"><b>Môn ${mon.name_mon} ${lop.lop} Khu vực ${quanhuyen.name_quanhuyen}</b></p>
   	 </div>
	<div class="admission">
	   <div class="container">
	   	 <div class="faculty_top">
	   	 <c:forEach items="${listTimKiem}" var="objGiaSu" >
	   	  <div class="col-md-4">
	   	  	<figure class="team_member">
	   	  		<img src="${pageContext.request.contextPath}/files/${objGiaSu.picture}" class="img-responsive wp-post-image" alt="" style="height: 270px; width: 350px"/>
	   	  		<div></div>
	   	  		<figcaption><h3 class="person-title"><a href="">${objGiaSu.fullname}</a></h3>
	   	  			 <p><span style="color: #f1b458;"><b>Dạy các môn:</b></span></p>
	       <div style="margin-left: 5%; margin-top: -2%">
	       <c:forEach items="${listDKM}" var="objDK">
	             <c:if test="${objGiaSu.id_user==objDK.id_user}">
	                     <c:forEach items="${listMon}" var="objMon">
                             <c:if test="${objMon.id_mon == objDK.id_mon}">
                              <p style="display: inline;">- ${objMon.name_mon} : </p>
                             </c:if>
                         </c:forEach>
	                     <c:forEach items="${listLop}" var="objLop">
                             <c:if test="${objLop.id_lop == objDK.id_lop}">
                              <p style="display: inline;"> ${objLop.lop}</p></br>
                             </c:if>
                         </c:forEach>
	             </c:if>
	       </c:forEach>
            </div>
	   	  			<div class="person-social">
	   	  				<ul class="social-person">
	   	  					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
	   	  					<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
	   	  					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
	   	  					<li><a href="#"><i class="fa fa-youtube"></i></a></li>
	   	  			    </ul>
	   	  		  </div>
	   	  	   </figcaption>
	   	  	 </figure>
	   	  </div>
	   	 </c:forEach>
	   	  <div class="clearfix"> </div>
	   	 </div>
	     <ul class="pagination">
	   	 	<li class="active"><a href="#">1</a></li>
	   	 	<li><a href="#">2</a></li>
	   	 </ul>
	  </div>
	</div>    
      </c:otherwise>
   </c:choose>
    