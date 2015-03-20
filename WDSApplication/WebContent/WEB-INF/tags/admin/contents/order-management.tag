<%@tag description="User management" pageEncoding="UTF-8" %>
<a href=""><strong><i
		class="glyphicon glyphicon-user"></i>Order management</strong></a>
	<hr>
	<div class="row">
		<div class="col-md-12">
			 <div class="table-responsive" id="tableContainer">
			</div>
		</div>
	</div>
	<script>
		var TableData = {
			saveUrl: App.contextPath + "/json/order/save",
			deleteUrl: App.contextPath + "/json/order/delete",
			findUrl: App.contextPath + "/json/order/find",
			listUrl : App.contextPath + "/json/order/list",
			init: function() {
				$('body').on('click', '.btn-action', function() {
					var $this = $(this);
					$.ajax({
				        type: "GET",
				        url: App.contextPath + "/json/order/updatestatus",
				        contentType: "application/json",
			   	        dataType: "json",
			   	        data: {
			   	        	id: parseInt($this.attr('item-id')),
			   	        	status: parseInt($this.attr('item-status')) + 1
			   	        }
				    }).done(function( data ) {
				        if (data)
				        {
				        	App.loadTableData();
				        } else {
				            swal("Error!", "Could not complete", "warning");
				        }
				    }).error(function() {
				    	swal("Error!", "Could not complete", "warning");
				    });
			    });
			},
			showAddForm: function() {
				
			},
			showEditForm: function(obj) {
				
			},
			checkForm: function() {
				return true;	
			},
			prepareObject: function() {
				return null;
			},
			processData: function(data) {
				if (data.length == 0) return data;
				var i;
				for (i = 0; i < data.length; i++) {
					data[i].fullName = data[i].customer.firstName + ' ' + data[i].customer.lastName;
					data[i].strCreatedDate = (typeof data[i].createdDate == 'undefined' || data[i].createdDate <= 0) 
							? "" 
							: new Date(data[i].createdDate).customFormat("#DD#/#MM#/#YYYY#");
					data[i].strStatus = '<button type="button" disabled="disabled" class="btn btn-xs btn-';
					var btnCommands = [];
					btnCommands.push('<button type="button"  item-status="' + data[i].orderStatus + '" item-id="' + data[i].id + '" class="btn btn-info btn-action btn-xs">');
					btnCommands.push('<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>');
			        btnCommands.push(' Confirm');
					if (data[i].orderStatus == 0) {
						data[i].strStatus += 'warning">PLACED';
					} else if (data[i].orderStatus == 1) {
						data[i].strStatus += 'success">AWAITING ITEMS';
					} else if (data[i].orderStatus == 2) {
						data[i].strStatus += 'success">BEING PACKED';
					} else if (data[i].orderStatus == 3) {
						data[i].strStatus += 'info">DISPATCHED';
					} else if (data[i].orderStatus == 4) {
						data[i].strStatus += 'primary">DELIVERED';
					}
					btnCommands.push('</button>');
					data[i].strStatus += '</button>';
					if (data[i].orderStatus != 4) {
						data[i].action = btnCommands.join("");
					} else {
						data[i].action = "";
					}
				}
				return data;
			},
			name : "Order",
			columns : [
				{data: "id", title: "ID"},
				{data: "fullName", title: "Customer Name"},
				{data: "customer.email", title: "Email"},
				{data: "customer.phone", title: "Phone"},
				{data: "customer.address", title: "Address"},
				{data: "strCreatedDate", title: "Created date"},
				{data: "strStatus", title: "Status"},
				{data: "action", title: ""}
			]
		}
	</script>
