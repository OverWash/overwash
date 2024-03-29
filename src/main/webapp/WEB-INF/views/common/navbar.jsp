<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#memberMyPage").click(function(e){
		e.preventDefault();
		$("#formMemberMyPage").submit();		
	});
	
	$("#memberModifyInfo").click(function(e){
		e.preventDefault();
		$("#formMemberModifyInfo").submit();	
	});
	
	$("#crewMyPage").click(function(e){
		e.preventDefault();
		$("#formCrewMyPage").submit();		
	});
	
	$("#crewModifyInfo").click(function(e){
		e.preventDefault();
		$("#formCrewModifyInfo").submit();	
	});
})
</script>

<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-search fa-fw"></i>
							</a> <!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-bell fa-fw"></i>
								<!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
							</a> <!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">알림내역</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is ready to download!</span>
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your account.
									</div>
								</a>
								<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages -->
								<span class="badge badge-danger badge-counter">7</span>
							</a> <!-- Dropdown - Messages -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a>
								<a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

								<span class="mr-2 d-none d-lg-inline text-gray-900 font-weight-bold">안녕하세요, ${username}님!</span> <img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
							</a> 
							<!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                
                                <sec:authorize access="hasRole('ROLE_MEMBER')">
	                                <%-- <form action="/member/mypage" method="post" id="formMemberMyPage">
	                                <a class="dropdown-item" href="#" id="memberMyPage">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    마이페이지
	                                    <input type="hidden" name="userId" value="<sec:authentication property='principal.userId'/>">
	                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                </a>
      	                          </form> --%>
                                  <form action="/member/modifyInfo" method="post" id="formMemberModifyInfo">
	                                <a class="dropdown-item" href="#" id="memberModifyInfo">
	                                    <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    정보수정
	                                    <input type="hidden" name="userId" value="<sec:authentication property='principal.userId'/>">
	                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                </a>
                                  </form>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_CREW')">
	                                <%-- <form action="/crew/mypage" method="post" id="formCrewMyPage">
	                                <a class="dropdown-item" href="#" id="crewMyPage">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    마이페이지
	                                    <input type="hidden" name="userId" value="<sec:authentication property='principal.userId'/>">
	                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                </a>
      	                          </form> --%>
                                  <form action="/crew/modifyInfo" method="post" id="formCrewModifyInfo">
	                                <a class="dropdown-item" href="#" id="crewModifyInfo">
	                                    <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    정보수정
	                                    <input type="hidden" name="userId" value="<sec:authentication property='principal.userId'/>">
	                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                                </a>
                                  </form>
                                </sec:authorize>
                                
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
						</li>
					</ul>
				</nav>
				<!-- End of Topbar -->
				<!-- Logout Modal-->
				<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
								<button class="close" type="button" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">정말 로그아웃할까요?</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
								<form action="/logout" method="post">
									<input type="submit" class="btn btn-primary" value="로그아웃" /> <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form>
								
							</div>
						</div>
					</div>
				</div>
				<!-- End of Topbar -->	
