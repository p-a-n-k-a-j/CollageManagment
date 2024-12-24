/**
 * 
 */

// I need to check the name is enter is correct or not

window.onload = function () {
    var errorMessageDiv = document.getElementById('errorMessage');
    if (errorMessageDiv && !errorMessageDiv.textContent.trim()) {
        errorMessageDiv.style.display = 'none';
    }
}

const fname = document.getElementById("name");
fname.addEventListener("keypress", function (event) {
    // Check if the pressed key is not a valid letter
    if (!/[A-Za-z\s]/.test(event.key)) {
        alert("Name should only contain letters and spaces.");
        event.preventDefault(); // Prevent invalid character from being added
    }
});


const input_field= document.getElementById('pass');
const hide = document.getElementById('hide');
const view = document.getElementById('view');

hide.addEventListener("click", function(){
	hide.style.display='none';
	view.style.display='block';
	input_field.type='text';
	
});
view.addEventListener("click", function(){
	hide.style.display='block';
	view.style.display='none';
	input_field.type='password';
});

// this is for second pass that is confirm pass
const input_field2= document.getElementById('pass2');
const hide2 = document.getElementById('hide2');
const view2 = document.getElementById('view2');
hide2.addEventListener("click", function(){
	hide2.style.display='none';
	view2.style.display='block';
	input_field2.type='text';
	
});
view2.addEventListener("click", function(){
	hide2.style.display='block';
	view2.style.display='none';
	input_field2.type='password';
});

const errorMessage = document.getElementById('error-message');
//now validate password here 
function validate(){
const password = document.getElementById('pass').value;
const confi_pass = document.getElementById('pass2').value;


	// Clear previous error messages
          errorMessage.textContent = "";
    // Validation: Check password conditions
    if (password.length < 8) {
        errorMessage.textContent = "Password must be at least 8 characters long.";
        event.preventDefault(); // Prevent form submission
        return false;
    }
	

    if (!/[A-Z]/.test(password)) {
        errorMessage.textContent = "Password must contain at least one uppercase letter.";
        event.preventDefault(); // Prevent form submission
        return false;
    }

    if (!/[0-9]/.test(password)) {
        errorMessage.textContent = "Password must contain at least one number.";
        event.preventDefault(); // Prevent form submission
        return false;
    }

	// Validation: Check if password matches confirm password
	if (password !== confi_pass) {
	    errorMessage.textContent = "Incorrect password.";
	    event.preventDefault(); // Prevent form submission
	    return false;
	}

	// Add a delay before submission
	   event.preventDefault(); // Stop immediate submission
	   errorMessage.style.color='green';
	  errorMessage.textContent = "Processing, please wait...";
	  alert("Hey You need this password for login...");
	event.preventDefault();// stop immediately to submit
	setTimeout(() => {
		document.getElementById("form").submit();
	}, 3000);
    return true; // Allow form submission
}


const email = document.getElementById('email');
const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
let typingTimer; // Timer variable for debounce
const typingDelay = 1000; // Delay time in milliseconds (e.g., 1 second)


email.addEventListener("input", function(){
	
	//clear an existing timeOut
	clearTimeout(typingTimer)
	// Show "checking email..." message
	 errorMessage.style.color = 'blue';
	 errorMessage.textContent = "Checking email...";
	 
	typingTimer=setTimeout(() => {
	if(!emailRegex.test(email.value)){
		errorMessage.style.color='red';
			errorMessage.textContent="Invalid Email";
			
			
		}else{
			errorMessage.textContent="";
		errorMessage.style.color='green';
		errorMessage.textContent="valid email";
		}
	}, typingDelay);
		
	
});


// here I check role and display field accordingly

const selectedRole = document.getElementById('selected');
const studentCredential = document.getElementById('student');
const facultyCredential = document.getElementById('faculty');

		
selectedRole.addEventListener("change", function(){
	let selectedValue = document.getElementById('selected').value;

	if(selectedValue.trim() === 'Student'){
		studentCredential.style.display='block';
		facultyCredential.style.display='none';
	}
	else if(selectedValue.trim() === 'Faculty'){
		studentCredential.style.display='none';
		facultyCredential.style.display='block';
	}
	
	else{
		facultyCredential.style.display='none';
		studentCredential.style.display='none';
	}
	
});



