<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$ID = $_REQUEST["id"];
try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "DELETE FROM `ETIQUETA` 
    WHERE ID= ?
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $ID);

    if ($stmt->execute()){
        echo json_encode(array(
            "message"=>"La Categoria fue eliminada correctamente", 
            "status"=>"Success"
        ));
    }else{

    echo json_encode(array(
            "message"=>"Error al eliminar el registro",
            "status"=>"Error"
        ));
    }
} catch(Exception $e){
    echo $e->getMessage();
}

$conn->close();
?>