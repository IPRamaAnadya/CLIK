<?php 

session_start();

require 'functions.php' ;

$loc= $_GET['lokasi'];
$cat= $_GET['kategori'];
$daerah = query('SELECT * FROM lokasi');
$kategori = query('SELECT * FROM kategori');

$locname = query('SELECT * FROM lokasi WHERE lokasi_id='.$loc)[0];
$catname = query('SELECT * FROM kategori WHERE kategori_id='.$cat)[0];
$res= query('SELECT * FROM produk WHERE lokasi_id='.$loc.' AND kategori_id='.$cat);

if (isset($_POST["search"])) {
    
    $lokasi = $_POST["lokasi"];
    $kategori = $_POST["kategori"];
    header('Location:search.php?lokasi='.$lokasi.'&kategori='.$kategori);
    exit;
}
 ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <link rel="stylesheet" href="asset/style.css">

    <title>search</title>
</head>


<style>
    .result p {
     width: 200px;
     height: 50px;
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
     text-transform: lowercase;
    }

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
                <?php if (empty($_SESSION)): ?>
                        <li class="nav-item">
                            <a href="login.php" class="nav-link" id="login">Login</a>
                        </li>
                    <?php endif ?>
                    <?php if (!empty($_SESSION)): ?>
                        <li class="nav-item">
                            <a href="profil.php?id=<?php echo($_SESSION['id']) ?>" class="nav-link" id="login">Hai <?php echo($_SESSION['username']) ?>!</a>
                        </li>
                    <?php endif ?>
            </ul>
        </div>
    </nav>
    <!-- End Navbar -->
    </header>

    <main class="main-content">
    <div class="container">
        <section id="search" class="search">
        <div class="text-center title">
            <h1>Search</h1>
        </div>

        <div class="row mt-3">
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
                                    Pilih Kategori Tempak kursus yang kamu mau
                                </p>
                                <div class="btn-group list-packet">
                                    <select id="level" name="kategori" class="form-control form-control-sm" style="text-transform: capitalize;">
                                        <?php foreach ($kategori as $key) :?>
                                            <option value="<?php echo $key['kategori_id'] ?>" style="text-transform: capitalize;"><?php echo $key['kategori_name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col text-center">
                                    <button type="submit" class="btn btn-secondary mt-5" name="search">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

        <div class="col-md-12 mt-3 mb-3">
            <h5><i>Berikut hasil pencarian tempat kursus di daerah <?php echo   $locname['lokasi_name'] ?> dengan kategori <?php echo   $catname['kategori_name'] ?></i></h5>
        </div>
        <div class="row mt-3 result">
            <!-- Grid column -->
            <?php foreach ($res as $key) : ?>
                <div class="col-lg-3">
                    <div class="card">
                        <img src="img/produk/<?php echo $key['produk_pic'] ?>" style= "width: 100%" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $key['produk_name'] ?></h5>
                            <p class="card-text"><?php echo $key['produk_deskripsi'] ?></p>
                            <a href="
                                <?php 
                                    if(empty($_SESSION)){
                                        echo('login.php');
                                    } else {
                                        echo "detail.php?id=".$key['produk_id'];
                                    }
                                 ?>
                            " class="btn btn-info">Detail</a>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
            
            
        </div>    
    </div>
    </section>
</main>   
</body>
</html>