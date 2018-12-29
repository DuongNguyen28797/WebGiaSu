
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>giasu</div>
<div class="templatemo-content-widget white-bg" style="width: 60%; margin-left: 26%; margin-top: 6%; margin-bottom: 15%">
	<h2 class="margin-bottom-10" style="color: #f1b458">Sửa Bài Viết</h2>
	                  <c:if test="${param['msg'] eq 'nonedit' }">
					          <h3 style="color:red">Sửa thất bại</h3>
					  </c:if>
	<div class="module-body">
		<form id="frmform" method="post" action="${pageContext.request.contextPath}/admin/baiviet/edit/${objItem.id_baiviet}" enctype="multipart/form-data">
				<div class="col-lg-6 col-md-6 form-group">
					<label for="inputFirstName" style="color: #1E90FF"><b>Tên bài viết</b> (<span style="color: red;">*</span>)</label> <input
						id="inputFirstName" class="form-control"
						placeholder="Nhập tên bài viết ... " name="name_baiviet" value="${objItem.name_baiviet}" 
						type="text" required="required">
				</div>
			
			<div class="row form-group">
				<img alt="" src="${pageContext.request.contextPath}/files/${objItem.picture}" style="width: 10%; height: 15%">
			</div>
					
			<div class="row form-group">
				<div class="col-lg-12 col-md-12 form-group">
					<label class="control-label templatemo-block" style="color: #1E90FF"><b>Hình ảnh</b></label> <input
						name="file" type="file">
				</div>
			</div>


			<div class="row form-group">
				<div class="col-lg-12 form-group">
					<label class="control-label" style="color: #1E90FF"><b>Mô tả</b> (<span style="color: red;">*</span>)</label>
					<textarea class="form-control" name="mota" rows="3" placeholder="Nhập mô tả ... " required="required">${objItem.mota}</textarea>
				</div>
				
			</div>
			<div class="row form-group">
				<div class="col-lg-12 form-group">
					<label class="control-label" style="color: #1E90FF"><b>Chi tiết</b> (<span style="color: red;">*</span>)</label>
					<textarea class="form-control" name="chitiet" id="editor1" rows="3" placeholder="Nhập chi tiết bài viết ... " required="required">${objItem.chitiet}</textarea>
				</div>
				<script>
					var editor = CKEDITOR.replace('editor1');
					CKFinder.setupCKEditor(editor, '/boss/ckfinder/');
				</script>
			</div>



			<div class="form-group text-right">
				<input class="templatemo-blue-button" name="submit" value="Sửa"
					type="submit"> <input class="templatemo-white-button"
					name="reset" value="Nhập lại" type="reset">
			</div>
			
		</form>

	</div>
</div>
    