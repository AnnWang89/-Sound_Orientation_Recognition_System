###### tags: `嵌入式硬體`
# 嵌入式系統設計期末專題報告 - 聲音方位辨識系統
###### 指導教授：陳慶瀚 
###### 學生：王君安 黃鵬緒 蘇郁雅

## 題目：**聲音方位辨識系統**
  利用VHDL code 結合FPGA 讀取五個數位麥克風I2S訊號，偵測first arrive的麥克風，並把方位顯示在FPGA板的LED燈上。
  在I2S介面上，聲音的訊號簡化成全部HIGH或LOW，傳送雙聲道，將數據信號和時鐘信號分開傳輸，避免了時差誘發的失真，故採用I2S協議製作音頻接口。
>I2S硬體介面定義
    1. 序列時鐘SCLK，也叫位時鐘（BCLK），即對應數字音訊的每一位資料，SCLK都有1個脈衝，SCLK的頻率=2*取樣頻率*取樣位數。
    2. 幀時鐘LRCK，用於切換左右聲道的資料，1為左聲道，0為右聲道，LRCK頻率等於取樣頻率。
    3. 序列資料SD，就是用二進位制補碼錶示的音訊資料。
    4. 有時為了使系統能夠更好地同步，還需要另外一個訊號MCLK，稱為主時鐘，也叫系統時鐘（sys clock），一般是取樣頻率的256倍或是384倍。切記，MCLK並不是必須的。可有可無，看設計要求。
原文網址：https://kknews.cc/news/98onkkb.html

## IDEF0 階層式模組化架構

![](https://i.imgur.com/Xh2q8tj.png)

## Grafcet設計
* main

    ![](https://i.imgur.com/lbu8dy4.png)


* 聲音讀取A1
            
    ![](https://i.imgur.com/RjbBrcJ.png)


* 方位辨識A2

    ![](https://i.imgur.com/9QZxJpk.png)
            
* 燈號顯示A3

    ![](https://i.imgur.com/CpGAgAg.png)

## 波形模擬
 
![](https://i.imgur.com/UtGHgXA.png)
![](https://i.imgur.com/LMDBv7o.png)

 
