<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="assets/css/table.css">

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
#myInput {
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 85%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
  margin-top: 12px;
</style>
<meta charset="ISO-8859-1">
<title>Admin</title>
 <!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>

<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
database.js"></script>

<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
firestore.js"></script>

<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-
storage.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
		  apiKey: "AIzaSyAzbGDob3CGN_Ev4ta4m0_QB9dsNa0wjpI",
		    authDomain: "thebuukstore.firebaseapp.com",
		    databaseURL: "https://thebuukstore.firebaseio.com",
		    projectId: "thebuukstore",
		    storageBucket: "thebuukstore.appspot.com",
		    messagingSenderId: "728807924646",
		    appId: "1:728807924646:web:d86df0114645cbfc692567"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>

</head>

<body class="animsition">
<center>
    <div class="page-wrapper">
   
<div class="page-container">
         
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                                                 
                            
                                <h1 style="font-family: calibri">List Buku</h1>
										<hr/>
										<form class="user">
										<div class="form-group">
												<input type="text" class="form-control form-control-user" id="uid"
												placeholder="ID" readonly>
											</div>
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="number" class="form-control form-control-user"
												id="idbuku" placeholder="ID buku">
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-user"
												id="judul" placeholder="judul">
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-user"
												id="keterangan" placeholder="keterangan buku">
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-user"
												id="genre" placeholder="Genre buku">
											</div>
											
										</div>
										   <button onclick="winOpen()">
                                        <i class="zmdi zmdi-plus"></i>Add Item</button>
								<input type="button" value="Update" onclick="update_user();"
								class="btn btn-warning btn-user" />
								<input type="button" value="Delete" onclick="delete_user();"
								class="btn btn-danger btn-user" />
								<hr>
								</form>
                            </div>
                                <div class="table-responsive table-responsive-data2">
                                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Judul..">
                                    <table id="tb_listbuku" class="table table-data2">
                                        <thead>
                                            <tr>
                                            	<th>ID</th>
                                                <th>ID Buku</th>
                                                <th>Judul</th>
                                                <th>Keterangan</th>
                                                <th>Genre</th>
                                            </tr>
                                        </thead>
                                     
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                                
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2020 Thebuukstore. All rights reserved.</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

   </center>


    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>
	
    <!-- Main JS-->
    <script src="js/main.js"></script>
    
	<script>
		var tbWork = document.getElementById('tb_listbuku');
		var databaseRef = firebase.database().ref('listbuku/');
		var rowIndex = 1;
		databaseRef.once('value', function(snapshot) {
			snapshot.forEach(function(childSnapshot) {
			var childKey = childSnapshot.key;
			var childData = childSnapshot.val();
			var row = tbWork.insertRow(rowIndex);
			var cellId = row.insertCell(0);
			var cellIdbuku = row.insertCell(1);
			var cellJudul = row.insertCell(2);
			var cellKeterangan = row.insertCell(3);
			var cellGenre = row.insertCell(4);
			
			cellId.appendChild(document.createTextNode(childKey));
			cellIdbuku.appendChild(document.createTextNode(childData.idbuku));
			cellJudul.appendChild(document.createTextNode(childData.judul));
			cellKeterangan.appendChild(document.createTextNode(childData.keterangan));
			cellGenre.appendChild(document.createTextNode(childData.genre));
			rowIndex = rowIndex + 1;
			});
			
			var table = document.getElementById("tb_listbuku");
			var rows = table.getElementsByTagName("tr");
			for (i = 0; i < rows.length; i++) {
			var currentRow = table.rows[i];
			var createClickHandler = function(row) {
			return function() {
			var cell1 = row.getElementsByTagName("td")[0];
			var cell2 = row.getElementsByTagName("td")[1];
			var cell3 = row.getElementsByTagName("td")[2];
			var cell4 = row.getElementsByTagName("td")[3];
			var cell5 = row.getElementsByTagName("td")[4];
			
			var id = cell1.innerHTML;
			var idbuku = cell2.innerHTML;
			var judul = cell3.innerHTML;
			var keterangan = cell4.innerHTML;
			var genre = cell5.innerHTML;
			
			document.getElementById('uid').value = id;
			document.getElementById('idbuku').value = idbuku;
			document.getElementById('judul').value = judul;
			document.getElementById('keterangan').value = keterangan;
			document.getElementById('genre').value = genre;
			};
		};
		currentRow.onclick = createClickHandler(currentRow);
		}
		});
		
		function update_user(){
			var idbuku = document.getElementById('idbuku').value;
			var judul = document.getElementById('judul').value;
			var keterangan = document.getElementById('keterangan').value;
			var genre = document.getElementById('genre').value;
			var uid = document.getElementById('uid').value;
			var data = {
			idbuku: idbuku,
			judul: judul,
			keterangan: keterangan,
			genre: genre
			}
			var updates = {};
			updates['/listbuku/' + uid] = data;
			firebase.database().ref().update(updates);
			alert('buku berhasil di update!');
			reload_page();
			}
		
		function delete_user(){
			var uid = document.getElementById('uid').value;
			firebase.database().ref().child('/listbuku/' + uid).remove();
			alert('buku berhasil di hapus!');
			reload_page();
		}
	
		function winOpen() {
			window.open("add_buku.jsp",null,
			"height=500,width=400,status=yes,toolbar=no,menubar=no,location=yes");
		};

		function reload_page(){
		window.location.reload();
		}
	</script>
	<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("tb_listbuku");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
</body>

</html>