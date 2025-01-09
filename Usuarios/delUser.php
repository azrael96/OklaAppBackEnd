<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$id = $_REQUEST["id"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "DELETE 
    FROM `USUARIOS` 
    WHERE ID = ?;
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);

    if($stmt->execute()){
        echo json_encode(array(
            "message"=>"El usuario fue eliminado correctamente",
            "status" => "Success",
            )
        );
        
    }else{
        echo json_encode(array(
            "message"=>"Error: El usuario no se pudo eliminar",
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