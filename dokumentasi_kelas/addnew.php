<?php

	error_reporting( ~E_NOTICE ); 
	
	require_once 'dbconfig.php';
	
	if(isset($_POST['btnsave']))
	{
		$doctype = $_POST['doc_type'];
		
		$imgFile = $_FILES['user_image']['name'];
		$tmp_dir = $_FILES['user_image']['tmp_name'];
		$imgSize = $_FILES['user_image']['size'];
		
		
		if(empty($doctype)){
			$errMSG = "Please Enter Doc Type.";
		}
		else if(empty($imgFile)){
			$errMSG = "Please Select Image File.";
		}
		else
		{
			$upload_dir = 'user_images/'; 
	
			$imgExt = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION)); 
			$valid_extensions = array('jpeg', 'jpg', 'png', 'gif'); 
			$docfile = rand(1000,1000000).".".$imgExt;
				
			if(in_array($imgExt, $valid_extensions)){			
				if($imgSize < 5000000)				{
					move_uploaded_file($tmp_dir,$upload_dir.$docfile);
				}
				else{
					$errMSG = "Sorry, your file is too large.";
				}
			}
			else{
				$errMSG = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";		
			}
		}
		
		if(!isset($errMSG))
		{
			$stmt = $DB_con->prepare('INSERT INTO tbl_docs(docType, docFile) VALUES(:dtype, :dfile)');
			$stmt->bindParam(':dtype',$doctype);
			$stmt->bindParam(':dfile',$docfile);
			
			if($stmt->execute())
			{
				$successMSG = "new record succesfully inserted ...";
				header("refresh:5;dokumen.php");
			}
			else
			{
				$errMSG = "error while inserting....";
			}
		}
	}

	require_once 'views/header.php';
?>

<div class="container">

<div class="row">
<div class="col-md-6 col-md-offset-3">

	<div class="page-header">
    	<h1 class="h2">Tambah dokumen baru. / <a class="btn btn-default" href="dokumen.php"> <span class="glyphicon glyphicon-eye-open"></span> &nbsp; lihat semua </a></h1>
    </div>

	<?php
	if(isset($errMSG)){
			?>
            <div class="alert alert-danger">
            	<span class="glyphicon glyphicon-info-sign"></span> <strong><?php echo $errMSG; ?></strong>
            </div>
            <?php
	}
	else if(isset($successMSG)){
		?>
        <div class="alert alert-success">
              <strong><span class="glyphicon glyphicon-info-sign"></span> <?php echo $successMSG; ?></strong>
        </div>
        <?php
	}
	?>   

<form method="post" enctype="multipart/form-data" class="form-horizontal">
	    
	<table class="table table-responsive">
	
    <tr>
    	<td><label class="control-label">Tipe Dokumen.</label></td>
        <td>
			<select class="form-control" name="doc_type">
			<option value="Siswa">Siswa</option>
				<option value="Buku Pelajaran">Buku Pelajaran</option>
				<option value="Jadwal Pelajaran">Jadwal Pelajaran</option>
				<option value="Kegiatan Pembersihan">Kegiatan Pembersihan</option>
				<option value="Kegiatan Lomba">Kegiatan Lomba</option>
				<option value="Kegiatan Persembahyangan">Kegiatan Persembahyangan</option>
				<option value="Guru Pengampu">Guru Pengampu</option>
				<option value="Papan Tulis">Papan Tulis</option>
			</select>
		</td>
    </tr>
    
    <tr>
    	<td><label class="control-label">Nama Dokumen.</label></td>
        <td><input class="input-group" type="file" name="user_image" accept="image/*" /></td>
    </tr>
    
    <tr>
        <td colspan="2"><button type="submit" name="btnsave" class="btn btn-default">
        <span class="glyphicon glyphicon-save"></span> &nbsp; Simpan
        </button>
        </td>
    </tr>
    
    </table>
    
</form>
</div>
</div>
<?php
require_once 'views/footer.php';
?>