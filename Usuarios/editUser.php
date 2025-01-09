<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$rol = $_REQUEST["rol"];
$telefono = $_REQUEST["telefono"];
$correo = $_REQUEST["correo"];
$nombre = $_REQUEST["nombre"];

$estado = $_REQUEST["estado"];
$username = $_REQUEST["username"];
$documento = $_REQUEST["documento"];

$id = $_REQUEST["id"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }

    $sql = 
      '
        UPDATE USUARIOS SET
        DOCUMENTO=?,
        NOMBRE_RAZON_SOCIAL=?,
        ESTADO=?,
        TELEFONO=?,
        CORREO=?,
        ROL=?,
        USERNAME=?
        WHERE ID=?
      '
    ;

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sssssssi',
                      $documento,
                      $nombre,
                      $estado,
                      $telefono,
                      $correo,
                      $rol,
                      $username,
                      $id,
                      );
      
      if ($stmt->execute()){
        echo json_encode(array(
            "message"=>"El Usuario fue modificado correctamente",
            "status"=>"Success",
            "name"=> $nombre,
            "correo"=> $correo,
            "telefono"=> $telefono,
            "rol"=> $rol,
        ));
      }else{
        echo json_encode(array(
            "message"=>"Error: El usuario no se pudo modificar",
            "status"=>"Error",
        ));
      }
}
catch(mysqli $e){
  echo json_encode(array(
    "message"=>$e,
    "status"=>"Error",
  ));
  return $e;
}

$conn->close();
?>

