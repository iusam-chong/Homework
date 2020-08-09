# 0807Homework - CyDinBenDong Database
>[name=Sam_Chong] [time=Sun, Aug 9]
>
### :rocket: 資料庫環境

| 工具              |類型/版本          |
| -----------------|------------------|
| 資料庫            | MariaDB - 10.4.13|
| 網頁伺服器         | Apache/2.4.43    |
| phpMyAdmin版本    | 5.0.2            | 


<br>

### :books: ERD
![](https://i.imgur.com/gDyafU4.png)

<br>

### 💾 資料匯入
尋找本目錄下的**cydinbendong.sql**，開啟檔案將所有內容複製貼上到**phpMyAdmin的SQL查詢**或在**MySQL的Shell**上執行，也能選擇檔案匯入的方式執行

> 本次作業匯入匯出皆在phpMyAdmin中執行

匯入完成後可自行查看或複製以下指令執行簡易訂單查詢
```sql
SELECT o.OrderID, e.LastName, od.OrderDetailsID, s.CompanyName, p.ProductName, od.Quantity, p.Unitprice
    FROM orders AS o
        JOIN employees AS e ON o.EmployeeID = e.EmployeeID
        JOIN orderdetails AS od ON o.OrderID = od.OrderID 
        JOIN products AS p ON od.ProductID = p.ProductID
        JOIN suppliers AS s ON p.SupplierID = s.SupplierID
    ORDER BY o.OrderID DESC
```

<!--
- Code block with color and line numbers：
```javascript=16
var s = "JavaScript syntax highlighting";
alert(s);
```
-->