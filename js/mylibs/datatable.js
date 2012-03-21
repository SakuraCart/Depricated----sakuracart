// remap jQuery to $
(function($){
$(document).ready(function() {


/* Formatted numbers sorting */
/*
	$.fn.dataTableExt.oSort['formatted-num-asc'] = function(x,y){
		x = parseInt( x.replace(/[^\d\-\.\/]/g,'') );
		y = parseInt( y.replace(/[^\d\-\.\/]/g,'') );
		return x - y;
	}
	$.fn.dataTableExt.oSort['formatted-num-desc'] = function(x,y){
		x = parseInt( x.replace(/[^\d\-\.\/]/g,'') );
		y = parseInt( y.replace(/[^\d\-\.\/]/g,'') );
		return y - x;
	}
*/

/* Initialisation */
/*
l - Length changing
f - Filtering input (search)
t - The table!
i - Information
p - Pagination
r - pRocessing
*/

	$(document).ready(function() {
		$('#datatable').dataTable({
//			"bJQueryUI": true,
			"bStateSave": true, /* to set cookie */
			"sCookiePrefix": "datatable_",
			"sDom": '<"top">t<"bottom"flipr><"clear">',
			"sPaginationType": "full_numbers",
/*
			"fnDrawCallback": function() {
				if (Math.ceil((this.fnSettings().fnRecordsDisplay()) / this.fnSettings()._iDisplayLength) > 1)  {
					$('.bottom').css("display", "block");
				} else {
					$('.bottom').css("display", "none");
				}
			}
*/
		});
	} );


});
})(this.jQuery);

/*
			"aoColumnDefs": [ {
				"sType": "formatted-num",
				"aTargets": [1,2,3,4,5]
			} ]
*/