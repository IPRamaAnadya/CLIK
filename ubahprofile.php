<?php 
require 'functions.php';

$id = $_GET['id'];

$user = query('SELECT user.user_foto AS foto, detail_user.duser_name AS nama, user.user_username AS username, user.user_level AS `level` ,user.user_email AS email, detail_user.duser_alamat AS alamat, detail_user.duser_telp AS telepon FROM detail_user INNER JOIN user ON user.user_id = detail_user.user_id WHERE user.user_id ='.$id)[0];

$res = 0;

if (isset($_POST['submit'])) {
    if (ubahprofileuser($_POST,$id)>0) {
        $res++;
    }
    if (ubahprofileduser($_POST,$id)>0) {
        $res++;
    }
    if ($res > 0) {
        header('Location:profil.php?id='.$id);
        exit;
    } else {
        echo "
            <script>
            alert('Data gagal diperbarui!');
            document.location.href = 'ubahprofile.php?id=$id';
            </script>
        ";
        return false;
    }
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
        <a class="navbar-brand" href="#">CLICK</a>
    </nav>
    <div class="container-fluid">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="row side-nav mt-3">
            <div class="col-md-2"></div>
            <div class="col-md-8 side">
                <div>
                    <h2 class="text-center mb-2 mt-5"><span style=" font-weight: 700;font-size: 40px">Edit</span> Profile</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="profile col-md-12" style="margin-left: -8%">
                                <img src="img\profile\<?php echo $user['foto']; ?>" class="mx-auto d-block photo-profile" alt="<?php echo $user['foto']; ?>">
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
                            <input type="hidden" id="custId" name="foto" value="<?php echo $user['foto']; ?>">
                            <div class="form-group">
                                <label for="nama">Nama</label>
                                <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama" required minlength="5" maxlength="50" value="<?php echo $user['nama']; ?>">
                            </div>
                            <div class="form-group">
                                <label for="Username">Username</label>
                                <input value="<?php echo $user['username']; ?>" type="text" class="form-control" id="Username" name="Username" placeholder="Masukkan Username" required minlength="5" maxlength="50">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input value="<?php echo $user['email']; ?>" type="email" class="form-control" id="email" name="email" placeholder="Masukkan email" required minlength="5" maxlength="50">
                            </div>
                            <div class="form-group">
                                <label for="alamat">Alamat</label>
                                <textarea class="form-control" id="alamat" name='alamat' rows="3"><?php echo $user['alamat']; ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="telp">No telepon</label>
                                <input value="<?php echo $user['telepon']; ?>" type="text" class="form-control" id="telp" name="telp" placeholder="Masukkan telp" required minlength="5">
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