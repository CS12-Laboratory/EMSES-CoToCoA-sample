#!/bin/bash
if [ ! -d "requester" ]; then
    # リポジトリをクローン
    git clone https://github.com/CS12-Laboratory/MPIEMSES3D.git

    # ディレクトリ名を「requester」に変更
    mv MPIEMSES3D requester

    cp ctcamain.F90.in requester/src/cotocoa/ctcamain.F90
else
    echo "ディレクトリ 'requester' は既に存在します。"
fi
