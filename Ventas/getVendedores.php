<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$rol = "VENDEDOR"; //$_REQUEST["rol"];
$vendedores = array();

/*
if ($rol == "NINGUNO"){
    $rol = "";
}

if ($estado == "NINGUNO"){
    $estado = "";
}
*/

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql =
    "SELECT NOMBRE_RAZON_SOCIAL, ID
    FROM USUARIOS
    WHERE 
    (INSTR(ROL, ?) > 0)           
    ORDER BY NOMBRE_RAZON_SOCIAL;";

    $stmt = $conn->prepare($sql);

    $stmt->bind_param("s", $rol); 

    $stmt->execute();

    $resultados = $stmt->get_result();

    if($resultados->num_rows>0){

        foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
            if (!in_array($resultado, $vendedores)){
                array_push($vendedores, $resultado);
            }
        }
    }
}
catch(mysqli $e){
    echo json_encode(array(
      "message"=>$e,
      "status"=>"Error",
    ));
    return $e;
}

if($vendedores){
    echo json_encode(array(
        
        "vendedores"=>$vendedores,
        "message"=>"Los usuarios fueron encontrados",
        "status" => "Success", 
    ));
}
else{
    echo json_encode(array(
        "message"=>"Error: No se encontraron los usuarios",
        "status" => "Error",
    ));
}

$conn->close();
?>