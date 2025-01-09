<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$offset = $_REQUEST["offset"];
$needle = $_REQUEST["needle"];
$rol = $_REQUEST["rol"];
$estado = $_REQUEST["estado"];
$usuarios = array();

if ($rol == "NINGUNO"){
    $rol = "";
}
if ($estado == "NINGUNO"){
    $estado = "";
}

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    if($needle != ""){
        $sql =
        "SELECT *
        FROM USUARIOS
        WHERE 
        (
            ((INSTR(NOMBRE_RAZON_SOCIAL, ?) > 0)
            OR (INSTR(DOCUMENTO, ?) > 0))
            AND 
            (
                (INSTR(ROL, ?) > 0) 
                AND (INSTR(ESTADO, ?) > 0)
            )
        )
        ORDER BY NOMBRE_RAZON_SOCIAL 
        LIMIT ?, 10";

        $stmt = $conn->prepare($sql);

        $stmt->bind_param("ssssi", $needle, $needle, $rol, $estado, $offset); 

        $stmt->execute();

        $resultados = $stmt->get_result();

        if($resultados->num_rows>0){

            foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
                if (!in_array($resultado, $usuarios)){
                    array_push($usuarios, $resultado);
                }
            }
        }
    }
    else{

        $sql= 
        "SELECT * 
        FROM USUARIOS
        WHERE (INSTR(ROL, ?) > 0)
        AND (INSTR(ESTADO, ?) > 0) 
        ORDER BY NOMBRE_RAZON_SOCIAL
        LIMIT ?, 10";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param('ssi', $rol, $estado, $offset);

        $stmt->execute();
        $resultados = $stmt->get_result();
        
        if($resultados->num_rows>0){

            foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
                if (!in_array($resultado, $usuarios)){
                    array_push($usuarios, $resultado);
                }
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

if($usuarios){
    echo json_encode(array(
        "rol" => $sql,
        "usuarios"=>$usuarios,
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