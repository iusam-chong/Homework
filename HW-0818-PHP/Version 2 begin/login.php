<?php 

session_start();
if (isset($_GET["logout"]))
{
  //unset($_SESSION["userName"]);
  session_destroy();
	header("Location: index.php");
	exit();
}

if (isset($_POST["btnHome"]))
{
	header("Location: index.php");
	exit();
}

if (isset($_POST["btnOK"]))
{
  $userName = $_POST["txtUserName"];
  $userPassowrd = $_POST["txtPassword"] ;
	if (trim($userName) != "" && trim($userPassowrd) != "")
	{
    $mysqli = new mysqli("localhost", "root", "", "homeworkphp");
    // if (mysqli_connect_errno()) {
    //     printf("連接失敗： %s\n", mysqli_connect_error());
    //     exit();
    // }

 
    $mysqli->query("SET NAMES 'utf8'");
    $resultset = $mysqli->query("SELECT * FROM user WHERE userName = '$userName' AND userPassword='$userPassowrd'");
    
    $row = $resultset->fetch_assoc() ;
    if($row) {
       
      // Set Session
      $_SESSION["SuserId"] = $row['userId'] ;
      $_SESSION["SuserName"] = $userName ;

      // close sql
      $resultset->close();
      $mysqli->close();

      if (isset($_SESSION["lastPage"])){
        $temp = $_SESSION["lastPage"] ;
        unset($_SESSION["lastPage"]);
        header(sprintf("Location: %s", $temp));
      }else {
        header("Location: index.php");
      }
    }else {
      // if input username/password incorrect do something here
      header("Location: index.php");
    }
  }else{
    header("Location: index.php");
  }
	
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
      <td colspan="2" align="center" bgcolor="#CCCCCC"><input type="submit" name="btnOK" id="btnOK" value="登入" />
      <input type="reset" name="btnReset" id="btnReset" value="重設" />
      <input type="submit" name="btnHome" id="btnHome" value="回首頁" />
      </td>
    </tr>
  </table>
</form>
</body>
</html>