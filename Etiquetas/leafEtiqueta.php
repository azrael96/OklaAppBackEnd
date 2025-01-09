<?php
header("Access-Control-Allow-Origin");

include("../db.php");

try{

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = 
    "WITH RECURSIVE category_path (ID, NOMBRE, PADRE, path) AS
    (
    SELECT ID, NOMBRE, PADRE_ID_FK, NOMBRE as path
        FROM ETIQUETA
        WHERE PADRE_ID_FK IS NULL
    UNION ALL
    SELECT c.ID, c.NOMBRE, c.PADRE_ID_FK, CONCAT(cp.path, ' ', c.NOMBRE)
        FROM category_path AS cp JOIN ETIQUETA AS c
        ON cp.ID = c.PADRE_ID_FK
    )
    SELECT c1.ID, c1.NOMBRE, c1.PADRE, c1.path FROM category_path AS c1
    LEFT JOIN ETIQUETA c2 
    ON c2.PADRE_ID_FK = c1.ID
    WHERE c2.ID IS NULL
    ORDER BY path;
    ";

    $stmt = $conn->prepare($sql);
    //$stmt->bind_param('i', $offset);
    $stmt->execute();

    $resultado = $stmt->get_result();

    if($resultado->num_rows>0){
        $fila = $resultado->fetch_all(MYSQLI_ASSOC);
        echo json_encode(array(
            "message"=>"Se encontraron todas las etiquetas tipo hoja",
            "status"=>"Success",
            "etiquetas" => $fila,
        ));
    }else{
        echo json_encode(array(
            "message"=>"Error: No se encontraron todas las etiquetas tipo hoja",
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