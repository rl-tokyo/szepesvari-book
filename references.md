# 参考文献へのリンクまとめ

## 1 Overview
- Kaelbling et al. (1996) [Reinforcement Learning: A Survey](https://www.jair.org/media/301/live-301-1562-jair.pdf)
  - 50ページ未満でコンパクトなサーベイ。この本はこのサーベイの現代版を目指している。
- Bertsekas and Tsitsiklis (1996) [Neuro-Dynamic Programming](http://athenasc.com/ndpbook.html)
  - 理論的な詳細について細かい本。例えば本書では割引報酬和の期待値を指標として最適化をする話しかないが、それ以外の指標についての記述もある。
- Sutton and Berto (1998) [Reinforcement Learning: An Introduction](https://webdocs.cs.ualberta.ca/~sutton/book/the-book.html)
  - 界隈で一番有名な本。第二版が執筆中である。
- Bertsekas (2007) [Dynamic Programming and Optimal Control, volume 1., 2.](http://www.athenasc.com/dpbook.html)
  - 動的計画法/最適制御に関する包括的な教科書。強化学習の章もある。
- Bertsekas (2008) [Approximate dynamic programming (online chapter)](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.141.6891)
  - 上記のBertsekas (2007)の下巻第6章。本文中ではBertsekas (2010)となっている。
- Govsavi (2003) [Simulation-Based Optimization: Parametric Optimization Techniques and Reinforcement Learning](http://www.springer.com/us/book/9781489974907)
  - 平均コスト問題に焦点をあてている本。平均コスト問題については[こちら](note.md)にもまとめた。
- Cao (2007) [Stochastic Learning and Optimization: A Sensitivity-Based Approach](https://books.google.co.jp/books?id=Ot3J8AKuhLsC&lpg=PR7&ots=z-SHA2m4yc&lr=lang_en&hl=ja&pg=PA17#v=onepage&q&f=false)
  - 方策勾配法に焦点をあてている本。とくに *sensitivity-based approach* と呼ばれるものを理論の中心としている。方策空間の中で二つの点（二つの方策）に関する性能を比べることが出来るという設定のもとで、それによって良い方策を直接探すアプローチのように見える（例えば良い方策に逐次的に更新して行く方策反復が考えられる）。方策をパラメトライズして滑らかに変えれば方策勾配法になる。
- Powell (2007) [Approximate Dynamic Programming: Solving the curses of dimensionality](http://adp.princeton.edu/)
  - オペレーションズ・リサーチの観点から説明している本。
- Chang (2007) [Simulation-based Algorithms for Markov Decision Processes](http://castlelab.princeton.edu/ORF569papers/Fu%20-%20Simulation-based%20algorithms%20for%20MDPs.pdf)
  - 適応サンプリングに焦点を当てている本。
  - そもそも適応サンプリングがどんなものかはこちらの資料が参考になる: Thompson (2011) [Adaptive sampling](http://www.mathstat.helsinki.fi/msm/banocoss/2011/Presentations/Thompson_web.pdf)

## 3 Value prediction problems

- Frank et al. (2008) [Reinforcement Learning in the Presence of Rare Events](http://www.machinelearning.org/archive/icml2008/papers/580.pdf) ICML
  - `estimating the failure probability of a large power grid` と書いてあるが電力の話はしてない。 
  - 具体的手法としてのポイントは以下二点
	- 状態遷移確率に稀なイベントを表す項を追加し、問題の状況を表現している（稀なイベントの遷移を切り離して扱えるようにしている）
	- sampling weightを導入し、更新速度が遅くなる懸念とバリアンスの問題に対応している（ASA; adaptive importance sampling algorithm）
		- この論文では、さらにREASA（rare events adaptive stochastic approximation）という拡張を行い、TD(λ)よりも学習効率が良いことをシミュレーションで示している
  - 実データへの応用として、非常に低い確率であるはあるが、経路が遮断されることを考慮に入れた通信ネットワークのプランニングへと応用をしている。
	- 北米10都市のネットワークトラフィック問題（年3%程度の確率で需要スパイクが発生する状況で、トラフィックをどう捌くかという問題）に適用

## 3.1.1 Tabular TD(0)

- Polyak and Juditsky (1992) [Acceleration of stochastic approximation by averaging](https://www.researchgate.net/profile/Boris_Polyak2/publication/236736831_Acceleration_of_Stochastic_Approximation_by_Averaging/links/0f31753227e964baab000000/Acceleration-of-Stochastic-Approximation-by-Averaging.pdf)
  - いわゆる [Polyak Averaging](https://en.wikipedia.org/wiki/Stochastic_approximation)
  - ステップ幅の文脈で出てくるが、特にステップ幅の話ではない。過去の更新されたパラメータを記録しておいて平均することで新しいパラメータの推定値とする話。
  - こちらのスライドがわかりやすい: https://www.cs.ox.ac.uk/people/nando.defreitas/machinelearning/lecture5.pdf

- Tadic (2004) [On the Almost Sure Rate of Convergence of Linear Stochastic Approximation Algorithms](http://ieeexplore.ieee.org/document/1266818/)

## 3.2.1 TD(λ) with function approximation

- Van Roy (2006) [Performance loss bounds for approximate value iteration with state aggregation](http://web.stanford.edu/~bvr/pubs/aggregation.pdf)
  - 関数近似器を使ったときのTD(0)はTD(1)と比べてサンプル無限大で近似誤差が劣ってしまうが、（状態集約をしたときの）制御性能では劣っていないという文脈で引用されている論文。
- Sutton et al. (2008) [Dyna-Style Planning with Linear Function Approximation and Prioritized Sweeping](https://arxiv.org/pdf/1206.3285.pdf)
- Parr et al al. (2008) [An Analysis of Linear Models, Linear Value-Function Approximation, and Feature Selection for Reinforcement Learning](https://users.cs.duke.edu/~parr/icml08.pdf)

## 3.2.3 Least-squares methods

- Bertsekas et al. (2004) [Improved Temporal Difference Methods with Linear Function Approximation](http://web.mit.edu/dimitrib/www/TD_Policy_Eval_04.pdf)
  - λ-LSPEとLSTD(λ)の比較の文脈で引用される。9.5節ではLSTDによって推定されるパラメータが真値へ収束するより速く，LSPEによって推定されるパラメータがLSTDによって推定されるパラメータへと収束する旨が主張されており、LSPEがLSTDに比類する根拠とされている。
- Lin (1992) [Self-Improving Reactive Agents Based On Reinforcement Learning, Planning and Teaching](https://pdfs.semanticscholar.org/9cd8/193a66cf53143cbba6ccb0c7b9c2ebf2452b.pdf)
  - 経験再生を提案している論文

## 3.2.4 The choice of the function space

- Gyorfi et al. [A Distribution-Free Theory of Nonparametric Regression](http://web.stanford.edu/class/ee378a/books/book1.pdf) 2002
  - p.192のTheorem11.3を強化学習の文脈に直してそのまま登場させている．
- Munos&Szpezari 2008 [Finite-Time Bounds for Fitted Value Iteration](https://sites.ualberta.ca/~szepesva/papers/munos08a.pdf)
  - 適合価値反復の有限サンプルにおける性能のバウンドを導いているという文脈で登場
- Antos et al. 2007 [Learning Near-Optimal Policies with Bellman-Residual Minimization Based Fitted Policy Iteration and a Single Sample Path](https://hal.archives-ouvertes.fr/inria-00117130/document) COLT2006
  - 近似方策反復法の有限サンプルにおける性能のバウンドを導いているという文脈で登場
- Antos et al. 2008 [Fitted Q-iteration in continuous action-space MDPs](https://papers.nips.cc/paper/3233-fitted-q-iteration-in-continuous-action-space-mdps.pdf) NIPS2008
  - 適合actor-criticの有限サンプルにおける性能のバウンドを導いているという文脈で登場
  - `This algorithm, which we could also call a fitted actor-critic algorithm`

## 4.2.1 Online learning in bandits

- Audibert et al. (2009) [Exploration-exploitation trade-off using variance estimates in multi-armed bandits](http://certis.enpc.fr/~audibert/Mes%20articles/TCS08.pdf)
  - UCBにおける定数Rの代わりに、推定した分散を使うアルゴリズムの分析をした話。 **[TODO: Resultsについてひと言書く]**

## 4.2.3 Active learning in Markov Decision Processes
- Ortner (2008) [Online regret bounds for Markov decision processes with deterministic transitions](http://ac.els-cdn.com/S0304397510002008/1-s2.0-S0304397510002008-main.pdf?_tid=baf2ef9e-e582-11e6-bea4-00000aab0f26&acdnat=1485626212_65faa377ff897ad0b15b7c54390e8b33)
- Kearns and Singht (2002) [Near-Optimal Reinforcement Learning in Polynomial Time](https://www.cis.upenn.edu/~mkearns/papers/KearnsSinghE3.pdf), Machine Learning.
  - E3アルゴリズムを提案。行動空間・状態空間のサイズ、及び時間T (mixing time or horizon time) の多項式オーダーの行動数と計算時間で探索が終わるアルゴリズム、という理解。
- Brafman and Tennenholtz (2002) [R-MAX - A General Polynomial Time Algorithm for Near-Optimal Reinforcement Learning](http://www.jmlr.org/papers/volume3/brafman02a/brafman02a.pdf), JMLR
  - R-MAXアルゴリズムを提案。E3アルゴリズムが洗練されている。

## 4.2.4 Online learning in Markov DecisionProcesses
- Auer et al. (2010) [Near-optimal Regret Bounds for Reinforcement Learning](http://www.jmlr.org/papers/volume11/jaksch10a/jaksch10a.pdf) JMLR
  - UCRL2アルゴリズムの提案
- Bartlett and Tewari (2009) [REGAL: A Regularization based Algorithm for Reinforcement
Learning in Weakly Communicating MDPs](https://arxiv.org/pdf/1205.2661v1.pdf) UAI
  - transient stateをもつMDPに対してのリグレットのバウンドを考えている話（？）
- Brafman and Tennenholtz [R-max – A General Polynomial Time Algorithm for Near-Optimal Reinforcement Learning](http://www.jmlr.org/papers/volume3/brafman02a/brafman02a.pdf) JMLR
- Kakade (2003) [On the Sample Complexity of
Reinforcement Learning](https://homes.cs.washington.edu/~sham/papers/thesis/sham_thesis.pdf) PhD thesis
  - （改良版の）R-MAXがPAC-MDPであることを示し、下界も示した。
- Szita and Szepesvari (2010) [Model-based reinforcement learning with nearly tight exploration complexity bounds](http://citeseerx.ist.psu.edu/viewdoc/download;jsessionid=46E2A19A7D4C4775430F2C4767749453?doi=10.1.1.170.2457&rep=rep1&type=pdf) ICML
  - MorMax
- Strehl et al. (2006) [PAC Model-Free Reinforcement Learning](http://cseweb.ucsd.edu/~ewiewior/06efficient.pdf) ICML
  - 遅延Q学習
- Strehl and Littman (2008) [Online Linear Regression and Its Application to
Model-Based Reinforcement Learning](https://papers.nips.cc/paper/3197-online-linear-regression-and-its-application-to-model-based-reinforcement-learning.pdf) NIPS
  - 大規模なMDPを解く問題を考えている。

## 4.4.2 Implementinganactor

- Bhatnagar et al. (2009) [Natural Actor–Critic Algorithms](https://webdocs.cs.ualberta.ca/~sutton/papers/BSGL-TR.pdf) Automatica
- Singh et al. (2000) [Convergence Results for Single-Step On-Policy Reinforcement-Learning Algorithms](https://sites.ualberta.ca/~szepesva/papers/singh98convergence.pdf)
  - CriticにテーブルSARSA(0)を用いて、GLIEという条件を満たす方策を更新していくと、漸近的に最適方策と一致するという結果を示した論文。

## 5.1.0 Further reading
- Chow and Tsitsiklis (1989) [The Complexity of Dynamic Programming](http://www.mit.edu/~jnt/Papers/J026-89-dpcomplexity.pdf) Journal of Complexity
  - オフラインのプランニングの計算量の文脈で引用されている論文。
- Rust (1996) [Using Randomization to Break the Curse of Dimensionality](http://people.hss.caltech.edu/~mshum/gradio/papers/dinakar.pdf) Econometrica
  - オンラインのプランニングの文脈で引用されている論文。オフラインだと状態次元数に対し指数的に最悪計算量が増えるがオンラインだと違うらしい。
- Szepesvari (2001) [Efficient Approximate Planning in Continuous
Space Markovian Decision Problems](https://www.researchgate.net/profile/Csaba_Szepesvari/publication/2587899_Efficient_Approximate_Planning_in_Continuous_Space_Markovian_Decision_Problems/links/09e4150cb772a8e202000000.pdf)
  - オンラインのプランニングの文脈で引用されている論文。
- Even-Dar et al. 2005 [Experts in a Markov Decision Process](https://papers.nips.cc/paper/2730-experts-in-a-markov-decision-process.pdf)
  - `online learning in MDPs with arbitrary reward processes` の例として引用されている。
- Nu et al. 2009 [Markov Decision Processes with Arbitrary Reward Processes](https://link.springer.com/chapter/10.1007/978-3-540-89722-4_21)
  - `online learning in MDPs with arbitrary reward processes` の例として引用されている。
- Neu et al. 2010 [The Online Loop-free Stochastic Shortest-Path Problem](http://colt2010.haifa.il.ibm.com/papers/125neu.pdf)
  - `online learning in MDPs with arbitrary reward processes` の例として引用されている。

## 5.2.0 Applications
- Simao et al. (2008) [An Approximate Dynamic Programming Algorithm for Large-Scale Fleet Management: A Case Application](http://castlelab.princeton.edu/Papers/Simao_et_al_SchneiderNational.pdf)
  - トラックの車両管理 (fleet management) への応用
