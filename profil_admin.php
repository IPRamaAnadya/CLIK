<?php 
session_start();
if (!isset($_SESSION['login'])) {
    header('Location: login.php');
    exit;
} 

require 'functions.php';

$id = $_GET["id"];

$user = query('SELECT user.user_jk AS jk, user.user_foto AS foto, detail_user.duser_name AS nama, user.user_username AS username, user.user_level AS `level` ,user.user_email AS email, detail_user.duser_alamat AS alamat, detail_user.duser_telp AS telepon FROM detail_user INNER JOIN user ON user.user_id = detail_user.user_id WHERE user.user_id ='.$id)[0];

$produk = query('SELECT produk.produk_id AS id, produk.produk_name AS namaproduk, detail_user.duser_name AS namapemilik, lokasi.lokasi_name AS lokasi, kategori.kategori_name AS kategori, produk.produk_deskripsi AS deskripsi, produk.produk_harga AS harga FROM produk INNER JOIN lokasi ON lokasi.lokasi_id = produk.lokasi_id INNER JOIN kategori ON kategori.kategori_id = produk.produk_id INNER JOIN detail_user ON detail_user.user_id = produk.user_id WHERE produk.produk_status = "aktif";');

$produkrequest = query('SELECT produk.produk_id AS id, produk.produk_name AS namaproduk, detail_user.duser_name AS namapemilik, lokasi.lokasi_name AS lokasi, kategori.kategori_name AS kategori, produk.produk_deskripsi AS deskripsi, produk.produk_harga AS harga FROM produk INNER JOIN lokasi ON lokasi.lokasi_id = produk.lokasi_id INNER JOIN kategori ON kategori.kategori_id = produk.produk_id INNER JOIN detail_user ON detail_user.user_id = produk.user_id WHERE produk.produk_status = "pending";');

$alluser = query('SELECT user.user_jk AS jk, user.user_foto AS foto, detail_user.duser_name AS nama, user.user_username AS username, user.user_level AS level,user.user_email AS email, detail_user.duser_alamat AS alamat, detail_user.duser_telp AS telepon FROM detail_user INNER JOIN user ON user.user_id = detail_user.user_id');






$level = $user['level'];

 ?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>

<style>
    body {
        background-color: #f3f3f3;
    }
    .side-nav .side {
        background-color: white; 
        margin: 10px; 
        border-radius: 20px;
        padding: 10px;
        margin-top: 70px;
        margin-bottom: 30px;
    }
    .photo-profile {
        width: 30%;
        border-radius: 50px;
        margin-top: 40px;
        margin-bottom: 20px;
    }
    .side-nav .side .sText {
        color: #696969;
    }
    .profile {
        margin-bottom: 30px;
    }
    .button-profile  {
        padding: 10px 60px 30px;
    }
    .content-profile {
        margin: 10px; 
        padding: 10px;
    }
    .detail-profile {
        background-color: white; 
        margin: 10px; 
        border-radius: 20px;
        padding: 30px;
    }
</style>

