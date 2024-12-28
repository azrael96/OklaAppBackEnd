<?php
header("Access-Control-Allow-Origin");

include("../db.php");

try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "";

    $stmt = $conn->prepare($sql);
    //$stmt->bind_param('i', $offset);

    $stmt->execute();

    $resultado = $stmt->get_result();

    if($resultado->num_rows>0){
        $fila = $resultado->fetch_all(MYSQLI_ASSOC);
        echo json_encode(array(
            "message"=>"Se enviaron todas las etiquetas",
            "status"=>"Success",
            "categorias" => $fila,
        ));
    }else{
        echo json_encode(array(
            "message"=>"Error: No hay etiquetas",
            "status"=>"Error"
        ));
    }
} catch(Exception $e){
    echo $e->getMessage();
}

$conn->close();
?>