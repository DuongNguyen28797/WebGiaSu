
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
	<h2 class="text-uppercase margin-bottom-10 text-center" style="margin-bottom: 1%; margin-top: 5%; margin-left: 17%;color: #f1b458" >Bài Viết</h2>
	<div>
	
	          <c:if test="${param['msg'] eq 'add' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Thêm thành công</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'edit' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Sửa thành công</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'del' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Đã xoá ${param['soluongdel']} bài viết</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'nondel' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Xoá thất bại</b></h4>
	   </c:if>
</div></br>
	<form action="${pageContext.request.contextPath}/admin/baiviet/dels" method="get">
		<div class="table-responsive">
			<div id="myTable_wrapper" class="dataTables_wrapper no-footer" style="margin-left: 17%; margin-bottom: 30%;">
							
				<table id="myTable" 
					class="table-hover table-bordered table-striped dataTable no-footer" role="grid" aria-describedby="myTable_info" style="width: 95%">
					<thead>
						<tr class="text-center" role="row" style="text-align: center; height: 100px;">
							<th class="sorting_asc" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 20px; text-align: center;"
								aria-label="#: activate to sort column descending"
								aria-sort="ascending">ID</th>
							<th class="hidden sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" style="width: 0px;" aria-label="ID: activate to sort column ascending">ID</th>															
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label="Tên sản phẩm: activate to sort column ascending">Tên sản phẩm</th>
							
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 40px; text-align: center;"
								aria-label="Trạng thái: activate to sort column ascending">Trạng thái</th>
						
							
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 80px; text-align: center;"
								aria-label="Hình ảnh: activate to sort column ascending">Hình ảnh</th>
							
							
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 60px; text-align: center;"
								aria-label="Chức năng: activate to sort column ascending">Chức năng</th>
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 70px;text-align: center;"
								aria-label=" Chọn: : activate to sort column ascending">
								<div class="margin-right-15 templatemo-inline-block">
									Chọn: <input id="chkAll" name="chkAll" value="" type="checkbox">
									<label class="font-weight-400" for="chkAll"> <span></span>
									</label> <input id="dels" name="dels" value="Xóa"
										onclick="return valDels();" type="submit">
								</div>
							</th>	
						</tr>
					</thead>
					<tbody>
					
		   <c:forEach items="${listbaiviet}" var="obj" >
			      <c:set var="name" value="${obj.name_baiviet}"></c:set>
				  <c:set var="id" value="${obj.id_baiviet}"></c:set>
				  <c:set var="urlPic" value="${pageContext.request.contextPath}/files/${obj.picture}"></c:set>
			
					
					
					<tr class="odd" role="row" style="text-align: center; height: 40px;">
							<td class="text-center sorting_1"><a href="">${id}</a></td>
							<td class="id-news text-center hidden">${id}</td>
							<td ><a href="">${name}</a></td>
							
							<c:choose>
							   <c:when test="${obj.trangthai==1}">
							      <td class="edit_active text-center">								
								<a href="javascript:void(0)"  title="Ngừng kích hoạt"><img alt="" src="${pageContext.request.contextPath}/templates/admin/assets/img/active.gif" /></a>
								   <span class="hidden">Yes active</span>							
							</td>
							   </c:when>
							   <c:otherwise>
							    <td class="edit_active text-center">
                                <a class="noactive" href="javascript:void(0)" title="Kích hoạt">
								<img src="${pageContext.request.contextPath}/templates/admin/assets/img/noactive.gif" alt="">
								<span class="hidden">No active</span>
								</a>
							</td>
							   </c:otherwise>
							</c:choose>																				
                           <c:choose>
                              <c:when test="${obj.picture eq ''}">
                                  <td align="center"><a href=""><img src="${pageContext.request.contextPath}/templates/admin/assets/img/noimagefound.jpg" width="100px" height="100px"></a></td>
                              </c:when>
                              <c:otherwise>
                                 <td align="center"><a href=""><img src="${urlPic}" width="100px" height="100px"></a></td>
                              </c:otherwise>
                           </c:choose>
							<td align="center"><a href="${pageContext.request.contextPath}/admin/baiviet/edit/${id}">Sửa </a> / <a href="${pageContext.request.contextPath}/admin/baiviet/del/${id}" onclick="return confirm('Bạn chắc chắn muốn Xoá ?');"> Xóa </a></td>
							<td class="text-center">
								<div class="margin-right-15 templatemo-inline-block">
									<input id="${id}" name="iddel[]" value="${id}" type="checkbox">
									<label class="font-weight-400" for="${id}"> <span></span>
									</label>
								</div>
							</td>
						</tr>
			</c:forEach>							          
					</tbody>
				</table>
				 
	
			</div>
		</div>
		</form>
</div>


<script type="text/javascript">
$(function(){
	$(document).on('click','#myTable .edit_active a', function(){
		var check = 0;
		var id_news = 0;
		if($(this).hasClass('noactive')){
			check = 1;
		}
		
		id_news = $(this).parent().siblings('.id-news').html();	
		var $_point = $(this);
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/baiviet/kichhoat",
			type: 'POST',
			cache: false,
			data: {
				id_sp: id_news,
				trangthai : check,
				
			},
			success: function(data){
				$_point.parent().html(data);
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});		
	});
});
</script>
<script type="text/javascript">
function valDels()
{
    var checkedAtLeastOne = false;
    $('input[type="checkbox"][name="iddel[]"]').each(function() {
        if ($(this).is(":checked")) {
            checkedAtLeastOne = true;
        }
    });
    
    if (checkedAtLeastOne == true){
		return confirm('Bạn có muốn xóa các mẫu tin đã chọn?');
    } else {
    	alert('Vui lòng chọn ít nhất 1 tin để xóa');
    	return false;
    }
}

$('#chkAll').click(function(event) {
  if(this.checked) {
      // Iterate each checkbox
      $(':checkbox').each(function() {
          this.checked = true;
      });
  }
  else {
    $(':checkbox').each(function() {
          this.checked = false;
      });
  }
});
</script>


