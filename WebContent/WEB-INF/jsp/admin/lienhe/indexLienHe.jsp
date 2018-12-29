
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
	<h2 class="text-uppercase margin-bottom-10 text-center" style="margin-bottom: 1%; margin-top: 5%; margin-left: 17%;color: #f1b458" >Messages</h2>
	<div>
					  <c:if test="${param['msg'] eq 'del' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Đã xoá ${param['soluongdel']} messages</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'nondel' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Xoá thất bại</b></h4>
	   </c:if>
</div></br>
	<form action="${pageContext.request.contextPath}/admin/dangky/dels-lienhe" method="get">
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
								aria-label="Time: activate to sort column ascending">Time</th>					
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label="Họ Tên: activate to sort column ascending">Họ Tên</th>
							
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 40px; text-align: center;"
								aria-label="Avatar: activate to sort column ascending">Avatar</th>
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 80px; text-align: center;"
								aria-label="Hình ảnh: activate to sort column ascending">Phone</th>
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
					
		   <c:forEach items="${listlienhe}" var="obj" >
				  <c:set var="urlPic" value="${pageContext.request.contextPath}/files/${obj.picture}"></c:set>
					
					<tr class="odd" role="row" style="text-align: center; height: 40px;">
							<td class="text-center sorting_1"><a href="">${obj.id_lienhe}</a></td>
							<td class="id-news text-center hidden">${obj.id_lienhe}</td>
							<td ><a href="">${obj.time }</a></td>
							<td ><a href="${pageContext.request.contextPath}/admin/dangky/chitiet-lienhe/${obj.id_lienhe}">${obj.fullname}</a></td>
							
																							
                           <c:choose>
                              <c:when test="${obj.picture eq ''}">
                                  <td align="center"><a href=""><img src="${pageContext.request.contextPath}/templates/admin/assets/img/noimagefound.jpg" width="100px" height="100px"></a></td>
                              </c:when>
                              <c:otherwise>
                                 <td align="center"><a href=""><img src="${urlPic}" width="100px" height="100px"></a></td>
                              </c:otherwise>
                           </c:choose>
                           <td ><a href="">${obj.phone}</a></td>
							<td align="center"><a href="${pageContext.request.contextPath}/admin/dangky/chitiet-lienhe/${obj.id_lienhe}">Chi tiết</a> / <a href="${pageContext.request.contextPath}/admin/dangky/del-lienhe/${obj.id_lienhe}" onclick="return confirm('Bạn chắc chắn muốn Xoá ?');"> Xóa </a></td>
							<td class="text-center">
								<div class="margin-right-15 templatemo-inline-block">
									<input id="${obj.id_lienhe}" name="iddel[]" value="${obj.id_lienhe}" type="checkbox">
									<label class="font-weight-400" for="${obj.id_lienhe}"> <span></span>
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


