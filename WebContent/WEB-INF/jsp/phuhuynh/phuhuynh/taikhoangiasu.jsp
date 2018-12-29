<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
	<div class="courses_box1" style="font-family: arial; margin-top: -5%;">
	   <div class="container">
	                
		<div class="col-md-8 detail"  style="width: 95%">
		  
	       <h3>${GiaSu.fullname}</h3>
	       <p style="display: inline;"><span style="color:#1E90FF;"><b>Ngày đăng ký:</b></span>${GiaSu.ngaydk}</p>
	       <p><span style="color: #1E90FF;"><b>Số năm kinh nghiệm:</b></span> ${GiaSu.sonamkinhnghiem} năm</p>
	       <p><span style="color: #1E90FF;"><b>Địa chỉ:</b></span> ${GiaSu.diachi}</p>
	        <p><span style="color: #1E90FF;"><b>Số phone:</b></span>${GiaSu.phone}</p>
	       <p><span style="color: #1E90FF;"><b>Dạy các môn:</b></span></p>
	       <div style="margin-left: 13%; margin-top: -2%">
	            <c:forEach items="${listDKM}" var="objDK">
	             <c:if test="${GiaSu.id_user==objDK.id_user}">
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
	       <input value="${GiaSu.id_user}" name="id_giasu" id="id_giasu" style="display: none;">
	       <input value="${GiaSu.fullname}" name="fullname" id="fullname" style="display: none;">
	       <input value="${PhuHuynh.fullname}" id="fullname_phuhuynh" style="display: none;">
	       <input value="${PhuHuynh.webxu}" id="webxu" style="display: none;">
	       <h4 style="margin-top: 2%; color: #f1b458"><b>Tự giới thiệu bản thân:</b></h4>
	       <p>${GiaSu.gioithieubanthan}</p>
	         <div>
	        <div class="lv-avatar pull-left" style="margin-left: 68%; margin-top: -27%; display: inline;">
				<img src="${pageContext.request.contextPath}/files/${GiaSu.picture}" style="width: 200px; height: 200px;" alt=""/>
			</div>
	     
	       <c:if test="${GiaSu.sobauchon <= 10}">
	          <img alt="" src="${pageContext.request.contextPath}/templates/public/images/1-star.png" style="width: 20%;margin-left: 68%; margin-top: -13%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>11 && GiaSu.sobauchon <=30}">
	          <img alt="" src="${pageContext.request.contextPath}/templates/public/images/two-star-rating.png" style="width: 20%;margin-left: 68%; margin-top: -13%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>30 &&  GiaSu.sobauchon<= 50}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/3star-1.png" style="width: 20%;margin-left: 68%; margin-top: -13%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon>50 && GiaSu.sobauchon<= 80}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/4star.png" style="width: 20%;margin-left: 68%; margin-top: -13%;"> 
	       </c:if>
	        <c:if test="${GiaSu.sobauchon >80}">
	           <img alt="" src="${pageContext.request.contextPath}/templates/public/images/RiAB776MT.png" style="width: 20%;margin-left: 68%; margin-top: -13%;"> 
	       </c:if>
	       
	       
	        <ul class="meta-post" style="margin-left: 67%; margin-top: -5%;" >
	            <li>
                   <i class="fa fa-plus-square-o fa-2x" aria-hidden="true" style="color: #f1b458" onclick="return getLuu()"></i>
                   <p style="display: inline;">Lưu</p>
                </li> 
               
             <c:choose>
                 <c:when test="${ketnoi != null}">
                       <li class="dagoiloimoi">
                   			<button  data-toggle="modal" data-target="#login" name="submit" type="submit" style="width: 100%;display: inline; font-family: arial;" onclick="return getGoiLoiMoi()">Gởi lời mời </button>
                       </li>
                 </c:when>
                 <c:when test="${dagoiloimoi != null}">
                       <li class="dagoiloimoi">
                   			<button  data-toggle="modal" data-target="#login" name="submit" type="submit" style="width: 100%;display: inline; font-family: arial;">Đã gởi lời mời </button>
                       </li>
                 </c:when>
                 <c:otherwise>
                       <li>
                   			<button  data-toggle="modal" data-target="#login" name="submit" type="submit" style="width: 100%;display: inline; font-family: arial;">Đã kết nối</button>
                       </li>
                 </c:otherwise>
             
             </c:choose>   
           </ul>
       </div>
       <div class="kodu">    
       
       </div>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 34%; margin-left: 60%; margin-bottom: -7%">
                 <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                               <b>Đánh giá theo số sao.</b>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
                        <div class="panel-body">
                           <form id="danhgiasosao" method="post" action="javascript:void(0);">
                                  <input type="radio" name="danhgia" id="1"  value="1"/><img alt="" src="${pageContext.request.contextPath}/templates/public/images/1-star.png" style="width: 70%;"> <br />
                                  <input type="radio" name="danhgia" id="2"  value="2"/><img alt="" src="${pageContext.request.contextPath}/templates/public/images/two-star-rating.png" style="width: 70%;"> <br />
                                  <input type="radio" name="danhgia" id="3"  value="3"/><img alt="" src="${pageContext.request.contextPath}/templates/public/images/3star-1.png" style="width: 70%;"> <br />
                                  <input type="radio" name="danhgia" id="4"  value="4"/><img alt="" src="${pageContext.request.contextPath}/templates/public/images/4star.png" style="width: 70%;"> <br />
                                  <input type="radio" name="danhgia" id="5"  value="5"/><img alt="" src="${pageContext.request.contextPath}/templates/public/images/RiAB776MT.png" style="width: 70%;"> <br />
                          <div class="form-group">
		    	            <input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Đánh giá" onclick="return getDanhGia()" style="background: #2f374c">
		                  </div>
                           </form>
                        </div>
                    </div>
                </div>
          </div>   
          
	       	<div style="font-family: arial;margin-left: 3%">
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
			 <form class="comment-form" id="contactForm" style="width: 87%" method="post" action="javascript:void(0);">
			 	<h4>Nhập bình luận</h4>
				  <div class="col-md-6 comment-form-left">
				  <c:choose>
				       <c:when test="${PhuHuynhInfo != null}">
				        <input type="text" placeholder="Your Name" value="${PhuHuynhInfo.fullname}" id="name" name="name" class="form-control" style="display: none;" readonly="readonly">
				        <input type="text" class="form-control" placeholder="Your Email" value="${PhuHuynhInfo.email}" id="email" name="email" style="display: none;" readonly="readonly">
				        <input type="text" value="${PhuHuynhInfo.picture}" id="picture" name="picture" style="display: none;">
				       </c:when>
				  </c:choose>
	              </div>
				  <div class="col-md-6 comment-form-right">
					<textarea cols="15" name="comment" aria-required="true" id="comment" class="form-control" placeholder="Comment" style="margin-left: -106%; width: 97%"></textarea>
				  </div>
				  <div class="clearfix"> </div>
				  <div class="clearfix"> </div>						
				  <div class="form-submit" style="margin-top: 6%; width: 20%; margin-left: 12%">
				  	<input name="submit" type="submit" id="submit" class="submit_1 btn btn-primary btn-block" value="Bình luận" onclick="return binhluanGiaSu()"> 
				  </div>	  
           </form>
            <script type="text/javascript">
