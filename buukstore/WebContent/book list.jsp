<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Thebuukstore || Your Online Bookstore</title>
	<link href="assets/img/book.png" rel="shortcut icon"/>
	
        <!-- Required CSS files -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/barfiller.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/main.css">
    
    <style>
    
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 60px;
 border: 2px solid #ddd;
  padding: 8px;
}
table tbody tr {
  height: 50px;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: left;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}

    
.table100-head th{
  font-family: OpenSans-Regular;
  font-size: 18px;
  line-height: 1.2;
  font-weight: unset;
  background-color:#858BE5 ;
}
    
table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 10px;
  overflow: hidden;
  width: 85%;
  margin: 0 auto;
  position: relative;
}
#myInput {
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 85%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
  margin-left: 100px;
}
    </style>
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

<body>
    <div class="preloader">
        <span class="preloader-spin"></span>
    </div>
    <div class="site">
        


            <header>
            <div class="container">
                <div class="row">
                    <div class="col-6 col-sm-3 logo-column">
                        <a href="index.html" class="logo">
                            <img src="assets/img/logo.png" alt="logo">
                        </a>
                    </div>
                    <div class="col-6 col-sm-9 nav-column clearfix">
                        <div class="right-nav">
                            <span class="search-icon fa fa-search"></span>
                            <form action="#" class="search-form">
                                <input type="search" placeholder="search now">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                            <div class="header-social">
                                <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
                                <a href="https://twitter.com/" class="fa fa-twitter"></a>
                            </div>
                        </div>
                        <nav id="menu" class="d-none d-lg-block">
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="book list.jsp">List Book</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>    <div class="page-title sp" style="background-image: url(assets/img/page-title.jpg)">
    <div class="container text-center">
        <h2>Find Your Book</h2>
        <p>Find your book within our thousand books and various genre to buy</p>
    </div>
</div>   
 <div class="portfolio-area sp">
<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
                                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Judul..">
                                    <table id="tb_listbuku">
                                        <thead>
                                            <tr class="table100-head">
                                            	<th>Kode ID Buku</th>
                                                <th>Judul</th>
                                                <th>Keterangan</th>
                                                <th>Genre</th>
                                                <th>Harga</th>
                                            </tr>
                                        </thead>
                                     
                                    </table>
                                </div>
							</div>
					</div>
			</div>
	</div>    
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3 footer_widget">
                    <div class="inner">
                        <h4>Stay Connected!</h4>
                        <p>Keep Checking Book on us, Because there's more of new releaced Book's at our Disposal!</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 footer_widget">
                    <div class="inner">
                        <h4>Company</h4>
                        <ul>
                            <li><a href="#">Company Overview</a></li>
                            <li><a href="#">Meet The Team</a></li>
                            <li><a href="#">Our Awesome Partners</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Frequently Asked Questions</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Terms of Use</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 footer_widget">
                    <div class="inner">
                        <h4>Recent Posts</h4>
                        <div class="media">
                            <a href="#">
                                <img src="assets/img/recent1.png" class="d-flex mr-3" alt="">
                            </a>
                            <div class="media-body">
                                <h5>
                                    <a href="#">How to make a Transaction</a>
                                </h5>
                                <span>May 10, 2019</span>
                            </div>
                        </div>
                        <div class="media">
                            <a href="#">
                                <img src="assets/img/recent1.png" class="d-flex mr-3" alt="">
                            </a>
                            <div class="media-body">
                                <h5>
                                    <a href="#">FAQ about The Buukstore</a>
                                </h5>
                                <span>June 22, 2019</span>
                            </div>
                        </div>
                        <div class="media">
                            <a href="#">
                                <img src="assets/img/recent1.png" class="d-flex mr-3" alt="">
                            </a>
                            <div class="media-body">
                                <h5>
                                    <a href="#">How to make a Complain</a>
                                </h5>
                                <span>January 22, 2020</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 footer_widget">
                    <div class="inner">
                        <h4>Address</h4>
                        <h5>Buukstore, Inc.</h5>
                        <p>Jalan Degur Blok AC 6 <br>Depok, Jawa Barat <br>P: (021) 77564322</p>
                        <h4>Newsletter</h4>
                        <form action="#" class="nw_form">
                            <input placeholder="Enter your email" type="email">
                            <button><i class="fa fa-paper-plane"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="copyright-txt">
                        © 2020 Buukstore. All Rights Reserved.
                    </div>
                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
       
       
        
    </div>

    <!--Required JS files-->
<script src="assets/js/jquery-2.2.4.min.js"></script>
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
	var cellJudul = row.insertCell(1);
	var cellKeterangan = row.insertCell(2);
	var cellGenre = row.insertCell(3);
	var cellHarga = row.insertCell(4);
	
	cellId.appendChild(document.createTextNode(childKey));
	cellJudul.appendChild(document.createTextNode(childData.judul));
	cellKeterangan.appendChild(document.createTextNode(childData.keterangan));
	cellGenre.appendChild(document.createTextNode(childData.genre));
	cellHarga.appendChild(document.createTextNode(childData.harga));
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
	var judul = cell2.innerHTML;
	var keterangan = cell3.innerHTML;
	var genre = cell4.innerHTML;
	var harga = cell5.innerHTML;
	
	document.getElementById('uid').value = id;
	document.getElementById('judul').value = judul;
	document.getElementById('keterangan').value = keterangan;
	document.getElementById('genre').value = genre;
	document.getElementById('harga').value = harga;
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
    td = tr[i].getElementsByTagName("td")[1];
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
<script src="assets/js/vendor/popper.min.js"></script>
<script src="assets/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/vendor/owl.carousel.min.js"></script>
<script src="assets/js/vendor/isotope.pkgd.min.js"></script>
<script src="assets/js/vendor/jquery.barfiller.js"></script>
<script src="assets/js/vendor/loopcounter.js"></script>
<script src="assets/js/vendor/slicknav.min.js"></script>
<script src="assets/js/active.js"></script>

</body>

</html>
