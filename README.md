# ArduinoProcessingLecture

URL: <https://github.com/ogai-lab/ArduinoProcessingLecture>

ArduinoとProcessingを用いた講義の資料。
過去の授業資料はpastディレクトリ以下に置く。

2024年7月の東京工芸大学工学部機械コース体験型模擬授業では以下の内容を行う。

- 第3回：PCとマイコンボードによるDCモータの制御
- 概要：パソコン(PC)からの入力により、マイコンボードArduino互換機を通してDCモータを制御する方法について学びます。使用したマイコンボードやモータ、電子部品などはお持ち帰りいただけます。

使用する機器の接続の様子(DCモータ2個の場合)：  
![ArduinoDCmotor](/images/ArduinoDCmotor.jpg)

## 使用するもの

### ソフトウェア

- Windows 10
- Arduino IDE
  - <https://www.arduino.cc/en/software> より無料でダウンロードできる。
- Processing
  - <https://processing.org/download> より無料でダウンロードできる。

### ハードウェア

- お持ち帰りいただけるもの
  - Arduino互換機 1台
    - <https://ja.aliexpress.com/item/32996691557.html>
  - USBケーブル 1本
  - DCモータ 1個
    - <https://ja.aliexpress.com/item/33021641990.html>
  - ワニ口クリップ 4本
    - <https://ja.aliexpress.com/item/33059461046.html>
  - ジャンパ線 7本
    - <https://ja.aliexpress.com/item/4000203371860.html>
  - 抵抗内蔵5mmLED赤 1個
    - <https://akizukidenshi.com/catalog/g/gI-06250/>
  - 光センサ 1個
    - <https://amz.run/5QHd>
  - MOSFET (IRF520) 1個
    - <https://ja.aliexpress.com/item/1005002567379132.html>
  - 整流ダイオード (1N4007) 1個
    - <https://ja.aliexpress.com/item/1005004345942815.html>
  - 抵抗10kΩ 1本
    - <https://amz.run/6zvj>
  - 単三電池4本用電池ボックス 1個
    - <https://amz.run/6zvi>
  - 単三電池 4本
  - ブレッドボード 1個
    - <https://amz.run/6zvn>
  
## Arduino

### Arduinoとは

<https://ja.wikipedia.org/wiki/Arduino>  
本授業では互換機を使用する。

### 基板LED点灯プログラム

まずはPCと接続する。計算機室のPCでは後ろ側のUSBポートに接続した方がなぜか挙動が安定する。  
Arduinoボード上の"L"と書かれている小さいLEDを点滅させる。  
メニューから以下のサンプルプログラムを開く。
> ファイル -> スケッチ例 -> 01.Basics -> Blink

メニューのツールから、ボードとポートの設定を確認してから、左上の右向きの矢印(→)ボタンを押すと、プログラムがArduinoにアップロードされる。アップロード後、自動的にプログラムが実行される。

"delay(1000)"と書かれているところの括弧中の数字を変えて再アップロードし、LEDの点滅速度を変えてみよう。

参考Webサイト：ArduinoとPCを接続してみよう  
<https://fabkura.gitbooks.io/arduino-docs/content/chapter3.html>

### 抵抗内蔵LED点灯プログラム

抵抗内蔵LEDをArduinoに直に差して動作を確認してみよう。  
通常、LEDの足の長い方がアノード(プラス)、短い方がカソード(マイナス)と呼ばれる。
以下のように接続する。

- 抵抗内蔵LED長い足 <-> Arduino 9番ピン
- 抵抗内蔵LED短い足 <-> Arduino GND

メニューから以下のサンプルプログラムを開く。
> ファイル -> スケッチ例 -> 01.Basics -> Fade

"int fadeAmount = 5"や"delay(30)"の数値を変えたときの、LEDの明るさの変化を見てみよう。

### 光センサプログラム

光センサで周囲の明るさを数値化してみよう。  
以下のように接続する。Arduino A0にはうまいこと2つの線を差す。線が途中で接触しないように注意しよう。

- 抵抗内蔵LED長い足 <-> Arduino 5v
- 抵抗内蔵LED短い足 <-> Arduino A0
- 光センサ <-> Arduino A0
- 光センサ <-> Arduino GND

メニューから以下のサンプルプログラムを開く。
> ファイル -> スケッチ例 -> 01.Basics -> AnalogReadSerial

スマホのライトなどをLEDに当てて、シリアルモニタに出力される値の変化を確かめよう。  
シリアルモニタはメニューの以下から起動できる。
> ツール -> シリアルモニタ

