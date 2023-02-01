
function kakaoapi(response) {      

var data = { 'id' : response.id }

$.ajax({
type : 'POST',
url : '/coffeedao/getKakaoId.da' ,
data : data ,
//dataType 기입 필수
dataType : "json",
success:function(data){

if(data.check == "CHECK") {

alert("로그인성공");
location.href = '/coffeedao/main.da'

} else {

alert("로그인실패" + data.check);
location.href = '/coffeedao/fail.da'
}

},
error:function(request,error,data){

alert("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
}
});



 
  };
  