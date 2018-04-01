// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import $ from "jquery";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

function update_manage_buttons() {
	$('.manage-button').each( (_, button) => {
		let user_id = $(button).data('user-id');
		let manage = $(button).data('manage');
		console.log(manage, "manage");
		if(manage != "") {
			$(button).text("Unmanage");
		}
		else {
			$(button).text("Manage");
		}
	});
}

function set_manage_button(user_id, value) {
	$('.manage-button').each( (_, button) => {
		if (user_id == $(button).data('user-id')) {
			$(button).data('manage', value);
		}
	});
	update_manage_buttons();
}

function manage(user_id) {
	let text = JSON.stringify({
		manage: {
			manager_id: current_user_id,
			managee_id: user_id
		},
	})

	$.ajax(manage_path, {
		method: "post",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		data: text,
		success: (resp) => { set_manage_button(user_id, resp.data.id); },
	});
}

function unmanage(user_id, manage_id){
	$.ajax(manage_path + "/" + manage_id, {
		method: "delete",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		data: "",
		success: () => { set_manage_button(user_id, ""); },
	});
}


function manage_click(event) {
	let button = $(event.target);
	let manage_id = button.data('manage');
	let user_id = button.data('user-id');

	if (manage_id != "") {
		unmanage(user_id, manage_id);
	}
	else {
		manage(user_id);
	}
}

function toggle(task_id){
	var csrf = document.querySelector("meta[name=csrf]").content;

	let text = JSON.stringify({
		task: {
			task_id: task_id,
			title: "reeee",
			description: "reeee",
			time_taken: "0",
			assigned_to_id: "1",
			is_completed: "true"
		},
	});

	var now = new Date();
	var dateFormat = require('dateformat');
	var time = dateFormat(now, "yyyy-mm-dd hh:MM:ss");
	console.log(time);

	let text2 = JSON.stringify({
		timeblock: {
			task_id: task_id,
			time: time
		}
	});

	$.ajax("/api/v1/timeblocks", {
		method: "POST",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		data: text2,
		success: (resp) => { console.log(resp.data) },
		error: function(e) {
    	console.log(e);
    }
	});
}

function timeblock_click(event){
	let button = $(event.target);
	let task_id = button.data('task-id');
	let timeblocks = button.data('task-timeblocks');

	toggle(task_id);
	location.reload();
}

function init_views() {
	if($('.manage-button')){
		$('.manage-button').click(manage_click);
		update_manage_buttons();
	}
	if($('.timeblock-button')){
		$('.timeblock-button').click(timeblock_click);
	}

	return;
}


$(init_views);
