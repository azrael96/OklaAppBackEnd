<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$offset = $_REQUEST["offset"];
$needle = $_REQUEST["needle"];
$vendedor = $_REQUEST["vendedor"]; // values T : Todos, SA : Sin Asignar, # : Codigo Vendedor.

$rol = "DISTRIBUIDOR"; //$_REQUEST["rol"];
$clientes = array();

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

    if($needle != ""){
        
        $a = "SELECT 
            DIST.ID, DIST.DOCUMENTO, DIST.NOMBRE_RAZON_SOCIAL,
            DIST.ESTADO, DIST.VENDEDOR_FK, 
            VEND.ID AS VID, VEND.NOMBRE_RAZON_SOCIAL AS VNOMBRE 
            FROM USUARIOS AS DIST
            LEFT JOIN USUARIOS AS VEND
            ON DIST.VENDEDOR_FK = VEND.ID
            WHERE 
            (
            ((INSTR(DIST.NOMBRE_RAZON_SOCIAL, ?) > 0)
            OR (INSTR(DIST.DOCUMENTO, ?) > 0))
            AND (INSTR(DIST.ROL, ?) > 0)
            AND (
                (INSTR(DIST.ESTADO, 'ACTIVO') > 0) 
                OR (INSTR(DIST.ESTADO, 'BLOQUEADO') > 0)
                )";
        $c = "
        )
        ORDER BY DIST.NOMBRE_RAZON_SOCIAL 
        LIMIT ?, 10";

        $flag = false;
        if($vendedor == "T"){
            $b = "";
        }
        else if($vendedor == "SA"){
            $b = "AND (DIST.VENDEDOR_FK IS NULL)";
        }
        else{
            $b = "AND (DIST.VENDEDOR_FK = ?)";
            $flag = true;
        }

        $sql = $a . $b . $c;

        $stmt = $conn->prepare($sql);
        if($flag == false){
            $stmt->bind_param("sssi", $needle, $needle, $rol, $offset);
        }else{
            $stmt->bind_param("ssssi", $needle, $needle, $rol, $vendedor, $offset);
        }
             
        $stmt->execute();

        $resultados = $stmt->get_result();

        if($resultados->num_rows>0){

            foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
                if (!in_array($resultado, $clientes)){
                    array_push($clientes, $resultado);
                }
            }
        }
    }
    else{

        $sql=
        $a="SELECT 
        DIST.ID, DIST.DOCUMENTO, DIST.NOMBRE_RAZON_SOCIAL,
        DIST.ESTADO, DIST.VENDEDOR_FK, 
        VEND.ID AS VID, VEND.NOMBRE_RAZON_SOCIAL AS VNOMBRE 
        FROM USUARIOS AS DIST
        LEFT JOIN USUARIOS AS VEND
        ON DIST.VENDEDOR_FK = VEND.ID
        WHERE (INSTR(DIST.ROL, ?) > 0)
        AND (
        (INSTR(DIST.ESTADO, 'ACTIVO') > 0) 
        OR (INSTR(DIST.ESTADO, 'BLOQUEADO') > 0)
        )";

        $c="
        ORDER BY DIST.NOMBRE_RAZON_SOCIAL
        LIMIT ?, 10";

        $flag = false;
        if($vendedor == "T"){
            $b = "";
        }
        else if($vendedor == "SA"){
            $b = "AND (DIST.VENDEDOR_FK IS NULL)";
        }
        else{
            $b = "AND (DIST.VENDEDOR_FK = ?)";
            $flag = true;
        }

        $sql = $a . $b . $c;

        $stmt = $conn->prepare($sql);
        if($flag == false){
            $stmt->bind_param('si', $rol, $offset);
        }else{
            $stmt->bind_param('ssi', $rol, $vendedor, $offset);
        }

        $stmt->execute();
        $resultados = $stmt->get_result();
        
        if($resultados->num_rows>0){

            foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
                if (!in_array($resultado, $clientes)){
                    array_push($clientes, $resultado);
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

if($clientes){
    echo json_encode(array(
        "sql" => $sql,
        "clientes" => $clientes,
        "message" => "Los usuarios fueron encontrados",
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