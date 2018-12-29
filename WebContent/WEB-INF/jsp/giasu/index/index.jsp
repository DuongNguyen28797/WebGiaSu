<%@page import="entities.BaiViet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
    
<!-- banner -->
	<div class="banner" style="height: 40%">
			<!-- banner Slider starts Here -->
					<script src="${pageContext.request.contextPath}/templates/public/js/responsiveslides.min.js"></script>
					 <script>
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider3").responsiveSlides({
							auto: true,
							pager: true,
							nav: true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
					
						});
					  </script>
					<!--//End-slider-script -->
					<div  id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
						<li>
								<div class="banner-bg banner-img2">
									<div class="container">
										<div class="banner-info">
											<h3>Uy Tín - Chất Lượng - Hiệu Quả<span style="font-size: 40%">Kết nối hiệu quả giữa gia sư và phụ huynh</span></h3>										
											<p>Với đội ngũ Gia Sư chất lượng được đánh giá, bầu chọn bởi chính Phụ Huynh</p>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="banner-bg">
									<div class="container">
										<div class="banner-info">										 
											<h3>Hướng dẫn sử dụng website</h3>
											<p>Cách sử dụng website cho phụ huynh và gia sư</p>
											<a href=""><i class="fa fa-thumbs-up icon_1" style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>Xem chi tiết</a>
										</div>
									</div>
								</div>
							</li>
							
							
							<li>
								<div class="banner-bg banner-img">
									<div class="container">
										<div class="banner-info">
											<h3>Các bài viết từ website</h3>
											<p>Những tin tức mới sẽ được cập nhật kịp thời nhất</p>
											<a href="${pageContext.request.contextPath}/giasu/bai-viet"><i class="fa fa-thumbs-up icon_1" style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>Xem chi tiết</a>
										</div>
									</div>
								</div>
							</li>
						
						</ul>
		          </div>
	</div>
	<!-- //banner -->
	<div class="details">
	   <div style="color: white;margin-left: 41%; margin-bottom: -5%; margin-top: 2%;"><h3 style="font-family: arial;">TÌM KIẾM GIA SƯ</h3></div>
	</div>
	<div class="details" style="margin-top: -2%">
       <div class="container">
        <form action="${pageContext.request.contextPath}/giasu/tim-kiem-gia-su" method="post">
		 <div class="col-sm-10 dropdown-buttons">   
			<div class="col-sm-3 dropdown-button" style="width: 0%">  		 
			</div>
			<div class="col-sm-3 dropdown-button" style="width: 30%">           			
    		 <div class="section_1">
    		 <label style="color: white;">Quận/Huyện: </label>
				 <select id="country" class="frm-field required" name="id_quanhuyen">
				 <c:forEach items="${listQuanHuyen}" var="objQuan">
				     <option value="${objQuan.id_quanhuyen}">${objQuan.name_quanhuyen}</option>
				 </c:forEach>
				 </select>
			  </div>
			</div>
    	   <div class="col-sm-3 dropdown-button" style="width: 30%">           			
    		  <div class="section_1">
    		  <label style="color: white;">Môn: </label>
				 <select id="country"  class="frm-field required" name="id_mon">
				 <c:forEach items="${listMon}" var="objMon">
				     <option value="${objMon.id_mon}">${objMon.name_mon}</option>
				 </c:forEach>
					
				 </select>
			  </div>
			</div>
		     <div class="col-sm-3 dropdown-button" style="width: 30%">
			  <div class="section_1">
			  <label style="color: white;">Lớp: </label>
				 <select id="country"  class="frm-field required" name="id_lop">
					 <c:forEach items="${listLop}" var="objLop">
				     <option value="${objLop.id_lop}">${objLop.lop}</option>
				 </c:forEach>
				 </select>
			  </div>
			 </div>
			 <div class="clearfix"> </div>
		  </div> 
		  <div class="col-sm-2 submit_button" style="margin-left: -5%; margin-top: 2%"> 
		   	     <input type="submit" value="Search">
		   </div>
		  </form> 
		   <div class="clearfix"> </div>
	     </div>
     </div>
     <div class="grid_1">
          <!-- banner -->
   <div class="bg_2" style="margin-top: -7%">
	  <div class="container">
	     <div style="margin-top: -5%">
	  	 <div class="col-md-6 service_2-left">
              <h2 style="font-family:arial;color: white"><span style="color: #f1b458">Gia Sư online</span><br>Nơi kết nối tuyệt vời giữa Phụ Huynh và Gia Sư.</h2>
         </div>
         <div class="col-md-6 service_2-right">
            <h3 style="color: #f1b458; font-family: arial">"Không có giới hạn cho Quy trình học, Cách để học. Sự thực một khi con người đã có Hứng thú tìm những con đường mới để Kết cấu nên Tri thức, họ sẽ không bao giờ sợ bị Buồn chán."</h3>
            <h3 style="font-family: arial; margin-left: 50%; color: white">-Robert Theobald-</h3>
         </div>
         </div>
         <div class="clearfix"> </div>
	  </div>
	</div>      
   	
    <!-- //banner -->
     <div class="bottom_content" style="margin-top: -2%">  
   	 <h3 style="font-family: arial;">Những Gia Sư Xuất Sắc Nhất</h3>
   	 </div>
	<div class="admission" style="margin-top: -13%">
	   <div class="container">
	   	 <div class="faculty_top">
	   	 
	   	   	 
	   	 <c:forEach items="${listGiaSu}" var="objGiaSu" >
	   	  <div class="col-md-4 faculty_grid" style="font-family: arial;margin-bottom: 3%">
	   	  	<figure class="team_member">
	   	  		<img src="${pageContext.request.contextPath}/files/${objGiaSu.picture}" class="img-responsive wp-post-image" alt="" style="width: 350px; height: 235px"/>
	   	  		<div></div>
	   	  		<figcaption><h3 class="person-title"><a href="${pageContext.request.contextPath}/giasu/tai-khoan-gia-su-${objGiaSu.id_user}">${objGiaSu.fullname}</a></h3>
	   	    <c:if test="${objGiaSu.sobauchon <= 10}">
	   	        <c:set var="string" value="style='width:20%'"></c:set>
	       </c:if>
	        <c:if test="${objGiaSu.sobauchon>11 && objGiaSu.sobauchon <=30}">
	        <c:set var="string" value="style='width:40%'"></c:set>
	       </c:if>
	        <c:if test="${objGiaSu.sobauchon>30 &&  objGiaSu.sobauchon<= 50}">
	        <c:set var="string" value="style='width:60%'"></c:set>
	       </c:if>
	        <c:if test="${objGiaSu.sobauchon>50 && objGiaSu.sobauchon<= 80}">
	        <c:set var="string" value="style='width:80%'"></c:set>
	       </c:if>
	        <c:if test="${objGiaSu.sobauchon >80}">
	        <c:set var="string" value="style='width:100%'"></c:set>
	       </c:if>
	   	  		 <div class="rating-box">
                      <div ${string} class="rating"></div>
                </div>
                 
	   	  			<span class="person-deg">${objGiaSu.email}</span>
	   	  			<div>
	   	  	<c:forEach items="${listDKM}" var="objDK">
	             <c:if test="${objGiaSu.id_user==objDK.id_user}">
	                     <c:forEach items="${listMon}" var="objMon">
                             <c:if test="${objMon.id_mon == objDK.id_mon}">
                             
                              <li> ${objMon.name_mon} : 
                             </c:if>
                         </c:forEach>
	                     <c:forEach items="${listLop}" var="objLop">
                             <c:if test="${objLop.id_lop == objDK.id_lop}">
                               ${objLop.lop}</li>
                             </c:if>
                         </c:forEach>
	             </c:if>
	       </c:forEach>
	   	  			</div>
	   	  			<p>Số năm kinh nghiệm giảng dạy: ${objGiaSu.sonamkinhnghiem} năm</p>
	   	  	   </figcaption>
	   	  	 </figure>
	   	  </div>
	   	  </c:forEach>
	   	  <div class="clearfix"> </div>
	   	 </div>
	     
	  </div>
	</div>
    </div>
   
   <div class="bottom_content" style="margin-top: -17%">  
   	 <h3 style="font-family: arial;margin-bottom: 2%">Tin Tức Mới Nhất</h3>
     <div class="grid_2" style="font-family: arial;">
      <c:forEach items="${listBaiViet}" var="obj" >
			      <c:set var="name" value="${obj.name_baiviet}"></c:set>
				  <c:set var="id" value="${obj.id_baiviet}"></c:set>
				  <c:set var="urlPic" value="${pageContext.request.contextPath}/files/${obj.picture}"></c:set>
			      <c:set var="slug" value="${slugUtils.makeSlug(name)}"></c:set>
     	<div class="col-md-4 portfolio-left" style="margin-top: 1%; margin-bottom: 3%">
            <div class="portfolio-img event-img">
                <img src="${urlPic}" class="img-responsive" alt="" style="width: 180px; height: 240px" />
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
               <h4><a href="${pageContext.request.contextPath}/giasu/chi-tiet-bai-viet/${slug}-${id}">${name}</a></h4>
               <p>${obj.mota}</p>
               
            </div>
            <div class="clearfix"> </div>
        </div>
      
       </c:forEach> 
        </div>
    </div> 
    <div class="clearfix"> </div>   
   
