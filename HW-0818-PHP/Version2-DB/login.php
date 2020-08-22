<?php 

require_once('configdb.php') ;

session_start();
if (isset($_GET["logout"])) {
  session_destroy();
	header("Location: index.php");
	exit();
}

if (isset($_POST["btnHome"])) {
	header("Location: index.php");
	exit();
}

// 在btnOK裡有新建SESSION,只要登入不成功就會觸發這行指令顯示使用者輸入錯誤
$loginError = (isset($_SESSION["SloginError"])) ? "賬號或密碼錯誤" : "" ;
unset($_SESSION["SloginError"]);

if (isset($_POST["btnOK"]))
{
  $userName = $_POST["txtUserName"];
  $userPassword = $_POST["txtPassword"] ;

  // 簡單判斷使用者輸入時候為null, 是的話設定SESSION轉回login.php進來就會知道登入失敗
  if (trim($userName) == "" && trim($userPassword) == "") {
    $_SESSION["SloginError"] = "Error" ;
    header("Location: login.php");
    exit() ;
  }

  // 呼叫function新增資料庫連線
  $db = setupDb() ;
  // 準備資料庫指令, 用bindValue()將值放進去
  $cmd = $db->prepare("SELECT userId, userName, userPassword FROM user WHERE userName = :uN AND userPassword= :uP lock in share mode"); //lock IN share mode
  $cmd->bindValue(":uN", $userName);
  $cmd->bindValue(":uP", $userPassword);
  // 執行上述指令
  $cmd->execute();
  
  // 將$cmd結果讀出
  $row = $cmd->fetch();
  if($row) {
    // 設定SESSION
    $_SESSION["SuserId"] = $row['userId'] ;
    $_SESSION["SuserName"] = $row['userName'] ;
    // 關閉資料庫
    $db = null;  
  }else {
    // 如果資料庫沒有匹配到對應的賬密就會進入else, 
    $_SESSION["SloginError"] = "Error" ;
    header("Location: login.php");
    exit() ;
  }
  
  if (isset($_SESSION["lastPage"])){
    $temp = $_SESSION["lastPage"] ;
    unset($_SESSION["lastPage"]);
    header(sprintf("Location: %s", $temp));
  }else {
    header("Location: index.php");
  }
  exit() ;
}

?>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Lab - Login</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="login.php">
  <table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
    <tr>
      <td colspan="2" align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">會員系統 - 登入</font></td>
    </tr>
    <tr>
      <td width="80" align="center" valign="baseline">帳號</td>
      <td valign="baseline"><input type="text" name="txtUserName" id="txtUserName" /></td>
    </tr>
    <tr>
      <td width="80" align="center" valign="baseline">密碼</td>
      <td valign="baseline"><input type="password" name="txtPassword" id="txtPassword" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center" valign="baseline" style="color:red"><?=$loginError?></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#CCCCCC"><input type="submit" name="btnOK" id="btnOK" value="登入" />
      <input type="reset" name="btnReset" id="btnReset" value="重設" />
      <input type="submit" name="btnHome" id="btnHome" value="回首頁" />
      </td>
    </tr>
  </table>
</form>
</body>
</html>

