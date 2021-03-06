<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<style>
main {
	width: 100vw;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

form {
	width: 400px;
	border: solid 1px #EBEBEB;
	padding: 5rem;
}

button {
	margin-top: 2rem;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-
fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>Add buku</title>


<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
database.js"></script>

<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
firestore.js"></script>

<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-
storage.js"></script>


<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyDb-S1EBW_LUB0ECj0Ak3vCuTHpaauSQxw",
    authDomain: "realtime-db-web-e540b.firebaseapp.com",
    databaseURL: "https://realtime-db-web-e540b.firebaseio.com",
    projectId: "realtime-db-web-e540b",
    storageBucket: "realtime-db-web-e540b.appspot.com",
    messagingSenderId: "1044032280349",
    appId: "1:1044032280349:web:ddd0e916cdce3bd39073f4",
    measurementId: "G-YS0DVEDZSW"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>
</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">
	<!-- Begin Page Content -->
	<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">List buku</h1>
	
	<form class="user">
		<div class="form-group">
			<input type="text" class="form-control form-control-user" id="idbuku"
			placeholder="ID Buku">
		</div>
		<div class="form-group">
			<input type="text" class="form-control form-control-user" id="judul"
			placeholder="Judul">
		</div>
		<div class="form-group">
			<input type="text" class="form-control form-control-user" id="keterangan"
			placeholder="Keterangan">
		</div>
		<div class="form-group">
			<input type="text" class="form-control form-control-user" id="genre"
			placeholder="Genre">
		</div>
		<div class="form-group">
			<input type="text" class="form-control form-control-user" id="harga"
			placeholder="Harga">
		</div>
		
		<input type="button" value="Save" onclick="save_user();" class="btn
		btn-primary btn-user btn-block" />
		<hr>
	</form>
	
	</div>
	<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->
	

<script>
function save_user() {
var uid = document.getElementById('idbuku').value;
var judul = document.getElementById('judul').value;
var keterangan = document.getElementById('keterangan').value;
var genre = document.getElementById('genre').value;
var harga = document.getElementById('harga').value;
var data = {
idbuku: idbuku,
judul: judul,
keterangan: keterangan,
genre: genre,
harga: harga
}
var updates = {};
updates['/listbuku/' + uid] = data;
firebase.database().ref().update(updates);
alert('buku berhasil di tambahkan!');
}
</script>
</body>
</html>