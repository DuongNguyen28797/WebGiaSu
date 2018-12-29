
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>giasu</div>
<div class="templatemo-content-widget white-bg" style="width: 60%; margin-left: 26%; margin-top: 6%; margin-bottom: 30%">
	<h2 class="margin-bottom-10" style="color: #f1b458">Sửa Lớp</h2>
	               
	<div class="module-body">

	
	<div style="margin-top: 5%">
		<form id="frmform" method="post" action="${pageContext.request.contextPath}/admin/dangky/edit-lop/${objLop.id_lop}" >
					<label for="inputFirstName" style="color: #1E90FF"><b>Lớp</b> (<span style="color: red;">*</span>)</label> <input
						id="inputFirstName" class="form-control"
						placeholder="Nhập tên lớp ... " name="lop" value="${objLop.lop}" 
						type="text">
					<div style="margin-top: 1%; margin-left: 66%">
						  <input class="templatemo-blue-button" name="submit" value="Sửa"
					type="submit"> <input class="templatemo-white-button"
					name="reset" value="Nhập lại" type="reset">
						</div>
		</form>
	</div>	
		<div style="clear: both;"></div>
	

	</div>
</div>
    