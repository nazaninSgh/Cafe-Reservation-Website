/**
 * Created by nazanin on 5/16/2019.
 */
var request=new XMLHttpRequest();
function searchInfo(){

  //  var name=document.search.search_id.value;

    var addBtn = document.createElement('button');
    addBtn.id = 'add';
    addBtn.className = 'btn-success';
    addBtn.innerHTML = 'اضافه کردن به منو'

    addBtn.onclick = function () {
        var addForm = document.getElementById('add-form');
        addForm.style.display = 'block';
    };
    var wrap = document.getElementById('wrap');

    wrap.appendChild(addBtn);
    var name = document.getElementById('search_id').value;

    var url="show-menu.jsp?search_id="+name;

    try{

        request.onreadystatechange=function(){
            if(request.readyState==4){
                document.getElementById('mylocation').innerHTML=request.responseText;
            }
        };
        request.open("GET",url,true);
        request.send();
    }catch(e){alert("Unable to connect to server");}
}
