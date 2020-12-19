<?php 

require 'functions.php';
$id = $_GET['id'];

$produk = query('SELECT produk.produk_name AS nama, produk.user_id AS pemilik, lokasi.lokasi_name as lnama, kategori.kategori_name AS knama, produk.produk_harga AS harga, produk.produk_deskripsi AS deskripsi, produk.produk_pic AS gambar FROM produk INNER JOIN lokasi ON lokasi.lokasi_id = produk.lokasi_id INNER JOIN kategori ON kategori.kategori_id = produk.kategori_id WHERE produk.produk_id ='.$id)[0];
$daerah = query('SELECT * FROM lokasi');
$kategori = query('SELECT * FROM kategori');

$pemilik = $produk['pemilik'];
if (isset($_POST['submit'])) {
    if (ubahproduk($_POST, $id)>0) {
        echo "
            <script>
            alert('Produk diupdate!');
            document.location.href = 'profil.php?id=$pemilik';
            </script>
        ";
    }
}



 ?>



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
        padding-bottom: 120px;
    }
    .photo-profile {
        width: 50%;
        border-radius: 5px;
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
        <a class="navbar-brand" href="#">CLICK</a>
    </nav>
    <div class="container-fluid">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="row side-nav mt-3">
            <div class="col-md-2"></div>
            <div class="col-md-8 side">
                <div>
                    <h2 class="text-center mb-2 mt-5"><span style=" font-weight: 700;font-size: 40px">Edit</span> Tempat Kursusmu</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile col-md-12" style="margin-left: -8%">
                                <img src="img\produk\<?php echo $produk['gambar']; ?>" class="mx-auto d-block photo-profile" alt="<?php echo $produk['gambar']; ?>">
                                <div class="file-field">
                                    <div class="d-flex justify-content-center">
                                      <div class="btn btn-mdb-color btn-rounded float-left ml-5">
                                        <input type="file" name="gambar" id="gambar" title="Ubah profile">
                                      </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 pr-1" style="margin-left: -10%;">
                            <input type="hidden" id="custId" name="foto" value="<?php echo $produk['gambar']; ?>">
                            <div class="form-group">
                                <label for="nama">Nama tempat kursus</label>
                                <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama" required minlength="5" maxlength="50" value="<?php echo $produk['nama']; ?>">
                            </div>
                            <div class="form-group list-packet">
                                <label>Lokasi</label> <small><i style="color: grey;">Lokasi awal : <?php echo $produk['lnama'] ?></i></small>
                                    <select id="level" name="lokasi" class="form-control form-control-sm" style="text-transform: capitalize;">
                                        <?php foreach ($daerah as $daerahh) :?>
                                            <option value="<?php echo $daerahh['lokasi_id'] ?>" style="text-transform: capitalize;"><?php echo $daerahh['lokasi_name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            <div class=" list-packet form-group">
                                <label>Kategori</label> <small><i style="color: grey;">Kategori awal : <?php echo $produk['knama'] ?></i></small>
                                    <select id="kategori" name="kategori" class="form-control form-control-sm" style="text-transform: capitalize;">
                                        <?php foreach ($kategori as $key) :?>
                                            <option value="<?php echo $key['kategori_id'] ?>" style="text-transform: capitalize;"><?php echo $key['kategori_name'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            <div class="form-group">
                                <label for="deskripsi">Deskripsi</label>
                                <textarea class="form-control" id="deskripsi" name='deskripsi' rows="5"><?php echo $produk['deskripsi']; ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="harga">Harga (IDR)</label>
                                <input value="<?php echo $produk['harga']; ?>" type="text" class="form-control" id="harga" name="harga" placeholder="Masukkan telp" required minlength="5">
                            </div>
                        </div>
                    </div>
                        
                </div>
            </div>
            <div class="col-md-12">  
                <div class="col text-center" style="margin-top: -100px;">
                    <button type="submit" class="btn btn-info mb-5" name="submit" style="width: 25%">Selesai</button>
                </div> 
            </div>
        </div>
    </div>
    </form>

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