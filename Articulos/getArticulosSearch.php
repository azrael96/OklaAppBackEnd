<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$offset = $_REQUEST["offset"];
$needles = $_REQUEST["needles"];
$articulos = array();
$data = "";
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
        INNER JOIN ATRIBUTO AS atri 
        ON arti.ID= atri.ARTICULO_ID_FK WHERE";

        $atributo = "";
        $articulo = "";  

        $c = " GROUP BY arti.NOMBRE ORDER BY counter ASC LIMIT ?, 10";       
        $f = false;
        foreach ($needles as $n) {
            if(!$f) {
                $f = true;
                $atributo .= " INSTR(atri.ESPECIFICACION, ?) > 0 ";
                $articulo .= " INSTR(arti.NOMBRE, ?) > 0 ";
                $casesAtri .= " CASE WHEN (INSTR(atri.ESPECIFICACION, ?) > 0) then 1 else 2 end";
                $casesArti .= "+ CASE WHEN (INSTR(arti.NOMBRE, ?) > 0) then 1 else 2 end";
                continue;
            }
            $atributo .= " OR INSTR(atri.ESPECIFICACION, ?) > 0 ";
            $articulo .= " OR INSTR(arti.NOMBRE, ?) > 0 ";
            $casesAtri .= "+ CASE WHEN (INSTR(atri.ESPECIFICACION, ?) > 0) then 1 else 2 end";
            $casesArti .= "+ CASE WHEN (INSTR(arti.NOMBRE, ?) > 0) then 1 else 2 end";
        };

        $sql = $a . $casesAtri . $casesArti . $b . "(" . $atributo . ") OR (" . $articulo . ")" . $c;
        $data = $sql;

        $stmt = $conn->prepare($sql);

        $params = array_merge($needles, $needles, $needles, $needles);
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
        FROM ARTICULO AS arti 
        ORDER BY NOMBRE LIMIT ?, 10";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $offset);

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

} catch(Exception $e){
    echo $e->getMessage();
}

if($articulos){
    echo json_encode(array(
        "needles" => $needles,
        "sql" => $data,
        "articulos"=>$articulos,
        "message"=>"Productos encontrados",
        "status" => "Success", 
    ));
}
else{
    echo json_encode(array(
        "needles" => $needles,
        "sql" => $data,
        "message"=>"Productos no encontrados",
        "status" => "Error",
    ));
}

$conn->close();
?>