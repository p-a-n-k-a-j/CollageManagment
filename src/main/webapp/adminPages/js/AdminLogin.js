/**
 * 
 */

window.onload=function(){
	var errorMessageDiv = document.getElementById('errorMessage');
	if(errorMessageDiv && !errorMessageDiv.textContent.trim()){
		errorMessageDiv.style.display='none';
	}
}

const right_arrow = document.getElementById('right-arrow');
const input_field = document.getElementById('input-pass');
const hide = document.getElementById('hide');
const view = document.getElementById('view');
input_field.addEventListener("input", function(){
	if(input_field.value.length>0){
		right_arrow.style.display='block';
		hide.style.display='block';
		hide.addEventListener("mousedown", function(){
			hide.style.display='none';
			view.style.display='block';
			input_field.type='text';
		});
		view,document.addEventListener("mouseup", function(){
			hide.style.display='block';
			view.style.display='none';
			input_field.type='password';
		});
	}else{
		right_arrow.style.display='none';
		hide.style.display='none';
	}
	
});

