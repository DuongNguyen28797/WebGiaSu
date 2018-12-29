
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<div>giasu</div>
<div class="templatemo-content-widget white-bg" style="width: 60%; margin-left: 26%; margin-top: 6%; margin-bottom: 30%">
	<h2 class="margin-bottom-10" style="color: #f1b458">Sửa Môn</h2>
	               
	<div class="module-body">

	
	<div style="margin-top: 5%">
		<form id="frmform" method="post" action="${pageContext.request.contextPath}/admin/dangky/edit-mon/${objMon.id_mon}" >
					<label for="inputFirstName" style="color: #1E90FF"><b>Môn</b> (<span style="color: red;">*</span>)</label> <input
						id="inputFirstName" class="form-control"
						placeholder="Nhập tên Môn học ... " name="name_mon" value="${objMon.name_mon}" 
						type="text">
					
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
                           <c:forEach items="${listdklop}" var="lop">
                               <c:choose>
                                  <c:when test="${lop.trangthai==1}">
                                     <input type="checkbox" name="idchoose[]" value="${lop.id_lop}" checked="checked"/>${lop.lop}<br />
                                  </c:when>
                                  <c:otherwise>
                                    <input type="checkbox" name="idchoose[]" value="${lop.id_lop}"/>${lop.lop}<br />
                                  </c:otherwise>
                                 </c:choose> 
                           </c:forEach>
                          <div class="form-group">
		    	            <input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Sửa" onclick="return valChoose()" style="background: #2f374c">
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