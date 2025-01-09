<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$vendedor = $_REQUEST["IDVendedor"];
$distribuidor = $_REQUEST["IDDistribuidor"];

if($vendedor == "SA"){
  $vendedor = null;
}

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql =
    "UPDATE USUARIOS SET
     VENDEDOR_FK=?
     WHERE ID=?";

    $stmt = $conn->prepare($sql);

    $stmt->bind_param("ii", $vendedor, $distribuidor); 

    $resultados = $stmt->get_result();

    if ($stmt->execute()){
        echo json_encode(array(
            "sql" => $sql,
            "vendedor" => $vendedor,
            "distribuidor" => $distribuidor,
            "message"=>"El Vendedor fue asignado correctamente",
            "status"=>"Success",
        ));
      }else{
        echo json_encode(array(
            "sql" => $sql,
            "vendedor" => $vendedor,
            "distribuidor" => $distribuidor,
            "message"=>"Error: El vendedor no se pudo asignar",
            "status"=>"Error",
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