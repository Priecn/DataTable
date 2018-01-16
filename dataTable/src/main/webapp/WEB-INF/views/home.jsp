<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>

<spring:url var="css" value="/resources/css" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Products</title>

<script type="text/javascript">
	window.contextRoot = "${contextRoot}"
</script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- DataTable -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${css}/jquery-ui.min.css">
<!-- Style for modal -->
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${css}/modal-style.css">
</head>

<body>
	<div class="wrapper">
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">

						<table id="productListTable"
							class="table table-striped table-borderd">
							<thead>
								<tr>
									<th>Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Qty. Available</th>
									<th></th>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<th>Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Qty. Available</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- MODALS  -->
	<!-- Delete Modal -->
	<div id="delete-row-modal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons delete">close</i>
						<!-- &#xE5CD; -->
					</div>
					<h4 class="modal-title">Are you sure?</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Do you really want to delete these records? This process
						cannot be undone.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
					<form method="post" style="display: inline;" id="delete-product">
						<button type="submit" class="btn btn-danger">
							<span class="glyphicon glyphicon-remove-circle"></span>&nbsp;&nbsp;Delete
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Update/Insert Modal -->
	<div id="update-row-modal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="material-icons edit">icon-edit</i>
						<!-- &#xe014; -->
					</div>
					<h4 class="modal-title">Update Product</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<sf:form method="POST" modelAttribute="product" id="update-product">
						<sf:hidden path="code" id="code"/>
						<sf:hidden path="id" id="id"/>
						<div class="form-group">
							<label>Product Name</label>
							<sf:input path="name" type="text" id="name" class="form-control"/>
							<sf:errors path="name" />
						</div>
						<div class="form-group">
							<label>Product Brand</label>
							<sf:input path="brand" type="text" id="brand" class="form-control"/>
							<sf:errors path="brand" />
						</div>
						<div class="form-group">
							<label>Product Unit Price</label>
							<sf:input path="unitPrice" type="text" id="price" class="form-control"/>
							<sf:errors path="unitPrice" />
						</div>
						<div class="form-group">
							<label>Quantity</label>
							<sf:input path="quantity" type="text" id="quantity" class="form-control"/>
							<sf:errors path="quantity" />
						</div>
						
						<sf:button type="submit" class="btn btn-primary">
							<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;Update
						</sf:button>
					</sf:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>

	<script>
		var $table = $('#productListTable');
		if ($table.length) {
			$table
					.DataTable({
						lengthMenu : [
								[ 3, 5, 10, -1 ],
								[ '3 Records', '5 Records', '10 Records', 'ALL' ] ],
						pageLength : 5,
						ajax : {
							url : window.contextRoot
									+ '/json/data/all/products',
							dataSrc : ''
						},
						columns : [
								{
									data : 'name',
								},
								{
									data : 'brand'
								},
								{
									data : 'unitPrice',
									mRender : function(data, type, row) {
										return '&#8377; ' + data
									}
								},
								{
									data : 'quantity'
								},
								{
									data : 'id',
									orderable : false,
									mRender : function(data, type, row) {
										return '<button class="btn btn-primary update" id='+data+' data-toggle="modal" data-target="#update-row-modal"><span class="glyphicon glyphicon-edit"></span></button>'
												+ '&nbsp;&nbsp;<button class="btn btn-danger delete" id='+data+' data-toggle="modal" data-target="#delete-row-modal"><span class="glyphicon glyphicon-remove-circle"></span></button>'
									}
								} ]
					});
		};

		$(document).ready(
				function() {
					//deleting a product
					$(document).on(
							'click',
							'.delete',
							function() {
								var product_id = $(this).attr('id');
								$('#delete-product').attr(
										'action',
										window.contextRoot + '/delete/'
												+ product_id + '/product');
							});
					$('#delete-product').on(
							'submit',
							function(event) {
								event.preventDefault();
								$.ajax({
									url : $('#delete-product').attr('action'),
									method : 'post',
									success : function() {
										$('#productListTable').DataTable().ajax
												.reload();
									}
								});
								event.stopPropagation();
								$("#delete-row-modal").modal('hide');
							});

					//updating a product

					$(document).on(
							'click',
							'.update',
							function() {
								var product_id = $(this).attr('id');
								$.ajax({
									url : window.contextRoot + '/product/'
											+ product_id,
									method : 'GET',
									dataType : 'json',
									success : function(data) {
										$('#name').val(data.name);
										$('#brand').val(data.brand);
										$('#price').val(data.unitPrice);
										$('#quantity').val(data.quantity);
										$('#code').val(data.code);
										$('#id').val(data.id);
										
										$('#update-product').attr('action', window.contextRoot+'/update/'+product_id+'/product');
									},
									complete: function(){
										console.log('complete');
										$('update-row-modal').modal('show');
									}
								});
							});
					
					/* $('#update-product').on(
							'submit',
							function(event) {
								event.preventDefault();
								$.ajax({
									url : $('#update-product').attr('action'),
									method : 'post',
									data: $('#update-product').serialize(),
									success : function() {
										$('#productListTable').DataTable().ajax
												.reload();
									}
								});
								event.stopPropagation();
								$("#update-row-modal").modal('hide');
							}); */

				});
		/* function deleteRow(event, elt, data) {
			event.preventDefault();
			$("#myModal").modal('show').one('click', '#delete', function(e) {
				console.log('delete');
				$("#myModal").modal('hide');
				console.log('delete2');
				$.ajax({
					url : window.contextRoot + '/delete/' + data + '/product',
					method : 'POST'
				}).done(function(data) {
					$('#productListTable').DataTable().ajax.reload();
				});
			}).one('click', '#cancel', function(e){
				console.log('cancel');
				$('#productListTable').DataTable().ajax.reload();
			});
			
		}; */

		function editRow(elt, data) {
			alert(data);
		};
	</script>
</body>
</html>