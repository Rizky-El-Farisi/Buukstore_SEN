const userId = document.getElementById('userId');
const firstName = document.getElementById('firstName');
const lastName = document.getElementById('lastName');
const age = document.getElementById('age');
const addBtn = document.getElementById('addBtn');
const updateBtn = document.getElementById('updateBtn');
const removeBtn = document.getElementById('removeBtn');
const showBtn = document.getElementById('showBtn');

const database = firebase.database();
const db = firebase.firestore();
const usersRef = database.ref('/listbuku');
addBtn.addEventListener('click', e => {
    e.preventDefault();
    usersRef.child(userId.value).set({
        first_name: firstName.value,
        last_name: lastName.value,
        age: age.value
    });
});

updateBtn.addEventListener('click', e => {
    e.preventDefault();
    const newData = {
        first_name: firstName.value,
        last_name: lastName.value,
        age: age.value
    };
    usersRef.child(userId.value).update(newData);
});

removeBtn.addEventListener('click', e => {
    e.preventDefault();
    usersRef.child(userId.value).remove()
    .then(()=> {
        Console.log('User Deleted !');
    })
    .catch(error => {
        console.error(error);
    });
});

var a,b,c,d;

showBtn.addEventListener('click', e => {
    e.preventDefault();
    usersRef.once('value', function(snapshot) {
        snapshot.forEach(function(childSnapshot) {
          var childKey = childSnapshot.key;
          var childData = childSnapshot.val();
          a= childData.first_name;
          b= childData.last_name;
          c= childData.age;
          var tes=document.getElementById("test");
    tes.insertAdjacentHTML("beforeend","<tr onclick=ed("+childKey+")>"+
    "<td>"+childKey+"</td>"+
    "<td>"+a+"</td>"+
    "<td>"+b+"</td>"+
    "<td>"+c+"</td>"+
"</tr>");
        });
      });
});

function add(){
    var tes=document.getElementById("test");
    tes.insertAdjacentHTML("beforeend","<tr onclick=ed("+userId.value+")>"+
    "<td>"+userId.value+"</td>"+
    "<td>"+firstName.value+"</td>"+
    "<td>"+lastName.value+"</td>"+
    "<td>"+age.value+"</td>"+
"</tr>");
}


function lod(){
    usersRef.once('value', function(snapshot) {
        snapshot.forEach(function(childSnapshot) {
          var childKey = childSnapshot.key;
          var childData = childSnapshot.val();
          a= childData.first_name;
          b= childData.last_name;
          c= childData.age;
          var tes=document.getElementById("test");
    tes.insertAdjacentHTML("beforeend","<tr onclick=ed("+childKey+")>"+
    "<td>"+childKey+"</td>"+
    "<td>"+a+"</td>"+
    "<td>"+b+"</td>"+
    "<td>"+c+"</td>"+
"</tr>");
        });
      });
}

function ed(keyss){
    usersRef.once('value', function(snapshot) {
        snapshot.forEach(function(childSnapshot) {
          var childKey = childSnapshot.key;
          var childData = childSnapshot.val();
          if(childKey==keyss){
document.getElementById('userId').value= childKey;
    document.getElementById('firstName').value=childData.first_name;
    document.getElementById('lastName').value=childData.last_name;
    document.getElementById('age').value=childData.age;
          }
        });
      });
    
}