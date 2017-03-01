## 1 Overview

#### 動的計画法と強化学習手法の対比に関する補足資料
Overviewの最後に動的計画法と強化学習の手法（価値反復，方策反復）との関連性が示唆されているが（強化学習は学習するバージョン）本書だけでは動的計画法に関する記述が短いので理解するのが難しいので、下記資料をザッと眺めると良いかもしれない。

- [Sutton and Barto (1998) の動的計画法の章](http://webdocs.cs.ualberta.ca/~sutton/book/4/node1.html)

#### 平均コスト問題 (average cost problem)
Bertsekas and Tsitsklis (1996)には`average cost per stage problem` についての記述がある。
割引報酬和（or コストの和）の期待値を指標として最適化するのとは別の指標（基準）を用いた問題。
具体的には割引報酬和の期待値のときには 

1. 1より小さいの割引率を使う
2. 吸収状態がありそれ以降報酬（コスト）が変わらない

のいずれかによって値が有限であることが保証されているが、適切な吸収状態がなかったり、割引をするのが適切でない問題もある。
そのため、各状態におけるコストの平均（の期待値）を指標とした問題が平均コスト問題である。

#### 適応サンプリング (adaptive sampling)
この本ではたびたび適応サンプリングという言葉が登場するが、具体的な説明はないが、
下記のThompsonによるスライドは分かりやすい。
どの値をサンプリングするかを、過去のサンプリングの履歴に依存する形で依存して決定するアプローチ全体を指すという理解。
探索と活用のトレードオフを考えるアルゴリズムはこの枠組に入ると思われる。

- Thompson (2011) [Adaptive sampling](http://www.mathstat.helsinki.fi/msm/banocoss/2011/Presentations/Thompson_web.pdf)

## 2.2 Markov Decision Processes

#### 最適符号化 (optimal coding) へのMDPの応用
情報源の発生情報量を見積もるためには、背後にある情報を生成する確率モデルを推定する必要があり、一つのモデルとしてMDPが使われる。

- マルコフ情報源とかで検索すると沢山関連資料がでてくる
  - [情報理論- 第6回 情報源モデルと通信路モデル](http://web.tuat.ac.jp/~s-hotta/info/slide6.pdf)
- 強化学習による定式化をした日本語での関連資料: [強化学習における収益の情報源符号化とその行動選択への応用](https://www.google.co.jp/webhp?sourceid=chrome-instant&rlz=1C5CHFA_enJP565JP565&ion=1&espv=2&ie=UTF-8#q=%E5%BC%B7%E5%8C%96%E5%AD%A6%E7%BF%92%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E5%8F%8E%E7%9B%8A%E3%81%AE%E6%83%85%E5%A0%B1%E6%BA%90%E7%AC%A6%E5%8F%B7%E5%8C%96%E3%81%A8%E3%81%9D%E3%81%AE%E8%A1%8C%E5%8B%95%E9%81%B8%E6%8A%9E%E3%81%B8%E3%81%AE%E5%BF%9C%E7%94%A8)

#### センサーネットワーク (sensor network) へのMDPの応用
ある基地局から別の基地局まで、他の基地局を経由しながら情報を適切に（短い距離で、失敗せずなど）送るためには動的計画法のような問題を解く必要がある、という理解。

- 関連がありそうなサーベイ: Alsheikh et al. (2015) [Markov Decision Processes with Applications in Wireless Sensor Networks: A Survey](https://arxiv.org/pdf/1501.00644.pdf)

#### ギャンブルの例の詳細
下記リンクでは、実際にギャンブラーが毎回の賭けに勝つ確率を既知（つまりモデルが既知）とした上で動的計画法（価値反復）によって最適方策を求めている。

- [Suttton and Barto (1998) のギャンブルに関する詳細な説明](http://webdocs.cs.ualberta.ca/~sutton/book/4/node5.html#SECTION00140000000000000000)

## 3.2 Algorithms for large state spaces

#### タイルコーディングに関連した文献
- http://web.cs.ucla.edu/~sherstov/pdf/sara05-tiling.pdf
- http://www.sciencedirect.com/science/article/pii/S0304397501000743
