# ArduinoProcessingLecture

URL: https://github.com/ogai-lab/ArduinoProcessingLecture

ArduinoとProcessingを用いた講義の資料。

2022年3月26日の東京工芸大学工学部機械コース体験授業では以下の内容で行う。

- タイトル：PCとマイコンボードによるサーボモータの制御
- 概要：PCからの様々な入力により、マイコンボードArduinoを通して小型サーボモータを制御する方法について体験します。またサーボモータやマイコンの、社会や研究での利用場面や応用可能性について学びます。
- 使用する機器の接続の様子：
![Arduino2022-03-26](/images/Arduino2022-03-26.jpg)

# 使用するもの

## ソフトウェア

- Windows 10
- Arduino IDE 1.8.19
  - https://www.arduino.cc/en/software より無料でダウンロードできる。
- Processing 3.5.4 for 64bit
  - https://processing.org/download より無料でダウンロードできる。

## ハードウェア

- 2022年3月26日の授業でお持ち帰りできるもの
  - Arduino互換機
    - https://ja.aliexpress.com/item/32996691557.html
  - USBケーブル
  - 小型サーボモータ
    - https://ja.aliexpress.com/item/1005003551920780.html
  - ジャンパ線3本
    - https://www.yodobashi.com/product/100000001003914674/
  - 抵抗内蔵5mmLED赤青
    - https://akizukidenshi.com/catalog/g/gI-06245/
    - https://akizukidenshi.com/catalog/g/gI-12519/
  - 光センサ
    - https://amz.run/5QHd
- その他備品
  - マイク


# Arduino

## Arduinoとは

https://ja.wikipedia.org/wiki/Arduino

2022年3月26日の授業では互換機を使用する。

## 基板LED点灯テスト

Arduinoボード上の"L"と書かれている小さいLEDを点滅させる。以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> 01.Basics -> Blink

メニューのツールから、ボードとポートの設定を確認してから、左上の右向きの矢印(→)ボタンを押すと、プログラムがArduinoにアップロードされる。アップロード後、自動的にプログラムが実行される。

"delay(1000)"と書かれているところの括弧中の数字を変えて再アップロードし、LEDの点滅速度を変えてみよう。

## 抵抗内蔵LED点灯テスト

抵抗内蔵LEDをArduinoに直に差して動作を確認してみよう。
通常、LEDの足の長い方がアノード(プラス)、短い方がカソード(マイナス)と呼ばれる。
以下のように接続する。

- 抵抗内蔵LED長い足 <-> Arduino 9番ピン
- 抵抗内蔵LED短い足 <-> Arduino GND

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> 01.Basics -> Fade

"int fadeAmount = 5"や"delay(30)"と書かれているところの括弧内の数字を変えて、
LEDの明るさの変化を変えてみよう。

## 光センサテスト

光センサで周囲の明るさを数値化してみよう。
以下のように接続する。Arduino A0にはうまいこと2つの線を差す。

- 抵抗内蔵LED長い足 <-> Arduino 5v
- 抵抗内蔵LED短い足 <-> Arduino A0
- 光センサ <-> Arduino A0
- 光センサ <-> Arduino GND

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> 01.Basics -> AnalogReadSerial

LEDに当てる光の強さを変えて、シリアルモニタに出力される値の変化を確かめよう。
シリアルモニタはメニューの以下から起動できる。
> ツール -> シリアルモニタ

<!--
## 光センサの入力でLEDの明るさを変える

光センサに当てる光の強さを変えて、LEDの明るさの変化を確かめよう。
あまり変化しなかったら、数字を変えたりしてみよう。

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> 03.Analog -> AnalogInOutSerial
-->

## サーボモータテスト

ジャンパ線で以下のとおり接続する。

- サーボモータ橙色線 <-> Arduino 6番ピン
- サーボモータ赤色線 <-> Arduino 5Vピン
- サーボモータ茶色線 <-> Arduino GNDピン

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> Servo -> Sweep

プログラム中の"myservo.attach(9)"の括弧内の数字を"6"に変える。
"delay(15)"の括弧内の数字や、0や180などの数字を変えて、モータの動き方を見てみよう。

## 光センサの入力でサーボモータを動かす

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> Servo -> Knob

プログラム中の"myservo.attach(9)"の括弧内の数字を"6"に変える。

LEDに当てる光の強さを変えて、モータの動きが変わることを確認しよう。

# Processing

## Processingとは

https://ja.wikipedia.org/wiki/Processing

## Processingのテスト

サンプルプログラムがメニューのサンプルにいろいろあるので、動かしてみよう。
例えば以下など。
> ファイル -> サンプル -> Topics -> Cellular Automata -> GameOfLife

左上の三角マークのボタンを押すと実行され、ウィンドウが表示される。

Videoライブラリなどを追加インストールすることで、カメラなども使うことができる。
Slit Scanの例。
https://www.youtube.com/watch?v=WCJM9WIoudI

## Processingでのマイク動作テスト

