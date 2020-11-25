function validateForm(){
	if (document.forms["formRegistrasi"]["nama"].value == "") {
    document.getElementById("namaHelp").innerHTML = "Nama tidak boleh kosong";
    document.forms["formRegistrasi"]["nama"].focus();
    return false;
    }
    if (document.forms["formRegistrasi"]["email"].value == "") {
    document.getElementById("emailHelp").innerHTML = "Email tidak boleh kosong";
    document.forms["formRegistrasi"]["email"].focus();
    return false;
    }
    if (document.forms["formRegistrasi"]["password1"].value == "") {
    alert("Password tidak boleh kosong");
    document.forms["formRegistrasi"]["password1"].focus();
    return false;
    }
    if (document.forms["formRegistrasi"]["password2"].value == "") {
    alert("Password tidak boleh kosong");
    document.forms["formRegistrasi"]["password2"].focus();
    return false;
    }
    if (document.forms["formRegistrasi"]["password2"].value != document.forms["formRegistrasi"]["password1"].value) {
    alert("Password tidak sama");
    document.forms["formRegistrasi"]["password2"].focus();
    return false;
    }
}