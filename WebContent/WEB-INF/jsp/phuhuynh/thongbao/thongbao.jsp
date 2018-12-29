<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/templates/taglib.jsp" %>
<div class="modal-content">
                    <div class="modal-header tieu-de-dang-nhap">
                        <h4 class="modal-title " id="PhuHuynhDangNhap" style="font-family: arial">Thông Báo</h4>
                    </div>
                     <div>
                     
		 <c:forEach items="${listTatCaThongBao}" var="objThongBao">
                   <c:set var="webxuhientai" value="${split.money(objThongBao.webxuhientai)}"></c:set>
                   <c:set var="webxunapvao" value="${split.money(objThongBao.webxunapvao)}"></c:set>
                  
                       <c:if test="${objThongBao.loaithongbao==1}">
                            <div class="alert alert-dismissible admission-alert" role="alert" style="background-color: white; height: 5%">
		      		        <h4 class="title normal" style="display: inline;color: #f1b458; font-family: arial">Tài Khoản</h4>
							<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true"><i class="fa fa-times-circle" style="color: black;"></i></span><span class="sr-only">Close</span></button><br>
							<img alt="" src="${pageContext.request.contextPath}/templates/public/images/5663f221-d9d9d09aa7.jpg" style="width: 8%; height: 10%; margin-top:2%; display: inline;" >
							 <span style="color: black;font-family: arial">Tài khoản của bạn vừa được nạp <span style="color: #FF6A6A">${webxunapvao}</span>xu. Web xu hiện tại là: <span style="color: #FF6A6A">${webxuhientai}</span>xu.</span>
							 <p style="color: #BFC5C7;margin-left: 9%; margin-top: -2%">lúc ${objThongBao.time}</p>
							   <p style="color: black;font-family: arial; margin-left: 8%"><b style="color: #1E90FF">Lưu ý:</b> Tài khoản của bạn phải bằng hoặc lớn hơn <span style="color: #FF6A6A;">10.000</span>xu mới có thể thực hiện đầy đủ chức năng của Gia Sư</p>
					</div>
                       </c:if>
                       <c:if test="${objThongBao.loaithongbao==2}">
                         <div class="alert alert-dismissible admission-alert" role="alert" style="background-color: white">
			             <h4 class="title normal" style="display: inline;color: #f1b458; font-family: arial">Kết Nối</h4>
						 <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true"><i class="fa fa-times-circle" style="color: black;"></i></span><span class="sr-only">Close</span></button><br>
						 <img alt="" src="${pageContext.request.contextPath}/templates/public/images/12be13beee21399fd898bdabff3d52bd_user-free-icon-73-00kb-user-account-clipart_256-256.jpeg" style="width: 8%; height: 8%; display: inline;" >
						 <span style="color: black;font-family: arial">Bạn đã đồng ý lời đề nghị làm Gia Sư của <span style="color: #0000FF"><b>Dương Tấn Lân</b></span>.</span>
					</div>			
                       </c:if>
                 
              </c:forEach>       
          </div>    
     </div>     