サンプルプログラムはメニューの以下にあるので、動かしてみよう。
> ファイル -> サンプル -> ライブラリ -> Sound -> IO -> AudioInput

2022年3月26日の授業の環境ではSoundライブラリはインストール済。

マイクに声を出してみて、挙動を確かめよう。

# Arduino+Processing

## Processingからのキーボード入力により、Arduinoでサーボモータを動かす

PCのキーボード入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元にサーボモータを動かす。

- Arduino用プログラム [/Arduino/SerialByteServo/SerialByteServo.ino](/Arduino/SerialByteServo/SerialByteServo.ino)
- Processing用プログラム [/Processing/KeyLRByte2Serial/KeyLRByte2Serial.pde](/Processing/KeyLRByte2Serial/KeyLRByte2Serial.pde)

Processing用プログラムのSerial.list()[]の数値を変える必要があるかもしれない。

lキー(left)とrキー(right)を押すと、サーボモータを動かすことができる。
speedの値を変えたりして挙動を確かめよう。

## Processingからのマウス入力により、Arduinoでサーボモータを動かす

PCのマウス入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元にサーボモータを動かす。

- Arduino用プログラムはキーボード入力のものと同じ。
- Processing用プログラム [/Processing/MouseXByte2Serial/MouseXByte2Serial.pde](/Processing/MouseXByte2Serial/MouseXByte2Serial.pde)

Processingで起動したウィンドウ上のマウスの横方向の位置により、サーボモータを動かすことができる。

## Processingからのマイク入力により、Arduinoでサーボモータを動かす

PCのマイク入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元にサーボモータを動かす。

- Arduino用プログラムはキーボード入力のものと同じ。
- Processing用プログラム [/Processing/MicrophoneByte2Serial/MicrophoneByte2Serial.pde](/Processing/MicrophoneByte2Serial/MicrophoneByte2Serial.pde)

マイク入力の大きさにより、サーボモータを動かすことができる。
VolumeMaxの値などを変えて挙動を確かめよう。

<!--
## カメラ入力でモータを動かす

カメラ入力によってサーボモータの動きが変わるのを確かめよう。
講師によるデモ。

開発中。しないかも。

-->

# マイコンとサーボモータの応用場面

## Arduinoドローンの例

Arduino Drone With GPS
https://www.instructables.com/Arduino-Drone-With-GPS/

## 二足歩行ロボットキットの例

近藤科学 KHR-3HV
https://www.vstone.co.jp/robotshop/index.php?main_page=index&cPath=70_117

## 顔の表情を生成するロボットの研究例

"Facially expressive humanoid robotic face",
Zanwar Faraj, Mert Selamet, Carlos Morales, Maimuna Hossain, Boyuan Chen, Hod Lipson, HardwareX, Volume 9, E00117, April 1, 2021
https://www.hardware-x.com/article/S2468-0672(20)30026-2/fulltext

# 今後の学習のために

## 参考書

- Arduinoをはじめよう 第2版 https://www.oreilly.co.jp/books/9784873115375/
- Processingをはじめよう 第2版 https://www.oreilly.co.jp/books/9784873117737/


## 追加学習案

### Arduinoをはじめようキット

https://www.switch-science.com/catalog/181/

Arduinoは互換機をそのまま使えるので、以下のような必要そうな部品だけ別に購入してもよい。

- ブレッドボード
- スイッチボタン
- 抵抗
- ジャンパ線、等々

### パルスオキシメータ

ArduinoとMax30102でSpO2を計測する
https://qiita.com/ogailab/items/390ac4cb290b5b0802da

### DCモータ、ギアボックス

ブライテンベルグビークルというロボットをArduinoで実装した例。

![BraitenbergVehicleTop](/images/BraitenbergVehicleTop.jpg)

![BraitenbergVehicleBottom](/images/BraitenbergVehicleBottom.jpg)

使用部品例
- タミヤ ダブルギヤボックス https://www.tamiya.com/japan/products/70168/index.html
- Arduino用モータードライバシールド「Ardumoto」https://www.switch-science.com/catalog/3262/

# その他

## 2022年3月26日の授業用ファイル置き場

東京工芸大学PC演習室のPCのDelivery(V:)以下のV:\common\arduino_test\以下に諸々置いてある。
学生アシスタントはその中のreadme.txtを読み指示に従うこと。

## ProcessingのProxy設定

東京工芸大学内ではProxyの設定をしないとProcessingが使用できない。
2022年3月26日の授業では以下のように学生アシスタントが設定する。

1. 所定の方法でProcessingを起動し、設定を開く。
2. 設定画面にあるpreferences.txtのパスをクリックすると、エクスプローラでpreferences.txtが入ったフォルダが開く。
3. Processingを終了する。
4. preferences.txtをダブルクリックし、所定の内容で編集し、保存、エディタを終了する。
5. Processingをまた起動する。

参考：蛍石製作所 processingのプロキシ設定 https://fluorite36.hatenablog.com/entry/2018/11/09/002758