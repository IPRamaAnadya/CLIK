<?php 
require 'functions.php';

if (isset($_POST['submit'])) {
	if (registrasi($_POST)) {
		$id = query('SELECT user_id FROM user ORDER BY user_id DESC LIMIT 1')[0];
		$query = "INSERT INTO detail_user VALUES ('',".$id['user_id'].",'','','');";
		mysqli_query($db, $query); 
		
		  echo "
			<script>
			document.location.href = 'login.php';
			</script>
		";
	}
}



 ?>

<html>
	<head>
		<meta charset="utf-8">
    	<meta content="width=device-width, initial-scale=1" name="viewport">
    	<title>Register</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/themify-icons.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	</head>
	<style type="text/css">
		body{
			background-image: url('img/login.jpg');
            background-repeat: no-repeat;
            background-size: cover;
		}
	</style>	
	<body>
		<div class="container">
			<div class="row justify-content-left mt-12">
				<div class="col-sm-8">
					<div class="row border-box">
						<div class="col-sm-6 p-0">
							<div class="card">
								<div class="card-header">
									<div class="sub-title">
										Register
									</div>
								</div>
								<div class="icon-user">
									<h4 class="ti-user"></h4>
								</div>
								<div class="card-body">
									<form method="post" action="" id="formregister">
										<div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text"><i class="ti-user"></i></span>
										  </div>
										  <!-- Nama -->
										  <input type="text" class="form-control input-login" name="nama" id="nama" placeholder="Nama pengguna" required maxlength="40" minlength="3">
									  </div>
									  <!-- <div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text"><i class="ti-mobile"></i></span>
										  </div>
										  <!-- nomor -->
										  <!-- <input type="number" class="form-control input-login" name="nomor" id="nomor" placeholder="No telepon"> -->
									  <!-- </div> -->
									  <div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text"><i class="ti-email"></i></span>
										  </div>
										  <!-- email -->
										  <input type="text" class="form-control input-login" name="email" id="email" placeholder="Alamat email">
									  </div>
									  <div>
									  	<select name="level" class="form-control form-control-sm">
									  		<option value="3">User</option>
									  		<option value="2">Mitra</option>
									  	</select>
									  </div>
									  <div>
									  	<select name="jk" class="form-control form-control-sm">
									  		<option value="Laki - laki">Laki - laki</option>
									  		<option value="Perempuan">Perempuan</option>
									  	</select>
									  </div>
									  <div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text"><i class="ti-lock"></i></span>
										  </div>
										  <!-- password1 -->
										  <input type="password" class="form-control input-login" name="password1" id="password1" placeholder="Kata sandi">
									  </div>
									  <div class="input-group mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text"><i class="ti-lock"></i></span>
										  </div>
										  <!-- password2 -->
										  <input type="password" class="form-control input-login" name="password2" id="password2" placeholder="Konfirmasi kata sandi">
									  </div>
									  <a href="login.html">Sudah Punya Akun?</a>
									  <div class="col text-center">
									  	<button type="submit" name="submit" class="btn btn-primary float-right">Daftar <i class="ti-angle-double-right" style="font-size: 12px"></i></button>
									  </div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-4 text-center">
					</div>
				</div>
				
			</div>
		</div>
	</body>
	<script type="text/javascript"src="js.js"></script>
</html>