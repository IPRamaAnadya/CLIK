<?php 
require 'functions.php';
$aksi = $_GET['aksi'];

if ($aksi == 'produkrequest') {
	$value = $_GET['value'];
	$id = $_GET['produkid'];
	if ($value == 'tolak') {
		mysqli_query($db, 'UPDATE produk SET produk_status ="nonaktif" WHERE produk_id='.$id);
	}
	else if($value == 'terima'){
		mysqli_query($db, 'UPDATE produk SET produk_status ="aktif" WHERE produk_id='.$id);
	}

}

if ($aksi == 'update') {
	$id = $_GET['id'];
	$value = $_GET['value'];
	if ($value == 'terima') {
		mysqli_query($db, 'UPDATE produk_aktif SET paktif_status ="Aktif" WHERE paktif_id='.$id);
		header('Location: profil.php');
		exit;
	}
	else if ($value == 'tolak') {
		mysqli_query($db, 'UPDATE produk_aktif SET paktif_status ="Tidak Aktif" WHERE paktif_id='.$id);
		header('Location: profil.php');
		exit;
	}
}


if($aksi == 'pesan'){
	$id = $_GET['id']; 
	$user = $_GET['user'];

	$result = mysqli_query($db, "SELECT * FROM produk_aktif WHERE user_id =".$user);
	// var_dump(mysqli_fetch_assoc($result)); return false;
	if (mysqli_fetch_assoc($result)) {
		echo "<script> alert('Kamu sudah mengikuti kursus ini'); document.location.href = 'detail.php?id=1';
		 </script>";
		return false;
	}

	if (transaksi($user, $id)>0) {
	    if(updatepaktif($user, $id)>0){
		      echo "
		      <script>
		      alert('Pemesanan Berhasil! Pihak kursus akan segera menghubungimu');
		      document.location.href = 'detail.php?id=1';
		      </script>
		    ";
	    }
  }
}
?>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

</body>
</html>