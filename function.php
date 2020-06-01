 <?php
 include 'koneksi.php';

 function edit($data){
     global $koneksi;
     $nama = htmlspecialchars($data['nama']);
     $alamat =htmlspecialchars( $data['alamat']);
     $email =htmlspecialchars( $data['email']);
     $noTelp =htmlspecialchars( $data['noTelp']);
     $password =$data['password'];
     $update = "UPDATE user INNER JOIN detailuser ON detailuser.userID = user.userID SET  nama = '$nama',alamat = '$alamat', noTelp = '$noTelp',PASSWORD = '$password' WHERE email = '$email'";
     mysqli_query($koneksi, $update); 
     return mysqli_affected_rows($koneksi);
    }

// FUNCTION-----DATA USER DI ADMIN---///
function query($query){
    global $koneksi;
    $result = mysqli_query($koneksi, $query);
    $rows = [];
    while($row = mysqli_fetch_assoc($result)){
        $rows [] =$row;
    }
    return $rows;
}
function cari($keyword){
    $query = "SELECT userID,nama,email,alamat,noTelp,jenis_kelamin, tingkatan_user FROM USER LEFT JOIN detailuser USING (userID) WHERE nama LIKE '%$keyword%' OR userID LIKE '%$keyword%' OR email LIKE '%$keyword%' OR jenis_kelamin LIKE '%$keyword%' OR alamat LIKE '%$keyword%' OR tingkatan_user LIKE '%$keyword%' ORDER BY userID ASC ";
    return query($query);
}

// FUNCTION-----DATA KAPAL DI ADMIN---///
function cariKapal($kunci){
    $query = "SELECT kapalID, jenis, waktu, rute,nama_dermaga,harga,kapasitas,foto FROM kapal WHERE kapalID LIKE '%$kunci%' OR jenis LIKE '%$kunci%' OR waktu LIKE '%$kunci%' OR harga LIKE '%$kunci%' OR kapasitas LIKE '%$kunci%' OR rute LIKE '%$kunci%' OR nama_dermaga LIKE '%$kunci%'";
    return query($query);
}
function editKapal ($data){
    global $koneksi;
    $kapalID = $data['kapalID'];
    $jenis = $data['jenis'];
    $waktu = $data['waktu'];
    $harga = $data['harga'];
    $kapasitas =$data['kapasitas'];
    $update = "UPDATE kapal SET  kapalID = '$kapalID',jenis = '$jenis', waktu = '$waktu','harga'='$harga', kapasitas = '$kapasitas'";
    mysqli_query($koneksi, $update); 
    return mysqli_affected_rows($koneksi);
   }
?>