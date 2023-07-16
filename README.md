# ArduinoProcessingLecture

URL: <https://github.com/ogai-lab/ArduinoProcessingLecture>

ArduinoとProcessingを用いた講義の資料。
過去の授業資料はpastディレクトリ以下に置く。

2023年7月の東京工芸大学工学部機械コース体験型模擬授業では以下の内容を行う。

- 第2回：PCとマイコンボードによる振動モータの制御
- 概要：パソコン(PC)からの入力により、マイコンボードArduino互換機を通して振動モータを制御する方法について学びます。使用したマイコンボードやモータ、電子部品などはお持ち帰りいただけます。

<!--
  使用する機器の接続の様子：
![Arduino2022-03-26](/images/Arduino2022-03-26.jpg)
-->

## 使用するもの

### ソフトウェア

- Windows 10
- Arduino IDE 1.8.19
  - <https://www.arduino.cc/en/software> より無料でダウンロードできる。
- Processing 3.5.4 for 64bit
  - <https://processing.org/download> より無料でダウンロードできる。

### ハードウェア

- お持ち帰りいただけるもの
  - Arduino互換機 1台
    - <https://ja.aliexpress.com/item/32996691557.html>
  - USBケーブル 1本
  - 振動モータ 3個
    - <https://ja.aliexpress.com/item/1005004653448729.html>
  - ワニ口クリップ 6本
    - <https://ja.aliexpress.com/item/33059461046.html>
  - ジャンパ線 4本
    - <https://ja.aliexpress.com/item/4000203371860.html>
  - 抵抗内蔵5mmLED赤黄 各1個
    - <https://akizukidenshi.com/catalog/g/gI-06250/>
    - <https://akizukidenshi.com/catalog/g/gI-06253/>
  - 光センサ 1個
    - <https://amz.run/5QHd>

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

### 振動モータ動作確認

振動モータの線が細いので、振動モータの線をワニ口クリップではさみ、ワニ口クリップの反対側でジャンパ線をはさむ。  
そのジャンパ線を以下のようにArduinoのピンに入れると、モータが動きだすはずである。  
振動モータの線は購入したままではワニ口クリップで掴みづらいので、ワイヤストリッパ(単線AWG28あたり)で被覆を5mm程度剥いている。  
振動モータの線は入れ替えても動く。

- 振動モータの線1 <-> ワニ口クリップ <-> ジャンパ線 <-> Arduino GNDピン
- 振動モータの線2 <-> ワニ口クリップ <-> ジャンパ線 <-> Arduino 3.3Vピン

### 振動モータプログラム

振動モータは定格電圧DC3V、電圧使用範囲がDC2.5V-4Vで、安全のため先にプログラムをアップロードする。  
まずは、メニューから以下のサンプルプログラムを選ぶ。LED用のプログラムだが流用できる。
> ファイル -> スケッチ例 -> 01.Basics -> Fade

以下のように"255"と書かれているところについて、

```Arduino
if (brightness <= 0 || brightness >= 255) {
```

以下のように"160"に変えて、アップロードする。

```Arduino
if (brightness <= 0 || brightness >= 160) {
```

そして、ワニ口クリップとジャンパ線で以下のとおり接続する。

- 振動モータの線1 <-> Arduino 9番ピン
- 振動モータの線2 <-> Arduino GNDピン

プログラム中の"int fadeAmount = 5"や"delay(30)"の数値を変えて、振動モータの変化の仕方を見てみよう。

### 振動モータ3個プログラム

先ほどと同じプログラムに、3箇所を以下のように追記する。  
1箇所目は、

```Arduino
int led = 9;
```

を以下に変える。

```Arduino
int led = 9;
int led2 = 5;
int led3 = 6;
```

2箇所目は、

```Arduino
pinMode(led, OUTPUT);
```

を以下に変える。

```Arduino
pinMode(led, OUTPUT);
pinMode(led2, OUTPUT);
pinMode(led3, OUTPUT);
```

3箇所目は、

```Arduino
analogWrite(led, brightness);
```

を以下に変える。

```Arduino
analogWrite(led, brightness);
analogWrite(led2, (brightness+53)%160);
analogWrite(led3, (brightness+106)%160);
```

