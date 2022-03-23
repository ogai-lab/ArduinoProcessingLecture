# ArduinoProcessingLecture

ArduinoとProcessingを用いた講義の資料。

URL: https://github.com/ogai-lab/ArduinoProcessingLecture


# はじめに


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

"delay(1000)"と書かれているところの括弧中の数字を変えて、LEDの点滅速度を変えてみよう。

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
以下のように接続する。

- 抵抗内蔵LED長い足 <-> Arduino 5v
- 抵抗内蔵LED短い足 <-> Arduino A0
- 光センサ <-> Arduino A0
- 光センサ <-> Arduino GND

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> 01.Basics -> AnalogReadSerial

明るさの変化をシリアルモニタで確かめよう。
シリアルモニタはメニューの以下から起動できる。
> ツール -> シリアルモニタ

## 光センサの入力でLEDの明るさを変える

光センサに当てる光の強さを変えて、LEDの明るさの変化を確かめよう。
あまり変化しなかったら、数字を変えたりしてみよう。

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> 03.Analog -> AnalogInOutSerial

## サーボモータテスト

ジャンパ線で以下のとおり接続する。

- サーボモータ橙色線 <-> Arduino 6番ピン
- サーボモータ赤色線 <-> Arduino 5Vピン
- サーボモータ茶色線 <-> Arduino GNDピン

以下のメニューからサンプルプログラムを使用する。
> ファイル -> スケッチ例 -> Servo -> Sweep

プログラム中の"myservo.attach(9)"の括弧内の数字を"6"に変える。
"delay(15)"の括弧内の数字を変えて、モータの動き方を変えてみよう。

## 光センサの入力でサーボモータを動かす


# Processing

## Processingとは

https://ja.wikipedia.org/wiki/Processing

## Processingのテスト

サンプルプログラムがメニューのサンプルにいろいろあるので、動かしてみよう。
例えば以下など。
> ファイル -> サンプル -> Topics -> Cellular Automata -> GameOfLife

## Processingでのマイク動作テスト

サンプルプログラムはメニューの以下にあるので、動かしてみよう。
> ファイル -> サンプル -> ライブラリ -> Sound -> IO -> AudioInput

2022年3月26日の授業の環境ではSoundライブラリはインストール済。

マイクへの音の大きさを変えてみて、挙動を確かめよう。


# Arduino+Processing

## Processingからのキーボード入力でサーボモータを動かす

キーボード入力によってサーボモータの動きが変わるのを確かめよう。

## マイク入力でモータを動かす

マイク入力によってサーボモータの動きが変わるのを確かめよう。

## カメラ入力でモータを動かす

カメラ入力によってサーボモータの動きが変わるのを確かめよう。
講師によるデモ。


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


# まとめ


# 今後足すとよいもの

## ブレッドボード

## スイッチボタン

## DCモータ
