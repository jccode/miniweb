/**
 * 
 */
define(function (require, exports, module) {
	
	var $ = require('jquery'), 
		util = require('util'), 
		webRoot = util.webRoot;
	require('bootstrap');
	
	var Init = {
		//main
		run: function () {
			for(var fn in Init) {
				if(fn === "run" || fn.startsWith('_')) continue;
				Init[fn].call(window);
			}
		}, 
		
		_formSubmit: function() {
			$("#loginForm").submit(function() {
				var $this = $(this);
				$.post($this.attr("action"), $this.serialize()).done(function(data) {
					if(!data.result) {
						window.alert(data.message);
					} else {
						window.location.href = webRoot;
					}
				});
				
				return false;
			});
		}
	};
	
	
	$(function() {
		Init.run();
	});
});