<%@tag description="User management" pageEncoding="UTF-8" %>
<%
	String mId = request.getParameter("id");
	int id = 0;
	if (mId != null) {
		id = Integer.parseInt(mId);
	}
%>
<a href=""><strong><i
		class="glyphicon glyphicon-tags"></i> Product stock level</strong></a>
	<hr>
	<script id="action-product-transfer" type="text/x-handlebars-template">
	  <div class="row" style="width:470px;">
		<div class="col-lg-8">
	  <div class="input-group">
	    <span class="input-group-btn">
	  		<button pid="{{productId}}" fid="{{wareHouseId}}" class="btn btn-primary btn-transfer-amount btn-sm"><span class="glyphicon glyphicon-send" aria-hidden="true"></span></button>
	  	</span>
	    <input type="text" class="form-control input-sm" placeholder="Number of product">
	    <span class="input-group-addon total-miles">
	    </span>
	  </div>
	  </div>
	  <div class="col-lg-4">
	  <div class="input-group">
		<select class="selWarehouse form-control input-sm" style="width:120px;" lid="{{locationId}}">
	    	{{{ options }}}
	    </select></div>
	    </div>
	    </div>
	</script>
	<script id="action-product-add" type="text/x-handlebars-template">
		<div class="input-group" style="width:200px;">
			<span class="input-group-btn">
					<button pid="{{productId}}" fid="{{wareHouseId}}" type="button" class="btn btn-primary btn-add-amount btn-sm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
				</span>
			<input type="text" class="form-control input-sm" placeholder="Number of product">
		</div>
	</script>
	<div class="row">
	<div class="col-md-12">
			<div class="table-responsive" id="tableContainerWarehouse">
			</div>
			
		</div>
	</div>
	<hr>
	<a href=""><strong><i
		class="glyphicon glyphicon-list-alt"></i> Transfer history</strong></a>
	<hr>
	<div class="row">
		<div class="col-md-12">
			
			 <div class="table-responsive" id="tableContainer">
			</div>
		</div>
	</div>
	<script>
		var TableData = {
			saveUrl: App.contextPath + "/json/product-transfer/save",
			deleteUrl: App.contextPath + "/json/product-transfer/delete",
			findUrl: App.contextPath + "/json/product-transfer/find",
			listUrl : App.contextPath + "/json/product-transfer/listbyproduct?id=<%=id%>",
			init: function() {
				var self = this;
				$('body').on('click', '.btn-transfer-amount', function() {
					var $this = $(this);
					var $input = $(this).parent().parent().find('input');
					var $select = $(this).parent().parent().parent().parent().find('select');
					var $option = $select.find(':selected');
					var amount = parseInt($input.val());
					$.ajax({
				        type: "POST",
				        url: TableData.saveUrl,
				        contentType: "application/json",
			   	        dataType: "json",
			   	        data: JSON.stringify({
			   	        	id: -1,
			   	        	productId: parseInt($this.attr('pid')),
			   	        	fromWareHouseId: parseInt($this.attr('fid')),
			   	        	toWareHouseId: parseInt($select.val()),
			   	        	totalMiles: $select.attr('miles'),
			   	        	quantity: amount,
			   	        	status: 0
			   	        })
				    }).done(function( data ) {
				        if (data)
				        {
				        	self.reloadData();
				        	App.loadTableData();
				        	swal("Create new pending transfer successfully!", "", "success");
				        } else {
				            swal("Error!", "Could not complete", "warning");
				        }
				    }).error(function() {
				    	swal("Error!", "Could not complete", "warning");
				    });
			    });
				
				$('body').on('click', '.btn-action', function() {
					var $this = $(this);
					$.ajax({
				        type: "GET",
				        url: App.contextPath + "/json/product-transfer/updatestatus",
				        contentType: "application/json",
			   	        dataType: "json",
			   	        data: {
			   	        	id: parseInt($this.attr('item-id')),
			   	        	status: parseInt($this.attr('item-status')) + 1
			   	        }
				    }).done(function( data ) {
				        if (data)
				        {
				        	self.reloadData();
				        	App.loadTableData();
				        } else {
				            swal("Error!", "Could not complete", "warning");
				        }
				    }).error(function() {
				    	swal("Error!", "Could not complete", "warning");
				    });
			    });
				$('body').on('change', '.selWarehouse', function(e) {
					self.updateDistance(e.target);
				});
				$('body').on('click', '.btn-add-amount', function() {
					var $this = $(this);
					var $input = $(this).parent().parent().find('input');
					var amount = parseInt($input.val());
					$.ajax({
				        type: "GET",
				        url: App.contextPath + "/json/product-warehouse/add-amount",
				        contentType: "application/json",
			   	        dataType: "json",
			   	        data: {
			   	        	pid: parseInt($this.attr('pid')),
			   	        	fid: parseInt($this.attr('fid')),
			   	        	amount: amount
			   	        }
				    }).done(function( data ) {
				        if (data)
				        {
				        	self.reloadData();
				        	swal("Added successfully!", "", "success");
				        } else {
				            swal("Error!", "Could not complete", "warning");
				        }
				    }).error(function() {
				    	swal("Error!", "Could not complete", "warning");
				    });
			    });
				
				this.reloadData();
			},
			updateDistance: function(sel) {
				var $option = $(sel).find(':selected');
				var lid = $option.attr('lid');
				$.ajax({
			        type: "GET",
			        url: App.contextPath + "/json/xml/distance/calculate",
		   	        dataType: "xml",
		   	        data: {
		   	        	town1: parseInt(lid),
		   	        	town2: parseInt($(sel).attr('lid'))
		   	        }
			    }).done(function( data ) {
			        if (data)
			        {
			        	var miles = $(data).find('DistanceInMiles').text();
			        	$(sel).attr('miles',miles);
			        	$(sel).parent().parent().parent().find('.total-miles').html(miles + ' miles');
			        } else {
			            swal("Error!", "Could not load distance", "warning");
			        }
			    }).error(function() {
			    	swal("Error!", "Could not load distance", "warning");
			    });
			},
			parseTableRow: function(data) {
				if (data.length > 0) {
					var i;
					for (i = 0; i< data.length; i++) {
						data[i].actionAdd = Handlebars.compile($("#action-product-add").html())({
							productId : data[i].productId,
							wareHouseId : data[i].wareHouseId,
						});
						var options = [];
						var j;
						for (j = 0; j < data.length; j++) {
							if (data[j].wareHouse.id != data[i].wareHouseId) {
								options.push('<option lid="' + data[j].wareHouse.locationId + '" value="' + data[j].wareHouse.id + '">' + data[j].wareHouse.name + '</option>');
							}
						}
						
						data[i].actionTransfer = Handlebars.compile($("#action-product-transfer").html())({
							productId : data[i].productId,
							wareHouseId : data[i].wareHouseId,
							locationId: data[i].wareHouse.locationId,
							options: options.join('')
						});
					}
				}
				return data;
			},
 			reloadData: function() {
				var self = this;
				$.ajax({
			        type: "GET",
			        url: App.contextPath + "/json/product-warehouse/listbyproduct?id=<%=id%>",
			        contentType: "application/json",
		   	        dataType: "json",
			    }).done(function( data ) {
			        if (typeof data != 'undefined')
			        {
			           $('#tableContainerWarehouse').empty();
			           $('#tableContainerWarehouse').html('<table class="table" id="tableDataWarehouse"></table>');
			           $("#tableDataWarehouse").DataTable( {
			        	    data: self.parseTableRow(data),
			        	    columns: [
								{ data: 'wareHouse.name', title: 'Warehouse'},
								{ data: 'stockLevel', title: 'Stock level'},
								{ data: 'actionAdd', title: 'Add product'},
								{ data: 'actionTransfer', title: 'Transfer product'}
							]
			        	} );
			           $('.selWarehouse').each(function() {
			        	   self.updateDistance(this);
			           });
			        } else {
			            swal("Error!", "Could not load " + TableData.name + " information", "warning");
			        }
			    }).error(function() {
			    	swal("Error!", "Could not load " + TableData.name + " information", "warning");
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
					data[i].strTransferedDate = (typeof data[i].transferedDate == 'undefined' || data[i].transferedDate <= 0) 
						? "" 
						: new Date(data[i].transferedDate).customFormat("#DD#/#MM#/#YYYY#");
					data[i].strDepartureDate = (typeof data[i].departureDate == 'undefined' || data[i].departureDate <= 0) 
							? "" 
							: new Date(data[i].departureDate).customFormat("#DD#/#MM#/#YYYY#");
					data[i].strStatus = '<button type="button" disabled="disabled" class="btn btn-xs btn-';
					var btnCommands = [];
					if (data[i].status == 0) {
						data[i].strStatus += 'warning">PENDING';
						
				        btnCommands.push('<button type="button"  item-status="' + data[i].status + '" item-id="' + data[i].id + '" class="btn btn-info btn-action btn-xs">');
				        btnCommands.push('<span class="glyphicon glyphicon-send" aria-hidden="true"></span>');
				        btnCommands.push(' Transfer');
				        btnCommands.push('</button>');
				        
					} else if (data[i].status == 1) {
						data[i].strStatus += 'info">TRANSFERING';
						
						btnCommands.push('<button type="button"  item-status="' + data[i].status + '" item-id="' + data[i].id + '" class="btn btn-primary btn-action btn-xs">');
				        btnCommands.push('<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>');
				        btnCommands.push(' Done');
				        btnCommands.push('</button>');
					} else if (data[i].status == 2) {
						data[i].strStatus += 'primary">DONE';
					}
					data[i].strStatus += '</button>';
					
					data[i].action = btnCommands.join("");
				}
				return data;
			},
			name : "Product detail",
			columns : [
				{data: "id", title: "ID"},
				{data: "fromWareHouse.name", title: "From warehouse"},
				{data: "toWareHouse.name", title: "To warehouse"},
				{data: "strTransferedDate", title: "Transfered date"},
				{data: "strDepartureDate", title: "Departured Date"},
				{data: "quantity", title: "Quantity"},
				{data: "totalMiles", title: "Scheduled miles"},
				{data: "strStatus", title: "Status"},
				{data: "action", title: ""}
			]
		}
	</script>
