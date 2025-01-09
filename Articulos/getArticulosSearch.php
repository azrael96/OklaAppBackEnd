<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$offset = $_REQUEST["offset"];
$needles = $_REQUEST["needles"];
$articulos = array();
$admin = $_REQUEST["admin"];
$estado = $_REQUEST["estado"];

$activo = "ACTIVO";
$sql_global ="";

if ($estado == "NINGUNO"){
    $estado = "";
}

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    if($needles != [""]){

        $a = "SELECT (";

        $casesAtri = "";
        $casesArti = "";

        $b = ") AS counter, arti.NOMBRE, arti.PRECIO, 
        arti.IMAGEN, arti.ID, arti.REFERENCIA, arti.STOCK 
        FROM ARTICULO AS arti 
        LEFT JOIN ATRIBUTO AS atri 
        ON arti.ID= atri.ARTICULO_ID_FK 
        LEFT JOIN ETIQUETA AS etiq 
        ON etiq.ID= atri.ETIQUETA_ID_FK 
        WHERE (";
        
        $atributo = "";
        $articulo = "";  
        
        $c = $admin == "true" ? ") AND (INSTR(arti.ESTADO, ?) > 0) " : ") AND arti.ESTADO = ? ";

        $d = " GROUP BY arti.NOMBRE ORDER BY counter ASC LIMIT ?, 10";       
        $f = false;
        foreach ($needles as $n) {
            if(!$f) {
                $f = true;
                $atributo .= " (INSTR(atri.ESPECIFICACION, ?) > 0 AND etiq.ESTADO = 'ACTIVO') ";
                $articulo .= " INSTR(arti.NOMBRE, ?) > 0 ";
                $casesAtri .= " CASE WHEN ((INSTR(atri.ESPECIFICACION, ?) > 0) AND etiq.ESTADO = 'ACTIVO') then 1 else 2 end";
                $casesArti .= "+ CASE WHEN (INSTR(arti.NOMBRE, ?) > 0) then 1 else 2 end";
                continue;
            }
            $atributo .= " OR (INSTR(atri.ESPECIFICACION, ?) > 0 AND etiq.ESTADO = 'ACTIVO') ";
            $articulo .= " OR INSTR(arti.NOMBRE, ?) > 0 ";
            $casesAtri .= "+ CASE WHEN ((INSTR(atri.ESPECIFICACION, ?) > 0) AND etiq.ESTADO = 'ACTIVO') then 1 else 2 end";
            $casesArti .= "+ CASE WHEN (INSTR(arti.NOMBRE, ?) > 0) then 1 else 2 end";
        };

        $sql = $a . $casesAtri . $casesArti . $b . "(" . $atributo . ") OR (" . $articulo . ")" . $c . $d;
        $sql_global = $sql;

        $stmt = $conn->prepare($sql);

        $params = array_merge($needles, $needles, $needles, $needles);
        $admin == "true" ? array_push($params, $estado) : array_push($params, $activo);

        $types = str_repeat('s', count($params));
        
        $types .= "i";
        array_push($params, $offset);

        $stmt->bind_param($types, ...$params); 

        $stmt->execute();

        $resultados = $stmt->get_result();
        
        if($resultados->num_rows>0){

            foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
                if (!in_array($resultado, $articulos)){
                    array_push($articulos, $resultado);
                }
            }
        }
    }else{

        $sql= 
        "SELECT DISTINCT arti.NOMBRE, arti.PRECIO, arti.IMAGEN, 
        arti.ID, arti.REFERENCIA, arti.STOCK 
        FROM ARTICULO AS arti";
        $sql.= $admin == "true" ? " WHERE (INSTR(arti.ESTADO, ?) > 0) " : " WHERE arti.ESTADO = ? ";
        $sql.= " ORDER BY NOMBRE LIMIT ?, 10";
        $sql_global = $sql;

        $stmt = $conn->prepare($sql);
        if($admin == "true"){
            $stmt->bind_param('si', $estado, $offset);
        }else{
            $stmt->bind_param('si', $activo, $offset);
        }
        
        $stmt->execute();
        $resultados = $stmt->get_result();
        
        if($resultados->num_rows>0){

            foreach ($resultados->fetch_all(MYSQLI_ASSOC) as $resultado) {
                if (!in_array($resultado, $articulos)){
                    array_push($articulos, $resultado);
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

if($articulos){
    echo json_encode(array(
        "sql_global" => $sql_global,
        "admin" => $admin,
        "articulos"=>$articulos,
        "message"=>"Productos encontrados",
        "status" => "Success", 
    ));
}
else{
    echo json_encode(array(
        "needles" => $needles,
        "admin" => $admin,
        "message"=>"Productos no encontrados",
        "status" => "Error",
    ));
}

$conn->close();
?>