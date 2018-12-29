<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
    <!-- //banner -->
	<div class="features" style="font-family: arial; margin-left: 1%;">
	   <div class="container">
	   	  <h2>${itemNews.name_baiviet}</h2>
	   	  <p style="font-size: 18px;">${itemNews.chitiet}</p>
	  </div>
	</div>
	<div style="font-family: arial;margin-left: 3%">
	 <div style="width: 40%">
			 	<h4>Bình luận</h4>
			 <div class="dabinhluan">
			 	<ul class="comment-list">
			 	<c:forEach items="${listBinhLuan}" var="obj" >
                   <li style="margin-bottom: -6%">
				     <div class="author-box">
				       <div class="author-box_left"><img src="${pageContext.request.contextPath}/templates/public/images/author.png" class="img-responsive" alt=""/></div>
				       <div class="author-box_right">
				       <p>${obj.name}</p>
			            <span class="m_1">${obj.time}</span>
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
				       <c:when test="${GiaSuInfo != null}">
				        <input type="text" placeholder="Your Name" value="${GiaSuInfo.fullname}" id="name" name="name" class="form-control" readonly="readonly">
				        <input type="text" class="form-control" placeholder="Your Email" value="${GiaSuInfo.email}" id="email" name="email" readonly="readonly">
				       </c:when>
				       <c:when test="${PhuHuynhInfo != null}">
				        <input type="text" placeholder="Your Name" value="${PhuHuynhInfo.fullname}" id="name" name="name" class="form-control" readonly="readonly">
				        <input type="text" class="form-control" placeholder="Your Email" value="${PhuHuynhInfo.email}" id="email" name="email" readonly="readonly">
				       </c:when>
				       <c:otherwise>
				        <input type="text" placeholder="Your Name" value="" id="name" name="name" class="form-control">
				        <input type="text" class="form-control" placeholder="Your Email" value="" id="email" name="email">
				       </c:otherwise>
				  </c:choose>
				  
				
				 
				 
				 
					
	                
	                <input id="id_baiviet" name="id_baiviet" value="${id_baiviet}" style="display: none;">	 
	              </div>
				  <div class="col-md-6 comment-form-right">
					<textarea name="comment" aria-required="true" id="comment" class="form-control" placeholder="Comment"></textarea>
				  </div>
				  <div class="clearfix"> </div>						
				  <div class="form-submit">
				  	<input name="submit" type="submit" id="submit" class="submit_1 btn btn-primary btn-block" value="Add comment" onclick="return binhluan()"> 
				  </div>	  
           </form>
            <script type="text/javascript">
function binhluan(){  
					var name= $("input#name").val();
					var email = $("input#email").val();
					var picture= $("input#picture").val();
					var comment = $("textarea#comment").val();
					var id_baiviet = $("input#id_baiviet").val();
					
					$.ajax({
					url: '${pageContext.request.contextPath}/binh-luan-bai-viet',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
					    name: name,
		                email: email,
		                comment: comment,
		                id_baiviet: id_baiviet,
		                
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

  };
		</script>
		
      
	     <div class="clearfix"></div>
	  </div>
	<div class="bg_2">
	  <div class="container">
	  	 <div class="col-md-6 service_2-left">
              <h2>Professional Education Programs</h2>
         </div>
         <div class="col-md-6 service_2-right">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
         </div>
         <div class="clearfix"> </div>
	  </div>
	</div>    