var total_sources_used = 0;
var current_source = -1;
var next_source = -1
var submit_button_pressed = false;

var time0 = -1;
var time1 = -1;

function create_nested_attributes(source_id, familiarity, utility, accessibility, trust, time_spent){
	var nested_attributes = '<input name="search[source_evaluations_attributes][' + total_sources_used + '][source_id]"     type="hidden" value="' + source_id + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][familiarity]"   type="hidden" value="' + familiarity + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][utility]"       type="hidden" value="' + utility + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][accessibility]" type="hidden" value="' + accessibility + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][trust]"         type="hidden" value="' + trust + '">';
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][time_spent]"    type="hidden" value="' + time_spent + '">';
	$(".container form").first().append(nested_attributes);
	total_sources_used += 1;
};

function bring_up_modal(){
	$("#modalPopUp").modal({ backdrop: 'static', keyboard: false });
};

function set_current_source(source_id){
	$(".source_page").bind('click', function(){
		bring_up_modal();
	});
	
	time0 = time1;
	time1 = new Date().getTime();
	
	current_source = next_source;
	next_source = source_id;
	$(".sources .source").addClass("hidden");
	$(".sources #source" + source_id).removeClass("hidden");
};

function finish_modal(){
	var utility = $("#modalPopUp .modal-body div .selected_x").get(0);
	var accessibility = $("#modalPopUp .modal-body div .selected_x").get(1);
	var trust = $("#modalPopUp .modal-body div .selected_x").get(2);
	var familiarity = $("#modalPopUp .modal-body div .selected_x").get(3);
	var time_spent = time1 - time0;
	
	if (utility && accessibility && trust && familiarity){
		create_nested_attributes(current_source, $(familiarity).data('value'), $(utility).data('value'), 
																						 $(accessibility).data('value'), $(trust).data('value'), time_spent);
		$(".selected_x").html(".");
		$(".selected_x").removeClass("selected_x");
		$("#modalPopUp").modal('hide');
		if (submit_button_pressed) {
			$($("form")[0]).submit();
		}
	}
	else{
		alert("Please make sure you've answered all of the questions.")
	}
};

$(function(){
	$(".source_submit").click(function(){
		current_source = next_source;
		
		time0 = time1;
		time1 = new Date().getTime();
		
		if (next_source != -1) {
			bring_up_modal();
			submit_button_pressed = true;
			return false;
		}else{
			return true;
		}
	});
});