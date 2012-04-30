var total_sources_used = 0;
var current_source = -1;
var next_source = -1
var submit_button_pressed = false;

function create_nested_attributes(source_id, familiarity, utility, accessibility, trust){
	var nested_attributes = '<input name="search[source_evaluations_attributes][' + total_sources_used + '][source_id]"     type="hidden" value="' + source_id + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][familiarity]"   type="hidden" value="' + familiarity + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][utility]"       type="hidden" value="' + utility + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][accessibility]" type="hidden" value="' + accessibility + '">';	
	   nested_attributes += '<input name="search[source_evaluations_attributes][' + total_sources_used + '][trust]"         type="hidden" value="' + trust + '">';
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
	current_source = next_source;
	next_source = source_id;
};

function finish_modal(){
	var utility = $("#modalPopUp .modal-body div .selected_x").get(0);
	var accessibility = $("#modalPopUp .modal-body div .selected_x").get(1);
	var trust = $("#modalPopUp .modal-body div .selected_x").get(2);
	var familiarity = $("#modalPopUp .modal-body div .selected_x").get(3);
	
	if (utility && accessibility && trust && familiarity){
		create_nested_attributes(current_source, $(familiarity).data('value'), $(utility).data('value'), $(accessibility).data('value'), $(trust).data('value'));
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
		if (next_source != -1) {
			bring_up_modal();
			submit_button_pressed = true;
			return false;
		}else{
			return true;
		}
	});
});