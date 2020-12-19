<?php 
session_start();
if (!isset($_SESSION['login'])) {
    header('Location: login.php');
    exit;
} 

require 'functions.php';

$id = $_GET["id"];

$user = query('SELECT user.user_jk AS jk, user.user_foto AS foto, detail_user.duser_name AS nama, user.user_username AS username, user.user_level AS `level` ,user.user_email AS email, detail_user.duser_alamat AS alamat, detail_user.duser_telp AS telepon FROM detail_user INNER JOIN user ON user.user_id = detail_user.user_id WHERE user.user_id ='.$id)[0];

$produk = query('SELECT produk.produk_id AS id, produk.produk_name AS namaproduk, detail_user.duser_name AS namapemilik, produk_aktif.paktif_tanggal AS tanggalaktif, produk_aktif.paktif_exp AS tanggalexpired FROM produk_aktif INNER JOIN produk ON produk_aktif.produk_id = produk.produk_id INNER JOIN detail_user ON produk.user_id = detail_user.user_id WHERE produk_aktif.user_id = '.$id);

$produkpemilik =  query('SELECT produk.produk_id, produk.produk_name, lokasi.lokasi_name, kategori.kategori_name, produk.produk_harga FROM produk INNER JOIN lokasi ON lokasi.lokasi_id = produk.lokasi_id INNER JOIN kategori ON produk.kategori_id = kategori.kategori_id WHERE produk.user_id ='.$id);

$produkaktif = query('SELECT produk_aktif.paktif_id, produk.produk_name, produk_aktif.paktif_tanggal, produk_aktif.paktif_exp, produk_aktif.paktif_status, detail_user.duser_name FROM produk_aktif INNER JOIN produk ON produk_aktif.produk_id = produk.produk_id INNER JOIN detail_user ON detail_user.user_id = produk_aktif.user_id WHERE produk.user_id ='.$id);

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
                            <small class="sText">member</small>
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
                                    <td>Member</td>
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

            <!-- Khusus User biasa -->
            <?php if ($level == 3): ?>
                <div class="col-md-12">
                    <div class="text-center" style="margin-bottom: 5px;">
                        <h3>Kursus yang kamu ikuti</h3>
                    </div>
                </div>
                <div class="col-md-12" style="padding:0px 50px; margin-top: 5px">
                    <div style="background-color: white; border-radius: 20px; padding: 40px;">
                        <table class="table">
                                <thead>
                                    <th>Nama Kurus</th>
                                    <th>Pemilik</th>
                                    <th>Tanggal mulai</th>
                                    <th>Tanggal selesai</th>
                                </thead>
                                <tbody>
                                    <?php foreach ($produk as $p): ?>
                                        <tr>
                                            <td ><a href="detail.php?id=<?php echo $p['id']; ?>" style='text-decoration: none; color: green; font-weight: 500'><?php echo $p['namaproduk']; ?></a></td>
                                            <td><?php echo $p['namapemilik']; ?></td>
                                            <td><?php echo $p['tanggalaktif']; ?></td>
                                            <td><?php echo $p['tanggalexpired']; ?></td>
                                        </tr>
                                    <?php endforeach ?>
                                </tbody>
                            </table>
                    </div>
                </div>
            <?php endif ?>

            <!-- End form user biasa -->

            <!-- Khusus pemilik kursus -->
            <?php if ($level == 2): ?>
                <div class="col-md-12">
                    <div class="text-center" style="margin-top: -25px; margin-bottom: 15px;">
                        <h3>Tempat kursus yang kamu miliki</h3>
                    </div>
                </div>
                <div class="col-md-12" style="padding-left: 15px; padding-right: 6%; margin-top: -5px">
                    <div style="background-color: white; border-radius: 20px; padding: 40px;">
                        <table class="table">
                                <thead>
                                    <th>Nama Kurus</th>
                                    <th>Lokasi</th>
                                    <th>Kategori</th>
                                    <th>Harga</th>
                                    <th>Aksi</th>
                                </thead>
                                <tbody>
                                    <?php foreach ($produkpemilik as $p): ?>
                                        <tr>
                                            <td ><a href="detail.php?id=<?php echo $p['produk_id']; ?>" style='text-decoration: none; color: green; font-weight: 500'><?php echo $p['produk_name']; ?></a></td>
                                            <td><?php echo $p['lokasi_name']; ?></td>
                                            <td><?php echo $p['kategori_name']; ?></td>
                                            <td>Rp <?php echo $p['produk_harga']; ?></td>
                                            <td ><a style='text-decoration: none;' href="ubahproduk.php?id=<?php echo $p['produk_id']; ?>">Ubah</a></td>
                                        </tr>
                                    <?php endforeach ?>
                                </tbody>
                        </table>
                        <div class="col text-center">
                            <a href="create.php?id=<?php echo $id ?>" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Ajukan produk</a>
                        </div>
                    </div>
                </div>
            <div class="col-md-12">
                    <div class="text-center" style="margin-bottom: 15px;">
                        <h3>Member kursus</h3>
                    </div>
                </div>
                <div class="col-md-12" style="padding-left: 15px; padding-right: 6%; margin-top: -5px">
                    <div style="background-color: white; border-radius: 20px; padding: 40px;">
                        <table class="table">
                                <thead>
                                    <th>Nama member</th>
                                    <th>Kursus yang di ikuti</th>
                                    <th>Tanggal bergabung</th>
                                    <th>Tanggal berhenti</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </thead>
                                <tbody>
                                    <?php foreach ($produkaktif as $p): ?>
                                        <?php if ($p['paktif_status'] != 'Tidak Aktif'): ?>
                                            <tr>
                                                <td ><?php echo $p['duser_name'];?></td>
                                                <td><?php echo $p['produk_name']; ?></td>
                                                <td><?php echo $p['paktif_tanggal']; ?></td>
                                                <td><?php echo $p['paktif_exp']; ?></td>
                                                <td><?php echo $p['paktif_status']; ?></td>
                                                <?php if ($p['paktif_status'] == 'Pending'): ?>
                                                    <td ><a href="aksi.php?aksi=update&&value=terima&&id=<?php echo $p['paktif_id']; ?>" style='text-decoration: none; color: blue'>Terima</a> | <a style='text-decoration: none; color: red' href="aksi.php?aksi=update&&value=tolak&&id=<?php echo $p['paktif_id']; ?>" onclick ="
                                                    return confirm('Yakin?')">Tolak</a></td>
                                                <?php endif ?>
                                            </tr>
                                        <?php endif ?>
                                    <?php endforeach ?>
                                </tbody>
                            </table>
                    </div>
                </div>

            <?php endif ?>
            <!-- Khusus pemilik kursus -->

        </div>
    </div>

    <footer class=" font-small blue pt-2 " style="background-color: black ; margin-top: 5%;">
        
            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href=""> Praktikum web programming</a>
            </div>
            <!-- Copyright -->
        
    </footer>































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