function binhluanGiaSu(){  
	var comment = $("textarea#comment").val();
	if(comment!=""){
					var name= $("input#name").val();
					var email = $("input#email").val();
					var picture = $("input#picture").val();
					var id_giasu = $("input#id_giasu").val();
					
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/binh-luan-gia-su',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
					    name: name,
		                email: email,
		                comment: comment,
		                id_giasu: id_giasu,
		                picture:picture,
		                
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$('#contactForm').trigger("reset");
						$('.dabinhluan').html(data);
					},
					error : function() {
						$('#contactForm').trigger("reset");
						
					}
				});
				return false;   
	}
  };
		</script>
		
      
	     <div class="clearfix"> </div>
	  </div>
	
           <script type="text/javascript">
function getGoiLoiMoi(){  
	var id_giasu = $("input#id_giasu").val();
	var fullname = $("input#fullname").val();
	var webxu = $("input#webxu").val();
	var fullname_phuhuynh = $("input#fullname_phuhuynh").val();
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/goi-loi-moi',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						id_giasu: id_giasu,
						fullname: fullname,
						name_phuhuynh: fullname_phuhuynh,
						webxu:webxu,
						
					//Dữ liệu gửi đi
					},
					success : function(data) {
						if(webxu <10000){
						$('.kodu').html(data);
						}else{
							$('.dagoiloimoi').html(data);
						}
					},
					error : function() {
						alert('Không thể gởi lời đề nghị !!!');
					}
				});
				return false;   
  };
  </script>
           
            <script type="text/javascript">
function getLuu(){  
	var id_giasu = $("input#id_giasu").val();
	var fullname = $("input#fullname").val();
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/luu-thong-tin',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						id_giasu: id_giasu,
						
					//Dữ liệu gửi đi
					},
					success : function(data) {
						alert('Bạn đã lưu thông tin của gia sư '+fullname+".");
					},
					error : function() {
						alert('Chua luu thong tin duoc !!!');
					}
				});
				return false;   
  };
  </script>
 
           <script type="text/javascript">
function getDanhGia(){  
	
	if ($("#1").is(":checked")) {  
		var sosao= $("input#1").val();
	}
	if ($("#2").is(":checked")) {  
		var sosao= $("input#2").val();
	}
	if ($("#3").is(":checked")) {  
		var sosao= $("input#3").val();
	}
	if ($("#4").is(":checked")) {  
		var sosao= $("input#4").val();
	}
	if ($("#5").is(":checked")) {  
		var sosao= $("input#5").val();
	}
	var fullname= $("input#fullname").val();
	var id_giasu= $("input#id_giasu").val();
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/danh-gia',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						sosao: sosao,
						id_giasu: id_giasu,
					},
					success : function(data) {
						$('#danhgiasosao').trigger("reset");
						alert('Bạn đã đánh giá '+sosao+" sao cho gia sư "+fullname);
					},
					error : function() {
						alert('Bạn chưa chọn số Sao !!!');
						$('#danhgiasosao').trigger("reset");
						
					}
				});
				return false;   

  };
		</script>
		
            
  <div class="col-md-8 grid_1_right" style="font-family: inherit; margin-top: 2%;width: 77%">
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT2.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  </c:forEach>
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT3.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  </c:forEach>
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT4.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  </c:forEach>
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT5.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  </c:forEach>
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT6.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  
			  </c:forEach>
		
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT7.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  </c:forEach>
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
			    		</div>
			    	</div>
			    	<div class="event_right">
		    	        <h4>${objT8.noidung}</h4>
		    	    </div>
		    	    <div class="clearfix"></div>
			   </div>
			  </c:forEach>
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
	 </div>         
    