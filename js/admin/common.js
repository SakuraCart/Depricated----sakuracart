// URL
function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';

	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');
		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}

	return urlVarValue;
}

// remap jQuery to $
(function($){
$(document).ready(function() {

// tabs
$('.vtabs a').tabs();
$('.htabs a').tabs();
$('.langtabs a').tabs();

// Confirm Delete
$('#form').submit(function(){
		if ($(this).attr('action').indexOf('delete',1) != -1) {
				if (!confirm (text_confirm)) {
						return false;
				}
		}
});

// Confirm Uninstall
$('a').click(function(){
		if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall',1) != -1) {
				if (!confirm (text_confirm)) {
						return false;
				}
		}
});

// route
	route = getURLVar('route');
	if (!route) {
		$('#dashboard').addClass('selected');
	} else {
		part = route.split('/');
		url = part[0];
		if (part[1]) {
			url += '/' + part[1];
		}
		$('a[href*=\'' + url + '\']').parents('li[id]').addClass('selected');
	}

// form input
	$('#form input').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#form').submit();
		}
	});

	$('#menu > ul').superfish({
		hoverClass	 : 'sfHover',
		pathClass	 : 'overideThisToUse',
		delay		 : 1000,
		animation	 : {height: 'show'},
		speed		 : 'fast',
		autoArrows	 : false,
		dropShadows	: false,
		disableHI	 : false, /* set to true to disable hoverIntent detection */
		onInit		 : function(){},
		onBeforeShow : function(){},
		onShow		 : function(){},
		onHide		 : function(){}
	});

	$('#menu > ul').css('display', 'block');


});
})(this.jQuery);