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

#### ギャンブルの例の詳細
下記リンクでは、実際にギャンブラーが毎回の賭けに勝つ確率を既知（つまりモデルが既知）とした上で動的計画法（価値反復）によって最適方策を求めている。

- [Suttton and Barto (1998) のギャンブルに関する詳細な説明](http://webdocs.cs.ualberta.ca/~sutton/book/4/node5.html#SECTION00140000000000000000)

## 3.2 Algorithms for large state spaces

#### タイルコーディングに関連した文献
- http://web.cs.ucla.edu/~sherstov/pdf/sara05-tiling.pdf
- http://www.sciencedirect.com/science/article/pii/S0304397501000743