<body>
    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="index.php">CLIK</a>
        <a href="logout.php" style="text-decoration: none; font-weight: 700; color: white;">Logout</a>
    </nav>
    <div class="container-fluid" style="padding:0px 80px; margin-left:24px;">
        <div class="row side-nav">
            <div class="col-md-3 side">
                <div class="row">
                    <div class="profile col-md-12">
                        <img src="img\profile\<?php echo $user['foto']; ?>" class="mx-auto d-block photo-profile" alt="<?php echo $user['foto']; ?>">
                        <div class="text-center">
                            <h3 class="text-center"><?php echo $user['nama']; ?></h3>
                            <?php if ($user['level']=='1'): ?>
                                <small class="sText">Admin</small>
                            <?php endif ?>
                            <?php if ($user['level']=='2'): ?>
                                <small class="sText">Mitra</small>
                            <?php endif ?>
                            <?php if ($user['level']=='3'): ?>
                                <small class="sText">Member</small>
                            <?php endif ?>
                        </div>
                    </div>
                    <div class="col-md-12 button-profile float-right">
                        <div class="row">
                            <div class="col-md-12 ">
                                <button type="button" class="btn btn-info btn-block" onclick="window.location.href = 'ubahprofile.php?id=<?php echo($id) ?>'">Ubah profile</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 content-profile">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h3>Detail Profile</h3>
                    </div>
                    <div class="col-md-12 detail-profile">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">Nama</th>
                                    <td><?php echo $user['nama']; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Username</th>
                                    <td><?php echo $user['username']; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Status</th>
                                    <th scope="row">Status</th>
                                    <?php if ($user['level']=='1'): ?>
                                        <td>Admin</td>
                                    <?php endif ?>
                                    <?php if ($user['level']=='2'): ?>
                                        <td>Mitra</td>
                                    <?php endif ?>
                                    <?php if ($user['level']=='3'): ?>
                                        <td>Member</td>
                                    <?php endif ?>
                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><?php echo $user['email']; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Alamat</th>
                                    <td><?php echo $user['alamat']; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Telepon</th>
                                    <td><?php echo $user['telepon']; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Jenis Kelamin</th>
                                    <td><?php echo $user['jk']; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Khusus admin -->

            <!-- Khusus admin -->
        </div>

        <!--Daftar Tempat Kursus-->
        <div class="col-md-12">
            <div class="text-center" style="margin-top: 100px; margin-bottom: 20px;">
                <h3>Daftar Tempat Kursus</h3>
            </div>
        </div>
        <div class="col-md-12" style="padding-left: 15px; padding-right: 6%; margin-top: -5px">
            <div style="background-color: white; border-radius: 20px; padding: 40px;">
                <table class="table">
                        <thead>
                            <th>Nama Kursus</th>
                            <th>Pemilik</th>
                            <th>Lokasi</th>
                            <th>Kategori</th>
                            <th>Harga</th>
                            <th>Deskripsi</th>
                        </thead>
                        <tbody>
                            <?php foreach ($produk as $p): ?>
                                <tr>
                                    <td ><a href="detail.php?id=<?php echo $p['id']; ?>" style='text-decoration: none; color: green; font-weight: 500'><?php echo $p['namaproduk']; ?></a></td>
                                    <td><?php echo $p['namapemilik']; ?></td>
                                    <td><?php echo $p['lokasi']; ?></td>
                                    <td><?php echo $p['kategori']; ?></td>
                                    <td>Rp <?php echo $p['harga']; ?></td>
                                    <td><?php echo $p['deskripsi']; ?></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
            </div>
        </div>

        <!--Tempat Kursus Menunggu untuk Diterima-->
        <div class="col-md-12">
            <div class="text-center" style="margin-top: 100px; margin-bottom: 20px;">
                <h3>Daftar Tempat Kursus yang Menunggu Persetujuan</h3>
            </div>
        </div>
        <div class="col-md-12" style="padding-left: 15px; padding-right: 6%; margin-top: -5px">
            <div style="background-color: white; border-radius: 20px; padding: 40px;">
                <table class="table">
                        <thead>
                            <th>Nama Kursus</th>
                            <th>Pemilik</th>
                            <th>Lokasi</th>
                            <th>Kategori</th>
                            <th>Harga</th>
                            <th>Deskripsi</th>
                            <th>Aksi</th>
                        </thead>
                        <tbody>
                            <?php foreach ($produkrequest as $p): ?>
                                <tr>
                                    <td ><a href="detail.php?id=<?php echo $p['id']; ?>" style='text-decoration: none; color: green; font-weight: 500'><?php echo $p['namaproduk']; ?></a></td>
                                    <td><?php echo $p['namapemilik']; ?></td>
                                    <td><?php echo $p['lokasi']; ?></td>
                                    <td><?php echo $p['kategori']; ?></td>
                                    <td>Rp <?php echo $p['harga']; ?></td>
                                    <td><?php echo $p['deskripsi']; ?></td>
                                    <td>
                                        <a href="aksi.php?aksi=produkrequest&&value=terima&&produkid=<?php echo $$p['id']; ?>">Terima</a>
                                         | 
                                         <a href="aksi.php?aksi=produkrequest&&value=terima&&produkid=<?php echo $$p['id']; ?>">Tolak</a>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
            </div>
        </div>
    
        <!--Daftar Akun-->
        <div class="col-md-12">
            <div class="text-center" style="margin-top: 100px; margin-bottom: 20px;">
                <h3>Daftar Akun</h3>
            </div>
        </div>
        <div class="col-md-12" style="padding-left: 15px; padding-right: 6%; margin-top: -5px">
            <div style="background-color: white; border-radius: 20px; padding: 40px;">
                <table class="table">
                        <thead>
                            <th>Nama</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Jenis Kelamin</th>
                            <th>Alamat</th>
                            <th>Nomor Telepon</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </thead>
                        <tbody>
                            <?php foreach ($alluser as $p): ?>
                                <tr>
                                    <td ><?php echo $p['nama']; ?></td>
                                    <td><?php echo $p['username']; ?></td>
                                    <td><?php echo $p['email']; ?></td>
                                    <td><?php echo $p['jk']; ?></td>
                                    <td><?php echo $p['alamat']; ?></td>
                                    <td><?php echo $p['telepon']; ?></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
            </div>
        </div>



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>
