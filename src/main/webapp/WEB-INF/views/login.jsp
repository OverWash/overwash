<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<%@ include file="common/header.jsp"%>

<body>
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9" style="margin-top: 20%;">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h3 class="h3 text-gray-900 mb-4">
											<strong>OverWash</strong>
										</h3>
									</div>
									
									<h5 class="h5 text-gray-900 mb-4">
										<c:out value="${error}" />
									</h5>
									<h5 class="h5 text-gray-900 mb-4">
										<c:out value="${logout}" />
									</h5>
									
									<!-- Login Form -->
									<form class="user" action="/login" method="post">
										<div class="form-group">
											<input type="text" name='username' class="form-control form-control-user" id="username" placeholder="Email" required="required">
										</div>

										<div class="form-group">
											<input type='password' name='password' class="form-control form-control-user" id="password" placeholder="Password" required="required">
										</div>
										
										<!--  security remember-me -->
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck"> <label class="custom-control-label" for="customCheck">Remember Me</label>
											</div>
										</div>
										
										<!-- CSRF 토큰으로 domain 직접 입력 판별 -->
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										
										<button type='submit' class="btn btn-secondary btn-user btn-block" style="font-size: 1.2rem; padding: 0.2rem"> Login </button>
								
										<p></p>
										
									</form>
									<!-- Login Form -->
									<hr>
									<div class="text-center">
										<a class="small" href="/register">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
						<!-- Nested Row within Card Body -->
					</div>
				</div>
			</div>
		</div>
		<!-- Outer Row -->
	</div>
	<!-- Container -->

</body>
