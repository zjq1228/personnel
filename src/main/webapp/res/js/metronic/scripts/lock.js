var Lock = function() {
	return {
		// main function to initiate the module
		init : function() {
			$.backstretch([ "page/static/js/metronic/img/bg/1.jpg", "page/static/js/metronic/img/bg/2.jpg", "page/static/js/metronic/img/bg/3.jpg", "page/static/js/metronic/img/bg/4.jpg" ], {
				fade : 1000,
				duration : 8000
			});
		}
	};
}();