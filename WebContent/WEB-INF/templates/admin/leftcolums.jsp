<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>    
   
   
            <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="${pageContext.request.contextPath}/templates/admin/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered"> Khải Lê</h5>
              	  	
                 
                  <li class="sub-menu">
                      <a class="${baiviet}">
                          <i class="fa fa-book"></i>
                          <span>Bài viết</span>
                      </a>
                       <ul class="sub">
                          <li><a  href="${pageContext.request.contextPath}/admin/baiviet" style="color: #ff865c">Danh sách bài viết</a></li>
                          <li><a  href="${pageContext.request.contextPath}/admin/baiviet/add" style="color: #ff865c">Thêm bài viết</a></li> 
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a class="${giasu}">
                          <i class="fa fa-user"></i>
                          <span>Gia sư</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="${pageContext.request.contextPath}/admin/giasu" style="color: #ff865c">Danh sách Gia sư</a></li>
                          
                      </ul>
                  </li>
                  
                  <li class="sub-menu">
                      <a class="${phuhuynh}">
                          <i class="fa fa-user"></i>
                          <span>Phụ Huynh</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="${pageContext.request.contextPath}/admin/phuhuynh" style="color: #ff865c">Danh sách Phụ huynh</a></li>
                          
                      </ul>
                  </li>
                   <li class="sub-menu">
                      <a  class="${hoadon}" href="${pageContext.request.contextPath}/admin/hoa-don" >
                          <i class="fa fa-usd"></i>
                          <span>Hoá đơn</span>
                      </a>
                      
                  </li>
                  
                  <li class="sub-menu">
                      <a  class="${dangky}" href="${pageContext.request.contextPath}/admin/dangky/lop-mon-quanhuyen" >
                          <i class="fa fa-cogs"></i>
                          <span>Đăng ký</span>
                      </a>
                      
                  </li>
                  
                

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->