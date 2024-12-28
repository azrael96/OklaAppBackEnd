<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$username = $_REQUEST["username"];
$password = $_REQUEST["password"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "SELECT * FROM USUARIOS WHERE USERNAME=?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);

    $stmt->execute();

    $resultado = $stmt->get_result();
    
    if($resultado->num_rows>0){
        $fila = $resultado->fetch_assoc();

        if(password_verify($password, $fila['PASS'])){
            echo json_encode(array(
                "message"=>"Inicio de sesión exitoso",
                "status"=>"Success",
                "id" => $fila['ID'],
                "name"=> $fila['NOMBRE_RAZON_SOCIAL'],
                "doc"=> $fila['DOCUMENTO'],
                "correo"=> $fila['CORREO'],
                "telefono"=> $fila['TELEFONO'],
                "username"=> $fila['USERNAME'],
                "rol"=> $fila['ROL'],
            ));
        }else{
            echo json_encode(array(
                "message"=>"Error: La contraseña es incorrecta",
                "status"=>"Error"
            ));
        }
    }else{
        echo json_encode(array(
            "message"=>"Error: El usuario no existe",
            "status"=>"Error"
        ));
    }

} catch(mysqli $e){
    die("and error has been ocurred" . $e);
}

$conn->close();
?>