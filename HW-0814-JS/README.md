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

>GIF傷眼抱歉

Server端監聽與Client端請求

![](https://i.imgur.com/gbxPENY.gif)

ScrollBar效果

![](https://i.imgur.com/m1gsJgb.gif)

---
#### 聊天室是如何修改出來的？
首先，在課堂上的檔案原本就有server端程式在監聽，我只需要在client段新增一個不停發送請求的程式既可達到不停更新資料的效果

```javascript=
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

然後在把元素排一排以及新增一個輸入欄位跟按鈕大致上就有一個聊天室的樣子惹

```htmlembedded=
<div class="row">
    <div class="col-lg-10 col-md-9 col-sm-9 col-xs-9">
        <!-- <span class="glyphicon glyphicon-pencil"></span> -->
        <input type="text"
        id="titleTextBox2"
        class="form-control"
        placeholder="偉人的話">
    </div>
    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
        <button type="button"
                id="okButton"
                class="btn near-moon-gradient">
            <span class="glyphicon glyphicon-ok"></span> 送出
        </button>
    </div>
</div>
```

---
#### ScrollBar製作

我製作scrollbar的方法**有點奇葩**，通常製作scrollbar是先在html裡規劃後盒子後才把div改成scrollbar，但是因為我是魔改作業的關係所以在css裡將list-group的class設一個高度上限讓他的內容物無法超出這個盒子，當內容物的高度超出盒子上限就會生成scrollbar

```css
.list-group{
    max-height: 310px;
    margin-bottom: 10px;
    overflow-y: auto ;
    -webkit-overflow-scrolling: touch;
}
```

再來如果一個聊天室不會跟著新訊息移動，感覺不夠人性化，所以就要讓新訊息一直保持在盒子的最低端；輸入欄的上方。

> element.scrollHeight // 元素的滾動最大值，也就是他能滾動的最大範圍，會因為資料的異動而有所變化，由上而下 0-MAX
> element.scrollTop // 元素目前滾動在的位置，scrollbar移動它的值就會變化

做法很簡單只要在client端讀取資料後讓scrollbar的顯示位置一直顯示在他的最高點就好。

```javascript=
 scrollBar.scrollTop = scrollBar.scrollHeight ;
```

但問題出現惹，這樣的話如果我想看上方的訊息時因為每次收到資料後都會把我拉到最下方位置，所以上方的做法可以更好，改成每次讀取資料後執行checkScrollBar()來判斷scrollbar當前位置是否要跟著新訊息往下

> lsh 是在呼叫這個function前抓取目前ScrollBar的位置
> distanceWithOutPx 是抓取盒子的高度，這個值其實一開始我們就在css設定了是310px，但因為要保持程式易維護的關係所以才弄個變數出來


```javascript=
function checkScrollBar(lsh) { //lastScrollHeight
        
    //console.log(lsh) ;
    let scrollBar = document.getElementById("latestNews");
    let distance = $(latestNews).css("max-height") ;

    let distanceWithOutPx = distance.replace('px','') ;
    //console.log(distanceWithOutPx) ;

    if(scrollBar.scrollHeight > lsh && (lsh-scrollBar.scrollTop) == distanceWithOutPx ){
        scrollBar.scrollTop = scrollBar.scrollHeight ;
        //console.log(scrollBar.scrollHeight - scrollBar.scrollTop) ;
    }
}
```

以上的判斷敘述翻成中文就是達成以下兩個條件
> 目前滾動最大值 大於 更新資料前的滾動最大值
> 上一次滾動最大值 減 目前的滾動值 必須等於 盒子的最大值

在白話一點就是既有新異動的資料進來以及現在的滾動位置必須是上一個滾動最大值的位置才會執行將滾輪拉到最低端的位置

---
#### 其它

人性化設計的坑越挖就越多細節，由於時限的關係無法一直繼續製作下去，所以作業內容目前就到此結束羅，謝謝。