
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>giasu</div>
<div class="templatemo-content-widget white-bg" style="width: 60%; margin-left: 26%; margin-top: 6%; margin-bottom: 15%">
	<h2 class="margin-bottom-10" style="color: #f1b458">Thêm</h2>
	                  <c:if test="${param['msg'] eq 'nonadd' }">
					          <h3 style="color:red">Thêm thất bại</h3>
					  </c:if>
	<div class="module-body">
	<div>
		<form id="frmform" method="post" action="${pageContext.request.contextPath}/admin/dangky/add-quanhuyen">
					<label for="inputFirstName" style="color: #1E90FF"><b>Quận Huyện</b> (<span style="color: red;">*</span>)</label> <input
						id="inputFirstName" class="form-control"
						placeholder="Nhập tên quận/huyện ... " name="name_quanhuyen" value="" 
						type="text" required="required">
						<div style="margin-top: 1%; margin-left: 66%">
						  <input class="templatemo-blue-button" name="submit" value="Thêm"
					type="submit"> <input class="templatemo-white-button"
					name="reset" value="Nhập lại" type="reset">
						</div>
		</form>
	</div>	
		<div style="clear: both;"></div>
	
	<div style="margin-top: 5%">
		<form id="frmform" method="post" action="${pageContext.request.contextPath}/admin/dangky/add-lop" >
					<label for="inputFirstName" style="color: #1E90FF"><b>Lớp</b> (<span style="color: red;">*</span>)</label> <input
						id="inputFirstName" class="form-control"
						placeholder="Nhập tên lớp ... " name="lop" value="" 
						type="text" required="required">
					<div style="margin-top: 1%; margin-left: 66%">
						  <input class="templatemo-blue-button" name="submit" value="Thêm"
					type="submit"> <input class="templatemo-white-button"
					name="reset" value="Nhập lại" type="reset">
						</div>
		</form>
	</div>	
		<div style="clear: both;"></div>
	
	<div style="margin-top: 5%">
			<form action="${pageContext.request.contextPath}/admin/dangky/choose" method="post">
					<label for="inputFirstName" style="color: #1E90FF"><b>Môn Học</b> (<span style="color: red;">*</span>)</label> <input
						id="inputFirstName" class="form-control"
						placeholder="Nhập tên môn học ... " name="name_mon" value="" 
						type="text" required="required">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 34%; margin-bottom: -7%">
                 <div class="panel panel-default" style="width: 164%;">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                               <b>Chọn danh sách lớp học phù hợp theo môn.</b>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
                        <div class="panel-body">
                           <c:forEach items="${listLop}" var="lop">
                                <input type="checkbox" name="idchoose[]" value="${lop.id_lop}"/>${lop.lop}<br />
                           </c:forEach>
                                  
                          <div class="form-group">
		    	            <input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Thêm" onclick="return valChoose()" style="background: #2f374c">
		                  </div>
                        </div>
                    </div>
                </div>
					</div>
		</form>	
	</div>	
		<div style="clear: both;"></div>		
		
	</div>
</div>
 
		
<script type="text/javascript">
function valChoose()
{
    var checkedAtLeastOne = false;
    $('input[type="checkbox"][name="idchoose[]"]').each(function() {
        if ($(this).is(":checked")) {
            checkedAtLeastOne = true;
        }
    });
    
    if (checkedAtLeastOne == false){
    	alert('Vui lòng chọn ít nhất 1 lớp phù hợp !');
    	return false;
    }
}
</script> 