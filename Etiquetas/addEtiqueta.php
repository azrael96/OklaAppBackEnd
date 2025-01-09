<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$nombre = $_REQUEST["nombre"];
$descripcion = $_REQUEST["descripcion"];
$estado = "ACTIVO";
$padre = $_REQUEST["padre"];

if($padre == "Null"){
    $padre = NULL;
}

try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "INSERT INTO `ETIQUETA`(`NOMBRE`, `DESCRIPCION`, `ESTADO`, `PADRE_ID_FK`) 
    VALUES ( ?, ?, ?, ?);
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sssi', 
                    $nombre,
                    $descripcion,
                    $estado,
                    $padre,
                    );

    if ($stmt->execute()){

        echo json_encode(array(
            "message"=>"La etiqueta fue registrada correctamente", 
            "status"=>"Success"
        ));

    }else{

    echo json_encode(array(
            "message"=>"Error al generar el registro",
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