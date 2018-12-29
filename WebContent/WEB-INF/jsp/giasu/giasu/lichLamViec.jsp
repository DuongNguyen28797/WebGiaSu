<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/taglib.jsp" %>
    <!-- banner -->
  <div class="courses_banner">
  	<div class="container">
  	                
  		<h3 style="font-family: arial;">Lịch làm việc</h3>
  		<p class="description">
  		Lịch làm việc giúp Gia Sư lưu lại thời gian, địa điểm, phụ huynh , nội dung Giảng dạy. Còn giúp cho Phụ Huynh đối chiếu, tìm thời gian rảnh của Gia Sư để chọn ra thời gian phù hợp nhất.
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/giasu/tai-khoan-gia-su">Tài khoản gia sư</a></li>
                <li class="current-page">Lịch làm việc</li>
            </ul>
        </div>
  	</div>
  </div>
    <!-- //banner -->
                 <c:if test="${msg != null}">
                       <div style="margin-top: 5%; font-family: arial;">
                            <h3 style="margin-left: 20%; color: #1E90FF;"><b>Bị trùng giờ !</b></h3>
                            <p style="margin-left: 20%"><b><c:choose><c:when test="${id_thu ==8 }">Chủ Nhật</c:when><c:otherwise>Thứ ${id_thu}</c:otherwise></c:choose> từ ${objTKBtrung.giodau}:<c:choose><c:when test="${objTKBtrung.phutdau ==0 }">00</c:when><c:otherwise>30</c:otherwise></c:choose> đến ${objTKBtrung.giocuoi}:<c:choose><c:when test="${objTKBtrung.phutcuoi== 0}">00</c:when><c:otherwise>30</c:otherwise></c:choose> bạn nhận dạy cho phụ huynh <span style="color: #f1b458">${phuhuynh.fullname}</span>, tại địa chỉ: ${objTKBtrung.diadiem}.</b></p>
                       </div>
			     </c:if>
			      <c:if test="${eror != null}">
			      <div style="margin-top: 5%; font-family: arial;">
			            <h3 style="margin-left: 35%; color: #1E90FF;"><b>Khung giờ không phù hợp !</b></h3>
			             <p style="margin-left: 35%"><b>Giờ bắt đầu không thể trễ hơn giờ kết thúc.</b></p>
			       </div>      
			     </c:if>
 <div class="col-md-8 grid_1_right" style="font-family: arial; margin-top: 3%;width: 65%; margin-left: 15%; margin-bottom: 10%">
              <h2 style="font-family: inherit;">Thêm lịch <c:choose><c:when test="${id_thu ==8 }">Chủ Nhật</c:when><c:otherwise>thứ ${id_thu}</c:otherwise></c:choose></h2>
		      <div class="but_list">
		       <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active" ><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true"><c:choose><c:when test="${id_thu ==8 }">Chủ Nhật</c:when><c:otherwise>Thứ ${id_thu}</c:otherwise></c:choose></a></li>
				</ul>
			<div id="myTabContent" class="tab-content">
			  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
			    <div class="events_box">
			    <c:choose>
			        <c:when test="${objTrung != null}">
			              <form action="${pageContext.request.contextPath}/giasu/them-lich/${id_thu}" method="post">
			    	<div class="event_left" style="width: 240px"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>
			    		Từ 
			    		<select style="display: inline;width: 68px" name="giodau">
			    		<c:forTokens items="00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" delims="," var="h">
                              <c:choose>
                                 <c:when test="${objTrung.giodau eq h}">
                                    <option selected="selected" value="${h}">${h} h</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option value="${h}">${h} h</option>
                                 </c:otherwise>
                              </c:choose>
                         </c:forTokens>
			    		</select>
			    		:
			    		<select style="display: inline;width: 70px" name="phutdau">
			    		<c:forTokens items="00,30" delims="," var="m">
                              <c:choose>
                                 <c:when test="${objTrung.phutdau eq m}">
                                    <option selected="selected" value="${m}">${m} m</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option value="${m}">${m} m</option>
                                 </c:otherwise>
                              </c:choose>
                         </c:forTokens>
                          
			    		</select>
			    		<div style="margin-left: 23px">
			    		Đến
			    		<select style="display: inline;width: 68px" name="giocuoi">
                       <c:forTokens items="00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" delims="," var="h">
                              <c:choose>
                                 <c:when test="${objTrung.giocuoi eq h}">
                                    <option selected="selected" value="${h}">${h} h</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option value="${h}">${h} h</option>
                                 </c:otherwise>
                              </c:choose>
                         </c:forTokens>
			    		</select>
			    		:
			    		<select style="display: inline;width: 70px" name="phutcuoi">
			    		<c:forTokens items="00,30" delims="," var="m">
                          <c:choose>
                                 <c:when test="${objTrung.phutcuoi eq m}">
                                    <option selected="selected" value="${m}">${m} m</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option value="${m}">${m} m</option>
                                 </c:otherwise>
                              </c:choose>
                          </c:forTokens>    
			    		</select>
			    		</div>
			    		</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i><input placeholder="Nhập địa chỉ ..." style="width: 175px" name="diadiem" value="${objTrung.diadiem }"></div>
			    		<input style="display: none;" name="id_giasu" value="${GiaSuInfo.id_user}">
			    		<input style="display: none;" name="id_thu" value="${id_thu}">
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <select style="display: inline;width: 175px" name="id_phuhuynh">
                                   <c:forEach items="${listPhuHuynh}" var="objPH">
			    			         <option value="${objPH.id_user}">${objPH.fullname}</option>
			    			       </c:forEach>
			    		       </select>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		</div>
			    	</div>
			    	<div class="event_right">
			    		 <textarea name="noidung" rows="7" cols="65" placeholder="Nhập nội dung ..." style="border: solid;-moz-border-radius: 10px;-webkit-border-radius: 10px;font-family: arial;">${objTrung.noidung}</textarea>
		    	    </div>
		    	    <div class="clearfix"></div>
		   <div class="form-group" style="width: 50%; margin-left: 25%">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" value="Thêm">
		    </div>
		    </form>
			        </c:when>
			        <c:otherwise>
			          <form action="${pageContext.request.contextPath}/giasu/them-lich/${id_thu}" method="post">
			    	<div class="event_left" style="width: 240px"><div class="event_left-item">
			    		<div class="icon_2"><i class="fa fa-clock-o"></i>
			    		Từ 
			    		<select style="display: inline;width: 68px" name="giodau">
                         	<c:forTokens items="00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" delims="," var="h">
                                    <option value="${h}">${h} h</option>
                           </c:forTokens>
			    		</select>
			    		:
			    		<select style="display: inline;width: 70px" name="phutdau">
                          <option value="00">00 m</option>
                          <option value="30">30 m</option>
			    		</select>
			    		<div style="margin-left: 23px">
			    		Đến
			    		<select style="display: inline;width: 68px" name="giocuoi">
                         <c:forTokens items="00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" delims="," var="h">
                                    <option value="${h}">${h} h</option>
                           </c:forTokens>
			    		</select>
			    		:
			    		<select style="display: inline;width: 70px" name="phutcuoi">
                          <option value="00">00 m</option>
                          <option value="30">30 m</option>
			    		</select>
			    		</div>
			    		</div>
			    		<div class="icon_2"><i class="fa fa-location-arrow"></i><input placeholder="Nhập địa chỉ ..." style="width: 175px" name="diadiem" value=""></div>
			    		<input style="display: none;" name="id_giasu" value="${GiaSuInfo.id_user}">
			    		<input style="display: none;" name="id_thu" value="${id_thu}">
			    		<div class="icon_2">
			    		  <div class="speaker">
			    			  <i class="fa fa-user"></i>
			    			  <div class="speaker_item">
			    			    <select style="display: inline;width: 175px" name="id_phuhuynh">
                                  <c:forEach items="${listPhuHuynh}" var="objPH">
			    			         <option value="${objPH.id_user}">${objPH.fullname}</option>
			    			    </c:forEach>
			    		       </select>
			    			  </div>
			    			  <div class="clearfix"></div></div>
			    		  </div>
			    		 
			    		</div>
			    	</div>
			    	<div class="event_right">
			    		 <textarea name="noidung" rows="7" cols="65" placeholder="Nhập nội dung ..." style="border: solid;-moz-border-radius: 10px;-webkit-border-radius: 10px;font-family: arial;"></textarea>
		    	    </div>
		    	    <div class="clearfix"></div>
		   <div class="form-group" style="width: 50%; margin-left: 25%">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" value="Thêm">
		    </div>
		    </form>
			        </c:otherwise>
			    </c:choose>
			    
			   </div>
			  
			  </div>
			 
		     </div>
		    </div>
		   </div>
      </div>
      <div class="clearfix"> </div>  
      <div class="bg_2">
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