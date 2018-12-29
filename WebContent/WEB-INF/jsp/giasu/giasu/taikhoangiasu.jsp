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
					   <c:if test="${param['msg'] eq 'deletetkb' }">
					           <h2 style="margin-left: 30%; color: #1E90FF">Xoá lịch thành công</h2>
					  </c:if>
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
	         <div class="lv-avatar pull-left" style="margin-left: 68%; margin-top: -30%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${GiaSu.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	      <c:if test="${GiaSu.sobauchon <= 10}">
	          <img alt="" src="${pageContext.request.contextPath}/templates/public/images/1-star.png" style="width: 20%;margin-left: 68%; margin-top: -19%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>11 && GiaSu.sobauchon <=30}">
	          <img alt="" src="${pageContext.request.contextPath}/templates/public/images/two-star-rating.png" style="width: 20%;margin-left: 68%; margin-top: -19%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>30 &&  GiaSu.sobauchon<= 50}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/3star-1.png" style="width: 20%;margin-left: 68%; margin-top: -19%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>50 && GiaSu.sobauchon<= 80}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/4star.png" style="width: 20%;margin-left: 68%; margin-top: -19%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon >80}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/RiAB776MT.png" style="width: 20%;margin-left: 68%; margin-top: -19%;"> 
	       </c:if>
	       
	        <ul class="meta-post" style="margin-left: 77%; margin-top: -8%;" >
                 <c:if test="${index == null}">
                <li>
                   <a href="${pageContext.request.contextPath}/giasu/sua-tai-khoan"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true" style="color: #f1b458"></i></a>
                   <p style="display: inline;">Sửa</p>
                </li>
                </c:if>                            
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
				     <div class="lv-avatar pull-left" style="margin-top: -1%; display: inline;">
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
	     
  <div class="col-md-8 grid_1_right" style="font-family: inherit; margin-top: 8%;width: 77%">
              <h2 style="font-family: inherit;">Lịch làm việc</h2>
		      <div class="but_list">
		       <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active" ><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Thứ 2</a></li>
				  <li role="presentation"><a href="#profile3" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile3">Thứ 3</a></li>
				  <li role="presentation"><a href="#profile4" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile4">Thứ 4</a></li>
				  <li role="presentation"><a href="#profile5" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile5">Thứ 5</a></li>
				  <li role="presentation"><a href="#profile6" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile6">Thứ 6</a></li>
				  <li role="presentation"><a href="#profile7" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile7">Thứ 7</a></li>
				  <li role="presentation"><a href="#profile8" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile8">Chủ Nhật</a></li>
				</ul>
			<div id="myTabContent" class="tab-content">
			  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
			   <c:if test="${t2.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${t2}" var="objT2">
			     <c:choose>
			       <c:when test="${objT2.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT2.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left" ><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT2.giodau}:${phutdau} - ${objT2.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT2.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT2.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		  <c:if test="${index == null}">
			    		   <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/2-${objT2.id_tkb}"></c:set>
			    		  <a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT2.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT2.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		        <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/2">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
			    </c:if>
			  </div>
			  
		   <div role="tabpanel" class="tab-pane fade" id="profile3" aria-labelledby="profile-tab">
		    <c:if test="${t3.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${t3}" var="objT3">
			    <c:choose>
			       <c:when test="${objT3.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT3.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT3.giodau}:${phutdau} - ${objT3.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT3.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT3.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		    <c:if test="${index == null}">
			    		  <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/3-${objT3.id_tkb}"></c:set>
			    		<a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT3.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT3.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		       <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/3">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
			    </c:if>
			  </div>
			  
			  <div role="tabpanel" class="tab-pane fade" id="profile4" aria-labelledby="profile-tab">
			   <c:if test="${t4.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${t4}" var="objT4">
			    <c:choose>
			       <c:when test="${objT4.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT4.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT4.giodau}:${phutdau} - ${objT4.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT4.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT4.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		    <c:if test="${index == null}">
			    		  <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/4-${objT4.id_tkb}"></c:set>
			    		  <a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT4.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT4.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		  <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/4">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
</c:if>
</div>		  
			  
			  <div role="tabpanel" class="tab-pane fade" id="profile3" aria-labelledby="profile-tab">
			   <c:if test="${t5.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${t5}" var="objT5">
			    <c:choose>
			       <c:when test="${objT5.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT5.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT5.giodau}:${phutdau} - ${objT5.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT5.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT5.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		    <c:if test="${index == null}">
			    		  <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/5-${objT5.id_tkb}"></c:set>
			    		  <a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT5.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT5.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		  <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/5">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
			    </c:if>
			  </div>
			  
			  <div role="tabpanel" class="tab-pane fade" id="profile6" aria-labelledby="profile-tab">
			  <c:if test="${t6.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${t6}" var="objT6">
			    <c:choose>
			       <c:when test="${objT6.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT6.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT6.giodau}:${phutdau} - ${objT6.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT6.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT6.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		    <c:if test="${index == null}">
			    		  <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/6-${objT6.id_tkb}"></c:set>
			    		  <a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT6.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT6.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		       <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/6">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
			    </c:if>
			  </div>
		
		<div role="tabpanel" class="tab-pane fade" id="profile7" aria-labelledby="profile-tab">
		 <c:if test="${t7.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${t7}" var="objT7">
			    <c:choose>
			       <c:when test="${objT7.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT7.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT7.giodau}:${phutdau} - ${objT7.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT7.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT7.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		    <c:if test="${index == null}">
			    		  <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/7-${objT7.id_tkb}"></c:set>
			    		  <a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT7.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT7.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		       <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/7">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
			    </c:if>
			  </div>
		
		<div role="tabpanel" class="tab-pane fade" id="profile8" aria-labelledby="profile-tab">
		       <c:if test="${cn.size()==0}"><h2 style="margin-left: 30%"> Lịch trống.</h2></c:if>
			  <c:forEach items="${cn}" var="objT8">
			    <c:choose>
			       <c:when test="${objT8.phutdau == 0}">
			            <c:set var="phutdau" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutdau" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			     <c:choose>
			       <c:when test="${objT8.phutcuoi == 0}">
			            <c:set var="phutcuoi" value="00"></c:set>
			       </c:when>
			       <c:otherwise>
			            <c:set var="phutcuoi" value="30"></c:set>
			       </c:otherwise>
			    </c:choose>
			        <div class="events_box">
			    	<div class="event_left"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>${objT8.giodau}:${phutdau} - ${objT8.giocuoi}:${phutcuoi}</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i>${objT8.diadiem}</div>
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <c:forEach items="${listPhuHuynh}" var="PH">
			    			          <c:if test="${PH.id_user == objT8.id_phuhuynh}">
			    			              <a href="#">${PH.fullname}</a>
			    			          </c:if>
			    			    </c:forEach>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		    <c:if test="${index == null}">
			    		  <c:set var="url" value="${pageContext.request.contextPath}/giasu/sua-lich-lam-viec/8-${objT8.id_tkb}"></c:set>
			    		  <a href="${url}">
			    		  <i class="fa fa-pencil-square fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    		  </a>
			    		  <p style="display: inline;">Sửa</p>
			    		   <a href="${pageContext.request.contextPath}/giasu/xoa/${objT8.id_tkb}">
			    		  <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
			    		  </a>
			    		  <p style="display: inline;">Xoá</p>
			    		  </c:if>
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT8.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		        <c:if test="${index == null}">
			   <a href="${pageContext.request.contextPath}/giasu/them-lich-lam-viec-thu/8">
			   <i class="fa fa-plus-circle fa-2x" aria-hidden="true" style="color: #21b384"></i>
			    </a>
			    <p style="display: inline;">Thêm</p>
			    </c:if>
			  </div>	  
			
			  
		     </div>
		    </div>
		   </div>
      </div>
      <div class="clearfix"> </div>
     </div>
     <div class="clearfix"> </div>
     <div class="clearfix"> </div>
			
		 </div>
	     <div class="clearfix"> </div>
	   </div>
