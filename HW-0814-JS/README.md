## 0814 Homework - ~~JS~~ Simple Chatroom

### 作業流程與說明
這次作業我粗略分3個階段進行

第1階段: <br>
優先完成作業基本要求，既重做課堂上所演示的JS程式內容並記錄過程，記錄過程的部分會在下方的影片以縮時呈現

第2階段：<br>
以前者的程式內容修改成聊天室，雖然過程上有錄影但是錄製時的檔案超出硬碟容量導致影片消失，所以第2階段並沒有縮時記錄，影片只會出現功能預覽的部分

第3階段：<br>
剪輯製作影片，GIF製作，撰寫MD

### 縮時記錄影片、功能展示

影片內容前面是縮時記錄，最後則是修改完的功能預覽，~~應該會有導覽功能~~

<!-- :::info
:mega: 影片有音樂，注意音量！~~應該會有導覽功能~~
::: {%youtube J53VhqsBFL4 %} -->
[傳送到 Youtube](https://youtu.be/J53VhqsBFL4)

### 程式設計

#### 執行環境與安裝
執行環境需要MySql以及Node.js，Node.js部分跟課堂上裝的一致並無新增API

```node.js
npm install express
npm install body-parser
npm install express-session
npm install ejs
npm install mysql
```
---
#### 效果預覽

Server端監聽與Client端請求

![](https://i.imgur.com/gbxPENY.gif)

ScrollBar效果

![](https://i.imgur.com/m1gsJgb.gif)

---
#### 聊天室是如何修改出來的？
首先，在課堂上的檔案原本就有server端程式在監聽，我只需要在client段新增一個不停發送請求的程式既可達到不停更新資料的效果

```ajax
function getData(){
    $.ajax({
        type : "get",
        url : "http://localhost/home/news",
    }).then(function(e){
        newsList =  JSON.parse(e);
        refreshUI() ;
    }).done(function(){
        setTimeout(() => {
            getData();
        }, 750);
    })
}
```

