<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$id = $_REQUEST["id"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "SELECT REFERENCIA, NOMBRE, PRECIO, DESCRIPCION, 
        IMAGEN, STOCK, ESTADO
        FROM ARTICULO
        WHERE ID = ?;
        ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);

    $stmt->execute();

    $resultado = $stmt->get_result();
    
    if($resultado->num_rows>0){
        $articulo = $resultado->fetch_assoc();

        $sql_2 = "SELECT ID, ESPECIFICACION, ETIQUETA_ID_FK
                FROM ATRIBUTO
                WHERE ARTICULO_ID_FK = ?;";

        $stmt_2 = $conn->prepare($sql_2);
        $stmt_2->bind_param('i', $id);

        $stmt_2->execute();

        $resultado = $stmt_2->get_result();
        
        if($resultado->num_rows>0){
            $atributo = $resultado->fetch_all(MYSQLI_ASSOC);
        }else{
            $atributo = "";
        }

        echo json_encode(array(
            "message"=>"Artículo encontrado",
            "status" => "Success",
            "articulo" => $articulo,
            "atributo" => $atributo,
            )
        );
        
    }else{
        echo json_encode(array(
            "message"=>"Error: El Artículo no existe",
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