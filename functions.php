<?php 
$db = mysqli_connect("localhost", "root", "", "clik");

function query ($query){
	global $db;
	$result = mysqli_query( $db, $query );
	$rows = [];
	while ($row=mysqli_fetch_assoc($result)) {
		$rows[] = $row;
	}
	return $rows;
}

function tambahproduk ($data,$id){
	global $db;
	$nama = htmlspecialchars($data["nama"]);
	$lokasi = htmlspecialchars($data["lokasi"]);
	$kategori = htmlspecialchars($data["kategori"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$harga = htmlspecialchars($data["harga"]);

	//upload gambar
	$gambar = aplodproduk();

	if(!$gambar){
		return false;
	}

	$query = "INSERT INTO produk VALUES ('','$nama','$id','$lokasi','$kategori','$harga','$deskripsi','$gambar','pending')";

	mysqli_query($db, $query);

	return mysqli_affected_rows($db);
 }

function registrasi($data){
	global $db; 

	$username = strtolower(stripcslashes($data["nama"]));
	$email = strtolower(stripcslashes($data["email"]));
	$level = htmlspecialchars($data["level"]);
	$password = mysqli_real_escape_string($db, $data["password1"]);
	$password2 = mysqli_real_escape_string($db, $data["password2"]);
	$jk = htmlspecialchars($data["jk"]);


	// cek username

	$result = mysqli_query($db, "SELECT user_username FROM user WHERE user_username = '$username'");

	if (mysqli_fetch_assoc($result)) {
		echo "<script> alert('Username sudah terdaftar') </script>";
		return false;
	}

	// cek confirm pass
	if ($password !== $password2) {
		echo "<script> alert('Password tidak sesuai') </script>";
		return false;
	}

	//enkripsi password
	$password = password_hash($password, PASSWORD_DEFAULT);

	//insert into database
	mysqli_query($db, "INSERT INTO user VALUES('','$username','$email','$password','$level','1.jpg','$jk')");

	return mysqli_affected_rows($db); 

}

function transaksi ($user, $produk){
	global $db;

	$query = "INSERT INTO transaksi VALUES ('',$user,$produk,NOW())";

	mysqli_query($db, $query);

	return mysqli_affected_rows($db);
 }

 function updatepaktif ($user, $produk){
	global $db;

	$query = "INSERT INTO produk_aktif VALUES ('',$produk,'', '', 'Pending',$user)";

	mysqli_query($db, $query);

	return mysqli_affected_rows($db);
 }

function ubahproduk($data, $id){
 	global $db;
 	$nama = htmlspecialchars($data["nama"]);
	$kategori = htmlspecialchars($data["kategori"]);
	$lokasi = htmlspecialchars($data["lokasi"]);
	$deskripsi = htmlspecialchars($data["deskripsi"]);
	$harga = htmlspecialchars($data["harga"]);
	$gambarlama = htmlspecialchars($data["foto"]);

	// cek 
	if($_FILES["gambar"]["error"] === 4 ){
		$gambar = $gambarlama;
	} else {
		$gambar = aplodproduk(); 	
	}
 	$query = "UPDATE produk SET produk_name = '$nama', lokasi_id = '$lokasi', kategori_id ='$kategori', produk_deskripsi = '$deskripsi', produk_harga = $harga, produk_pic = '$gambar' WHERE produk_id =$id";

 	mysqli_query($db, $query);

	return mysqli_affected_rows($db);
 }

function ubahprofileuser($data, $id){
 	global $db;
 	$nama = htmlspecialchars($data["nama"]);
	$username = htmlspecialchars($data["Username"]);
	$email = htmlspecialchars($data["email"]);
	$alamat = htmlspecialchars($data["alamat"]);
	$gambarlama = htmlspecialchars($data["foto"]);

	// cek 
	if($_FILES["gambar"]["error"] === 4 ){
		$gambar = $gambarlama;
	} else {
		$gambar = aplodprofile(); 	
	}
 	$query = "UPDATE user SET user_username = '$username', user_email = '$email', user_foto ='$gambar' WHERE user_id =$id";

 	mysqli_query($db, $query);

	return mysqli_affected_rows($db);
 }

 function ubahprofileduser($data, $id){
 	global $db;
 	$nama = htmlspecialchars($data["nama"]);
	$username = htmlspecialchars($data["Username"]);
	$email = htmlspecialchars($data["email"]);
	$alamat = htmlspecialchars($data["alamat"]);
	$gambarlama = htmlspecialchars($data["foto"]);
	$telp = htmlspecialchars($data["telp"]);

	// cek 
	if($_FILES["gambar"]["error"] === 4 ){
		$gambar = $gambarlama;
	} else {
		$gambar = aplodprofile(); 	
	}
 	$query = "UPDATE detail_user SET duser_name = '$nama', duser_alamat = '$alamat', duser_telp = '$telp' WHERE user_id =$id";

 	mysqli_query($db, $query);

	return mysqli_affected_rows($db);
 }

 function aplodprofile(){
	$namafile = $_FILES["gambar"]["name"];
	$ukuranfile = $_FILES["gambar"]["size"];
	$error = $_FILES["gambar"]["error"];
	$tmpname = $_FILES["gambar"]["tmp_name"];

	//cek gambar yang diaplod
	$gambarvalid = ['jpg'];
	$format = strtolower (pathinfo($namafile, PATHINFO_EXTENSION));

	if(!in_array($format, $gambarvalid)){
		echo "<script> alert('Format upload jpg'); </script>";
		return false;
	}
	if($ukuranfile >10000000){
		echo "<script> alert('Ukuran file terlalu besar'); < /script>";
		return false;
	}

	$namafilebaru = uniqid();
	$namafilebaru .= ".";
	$namafilebaru .= $format;

	move_uploaded_file($tmpname, 'img/profile/'.$namafilebaru);

	return $namafilebaru;
	

}

function aplodproduk(){
	$namafile = $_FILES["gambar"]["name"];
	$ukuranfile = $_FILES["gambar"]["size"];
	$error = $_FILES["gambar"]["error"];
	$tmpname = $_FILES["gambar"]["tmp_name"];

	//cek gambar yang diaplod
	$gambarvalid = ['jpg'];
	$format = strtolower (pathinfo($namafile, PATHINFO_EXTENSION));

	if(!in_array($format, $gambarvalid)){
		echo "<script> alert('Format upload jpg'); </script>";
		return false;
	}
	if($ukuranfile >10000000){
		echo "<script> alert('Ukuran file terlalu besar'); < /script>";
		return false;
	}

	$namafilebaru = uniqid();
	$namafilebaru .= ".";
	$namafilebaru .= $format;

	move_uploaded_file($tmpname, 'img/produk/'.$namafilebaru);

	return $namafilebaru;
	

}


 ?>