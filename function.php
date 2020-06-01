 <?php
 include 'koneksi.php';

 function edit($data){
     global $koneksi;
     $nama = $data['nama'];
     $alamat = $data['alamat'];
     $email = $data['email'];
     $noTelp = $data['noTelp'];
     $password =md5($data['password']);
     $jenis_kelamin =$data['jenis_kelamin'];
     $update = "UPDATE user INNER JOIN detailuser ON detailuser.userID = user.userID SET  nama = '$nama',alamat = '$alamat', noTelp = '$noTelp', PASSWORD = '$password' WHERE email = '$email'";
     mysqli_query($koneksi, $update); 
     return mysqli_affected_rows($koneksi);
    }
 ?>
