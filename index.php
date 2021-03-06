<?php 
session_start();


require 'functions.php' ;
  
$galeri = query('SELECT * FROM produk ORDER BY rand()');
$daerah = query('SELECT * FROM lokasi');
$kategori = query('SELECT * FROM kategori');




if (isset($_POST["search"])) {
    
    $lokasi = $_POST["lokasi"];
    $kategori = $_POST["kategori"];
    header('Location:search.php?lokasi='.$lokasi.'&kategori='.$kategori);
    exit;
}
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
    
    <link rel="stylesheet" href="asset/style.css">

    <title>CLIK</title>
</head>

<style>
    .galeri-img {
        background-size: contain;
        background-repeat: no-repeat;
        cursor: pointer;
        transition: all 200ms ease-in;  
        filter: grayscale(1) opacity(.8);
    }

    .galeri-img:hover {
        filter: grayscale(0) opacity(1);

</style>


<body>
    <header class="header">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <a href="index.php" class="navbar-brand" style="font-weight: 800;">CLIK</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsif">
                <span class="navbar-toggler-icon"></span>
            </button>
        
            <div class="collapse navbar-collapse" id="navbarresponsif">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="#" class="nav-link" id="">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="#about" class="nav-link" id="">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="#list" class="nav-link" id="">List</a>
                    </li>
                    <li class="nav-item">
                        <a href="#galeri" class="nav-link" id="">Gallery</a>
                    </li>
                    <li>
                         |
                    </li>
                    <?php if (empty($_SESSION)): ?>
                        <li class="nav-item">
                            <a href="login.php" class="nav-link" id="login">Login</a>
                        </li>
                    <?php endif ?>
                    <?php if (!empty($_SESSION)): ?>
                        <?php 
                             $user = query('SELECT * FROM user WHERE user_id ='.$_SESSION["id"])[0];
                        ?>
                        <?php if ($user['user_level']=='1'): ?>
                            <li class="nav-item">
                                <a href="profil_admin.php?id=<?php echo($_SESSION['id']) ?>" class="nav-link" id="login">Hai <?php echo($_SESSION['username']) ?>!</a>
                            </li>
                        <?php endif ?>
                        <?php if ($user['user_level']!='1'): ?>
                            <li class="nav-item">
                                <a href="profil.php?id=<?php echo($_SESSION['id']) ?>" class="nav-link" id="login">Hai <?php echo($_SESSION['username']) ?>!</a>
                            </li>
                        <?php endif ?>
                    <?php endif ?>
                </ul>
            </div>
        </nav>
        <!-- End Navbar -->
    
        <!-- carousel -->
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/carousel1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/carousel2.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <div class="carousel-caption text-center">
                <h1>SELAMAT DATANG DI <b>CLIK</b></h1>
                <h3>Website booking kelas online terbesar di Bali</h3>
            </div>
        </div>
        <!-- End carousel -->
    </header>

    <main class="main-content">
        <div class="container">
            <!-- About -->
            <section id="about" class="about">
                <div class="text-center title">
                    <h1>About</h1>
                </div>
                <div>
                    <p class="">
                        <h6>
                        <div class="text-center" style="line-height: 1.6;">
                            <b>CLIK</b> adalah laman web yang bergerak di bidang pendidikan, dibangun agar memudahkan seseorang untuk mencari tempat kursus di tempat yang telah 
                            disediakan, serta ditampilkan juga list harga per durasi. Web ini dibuat guna memenuhi tugas dari 
                            matakuliah Pemrograman Berbasis Web. Kata <u>CLIK</u> juga memiliki kepanjangan yaitu <u>C</u>ek <u>LI</u>st <u>K</u>ursus. 
                            Pada web ini kami membantu para pelajar baik kalangan muda sampai dewasa untuk menemukan tempat kursus dengan kualitas 
                            tebaik dan harga yang sudah sesuai. 
                        </div>
                        </h6>
                        <p>
                        <div class="text-center" style="line-height: 1.6;">
                        <i> <b>"makanlah sesuai kebutuhan tubuhmu, karena itu dapat membantumu dari kelaparan, 
                            namun belajarlah sebanyak mungkin, karena belajar mampu menyelamatkanmu dari ketidaktahuan (kebodohan)"</b> </i> 
                        </div>
                        </p>
                    </p>
                </div>
            </section>
            <!-- End About -->

            <!-- Galeri -->
            <section id="galeri" class="galeri">
                <div class="text-center title">
                    <h1 class>Galery</h1>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row no-gutters">
                            <div class="col-md-8 galeri-img">
                                <a href="detail.php?id=<?php echo $galeri[0]['produk_id'] ?>">
                                    <img src="img/produk/<?php echo $galeri[0]['produk_pic'] ?>" style= "width: 100%" alt="" class="img-fluid">
                                </a>
                                
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12 galeri-img">
                                        <a href="detail.php?id=<?php echo $galeri[1]['produk_id'] ?>">
                                            <img src="img/produk/<?php echo $galeri[1]['produk_pic'] ?>" style= "width: 100%" alt="" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="col-md-12 galeri-img">
                                        <a href="detail.php?id=<?php echo $galeri[2]['produk_id'] ?>">
                                            <img src="img/produk/<?php echo $galeri[2]['produk_pic'] ?>" style= "width: 100%" alt="" class="img-fluid">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12 galeri-img">
                                        <a href="detail.php?id=<?php echo $galeri[3]['produk_id'] ?>">
                                            <img src="img/produk/<?php echo $galeri[3]['produk_pic'] ?>" style= "width: 100%" alt="" class="img-fluid" >
                                        </a>
                                    </div>
                                    <div class="col-md-12 galeri-img">
                                        <a href="detail.php?id=<?php echo $galeri[4]['produk_id'] ?>">
                                            <img src="img/produk/<?php echo $galeri[4]['produk_pic'] ?>" style= "width: 100%" alt="" class="img-fluid">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 galeri-img">
                                <a href="detail.php?id=<?php echo $galeri[5]['produk_id'] ?>">
                                    <img src="img/produk/<?php echo $galeri[5]['produk_pic'] ?>" style= "width: 100%" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Galeri -->

            <!-- packet -->
            <section class="list" id="list">
                <div class="title text-center">
                    <h1>List</h1>
                </div>
                <div class="row">
                    <div class="col-md-12 tabel-paket">
                        <h2 style="margin-top: 20px;" class="pr-5 pl-5">Cari tempat kursus kamu disini!</h2>
                        <div class="pr-5 pl-5">
                            <form action="" method="post">
                                <p class="sub-title" style="margin-top: 50px;">
                                    Pilih daerah yang ingin dicari
                                </p>
                                <div class="btn-group list-packet">
                                    <select id="level" name="lokasi" class="form-control form-control-sm" style="text-transform: capitalize;">
                                        <?php foreach ($daerah as $daerahh) :?>
                                            <option value="<?php echo $daerahh['lokasi_id'] ?>" style="text-transform: capitalize;"><?php echo $daerahh['lokasi_name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <p class="sub-title" style="margin-top: 20px;">
                                    Pilih Kategori Tempat kursus yang kamu mau
                                </p>
                                <div class="btn-group list-packet">
                                    <select id="level" name="kategori" class="form-control form-control-sm" style="text-transform: capitalize;">
                                        <?php foreach ($kategori as $key) :?>
                                            <option value="<?php echo $key['kategori_id'] ?>" style="text-transform: capitalize;"><?php echo $key['kategori_name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col text-center">
                                    <button type="submit" class="btn btn-info mt-5" name="search" style="width: 50%">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        </section>
</main>

        <!-- Footer -->
        <footer class="page-footer font-small blue pt-2  ">
        
            <!-- Copyright -->
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href=""> Praktikum web programming</a>
            </div>
            <!-- Copyright -->
        
        </footer>
        <!-- End Footer -->

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="asset/js.js"></script>
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
