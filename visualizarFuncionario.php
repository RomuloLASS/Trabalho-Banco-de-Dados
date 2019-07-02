<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Visualizar Funcionário</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="publico/css/bootstrap.min.css" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="publico/css/estilo.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<?php
include "header.php";
?>

<body>
    <script language="JavaScript">
        function deletar(cpf) {
            fetch(`./deletarFuncionario.php?cpf=${cpf}`)
                .then(window.location.reload())
                .catch(console.error);
        }
    </script>
<!-- Tabela de Vendedores -->
    <div class="table-responsive">
        <fieldset>
        <legend>Vendedores:</legend>
            <table class="table table-bordered">
                <thead class="thead-light">
                    <th>Nome</th>
                    <th>Cpf</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                </thead>
                <tbody>
                    <?php
                    include_once("conexao.php"); /* Estabelece a conexão */
                    $sqlFuncioanario = "SELECT * FROM funcionarios f INNER JOIN vendedor v on (f.cpf=v.codigo_func)";
                    $resultado = mysqli_query($conexao, $sqlFuncioanario);
                    if (mysqli_num_rows($resultado) > 0) {
                        /* Dados de saída de cada linha */
                        while ($linha = mysqli_fetch_assoc($resultado)) {
                                echo "<tr><td>" . $linha["nome"] .
                                    "</td><td>" . $linha["cpf"] .
                                    "</td><td>" . $linha["telefone"] .
                                    "</td><td>" . $linha["endereco"] .
                                    "</td>" ;
                                echo "<td><a href=\"./editarFuncionario.php?cpf=$linha[cpf]\"><i class=\"fas fa-pencil-alt\"></i></a>" .
                                "<a href=\"javascript:deletar('$linha[cpf]')\"><i class=\"fas fa-trash\"></i></a>" .
                                "</td></tr>";
                            }
                    }
                    ?>
                </tbody>
            </table>
        </fieldset>
    </div>
    <!-- Fim da tabela de Vendedores -->
    <!-- Tabela de Gerente -->
    <div class="table-responsive">
        <fieldset>
        <legend>Gerente: </legend>
            <table class="table table-bordered">
                <thead class="thead-light">
                    <th>Nome</th>
                    <th>Cpf</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                </thead>
                <tbody>
                    <?php
                    $sqlFuncioanario = "SELECT * FROM funcionarios f INNER JOIN gerente g on (cpf=codigo_func)";
                    $resultado = mysqli_query($conexao, $sqlFuncioanario);
                    if (mysqli_num_rows($resultado) > 0) {
                        /* Dados de saída de cada linha */
                        while ($linha = mysqli_fetch_assoc($resultado)) {
                            if($linha["tipo"] == 2 || $linha["tipo"] == 0){ 
                                echo "<tr><td>" . $linha["nome"] .
                                    "</td><td>" . $linha["cpf"] .
                                    "</td><td>" . $linha["telefone"] .
                                    "</td><td>" . $linha["endereco"] .
                                    "</td>" ;
                                echo "<td><a href=\"./editarFuncionario.php?cpf=$linha[cpf]\"><i class=\"fas fa-pencil-alt\"></i></a>" .
                                "<a href=\"javascript:deletar('$linha[cpf]')\"><i class=\"fas fa-trash\"></i></a>" .
                                "</td></tr>";
                            }
                        }
                    }
                    mysqli_close($conexao);
                    ?>
                </tbody>
            </table>
        </fieldset>
    </div>
    <!-- Fim da tabela de Gerente -->
</body>

<?php
include "footer.php";
?>

</html>