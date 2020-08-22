<?php
   
    function setupDb() {
        // 新增資料庫連線協議
        $db = new PDO("mysql:host=localhost;dbname=homeworkphp", "root", "");
        // 設定字元集utf8, exec()與execute()差異在於後者需要prepare才可執行, 前者不用
        $db->exec("set names utf8");
        return $db ;
    }
?>