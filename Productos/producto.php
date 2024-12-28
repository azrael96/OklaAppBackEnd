<?php
header("Access-Control-Allow-Origin");

include("db.php");

$id = $_REQUEST["id"];

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "SELECT 
        NOMBRE, 
        IMAGEN, 
        PRECIO, 
        STOCK, 
        PROCESADOR, 
        MARCA_PROCESADOR,	
        GENERACION_SERIE,
        RAM,
        TIPO_RAM,
        STORAGE,
        TIPO_STORAGE,
        TIPO_PANTALLA,
        TAMANO_PANTALLA,
        COLOR,
        PESO,
        LARGO,
        ANCHO,
        ALTO,
        DESCRIPCION
        FROM PRODUCTO WHERE ID = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);

    $stmt->execute();

    $resultado = $stmt->get_result();
    
    if($resultado->num_rows>0){
        echo json_encode(array(
            "message"=>"Producto encontrado",
            "status" => "Success",
            "producto" => $fila = $resultado->fetch_assoc(),
            )
        );
    }else{
        echo json_encode(array(
            "message"=>"Error: El producto no existe",
            "status"=>"Error"
        ));
    }

} catch(mysqli $e){
    die("and error has been ocurred" . $e);
}
 
$conn->close(); 
?>