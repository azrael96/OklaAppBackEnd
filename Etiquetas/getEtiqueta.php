<?php
header("Access-Control-Allow-Origin");

include("../db.php");
$ID = $_REQUEST["ID_ACTUAL"];

try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "SELECT e.ID, e.NOMBRE, e.DESCRIPCION, e.ESTADO, e.PADRE_ID_FK, p.NOMBRE as PADRE 
    FROM ETIQUETA as e
    LEFT JOIN ETIQUETA AS p
    ON e.PADRE_ID_FK = p.ID
    WHERE e.ID = ?;
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', 
                    $ID,);
    
    $stmt->execute();

    $resultado = $stmt->get_result();

    if($resultado->num_rows>0){
        $fila = $resultado->fetch_assoc();
        echo json_encode(array(
            "message"=>"Se enviaron todas las etiquetas",
            "status"=>"Success",
            "etiqueta" => $fila,
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

