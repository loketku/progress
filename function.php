 <?php
 include 'koneksi.php';

 function edit($data){
     global $koneksi;
   $nama = htmlspecialchars($data['nama']);
     $alamat =htmlspecialchars( $data['alamat']);
     $email =htmlspecialchars( $data['email']);
     $noTelp =htmlspecialchars( $data['noTelp']);
     $password =$data['password'];
     $update = "UPDATE user INNER JOIN detailuser ON detailuser.userID = user.userID SET  nama = '$nama',alamat = '$alamat', noTelp = '$noTelp', PASSWORD = '$password' WHERE email = '$email'";
     mysqli_query($koneksi, $update); 
     return mysqli_affected_rows($koneksi);
    }
 ?>
