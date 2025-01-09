<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$ID = $_REQUEST["id"];
$nombre = $_REQUEST["nombre"];
$descripcion = $_REQUEST["descripcion"];
$estado = $_REQUEST["estado"];
$padre = $_REQUEST["padre"];

if($padre == "Null"){
    $padre = NULL;
}

try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "UPDATE ETIQUETA 
    SET NOMBRE= ?, DESCRIPCION=?,
    ESTADO= ?, PADRE_ID_FK= ? 
    WHERE ID= ?
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sssii', 
                $nombre,
                $descripcion,
                $estado,
                $padre,
                $ID,
                );

    if ($stmt->execute()){
        echo json_encode(array(
            "message"=>"La etiqueta fue editada correctamente", 
            "status"=>"Success",
            "padre"=>$padre
        ));

    }else{

    echo json_encode(array(
            "message"=>"Error al cambiar la etiqueta",
            "status"=>"Error",
            "padre"=>$padre
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