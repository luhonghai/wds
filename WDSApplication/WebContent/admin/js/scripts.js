$(document).ready(function() {
	Date.prototype.customFormat = function(formatString){
	    var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
	    var dateObject = this;
	    YY = ((YYYY=dateObject.getFullYear())+"").slice(-2);
	    MM = (M=dateObject.getMonth()+1)<10?('0'+M):M;
	    MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
	    DD = (D=dateObject.getDate())<10?('0'+D):D;
	    DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][dateObject.getDay()]).substring(0,3);
	    th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
	    formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);

	    h=(hhh=dateObject.getHours());
	    if (h==0) h=24;
	    if (h>12) h-=12;
	    hh = h<10?('0'+h):h;
	    AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
	    mm=(m=dateObject.getMinutes())<10?('0'+m):m;
	    ss=(s=dateObject.getSeconds())<10?('0'+s):s;
	    return formatString.replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
	}
	function enableForm(enable) {
		if (enable) {
    		$("input").prop("disabled", "disabled");
   			$("textarea").prop("disabled", "disabled");
   			$("button").prop("disabled", "disabled");
   			$("radio").prop("disabled", "disabled");
   			$("select").prop("disabled", "disabled");
		} else {
			$("input").prop("disabled", "");
   			$("textarea").prop("disabled", "");
   			$("button").prop("disabled", "");
   			$("radio").prop("disabled", "");
   			$("select").prop("disabled", "");
		}
	}
	//$(".alert").addClass("in").fadeOut(4500);
	/* swap open/close side menu icons */
	$('[data-toggle=collapse]').click(function() {
		// toggle icon
		$(this).find("i").toggleClass("glyphicon-chevron-right glyphicon-chevron-down");
	});
	
	
    $('.datepicker-input').datepicker({
    	autoclose: true
    });
    
    /**
     * Add command column data to row
     * Command cell contain 2 button: Edit & Delete with target attribute is row id
     * @param row object
     * @returns row object with command
     */
    function parseTableRow(data) {
    	if (data.length == 0) return data;
    	var i;
    	for (i = 0; i < data.length; i++) {
	        var btnCommands = [];
	        btnCommands.push('<div class="table-action-group"><button type="button" item-id="' + data[i].id + '" class="btn btn-warning table-action btn-edit btn-xs">');
	        btnCommands.push('<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>');
	        btnCommands.push('Edit');
	        btnCommands.push('</button>');
	        btnCommands.push('<button type="button" item-id="' + data[i].id + '" class="btn btn-danger table-action btn-delete btn-xs">');
	        btnCommands.push('<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>');
	        btnCommands.push('Delete');
	        btnCommands.push('</button></div>');
	
	        data[i].command = btnCommands.join("");
    	}
        return data;
    }
    
    App.loadTableData = function() {
	    if (typeof TableData != 'undefined') {
		    $.ajax({
		        type: "GET",
		        url: TableData.listUrl,
		        contentType: "application/json",
	   	        dataType: "json",
		    }).done(function( data ) {
		        if (typeof data != 'undefined')
		        {
		           $('#tableContainer').empty();
		           $('#tableContainer').html('<table class="table table-striped table-bordered table-hover" id="tableData"></table>');
		           $("#tableData").DataTable( {
		        	    data: parseTableRow(TableData.processData(data)),
		        	    columns: TableData.columns
		        	} );
		        } else {
		            swal("Error!", "Could not load " + TableData.name + " information", "warning");
		        }
		    }).error(function() {
		    	swal("Error!", "Could not load " + TableData.name + " information", "warning");
		    });
	    }
    }
    
    $('body').on('click', '.btn-add', function() {
    	if (typeof TableData != 'undefined') {
    		TableData.showAddForm();
    	}
    });
    $('body').on('click', '.btn-edit', function() {
    	if (typeof TableData != 'undefined') {
    		var _id = $(this).attr("item-id");
    		$.ajax({
		        type: "GET",
		        url: TableData.findUrl,
		        contentType: "application/json",
	   	        dataType: "json",
	   	        data: {
	   	        	id: parseInt(_id)
	   	        }
		    }).done(function( data ) {
		        if (typeof data != 'undefined')
		        {
		        	TableData.showEditForm(data);
		        } else {
		            swal("Error!", "Could not load " + TableData.name + " information", "warning");
		        }
		    }).error(function() {
		    	swal("Error!", "Could not load " + TableData.name + " information", "warning");
		    });
    	}
    });
    $('body').on('click', '.btn-delete', function() {
    	if (typeof TableData != 'undefined') {
    		var _id = $(this).attr("item-id");
    		swal({
                title: "Delete " + TableData.name + " id " + _id + "?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, delete it!",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function (isConfirm) {
                if (isConfirm) {
                	$.ajax({
        		        type: "GET",
        		        url: TableData.deleteUrl,
        		        contentType: "application/json",
        	   	        dataType: "json",
        	   	        data: {
        	   	        	id: parseInt(_id)
        	   	        }
        		    }).done(function( data ) {
        		        if (data)
        		        {
        		        	App.loadTableData();
        		        	swal("Delete " + TableData.name + " id " + _id + " successfully!", "", "success");
        		        } else {
        		            swal("Error!", "Could not delete " + TableData.name + " id " + _id, "warning");
        		        }
        		    }).error(function() {
        		    	swal("Error!", "Could not delete " + TableData.name + " id " + _id, "warning");
        		    });
                }
         });
    	}
    });
    
    $('body').on('click', '.btn-save', function() {
    	if (typeof TableData != 'undefined') {
    		if (TableData.checkForm()) {
	    		$.ajax({
			        type: "POST",
			        url: TableData.saveUrl,
			        contentType: "application/json",
		   	        dataType: "json",
		   	        data: JSON.stringify(TableData.prepareObject())
			    }).done(function( data ) {
			        if (data)
			        {
			        	App.loadTableData();
			        	$("#dataModal").modal("hide");
			        	swal("Save " + TableData.name + " successfully!", "", "success");
			        } else {
			            swal("Error!", "Could not delete " + TableData.name + " id " + _id, "warning");
			        }
			    }).error(function() {
			    	swal("Error!", "Could not delete " + TableData.name + " id " + _id, "warning");
			    });
    		}
    	}
    });
    if (typeof TableData != 'undefined' && typeof TableData.init != 'undefined') {
    	TableData.init();
    }
    App.loadTableData();
});