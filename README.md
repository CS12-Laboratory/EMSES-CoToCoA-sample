# EMSES-CoToCoA-sample

月面EMSESとCoToCoAを使うときのサンプルコード

月面EMSESをCoToCoAのrequesterとして、workerにデータを送るサンプルコードです。

このサンプルコードではEMSESの`phi`(ポテンシャル)の一部を`phi_data`としてworkerに送ります。

workerでは`read_data`という名前でポテンシャルのデータを受け取ります。

### 動かし方

#### 本サンプルリポジトリのクローン
```bash
git clone https://github.com/CS12-Laboratory/EMSES-CoToCoA-sample.git
```

#### 2. セットアップ
```bash
cd EMSES-CoToCoA-sample
cd simulators

# requesterのダウンロード
# `simulators/requester/src/cotocoa/ctcamain.F90` を`simulators/ctcamain.f90.in`で置き換えます。
chmod u+x setup-requester.sh
./setup-requester.sh

make
```

>  **注意**: 
>
> EMSESには通常モード(CoToCoAを使わず単独で動かすモード)、requesterモード、workerモードがあります。
> 
> 今回はrequesterモードで動かすため、EMSESのフォルダ内で`make requester`が実行されます。


#### 3. シミュレーションフォルダに移動しジョブを投入します

(例)

```bash
cd exp_hole_ctca
sbatch job.sh
```

### 結果確認

ジョブの出力ファイルを確認し、
requester: phi_data=
から始まる数値と
worker: read_data=
から始まる数値が一致していれば成功です。
