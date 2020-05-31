<?php
include 'koneksi.php';
if ($_SESSION) {
    $nama = $_SESSION["nama"];
}
    $rute = "";
    $dermaga = "";
    if (isset ($_POST['cari'])){
        $rute = $_POST['rute'];
        $dermaga = $_POST['dermaga'];
    }
            
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" >
        <!--<link rel="stylesheet" type="text/css" href="assets/caritiket.css">-->
        
        <script src="assets/js/jquery-1.11.3.min.js"></script>
       <!-- <link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css"/>--> 
        <link rel="stylesheet" href="assets/caritiket.css" type="text/css"/>   
        <link rel="stylesheet" type="text/css" href="assets/fontawesome/css/all.min.css">     
       
        <title>Cari Tiket</title>
    </head>
    <body>

    <?php include 'layout/navbar.php' ?>
    <div class="container">
        <div class="warna">
            <h4 class="alert alert-primary text-center">Booking tiket dengan kapal pilihanmu disini</h4>
        <form action=" " method="POST">
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label>Keberangkatan</label>
                    <i class="fa fa-ship"></i>
                    <select name="rute" id = "rute" class="form-control">
                    <option value="-"> -Choose- </option>
                    <option value="Gili Terawangan" <?php if ($rute=="Gili Terawangan"){ echo "selected"; } ?>>Gili Terawangan</option>
                    <option value="Nusa Penida" <?php if ($rute=="Nusa Penida"){ echo "selected"; } ?>>Nusa Penida</option>
                    </select>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>Dermaga Tujuan</label>
                    <i class="fa fa-ship"></i>
                    <select name="dermaga" id = "dermaga" class="form-control">
                    <option value="-"> -Choose- </option>
                    <option value="Sanur Bay" <?php  if ($dermaga == "Sanur Bay"){ echo "selected"; } ?>>Sanur Bay</option>
                    <option value="Gili Bay" <?php if ($dermaga == "Gili Bay"){ echo "selected"; } ?>>Gili Bay</option>
                    </select>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label>Tanggal Keberangkatan</label>
                    <br><input type="date" name="tgl_pemesanan" id="tgl_pemesanan" class="form-control">
                </div>
            </div>
        

            <script src ="assets/js/bootstrap.js"></script>
            <script src ="assets/js/bootstrap-datepicker.js"></script>  
            <script>
                $( "#tgl_pemesanan").datepicker({
                    format : 'mm/dd/yyyy',
                });
            </script> 

            <div class="col-md-3">
                <div class="form-group">
                    <button id = "search" name="cari" class="btn alert-info" style="margin-top: 30px;">CARI KAPAL</button>
                </div>
            </div>
        </div>

        
        </form>
    <table class="table table-striped table-bordered" style="width:100%;margin-top:20px;">
		    <thead>
		        <tr class="bg-dark text-white">
		            <td>No</td>
                    <td>ID Kapal</td>
                    <td>Jenis</td>
                    <td>Foto</td>
		            <td>Waktu</td>
		            <td>Rute</td>
		            <td>Nama Dermaga</td>
                    <td>Harga</td>
                    <td>Kapasitas</td>
                    <td>  </td>
		        </tr>
            </thead>
            <tbody>
            <?php
                $search_rute = '%'. $rute .'%';
                $search_keyword = '%'. $dermaga .'%';
                $no = 1;
                $query = "SELECT * FROM kapal WHERE rute LIKE ? AND nama_dermaga LIKE ? ";
                $dewan1 = $koneksi->prepare($query);
                $dewan1->bind_param('ss', $search_rute, $search_keyword);
                $dewan1->execute();
                $res1 = $dewan1->get_result();

                if ($res1->num_rows > 0){
                    while ($row = $res1->fetch_array()) {
                       $kapalID = $row ['kapalID'];
                       $jenis = $row ['jenis'];
                       $foto = $row ['foto'];
                       $waktu = $row ['waktu'];
                       $rute = $row ['rute'];
                       $nama_dermaga = $row ['nama_dermaga'];
                       $harga = $row ['harga'];
                       $kapasitas = $row ['kapasitas']; 
            ?>
                       <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo $kapalID; ?></td>
                            <td><?php echo $jenis; ?></td>
                            <td><?php echo '<img src="data:foto/jpeg; base64,'.base64_encode( $row ['foto'] ).'" width="300" />';?></td>
                            <td><?php echo $waktu; ?></td>
                            <td><?php echo $rute; ?></td>
                            <td><?php echo $nama_dermaga; ?></td>
                            <td><?php echo $harga; ?></td>
                            <td><?php echo $kapasitas; ?></td>
                            <td><a href="#" class="btn btn-primary">BOOKING</a></td>
                        </tr>
                       <?php }} else{ ?>
                <tr>
                     <td colspan='7'>Data Tidak Ada</td>
                 </tr>
                <?php } ?>
            
            </tbody>
    </table>
    </div>
    </div>
    <?php include 'layout/footer.php';?>
    </body>
</html>
