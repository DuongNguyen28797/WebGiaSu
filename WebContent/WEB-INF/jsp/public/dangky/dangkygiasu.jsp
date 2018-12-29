<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
    
<!-- banner -->
  <div class="courses_banner">
  	<div class="container">
  		<h3 style="font-family: arial;">Lưu ý</h3>
  		<p class="description">
  		   Thông tin cần phải điền đầy đủ và chính xác nhất, để tiện cho việc liên lạc giữa Gia Sư và Phụ Huynh sau này.
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">Home</a></li>
                <li class="current-page">Đăng ký Gia Sư</li>
            </ul>
        </div>
  	</div>
  </div>
    <!-- //banner -->
	<div class="courses_box1">
	   <div class="container">
	   	          <div style="margin-top: -5%; "></div><div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="panel panel-default form-dang-ky">
				<c:if test="${dkgs != null}">
				   <h3 style="color: #1E90FF; margin-left: 38%"><b> Đăng kí thành công !</b></h3>
				</c:if>
					<div class="panel-heading">
						<h3 class="panel-title" style="font-family: arial;">Đăng ký gia sư</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/dang-ky-gia-su">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="username">Username</label>
								<c:if test="${param['msg'] eq 'trung' }">
								     <h5 style="color: red; font-family: arial;">Username đã có  người sử dụng !</h5>
								</c:if>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="username" name="username" placeholder="Username" required="required"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password">Mật khẩu</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required="required"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="fullname">Tên đầy đủ</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="fullname" name="fullname" placeholder="Nhập họ và tên" required="required"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="email">Email</label>
								<div class="col-sm-5">
									<input type="email" class="form-control" id="email" name="email" placeholder="Email" required="required"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="id_quanhuyen">Quận huyện</label>
								<div class="col-sm-5">
						            <select class="form-control" name="id_quanhuyen">
						             <c:forEach items="${listquanhuyen}" var="obj" >
											<option value="${obj.id_quanhuyen}">${obj.name_quanhuyen}</option>
								    </c:forEach>	
										</select>
					            </div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="phone">Số điện thoại</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" required="required"/>
								</div>
								
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="address">Địa chỉ</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="diachi" name="diachi" placeholder="Nhập địa chỉ" required="required"/>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit" class="btn btn-primary" name="signup" style="margin-left: 41%">Đăng ký</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	   </div>
	</div>    