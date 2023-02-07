<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/test1.da" method="post" enctype="multipart/form-data">

<input type="text" name="name1">

<input type="text" name="name2">

<input type="text" name="name3">


<!-- <input type="file" accept="image/*" capture="camera" id="camera" name="camera"> -->

<input type="file" id="camera" name="camera">
<img id="frame">

<button>전송</button>


</form>

<script>
var camera = document.getElementById('camera');
var frame = document.getElementById('frame');

camera.addEventListener('change', function(e) {
var file = e.target.file;

if(camera != null){
alert(camera.value);}
else {
	alert("카메라 없음");
}

frame.src = URL.createObjectURL(file);
});


</script>


</body>
</html>