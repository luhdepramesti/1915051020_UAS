<?php 

require_once 'session.php';
require_once 'koneksi.php';
require_once 'functions.php';

$nama     = $_POST['nama'];
$username = $_POST['username'];
$password = $_POST['password'];
$password2 = $_POST['password2'];

if($nama == '' && $username == '' && $password == '' && $password2 == ''){
	set_flash_message('gagal', 'Semua data wajib diisi!');
	header('Location: register');
	die();
}

$cek_username = mysqli_query($koneksi, "SELECT * FROM tbl_users WHERE username = '$username'");
if($cek_username->num_rows == 0){
	if($password == $password2){
		$password_hash = password_hash($password, PASSWORD_DEFAULT);
		$query = mysqli_query($koneksi, "INSERT INTO tbl_users (nama, username, password) VALUES('$nama', '$username', '$password_hash')");
		if($query == TRUE){
			set_flash_message('sukses', 'Pendaftaran berhasil! Silahkan login!');
			header('Location: login');
		} else die(mysqli_error($koneksi));
	} else {
		set_flash_message('gagal', 'Password tidak sama!');
		header('Location: register');
	}
} else {
	
	set_flash_message('gagal', 'Username sudah terdaftar!');
	header('Location: register');
}
?>