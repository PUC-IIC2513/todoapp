// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {

	// Validación Form
	$("#inline-task-form .form-title input").keyup(function(event) {
		if($(this).val().length > 0) {
			$("#inline-task-form .submit input").removeAttr('disabled');
		} else {
			$("#inline-task-form .submit input").attr('disabled', 'disabled');
		}

	});

	// request AJAX: mostrar content en consola al hacer hover

	// OJO: cuando agregamos ".tasks" nuevas, esto no va a funcionar porque es un elemento nuevo en el DOM y no tiene 
	// el evento bindeado, por eso lo comentamos:

	// $(".task").hover(function() {
	// 	var task_id = $(this).attr('id');
	// 	$.get('/tasks/'+task_id+'.json', function(data) {
	// 		console.log(data.content);
	// 	});
	// });


	// El siguiente caso usa "burbujeo" del evento y lo reconoce en la raíz del documento, por lo tanto los nuevos tasks
	// agregados por ajax también gatillan la funcionan
	$(document).on('mouseover','.task', function() {
		var task_id = $(this).attr('id');
		$.get('/tasks/'+task_id+'.json', function(data) {
			console.log(data.content);
		});
	});

});