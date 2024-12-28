<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$rol = $_REQUEST["rol"];
$telefono = $_REQUEST["telefono"];
$correo = $_REQUEST["correo"];
$nombre = $_REQUEST["nombre"];
$id = $_REQUEST["id"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }

    $sql = 
      '
        UPDATE USUARIOS SET
        NOMBRE_RAZON_SOCIAL=?,
        TELEFONO=?,
        CORREO=?,
        ROL=?
        WHERE ID=?
      '
    ;

      $stmt = $conn->prepare($sql);
      $stmt->bind_param('ssssi',      
                        $nombre,
                        $telefono,
                        $correo,
                        $rol,
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
            "message"=>"Error: al modificar el usuario",
            "status"=>"Error",
        ));
      }
} catch(mysqli_sql_exception  $e){
    echo $e->getMessage();
    die("and error has been ocurred" . $e);
}

$conn->close();
?>

