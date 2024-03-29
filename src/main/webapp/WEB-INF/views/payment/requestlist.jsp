<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="../common/header.jsp"%>
<head>
	<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
</head>
<body id="page-top">
	<!-- Page Wrappe r -->
	<div id="wrapper">
		<%@ include file="../common/sidebar.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<%@ include file="../common/navbar.jsp"%>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h3 class="h3 mb-2 text-gray-800 font-weight-bold">결제 요청 목록</h3>
					<p class="mb-4">${username} 님의 결제 요청 목록입니다. 결제 버튼을 눌러 결제 수단을 선택하고 결제를 진행해 주세요.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">결제 요청서 목록</h6>
						</div>
						<div class="card-body">
							<table id="paymentRequestTable" class="table table-striped table-bordered" style="width: 100%">
								<thead>
									<tr>
										<th>No</th>
										<th>예약No</th>
										<th>예약일</th>
										<th>예약확정일</th>
										<th>금액</th>
										<th>검수내역</th>
										<th>결제하기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${prList}" var="prList">
										<tr>
											<td>${prList.prId}</td>
											<td>${prList.confirm.reservation.reservationId}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${prList.confirm.reservation.reservationDate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${prList.confirm.confirmDate}" /></td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${prList.prPrice}" /></td>
											<td><input id="checkListBtn" class="btn btn-dark" type="button" value="상세보기" onclick="checkList(event, ${prList.prId}, ${prList.confirm.confirmId})"></td>
											<td><input id="payProcessBtn" class="btn btn-dark" type="button" value="결제하기" onclick="payProcess(event, ${prList.prId}, ${prList.confirm.confirmId})"></td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- 검수 내역 모달창 -->
			<div class="modal fade" id="checkListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="font-weight-bold">결제요청서 No.</h5>
							<h5 id="prIdText" class="font-weight-bold"></h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<hr>
							<!-- Content Row -->
							<div class="row">
								<div class="col-xl-12 mb-4">
									<div class="card shadow mb-4">
										<div class="card-header py-3">
											<h6 class="m-0 font-weight-bold text-primary">검수 내역</h6>
										</div>
										<!-- 검수 내역 테이블로 가져오기 (restful) -->
										<div id="price" class="card-body">
											<table id="checkTable" class="table table-striped table-bordered" style="width: 100%">
												<thead>
													<tr>
														<th>품목</th>
														<th>가격</th>
													</tr>
												</thead>
												<tbody id="checkTableBody"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" type="button" data-dismiss="modal">돌아가기</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 결제 진행 모달창 -->
			<div class="modal fade" id="payProcessModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="font-weight-bold">결제요청서 No.</h5>
							<h5 id="prIdText2" class="font-weight-bold"></h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<form id="requestForm" class="user" action="/payment/process" method="POST">
							<div class="modal-body">
								<hr>
								<!-- Content Row -->
								<div class="row">
									<div class="col-xl-12 mb-4">
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">결제수단을 선택해 주세요</h6>
											</div>

											<!-- 결제수단 체크박스 -->
											<div class="card-body">
												<!-- <div class="input-group">
													<label><input type="radio" id="paymentMethod" name="paymentMethod" value="신용카드" > 신용카드</label>
												</div>
												<div class="input-group">
													<label><input type="radio" id="paymentMethod" name="paymentMethod" value="카드" > 카드</label>
												</div>
												 -->
												<select name="paymentMethod" class="custom-select custom-select-sm form-control form-control-sm">
													<option value="문화상품권">문화상품권</option>
													<option value="모바일결제">모바일 결제</option>
													<option value="신용카드">신용카드</option>
													<option value="토스">토스</option>
													<option value="PAYCO">PAYCO</option>
													<option value="KakaoPay">KakaoPay</option>
												</select>
												<input id="prId" type="hidden" name="prId">
												<input id="confirmId" type="hidden" name="confirmId">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button class="btn btn-primary" type="button" onclick="return chk_form()">결제하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<%@ include file="../common/copyright.jsp"%>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript" src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" src="/resources/js/payment.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#paymentRequestTable').DataTable(); // table 띄우기
		});
		
		function payProcess(event, prId, confirmId) {
			event.preventDefault(); // 버블링 방지
			$('#payProcessModal').modal("show"); // modal 띄우기
			$('#prIdText2').text(prId);
			$('#prId').attr("value", prId);
			$('#confirmId').attr("value", confirmId);
		}
		
		function chk_form() {
			$("#requestForm").submit();
		}
		
		function checkList(event, prId, confirmId) {
			event.preventDefault(); // 버블링 방지
			$('#checkListModal').modal("show"); // modal 띄우기
			$('#prIdText').text(prId);
			
			// ajax 호출
			paymentService.getCheckList(confirmId, function(data){
				var html = '';
				$(data).each(function(){
					html += '<tr>';
					html += '<td>'+ this.laundry.name +'</td>';
					html += '<td>'+ this.laundry.laundryPrice.price +'</td>';
					html += '</tr>';	
				});
				
				$("#checkTableBody").empty();
				$("#checkTableBody").append(html); 
			});
		}
	</script>
</body>
</html>