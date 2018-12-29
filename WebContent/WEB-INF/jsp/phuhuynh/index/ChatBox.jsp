<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	    <div class="navbar-header">
	        <a class="navbar-brand" href="${pageContext.request.contextPath}/phuhuynh" style="color: #f1b458"><b>Gia Sư online</b></a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;margin-left: 93%">
	        <ul class="nav navbar-nav">
		        <li class="dropdown">
		            <a href="${pageContext.request.contextPath}/phuhuynh/phuhuynh-logout" ><i class="fa fa-power-off fa-2x" style="color: #f1b458;"></i><span></span></a>
		            
		        </li> 
		    </ul>
	    </div>
	    
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
</nav>
<%@ include file="/templates/taglib.jsp" %>
	<div class="container-fluid">
		<div class="container ng-scope">
			<div class="block-header">
				<h2></h2>
			</div>
			<div class="card m-b-0" id="messages-main"
				style="box-shadow: 0 0 40px 1px #c9cccd;">
				<div class="ms-menu" style="overflow: scroll; overflow-x: hidden;"
					id="ms-scrollbar">
					<div class="ms-block">
						<div class="ms-user">
						  <div class="lv-avatar pull-left" style="margin-left: -5%">
							<img src="${pageContext.request.contextPath}/files/${PhuHuynhInfo.picture}" alt="">
							</div>
							<div>
							<h5 class="q-title" align="center" style="margin-left: -16%; margin-top: 0%"> 
								${PhuHuynhInfo.fullname}
							</h5>
							</div>
						</div>
					</div>
					<div class="ms-block">
						<a class="btn btn-primary btn-block ms-new" href="#">Danh sách Gia Sư</a>
					</div>
					<hr />
					<div class="listview lv-user m-t-20">
					  <div class="changebox">
					     <c:forEach items="${listGiaSu}" var="objGS">
						<div class="lv-item media" id="${objGS.id_user}" style="margin-left: 7%; margin-bottom: 5%">
							<div class="lv-avatar pull-left">
								<img src="${pageContext.request.contextPath}/files/${objGS.picture}" alt="">
							</div>
							<div class="media-body" style="margin-top: 4%">
								<div class="lv-title"><b>${objGS.fullname}</b>
								<c:if test="${objGS.online==1}">
								<span style="margin-left: 8px; position: absolute; margin-top: 8px; width: 8px; height: 8px; line-height: 8px; border-radius: 50%; background-color: #80d3ab;"></span>
							    </c:if>
							  </div>  
							</div>
						</div>
				     </c:forEach>		
					  </div>
					</div>
<c:forEach items="${listGiaSu}" var="objGS">
<c:set var="id" value="${objGS.id_user}"></c:set>						
<script type="text/javascript">
$(function(){
	var id = ${id};
	var oldscrollHeight = $(".lv-body")[0].scrollHeight+5000;
	$(document).on('click','.changebox #${id}', function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/phuhuynh/changebox",
			type: 'POST',
			cache: false,
			data: {
				id_giasu: id,	
			},
			success: function(data){
				$('.lv-body').html(data);
				$(".lv-body").animate({ scrollTop: oldscrollHeight }, 'normal');
			},
			error: function (){
			}
		});	
		return false;
	});	
});	
</script> 
</c:forEach>
<c:if test="${chat != null}">
<script type="text/javascript">
 setInterval(
		 function(){  
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/check-online',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$('.changebox').html(data);
					},
					error : function() {
					}
				});
				return false;   	
			    }
		 , 10000)
</script>	 
</c:if>			
				</div>
				<div class="check">
				
				</div>
				<div class="ms-body">
					<div class="listview lv-message">
						<div class="lv-header-alt clearfix">
							<div id="ms-menu-trigger">
								<div class="line-wrap">
									<div class="line top"></div>
									<div class="line center"></div>
									<div class="line bottom"></div>
								</div>
							</div>
							<div class="lvh-label hidden-xs">
								<div class="lv-avatar pull-left">
								</div>
							</div>
							<ul class="lv-actions actions list-unstyled list-inline">
							</ul>
						</div>
						<div class="lv-body" id="ms-scrollbar" style="overflow: scroll; overflow-x: hidden; height: 520px;">
					
						</div>
						<div class="clearfix"></div>
						<div class="lv-footer ms-reply">
						<form id="messages" method="post" action="javascript:void(0);">
							<textarea  id="noidungchat" rows="10" placeholder="Write messages..."></textarea>
							<button type="submit" onclick="return send()">
								<span  class="glyphicon glyphicon-send" ></span>
							</button>
						</form>	
						</div>
					
				</div>
				
			</div>
			
<script type="text/javascript">
function send(){  
	var id_giasu = $("input#id_giasu").val();
	if(id_giasu != null){
	                var oldscrollHeight = $(".lv-body")[0].scrollHeight;
					var noidung = $("textarea#noidungchat").val();
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/sendBox',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
					    noidung: noidung,
					    id_giasu: id_giasu,
					//Dữ liệu gửi đi
					},
					success : function(data) {
						
						$('#messages').trigger("reset");
						$('.lv-body').html(data);
						var newscrollHeight = $(".lv-body")[0].scrollHeight; //Scroll height after the request
						if(newscrollHeight > oldscrollHeight){
							$(".lv-body").animate({ scrollTop: newscrollHeight }, 'normal'); //Autoscroll to bottom of div
						}
					},
					error : function() {
						alert('@@');
					}
				});
				return false; 
	}
  };
		</script>
		
<c:if test="${chat != null}">
<script type="text/javascript">
 setInterval(
		 function(){  
				var id_giasu = $("input#id_giasu").val();
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/check',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						id_giasu: id_giasu,
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$('.check').html(data);
					},
					error : function() {
					}
				});
				return false;   	
			    }
		 , 500)
</script>	 
</c:if>	
		
<c:if test="${chat != null}">
<script type="text/javascript">
 setInterval(
		 function(){  
				var id_ketnoi = $("input#id_ketnoi").val();
				if(id_ketnoi != null){
			    	var oldscrollHeight = $(".lv-body")[0].scrollHeight;
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/lapBox',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						id_ketnoi: id_ketnoi,
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$('.lv-body').html(data);
						$(".lv-body").animate({ scrollTop: oldscrollHeight }, 'normal');
					},
					error : function() {
					}
				});
				return false;   	
			    }
		 }
		 , 250)
</script>	 
</c:if>			
		</div>
	</div>
	</div>
	
	