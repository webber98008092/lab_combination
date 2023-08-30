# Lab combination -- binary2bcd_div
* 實驗目的: 利用整數除法的方式將binary形式的變數轉換成bcd形式
* 摘要: 參考下方 hackmd 檔案

## binary2bcd_div.v
輸入和輸出:  
input [13:0] in_binary: 這是一個14位元的二進制輸入數。  
output [15:0] packed_bcd: 這是一個16位元的輸出，其中包含了4個4位元的BCD（二進制編碼十進制）數字。

主要邏輯:  
初始賦值與局部變數: 代碼首先將in_binary賦給局部變數a，並定義4個用於存儲各個BCD位元的變數（digit_1, digit_2, digit_3, digit_4）。  
計算每一個BCD數字: 使用get_digit函數來計算a的每一個數字（從個位到千位），並儲存到digit_1、digit_2、digit_3、digit_4中。  
除以10以獲取下一個數字: 在每次使用get_digit後，將a除以10，以便提取下一個更高位的數字。  
打包BCD: 最後，將這4個4位元數字打包成一個16位元的packed_bcd輸出。

主要功能:  
該模塊的主要功能是將一個14位元的二進制數轉換為其對應的16位元的BCD（二進制編碼十進制）表示。這通常用於數字顯示或其他需要十進制表示的應用。

## binary2bcd_div_tb.v
目的: 這個testbench的主要目的是驗證binary2bcd_div模塊是否能正確地將14位元的二進制數轉換為其相應的16位元的BCD（二進制編碼十進制）格式。

流程:  
1.初始化變數和實例: 在開始時，in_binary被初始化為14位元的0，並實例化了binary2bcd_div模塊。它還定義了一個名為packed_bcd_sw的軟體“黃金模型”，用於與硬體生成的packed_bcd_hw進行比較。  
2.迭代和測試: 使用一個for迴圈，遍歷所有可能的in_binary值（從0到9999）。在每次迭代中，都會呼叫binary2bcd_software任務來計算軟體版本的BCD值（packed_bcd_sw）。  
3.驗證和錯誤報告: 在每次迭代後，檢查硬體生成的packed_bcd_hw是否等於軟體生成的packed_bcd_sw。如果不相等，則顯示錯誤消息。這樣可以確保硬件模塊的功能與軟體“黃金模型”相符。  
4.時間延遲和計數器更新: 在每次迭代之後，有一個#160的時間延遲，然後in_binary會增加1，以進行下一次測試。

## synthesis.log
https://hackmd.io/rGialrIATR6CvZ_ki5YeAA
