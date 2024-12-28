<?php
header("Access-Control-Allow-Origin");

include("db.php");

$offset = $_REQUEST["offset"];
$needle = $_REQUEST["needle"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "SELECT NOMBRE, PRECIO, IMAGEN, ID 
    FROM PRODUCTO 
    WHERE INSTR(`NOMBRE`, '{$needle}') > 0 
    ORDER BY NOMBRE 
    LIMIT ?, 10";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $offset);

    $stmt->execute();

    $resultado = $stmt->get_result();
    
    if($resultado->num_rows>0){
            echo json_encode(array(
                "message"=>"Productos encontrados",
                "status" => "Success",
                "productos" => $resultado->fetch_all(MYSQLI_ASSOC),
                )
            );
    }else{
        echo json_encode(array(
            "message"=>"Error: No hay productos",
            "status"=>"Error"
        ));
    }

} catch(Exception $e){
    echo $e->getMessage();
}

$conn->close();
?>