<?php
    include 'conexao.php';
$post = $_POST;
    if($post['acao'] == 'INSERIR') {
        $codigo = $post['codigo'];
        
        $nome = $post['nome'];
        $userName = $post['userName'];
        $cnpj = $post['cnpj'];
        $endereco = $post['endereco'];
        $email = $post['email'];
        $senha = $post['senha'];
        $dataNascimento = $post['dataNascimento'];
        $servicos = $post['servicos'];
        $nomeTitular = $post['nomeTitular'];
        $banco = $post['banco'];
        $agencia = $post['agencia'];
        $conta = $post['conta'];
        $cpfConta = $post['cpfTitular'];
        
        $query = 'INSERT INTO contratados()values($)';
        
        $result = mysql_query($query, $conn);
        
        if($result) {
            mysql_close($conn);
            echo "<script>location.href = 'form.php?msg=ok'</script>";
        }
        else {
            mysql_close($conn);
            echo "<script>location.href = 'form.php?msg=erro'</script>";
        }
    }
