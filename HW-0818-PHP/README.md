# 0818 Homework - PHP

####  :pushpin: Tips :
> 這份README是各版本文件夾裡README的總整理 <br>
> 主要功能: SESSION / DB LOGIN

## 程式流程圖
![](https://i.imgur.com/m5Ny0ga.png)

## DB Setup
``` sql
CREATE DATABASE homeworkphp  DEFAULT CHARACTER SET utf8;

USE homeworkphp ;

CREATE TABLE IF NOT EXISTS `user` (
    `userId` tinyint(2) unsigned zerofill NOT NULL auto_increment,
    `userName` varchar(16) collate utf8_unicode_ci NOT NULL,
    `userPassword` varchar(64) collate utf8_unicode_ci NOT NULL,
    PRIMARY KEY  (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8   COLLATE=utf8_unicode_ci AUTO_INCREMENT= 11 ;

INSERT INTO `user` (`userName`, `userPassword`) VALUES
('alpha', '8ed3f6ad685b959ead7022518e1af76cd816f8e8ec7ccdda1ed4018e8f2223f8'),
('beta', 'f44e64e75f3948e9f73f8dfa94721c4ce8cbb4f265c4790c702b2d41cfbf2753')

/*
作業用為了方便userName=userPassword
*/
```

## 程式碼

### configdb.php
![](https://i.imgur.com/NKGX8sh.png)

### login.php
![](https://i.imgur.com/HyHbxaV.png)

### 在呼叫資料庫前添加hash
![](https://i.imgur.com/i7IPDuP.png)

### secret.php
![](https://i.imgur.com/Saj4KAJ.png)

## 畫面截圖
### 登入步驟
![](https://i.imgur.com/hGvptJ4.png)

### 添加資料庫後
![](https://i.imgur.com/hgtlBn3.png)

---