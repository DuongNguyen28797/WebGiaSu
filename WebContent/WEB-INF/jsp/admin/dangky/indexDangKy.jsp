
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div class="templatemo-content-widget white-bg">

	<div class="bottom-spacing">
	<div>gia su on line</div>
		<div class="float-left" style="margin-bottom: -6%; margin-top: 12%; margin-left: 30%">
		</div>
		<div class="clear"></div>
	</div>
	<a href="${pageContext.request.contextPath}/admin/dangky/them-dang-ky"><button style="margin-bottom: 1%; margin-top: -2%; margin-left: 30%; border: 1px solid #64c3c2 !important; border-radius:3px">Thêm</button></a>
	<h2 class="text-uppercase margin-bottom-10 text-center" style="margin-bottom: 1%; margin-top: -2%; margin-left: 17%;color: #f1b458" >Lớp</h2>
	
	<div>
	
	          <c:if test="${param['msg'] eq 'add' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Thêm thành công</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'edit' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Sửa thành công</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'del' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Đã xoá !</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'nondel' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Xoá thất bại</b></h4>
	   </c:if>
</div></br>
		<div class="table-responsive" style="display:block;">
			<div id="myTable_wrapper" class="dataTables_wrapper no-footer" style="margin-left: 17%; margin-bottom: 5%;">
							
				<table id="myTable" 
					class="table-hover table-bordered table-striped dataTable no-footer" role="grid" aria-describedby="myTable_info" style="width:45%">
					<thead>
						<tr class="text-center" role="row" style="text-align: center; height: 15%;">
							<th class="sorting_asc" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 20px; text-align: center;"
								aria-label="#: activate to sort column descending"
								aria-sort="ascending">ID</th>
							<th class="hidden sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" style="width: 0px;" aria-label="ID: activate to sort column ascending">ID</th>															
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label="Lớp: activate to sort column ascending">Lớp</th>
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 60px; text-align: center;"
								aria-label="Chức năng: activate to sort column ascending">Chức năng</th>
							
						</tr>
					</thead>
					<tbody>
					
		   <c:forEach items="${listLop}" var="obj" >
					<tr class="odd" role="row" style="text-align: center; height: 40px;">
							<td class="text-center sorting_1"><a href="">${obj.id_lop}</a></td>
							<td class="id-news text-center hidden">${obj.id_lop}</td>
							<td ><a href="">${obj.lop}</a></td>
							<td align="center"><a href="${pageContext.request.contextPath}/admin/dangky/edit-lop/${obj.id_lop}">Sửa</a> / <a href="${pageContext.request.contextPath}/admin/dangky/del-lop/${obj.id_lop} " onclick="return confirm('Bạn chắc chắn muốn Xoá ?');"> Xóa </a></td>
					</tr>
			</c:forEach>							          
					</tbody>
				</table>
			</div>
		</div>
		<h2 class="text-uppercase margin-bottom-10 text-center" style="margin-bottom: 1%; margin-top: 5%; margin-left: 17%;color: #f1b458" >Môn Học</h2>
		<div class="table-responsive">
			<div id="myTable_wrapper" class="dataTables_wrapper no-footer" style="margin-left: 17%;">
							
				<table id="myTable" 
					class="table-hover table-bordered table-striped dataTable no-footer" role="grid" aria-describedby="myTable_info" style="width:45%">
					<thead>
						<tr class="text-center" role="row" style="text-align: center; height: 15%;">
							<th class="sorting_asc" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 20px; text-align: center;"
								aria-label="#: activate to sort column descending"
								aria-sort="ascending">ID</th>
							<th class="hidden sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" style="width: 0px;" aria-label="ID: activate to sort column ascending">ID</th>															
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label="Môn: activate to sort column ascending">Môn</th>
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 60px; text-align: center;"
								aria-label="Chức năng: activate to sort column ascending">Chức năng</th>
							
						</tr>
					</thead>
					<tbody>
					
		   <c:forEach items="${listMon}" var="obj" >
					<tr class="odd" role="row" style="text-align: center; height: 40px;">
							<td class="text-center sorting_1"><a href="">${obj.id_mon}</a></td>
							<td class="id-news text-center hidden">${obj.id_mon}</td>
							<td ><a href="">${obj.name_mon}</a></td>
							<td align="center"><a href="${pageContext.request.contextPath}/admin/dangky/edit-mon/${obj.id_mon}">Sửa</a> / <a href="${pageContext.request.contextPath}/admin/dangky/del-mon/${obj.id_mon}" onclick="return confirm('Bạn chắc chắn muốn Xoá ?');"> Xóa </a></td>
					</tr>
			</c:forEach>							          
					</tbody>
				</table>
			</div>
		</div>
		<h2 class="text-uppercase margin-bottom-10 text-center" style="margin-bottom: 1%; margin-top: 5%; margin-left: 17%;color: #f1b458" >Quận Huyện</h2>
		<div class="table-responsive">
			<div id="myTable_wrapper" class="dataTables_wrapper no-footer" style="margin-left: 17%; margin-bottom: 30%;">
							
				<table id="myTable" 
					class="table-hover table-bordered table-striped dataTable no-footer" role="grid" aria-describedby="myTable_info" style="width:45%">
					<thead>
						<tr class="text-center" role="row" style="text-align: center; height: 15%;">
							<th class="sorting_asc" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 20px; text-align: center;"
								aria-label="#: activate to sort column descending"
								aria-sort="ascending">ID</th>
							<th class="hidden sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" style="width: 0px;" aria-label="ID: activate to sort column ascending">ID</th>															
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label=": activate to sort column ascending">Quận Huyện</th>
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 60px; text-align: center;"
								aria-label="Chức năng: activate to sort column ascending">Chức năng</th>
							
						</tr>
					</thead>
					<tbody>
					
		   <c:forEach items="${listQuanHuyen}" var="obj" >
					<tr class="odd" role="row" style="text-align: center; height: 40px;">
							<td class="text-center sorting_1"><a href="">${obj.id_quanhuyen}</a></td>
							<td class="id-news text-center hidden">${obj.id_quanhuyen}</td>
							<td ><a href="">${obj.name_quanhuyen}</a></td>
							<td align="center"><a href="${pageContext.request.contextPath}/admin/dangky/edit-quanhuyen/${obj.id_quanhuyen}">Sửa</a> / <a href="${pageContext.request.contextPath}/admin/dangky/del-quanhuyen/${obj.id_quanhuyen}" onclick="return confirm('Bạn chắc chắn muốn Xoá ?');"> Xóa </a></td>
					</tr>
			</c:forEach>							          
					</tbody>
				</table>
			</div>
		</div>
</div>


