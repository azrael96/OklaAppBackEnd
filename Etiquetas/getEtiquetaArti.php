<?php
header("Access-Control-Allow-Origin");

include("../db.php");

try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "";

    $stmt = $conn->prepare($sql);
    //$stmt->bind_param('i', $offset);
    $stmt->execute();

    $resultado = $stmt->get_result();

    if($resultado->num_rows>0){
        $fila = $resultado->fetch_all(MYSQLI_ASSOC);
        echo json_encode(array(
            "message"=>"Se encontraron las etiquetas del articulo",
            "status"=>"Success",
            "categorias" => $fila,
        ));
    }else{
        echo json_encode(array(
            "message"=>"Error: No se encontraron las etiquetas del articulo",
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