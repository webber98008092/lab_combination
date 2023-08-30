# Lab combination -- integer_division_modulus
* 實驗目的: 對input除以常數n後，回傳餘數
* 摘要: 參考下方 hackmd 檔案

## integer_division_modulus.v
輸入和輸出:  
input [31:0] a: 32位的輸入整數a。  
output reg [31:0] r: 32位的輸出整數r。

主要邏輯:  
在每次a改變時，always@ *塊會執行。  
定義了一個函數DivByConstant，它接受一個32位整數a作為輸入，並返回a除以常數1234101的商。  
計算r = a - 1234101 * DivByConstant(a)。

主要功能:  
該模塊的主要功能是計算輸入整數a除以常數1234101的餘數，並將其存儲在輸出變量r中。它使用了一個輔助函數DivByConstant來進行除法運算。然後，它使用該函數的結果來計算餘數r。

## integer_division_modulus_tb.v
目的: 該testbench的主要目的是驗證integer_division_modulus模塊的功能是否正確。它專門針對模塊進行測試，以確保其能正確地執行整數除法和取模運算。

流程:  
1.初始化變量和模塊: 在initial區塊中，將a初始化為32'd1234101，並對integer_division_modulus模塊進行實例化。  
2.進行測試: 在同一個initial區塊中，使用一個for循環從1234101到2468202遍歷整數i。每次迭代對a進行加1的操作。  

## synthesis.log
https://hackmd.io/9XrR36xwS2K68AaggIuzWg
