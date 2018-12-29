<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
 
<div class="bottom_content" style="margin-top: -1%">  
   	 <h3 style="font-family: arial;">Tin Tức - Bài Viết</h3>
     <div class="grid_2">
     	<div class="grid_2" style="font-family: arial;">
      <c:forEach items="${listBaiViet}" var="obj" >
			      <c:set var="name" value="${obj.name_baiviet}"></c:set>
				  <c:set var="id" value="${obj.id_baiviet}"></c:set>
				  <c:set var="urlPic" value="${pageContext.request.contextPath}/files/${obj.picture}"></c:set>
			      <c:set var="slug" value="${slugUtils.makeSlug(name)}"></c:set>
     	<div class="col-md-4 portfolio-left" style="margin-top: 1%; margin-bottom: 3%">
            <div class="portfolio-img event-img">
                <img src="${urlPic}" class="img-responsive" alt="" style="width: 180px; height: 240px" />
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
               <h4><a href="${pageContext.request.contextPath}/phuhuynh/chi-tiet-bai-viet/${slug}-${id}">${name}</a></h4>
               <p>${obj.mota}</p>
               
            </div>
            <div class="clearfix"> </div>
        </div>
      
       </c:forEach> 
        </div>
        <div class="clearfix"> </div>
     </div>
    </div>      