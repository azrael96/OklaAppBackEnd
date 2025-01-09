<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$id = $_REQUEST["id"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "SELECT DOCUMENTO, NOMBRE_RAZON_SOCIAL, 
        ESTADO, TELEFONO, CORREO, ROL, USERNAME
        FROM USUARIOS
        WHERE ID = ?;
        ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);

    $stmt->execute();

    $resultado = $stmt->get_result();
    
    if($resultado->num_rows>0){
        $usuario = $resultado->fetch_assoc();

        echo json_encode(array(
            "message"=>"El usuario fue encontrado",
            "status" => "Success",
            "usuario" => $usuario,
            )
        );
        
    }else{
        echo json_encode(array(
            "message"=>"Error: El usuario no existe",
            "status"=>"Error"
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