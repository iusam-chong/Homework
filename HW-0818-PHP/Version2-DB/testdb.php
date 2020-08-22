<?php
    /*===========================[01]建立連接===========================*/
    $mysqli = new mysqli("localhost", "root", "", "homeworkphp");

    if (mysqli_connect_errno()) {
        printf("連接失敗： %s\n", mysqli_connect_error());
        exit();
    }

    $userName = "alpha_user" ;
    $userPassowrd = "admin"  ;

    /*===========================[02]執行查詢======================*/
    $mysqli->query("SET NAMES 'utf8'");
    $resultset = $mysqli->query("SELECT * FROM user WHERE userName = '$userName' AND userPassword='$userPassowrd'");
   
    if($resultset) {
        $row = $resultset->fetch_assoc() ;
        echo "User ID：{$row['userId']}<br>";
		echo "User Name：{$row['userName']}<br>";
        // set_session ;
        
        //$resultset->close();
        //$mysqli->close();
        //header("Location: ");
    }
    // else {
    //     $resultset->close();
    //     $mysqli->close();
    // }

?>