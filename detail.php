<?php 
session_start();
if (!isset($_SESSION['login'])) {
    header('Location: login.php');
    exit;
} 
require 'functions.php';
$id = $_GET['id'];
$user = 5;

$res= query('SELECT * FROM produk WHERE produk_id='.$id)[0];

$lokasi = query('SELECT * FROM lokasi WHERE lokasi_id = '.$res['lokasi_id'])[0];
$kategori = query('SELECT * FROM kategori WHERE kategori_id = '.$res['kategori_id'])[0];
$pemilik =query('SELECT * FROM detail_user WHERE user_id = '.$res['user_id'])[0];




 ?>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a href="index.php" class="navbar-brand" style="font-weight: 800;">CLIK</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsif">
          <span class="navbar-toggler-icon"></span>
      </button>
  </nav>
  <!-- End Navbar -->
    <div class="container" style="padding:0px 80px; position:relative;">
      <div style="background-color: white; margin-top:50px;">
        <img src="img/produk/<?php echo $res['produk_pic']?>" alt="contoh" style="width: 100%;">
      </div>
      <div>
        <h1 style="text-transform: uppercase;"><?php echo $res['produk_name']?></h1>
      </div>
      <div style="margin-bottom: 50px;">
        <h4 style="text-transform: capitalize;"><?php echo $lokasi['lokasi_name']?></h4>
      </div>
      <div>
        <table class="table">
          <tbody>
            <tr>
              <td>Harga</td>
              <td>Rp <?php echo $res['produk_harga']?></td>
            </tr>
            <tr>
              <td>Kategori</td>
              <td><?php echo $kategori['kategori_name']; ?></td>
            </tr>
            <tr>
              <td>Nama Pemilik</td>
              <td style="text-transform: capitalize;"><?php echo $pemilik["duser_name"]; ?></td>
            </tr>
            <tr>
              <td>Deskripsi</td>
              <td> <?php echo $res['produk_deskripsi']?></td>
            </tr>
          </tbody>
        </table>
          <div style="margin-bottom : 50px;">
            <button type="button" class="btn btn-success float-right" style="width: 30%;margin-right: 35%;" name="submit" onclick="window.location.href = 'aksi.php?aksi=pesan&&id=<?php echo($id) ?>&&user=<?php echo($user) ?>'">Pesan</button>
          </div>
    </div>
    </div>        
    <!-- Footer -->
    <footer class=" font-small blue pt-2 " style="background-color: black ; margin-top: 20%;">
        
            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href=""> Praktikum web programming</a>
            </div>
            <!-- Copyright -->
        
    </footer>  
    <!-- End Footer -->
    


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
  </body>
</html>