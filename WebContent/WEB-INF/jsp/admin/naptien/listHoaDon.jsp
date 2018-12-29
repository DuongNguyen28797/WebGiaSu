
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
	<h2 class="text-uppercase margin-bottom-10 text-center" style="margin-bottom: 1%; margin-top: 5%; margin-left: 17%;color: #f1b458" >Phụ Huynh</h2>
	<div>
	
	                <c:if test="${param['msg'] eq 'del' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Xoá thành công !</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'nap' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Nạp thành công !</b></h4>
					  </c:if>
					  <c:if test="${param['msg'] eq 'nonnap' }">
					  <h4 style="color:#1E90FF; margin-left: 23%;"><b>Nạp thất bại !</b></h4>
	   </c:if>
</div></br>
	
		<div class="table-responsive">
			<div id="myTable_wrapper" class="dataTables_wrapper no-footer" style="margin-left: 17%; margin-bottom: 30%;">
							
				<table id="myTable" 
					class="table-hover table-bordered table-striped dataTable no-footer" role="grid" aria-describedby="myTable_info" style="width: 95%">
					<thead>
						<tr class="text-center" role="row" style="text-align: center; height: 100px;">
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label="Tên Gia Sư: activate to sort column ascending">Ngày</th>
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 100px; text-align: center;"
								aria-label="Tên Gia Sư: activate to sort column ascending">Tên User</th>
							
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 80px; text-align: center;"
								aria-label="Avatar: activate to sort column ascending">Avatar</th>
								
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 40px; text-align: center;"
								aria-label="Trạng thái: activate to sort column ascending">Web Xu nạp vào</th>	
								
							<th class="sorting" tabindex="0" aria-controls="myTable"
								rowspan="1" colspan="1" style="width: 60px; text-align: center;"
								aria-label="Chức năng: activate to sort column ascending">Chức năng</th>
							
						</tr>
					</thead>
					<tbody>
					
		   <c:forEach items="${listHoaDon}" var="obj" >
			     <c:forEach items="${listUser}" var="objUser" >
			     <c:if test="${obj.id_user==objUser.id_user}">
			    
			        <c:set var="urlPic" value="${pageContext.request.contextPath}/files/${objUser.picture}"></c:set>
			
					<tr class="odd" role="row" style="text-align: center; height: 40px;">
							<td class="text-center sorting_1"><a href="">${obj.time}</a></td>
							<td class="text-center sorting_1"><a href="">${objUser.fullname}</a></td>
							
							   <td class="edit_active text-center">								
								<a href="" ><img alt="" src="${urlPic}" width="100px" height="100px"/></a>
							</td>
                           <td class=""><a href="">${split.money(obj.webxunapvao)}</a> Xu</td>
                           
							<td align="center">
							<c:choose>
							   <c:when test="${obj.trangthai==1}">
							        <form action="${pageContext.request.contextPath}/admin/nap-xu/${obj.id_hoadon}" method="post">
							<div class="form-group">
		    	                <input type="submit" class="btn btn-primary btn-lg1 btn-block"  value="Nạp">
		                   </div>
		                   </form>
							   </c:when>
							   <c:otherwise>
							   <a href="${pageContext.request.contextPath}/admin/xoa-hoadon/${obj.id_hoadon}">Xoá</a>
							   </c:otherwise>
							</c:choose>
							
		                   </td>
						</tr>
			     </c:if>
						</c:forEach>
			</c:forEach>							          
					</tbody>
				</table>
				 
	
			</div>
		</div>
</div>


