<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$username = $_REQUEST["username"];
$passwordIncoming = $_REQUEST["password"];
$documento = $_REQUEST["documento"];
$telefono = $_REQUEST["telefono"];
$correo = $_REQUEST["correo"];
$nombre = $_REQUEST["nombre"];
$estado = $_REQUEST["estado"];
$rol = $_REQUEST["rol"];
$doc = "";
$avatar = "";

$options = [
  'cost' => 11
];
$password = password_hash($passwordIncoming, PASSWORD_BCRYPT, $options);

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }
      
      $sql = "SELECT count(1) FROM USUARIOS WHERE USERNAME = ?";
      $stmt_u = $conn->prepare($sql);
      $stmt_u->bind_param('s', $username);
      $stmt_u->execute();
      $stmt_u->bind_result($found_u);
      $stmt_u->fetch();
      $stmt_u->close();

      if ($found_u && $username != "") {

          echo json_encode(array(
                              "message"=>"Error: El nombre de usuario ya existe",
                              "status"=>"Error"
                          ));

      } else {

        $sql = "SELECT count(1) FROM USUARIOS WHERE DOCUMENTO = ?";
        $stmt_doc = $conn->prepare($sql);
        $stmt_doc->bind_param('s', $documento);
        $stmt_doc->execute();
        $stmt_doc->bind_result($found_doc);
        $stmt_doc->fetch();
        $stmt_doc->close();
        if ($found_doc) {

          echo json_encode(array(
                            "message"=>"Error: El documento o NIT ya fue registrado",
                            "status"=>"Error"
                          ));

        }else{
          $sql = "INSERT INTO USUARIOS ( `DOCUMENTO`, `NOMBRE_RAZON_SOCIAL`, `ESTADO`, `TELEFONO`, `CORREO`, `ROL`, `USERNAME`, `PASS`, `TIPO_DOC`, `AVATAR`)
          VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
          $stmt = $conn->prepare($sql);
          $stmt->bind_param('ssssssssis',      
                            $documento,
                            $nombre,
                            $estado,
                            $telefono,
                            $correo,
                            $rol,
                            $username, 
                            $password,
                            $doc,
                            $avatar,
                            );
          
          if ($stmt->execute()){

            echo json_encode(array(
                              "message"=>"El usuario fue registrado correctamente", 
                              "status"=>"Success"
                            ));

          }else{

            echo json_encode(array(
                              "message"=>"Error al generar el registro",
                              "status"=>"Error"
                            ));

          }
        }
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



