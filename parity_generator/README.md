# Lab combination -- parity_generator
* 實驗目的: 能夠根據不同的輸入產生對應的parity bit
* 摘要: 參考下方 hackmd 檔案

## parity_generator.v
輸入和輸出:  
input [15:0] a: 這是一個16位寬的輸入數據線，用於傳遞二進制數據。  
output reg parity: 這是一個單一的輸出比特，用於表示輸入數據的奇偶校驗結果。

主要邏輯:  
always@ block*: 這個區塊對輸入數據進行奇偶校驗。具體來說，它對所有16個輸入比特進行XOR操作。結果存儲在parity輸出中。

主要功能:  
這個模塊的主要功能是計算16位二進制數據的奇偶校驗。奇偶校驗是一種簡單的錯誤檢測方法，通常用於通信協議。校驗位（在這種情況下是parity輸出）通常附加到原始數據上，以便接收方可以檢測是否有單比特錯誤。

## parity_generator_tb.v
目的: 這個Testbench的主要目的是驗證parity_generator模塊的功能正確性。它會比較硬體生成（parity_hw）和軟體（或理想）生成（parity_sw）的奇偶校驗結果。

流程:  
1.初始化變量和模塊: 初始設置a和temp為16'b0，並實例化parity_generator模塊。  
2.迭代測試所有可能的輸入: 使用一個for迴圈迭代所有可能的16位數字（從0到65535），將每個值賦給輸入a。  
3.校驗和比較:
* 在每次迭代中，首先調用parity_generator_sw任務來計算理想的（或軟體生成的）奇偶校驗值parity_sw。
* 使用#5的延遲來同步模擬時間，確保硬體模塊已經更新其輸出parity_hw。
* 如果硬體和軟體生成的校驗位不匹配，則使用$display來輸出不匹配的信息。

## synthesis.log
https://hackmd.io/xqMRdaKeQVaA9ZbyPs85Pw