### 光センサの入力でLEDの明るさを変える(時間があれば)

光センサに当てる光の強さを変えて、LEDの明るさの変化を確かめよう。
あまり変化しなかったら、数字を変えたりしてみよう。  
メニューから以下のサンプルプログラムを開く。
> ファイル -> スケッチ例 -> 03.Analog -> AnalogInOutSerial

### DCモータ1個の動作確認

TinkercadによるDCモータ1個の回路図  
![Tinkercad-ArduinoDCmotor](/images/Tinkercad-Arduino1DCmotor.png)  
<https://www.tinkercad.com/things/7tMNzty2JFr>  
回路図内では抵抗のサイズが大きかったのでこのように示しているが、実際は抵抗はMOSFET左(ゲート)とMOSFET右(ソース)をまたぐように差せばよい。

ブレッドボードは中央部は縦方向に、上下部は横方向に内部で接続されている。(内部の画像：<https://m.media-amazon.com/images/I/713Uj2JUJaL._AC_SL1355_.jpg>)  
DCモータと電池ボックスは直接ブレッドボードに差さらないので、各端子をワニ口クリップではさみ、ワニ口クリップの反対側でジャンパ線をはさむ。そのジャンパ線の反対側をブレッドボードに差す。  
電池ボックスに単三電池4本を入れるのだが、<span style="color:red">赤線と黒線が直接接続されると高温になり危険</span>なので注意すること。  
モータはギアを付けると動きが分かりやすくなる。  
以下がつながるようにする。整流ダイオードは線が記載されている側をカソード、記載されていない側をアノードと呼ぶ。

- DCモータ1の線1、電池ボックス赤線、整流ダイオード(カソード)
- MOSFET左(ゲート)、Arduino 9番ピン、抵抗の片側
- MOSFET中(ドレイン)、DCモータ1の線2、整流ダイオード(アノード)
- MOSFET右(ソース)、電池ボックス黒線、抵抗の反対側、Arduino GND

メニューから以下のサンプルプログラムを開き、書き込むとDCモータが動くはずである。こちらも数値をいろいろ変えて試してみよう。
> ファイル -> スケッチ例 -> 01.Basics -> Fade

### 光センサの入力でDCモータを動かす(時間があれば)

光センサに当てる光の強さを変えて、モータの変化を確かめよう。  
メニューから以下のサンプルプログラムを開く。
> ファイル -> スケッチ例 -> 03.Analog -> AnalogInOutSerial

LEDに当てる光の強さを変えて、9番ピンに接続されているモータの動きが変わることを確認しよう。

## Processing

### Processingとは

<https://ja.wikipedia.org/wiki/Processing>

### Processingのテスト

サンプルプログラムがメニューのサンプルにいろいろあるので、動かしてみよう。
例えば以下など。
> ファイル -> サンプル -> Topics -> Cellular Automata -> GameOfLife

左上の三角マークのボタンを押すと実行され、ウィンドウが表示される。

参考Webサイト: Videoライブラリなどを追加インストールすることで、カメラなども使うことができる。
Slit Scanの例。
<https://www.youtube.com/watch?v=WCJM9WIoudI>

<!--
### Processingでのマイク動作テスト

サンプルプログラムはメニューの以下にあるので、動かしてみよう。
> ファイル -> サンプル -> ライブラリ -> Sound -> IO -> AudioInput

2022年夏の授業の環境ではSoundライブラリはインストール済。

マイクに声を出してみて、挙動を確かめよう。
-->

## Arduino+Processing

### Processingからのマウス入力により、ArduinoでDCモータを動かす

PCのマウス入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元にモータを動かす。  
ファイルは以下の場所に置いてある。授業では各PCに配布済。

- Arduino用プログラム [/Arduino/SerialByteDCmotor/SerialByteDCmotor.ino](/Arduino/SerialByteDCmotor/SerialByteDCmotor.ino)
- Processing用プログラム [/Processing/MouseXByte2Serial/MouseXByte2Serial.pde](/Processing/MouseXByte2Serial/MouseXByte2Serial.pde)

Processing用プログラムのSerial.list()[]の数値を変える必要があるかもしれない。  
Processingで起動したウィンドウ上のマウスの横方向の位置により、モータを動かすことができる。

### Processingからのキーボード入力により、ArduinoでDCモータを動かす(時間があれば)

PCのキーボード入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元にモータを動かす。  
ファイルは以下の場所に置いてある。授業では各PCに配布済。

- Arduino用プログラム [/Arduino/SerialByteDCmotor/SerialByteDCmotor.ino](/Arduino/SerialByteDCmotor/SerialByteDCmotor.ino)
- Processing用プログラム [/Processing/KeyLRByte2Serial/KeyLRByte2Serial.pde](/Processing/KeyLRByte2Serial/KeyLRByte2Serial.pde)

Processing用プログラムのSerial.list()[]の数値を変える必要があるかもしれない。  
lキー(left)とrキー(right)を押すと、モータを動かすことができる。
speedの値を変えたりして挙動を確かめよう。

<!--
### Processingからのマイク入力により、Arduinoでサーボモータを動かす

PCのマイク入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元にサーボモータを動かす。

- Arduino用プログラムはキーボード入力のものと同じ。
- Processing用プログラム [/Processing/MicrophoneByte2Serial/MicrophoneByte2Serial.pde](/Processing/MicrophoneByte2Serial/MicrophoneByte2Serial.pde)

マイク入力の大きさにより、サーボモータを動かすことができる。
VolumeMaxの値などを変えて挙動を確かめよう。
-->

<!--
## カメラ入力でモータを動かす

カメラ入力によってサーボモータの動きが変わるのを確かめよう。
講師によるデモ。

開発中。しないかも。

-->

## マイコンとDCモータの応用事例

様々な研究などでもマイコンやモータは使用されている。
持ち帰って自分でも自宅で試してみれば、きっと将来につながるだろう。

### Arduinoドローンの例

Arduino Drone With GPS  
<https://www.instructables.com/Arduino-Drone-With-GPS/>

### ArduinoとDCモータによるローバー研究

"Implementation of Digital Image Processing Using NI myRIO and Arduino Mega 2560 as Controller On Rover Bogie Robot"  
Arif Ainur Rafiq, Muhamad Yusuf, Pujono, Conference: 2018 International Conference on Applied Science and Technology (iCAST)  
<https://www.researchgate.net/publication/334155810_Implementation_of_Digital_Image_Processing_Using_NI_myRIO_and_Arduino_Mega_2560_as_Controller_On_Rover_Bogie_Robot>

## 今後の学習のために

### 今回の内容の復習

今回の内容はWebページ <https://github.com/ogai-lab/ArduinoProcessingLecture> で公開しています。
このURLをメモをして、お持ち帰りいただいたマイコンとモータで御自宅で再度試していただけたらと思います。

また、何でもご質問があれば制作者の大海のメールアドレスまでご連絡下さい。
担当されている方はホワイトボードにアドレスを書いておいて下さい。

### 参考書

- Arduinoをはじめよう 第4版 <https://www.oreilly.co.jp/books/9784814400232/>
- Processingをはじめよう 第2版 <https://www.oreilly.co.jp/books/9784873117737/>

### 追加学習案

#### Arduinoをはじめようキット

<https://www.switch-science.com/catalog/181/>  
Arduinoは互換機をそのまま使えるので、以下のような必要そうな部品だけ別に購入してもよい。

- ブレッドボード
- スイッチボタン
- 抵抗
- ジャンパ線、等々

#### パルスオキシメータ

ArduinoとMax30102でSpO2を計測する  
<https://qiita.com/ogailab/items/390ac4cb290b5b0802da>

#### DCモータ、ギアボックス

ブライテンベルグビークル(Braitenberg Vehicle)というロボットをArduinoで実装した例。
![BraitenbergVehicleTop](/images/BraitenbergVehicleTop.jpg)
![BraitenbergVehicleBottom](/images/BraitenbergVehicleBottom.jpg)

使用部品の例

- タミヤ ダブルギヤボックス <https://www.tamiya.com/japan/products/70168/index.html>
- Arduino用モータードライバシールド「Ardumoto」<https://www.switch-science.com/catalog/3262/>

## 工芸大PC演習室の設定

1. PCに各IDでログインする。
2. Arduino IDE, Processing, Google Chromeを起動しておく。
3. Google Chromeで、<https://github.com/ogai-lab/ArduinoProcessingLecture>、を開いておく。
4. Arduino互換機をあらかじめPCにUSBケーブルで接続をする。
5. Arduino IDE上で"Arduino Uno"に接続し、必要なライブラリをインストールさせておく。
6. 東京工芸大学PC演習室のPCのDelivery(V:)以下のV:\common\arduino_test\ArduinoProcessingLectureフォルダをTEMP(D:)以下ににコピーしておく。
