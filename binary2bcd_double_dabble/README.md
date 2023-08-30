# Lab combination -- binary2bcd_double_dabble
* 實驗目的: 使用double dabble的方式將binary形式的變數轉成bcd型態
* 摘要: 參考下方 hackmd 檔案

## binary2bcd_double_dabble.v
輸入和輸出:  
input [7:0] in_binary: 這是一個8位元的二進制輸入數字。  
output reg [15:0] unpacked_bcd: 這是一個16位元的輸出，其中包含非壓縮的BCD（Binary-Coded Decimal）表示形式。  
output reg [7:0] packed_bcd: 這是一個8位元的輸出，其中包含壓縮的BCD表示形式。

主要邏輯:  
初始化Scratchpad: 使用in_binary初始化scratch_pad_temp1和scratch_pad_temp2，並將最高8位設為0。  
Double Dabble 算法: 使用一個for迴圈和double_dabble函數來轉換二進制數字為BCD。  
結果整理: 經過迭代後，對scratch_pad_temp2進行左移運算得到scratch_pad_temp3。  
輸出賦值: 根據scratch_pad_temp3生成最終的packed_bcd和unpacked_bcd。

主要功能:  
這個模塊使用 Double Dabble 算法將8位元的二進制數字轉換為其對應的16位元的非壓縮BCD（unpacked_bcd）和8位元的壓縮BCD（packed_bcd）格式。

## binary2bcd_double_dabble_tb.v
目的: 這個testbench的主要目的是驗證binary2bcd_double_dabble模塊，確保它能正確地將8位元的二進制數字轉換為16位元的非壓縮BCD（unpacked BCD）和8位元的壓縮BCD（packed BCD）。

流程:  
1.模塊實例化: 創建了一個binary2bcd_double_dabble模塊的實例U，並連接其輸入和輸出到testbench中的對應信號。  
2.初始化: 初始設置in_binary為8位元的0。  
3.驗證迴圈: 使用一個for迴圈從0遍歷到99。在每次迭代中，in_binary會增加1，然後等待10單位時間（#10）

## synthesis.log
https://hackmd.io/j8m89hsyROm1XoIbawwUwg
