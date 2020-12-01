<?php

$serividor = "maridoaluguel.cfsmf6733nps.sa-east-1.rds.amazonaws.com";
$usuario = "admin";
$senha = "mackenzie";
$banco = "maridoAluguel";

$conexao = mysqli_connect($serividor,$usuario,$senha,$banco);

mysqli_query($conexao,"INSERT INTO teste VALUES ('Thaina', 2)");


if ($conexao){
    echo"Conectado com sucesso!";
}
else{
    echo "Erro na Conexão";
}


