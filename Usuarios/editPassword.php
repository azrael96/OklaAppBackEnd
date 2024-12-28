<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$oldpassword = $_REQUEST["oldpassword"];
$newpasswordIncoming = $_REQUEST["newpassword"];
$id = $_REQUEST["id"];

$options = [
    'cost' => 11
  ];
$newpassword = password_hash($newpasswordIncoming, PASSWORD_BCRYPT, $options);

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "SELECT PASS FROM USUARIOS WHERE ID = ?";
    $stmt_u = $conn->prepare($sql);
    $stmt_u->bind_param('i', $id);
    $stmt_u->execute();
    $stmt_u->bind_result($fila);
    $stmt_u->fetch();
    $stmt_u->close();

    if (!password_verify($oldpassword, $fila)) {
        echo json_encode(array(
            "message"=>"Error: La contraseña actual ingresada es incorrecta",
            "status"=>"Error"
          ));

    } else {
        $sql = 
        '
          UPDATE USUARIOS SET
          PASS=?
          WHERE ID=?
        '
      ;

      $stmt = $conn->prepare($sql);
      $stmt->bind_param('si',      
                        $newpassword,
                        $id,
                        );
        
        if($stmt->execute()){
            echo json_encode(array(
                "message"=>"La contraseña fue modificada correctamente",
                "status"=>"Success",
            ));  
        }
    }
} catch(mysqli $e){
    die("and error has been ocurred" . $e);
}

$conn->close();
?>