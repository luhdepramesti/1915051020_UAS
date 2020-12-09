<?php 
require_once '../session.php';
require_once '../koneksi.php';
require_once '../functions.php';

if (!isset($_SESSION['auth'])) {
	set_flash_message('gagal', 'Anda harus login dulu!');
	header('Location: login');
}

if(!isset($_GET['id'])){
	header('Location: index');
}

$id = $_GET['id'];
$query = mysqli_query($koneksi, "DELETE FROM tbl_users WHERE id = $id");
if($query){
	set_flash_message('sukses', 'Akun berhasil dihapus!');
	header('Location: index');
} else die("gagal!" . mysqli_error($koneksi));

?>