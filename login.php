<?php 

session_start();
if (isset($_SESSION['login'])) {
	header('Location: index.php');
	exit;
} 

require 'functions.php';

if (isset($_POST["login"])) {
	$username = $_POST["username"];
	$password = $_POST["password"];

	$result = mysqli_query($db, "SELECT * FROM user WHERE user_username = '$username'");

	//cek username
	if ( mysqli_num_rows($result) === 1) {
		
		// cek password
		$row = mysqli_fetch_assoc($result);
		if(password_verify($password, $row["user_password"])){
			//set session
			$_SESSION['login'] = true;
			$_SESSION['username'] = $row['user_username'];
			$_SESSION['id'] = $row['user_id'];
			header('Location: index.php');
			exit;
		}
	}
	$error = true;
}



 ?>

<html>
	<head>
	<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/style.css">
	<title>Login</title>
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
										Login
									</div>
								</div>
								<div class="icon-user">
									<h4 class="ti-home"></h4>
								</div>
								<div class="card-body">
									<form method="post" action="">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="ti-email"></i></span>
											</div>
											<input type="text" class="form-control input-login" name="username" placeholder="Username">
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="ti-lock"></i></span>
											</div>
											<input type="password" name="password" class="form-control input-login" placeholder="Kata sandi">
										</div>
											<a href="register.php">Belum Punya Akun?</a>
										<div class="col text-center">
											<button type="submit" name="login" class="btn btn-primary float-right">Masuk <i class="ti-angle-double-right" style="font-size: 12px"></i></button>
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
</html>