そして、ワニ口クリップとジャンパ線で以下のとおり接続する。  
GNDピンに接続されているジャンパ線の反対側には3本のワニ口クリップが接続される。  
9、5、6番ピンはPWM出力に対応しているのでanalgoWrite関数が利用できる。

- 振動モータ1の線1 <-> Arduino 9番ピン
- 振動モータ1の線2 <-> Arduino GNDピン
- 振動モータ2の線1 <-> Arduino 5番ピン
- 振動モータ2の線2 <-> Arduino GNDピン
- 振動モータ3の線1 <-> Arduino 6番ピン
- 振動モータ3の線2 <-> Arduino GNDピン

振動モータが3個とも動くはずである。  
動いたら触ってみて、動きの違いを確認してみたり、どうして違うのか考えてみよう。

### 光センサの入力で振動モータを動かす(時間があれば)

光センサに当てる光の強さを変えて、振動モータの変化を確かめよう。  
メニューから以下のサンプルプログラムを開く。
> ファイル -> スケッチ例 -> 03.Analog -> AnalogInOutSerial

以下のように"255"と書かれているところについて、

```Arduino
outputValue = map(sensorValue, 0, 1023, 0, 255);
```

以下のように"160"に変えて、アップロードする。

```Arduino
outputValue = map(sensorValue, 0, 1023, 0, 160);
```

LEDに当てる光の強さを変えて、9番ピンに接続されている振動モータの動きが変わることを確認しよう。

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

### Processingからのマウス入力により、Arduinoで振動モータを動かす

PCのマウス入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元に振動モータを動かす。  
ファイルは以下の場所に置いてある。授業では各PCに配布済。

- Arduino用プログラム [/Arduino/SerialByteVibration/SerialByteVibration.ino](/Arduino/SerialByteVibration/SerialByteVibration.ino)
- Processing用プログラム [/Processing/MouseXByte2Serial/MouseXByte2Serial.pde](/Processing/MouseXByte2Serial/MouseXByte2Serial.pde)

Processing用プログラムのSerial.list()[]の数値を変える必要があるかもしれない。  
Processingで起動したウィンドウ上のマウスの横方向の位置により、モータを動かすことができる。

### Processingからのキーボード入力により、Arduinoで振動モータを動かす(時間があれば)

PCのキーボード入力をProcessingが受け取り、シリアル通信によってArduinoに送る。
Arduinoは受け取ったデータを元に振動モータを動かす。  
ファイルは以下の場所に置いてある。授業では各PCに配布済。

- Arduino用プログラム [/Arduino/SerialByteVibration/SerialByteVibration.ino](/Arduino/SerialByteVibration/SerialByteVibration.ino)
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

## マイコンと振動モータの応用事例

様々な研究などでもマイコンや振動モータは使用されている。
また、振動モータはスマートフォンやVR装置などでも広く使われている。
持ち帰って自分でも自宅で試してみれば、きっと将来につながるだろう。

### Arduinoドローンの例

Arduino Drone With GPS  
<https://www.instructables.com/Arduino-Drone-With-GPS/>

### VR研究に振動モータを用いた例

"Haplets: Finger-Worn Wireless and Low-Encumbrance Vibrotactile Haptic Feedback for Virtual and Augmented Reality"  
Pornthep Preechayasomboon, Eric Rombokas, Front. Virtual Real., Volume 2, 2021  
<https://www.frontiersin.org/articles/10.3389/frvir.2021.738613/full>

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

### 授業用ファイル置き場

東京工芸大学PC演習室のPCのDelivery(V:)以下のV:\common\arduino_test\以下に諸々置いてある。
学生アシスタントはその中のpreferences4t-kougei\readme.txtを読み指示に従うこと。

### ProcessingのProxy設定

東京工芸大学内ではProxyの設定をしないとProcessingが使用できない。以下のように学生アシスタントが設定する。

1. 所定の方法でProcessingを起動し、設定を開く。
2. 設定画面にあるpreferences.txtのパスをクリックすると、エクスプローラでpreferences.txtが入ったフォルダが開く。
3. Processingを終了する。
4. preferences.txtをダブルクリックし、所定の内容で編集し、保存、エディタを終了する。
5. Processingをまた起動する。

参考：蛍石製作所 processingのプロキシ設定 <https://fluorite36.hatenablog.com/entry/2018/11/09/002758>
