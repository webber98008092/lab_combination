# Lab combination -- leading one
* 實驗目的: 輸入input，回報最高位1出現的位置
* 摘要: 參考下方 hackmd 檔案

## lab01.v
輸入和輸出:  
input [8:0] a: 一個9位的二進制輸入信號。  
output reg signed [4:0] index: 一個5位的有符號整數輸出，用於表示最高位的1在a中的位置。

主要邏輯:  
這個模塊使用一系列的if-else條件語句來檢查輸入a中最高位的1是在哪一位。依次檢查a[8]到a[0]，並將相對應的索引值賦予輸出index。

主要功能:  
這個模塊的主要功能是找到9位二進制數字a中最高位1的位置（索引）。如果a是全0，則輸出index會是-1。這通常被用於數位設計中的多種應用，如數據壓縮、尋址等。

## lab01_tb.v
目的: 這個testbench的主要目的是驗證leading_one模塊的正確性。它會生成各種可能的9位輸入值，然後比較模塊輸出的index與預期的“金標”(index_golden)是否匹配。

流程:  
1.初始化變量和模塊:
* 初始化一個a的值為9'd0，並將i設置為0。
* 實例化leading_one模塊。

2.生成和測試各種輸入:
* 使用for迴圈從i=0運行到i=511，即所有的9位二進制數字。
* 在每一次迴圈中，用leading_one_golden任務生成預期的index_golden。

3.比較和報告:
* 在每次迴圈中，使用#5的延遲來更新模塊的輸出。
* 如果index和index_golden不匹配，則顯示一個錯誤消息。
* 如果它們匹配，則顯示一個確認消息。
* 最後，使用#5的延遲後，使a增加1，以測試下一個數字。

## synthesis.log
https://hackmd.io/OZNjcHpUQYqeSbS6eWRL3g
