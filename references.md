#### 3 Value prediction problems

- Frank et al. (2008) [Reinforcement Learning in the Presence of Rare Events](http://www.machinelearning.org/archive/icml2008/papers/580.pdf) ICML
  - `estimating the failure probability of a large power grid` と書いてあるが電力の話はしてない。 **[TODO: 提案手法の内容を簡単に説明する]**
実データへの応用として、非常に低い確率であるはあるが、経路が遮断されることを考慮に入れた通信ネットワークのプランニングへと応用をしている。

#### 3.1.1 Tabular TD(0)

- Polyak and Juditsky (1992) [Acceleration of stochastic approximation by averaging](https://www.researchgate.net/profile/Boris_Polyak2/publication/236736831_Acceleration_of_Stochastic_Approximation_by_Averaging/links/0f31753227e964baab000000/Acceleration-of-Stochastic-Approximation-by-Averaging.pdf)
  - いわゆる [Polyak Averaging](https://en.wikipedia.org/wiki/Stochastic_approximation)
  - ステップ幅の文脈で出てくるが、特にステップ幅の話ではない。過去の更新されたパラメータを記録しておいて平均することで新しいパラメータの推定値とする話。
  - こちらのスライドがわかりやすい: https://www.cs.ox.ac.uk/people/nando.defreitas/machinelearning/lecture5.pdf

- Tadic (2004) [On the Almost Sure Rate of Convergence of Linear Stochastic Approximation Algorithms](http://ieeexplore.ieee.org/document/1266818/)

#### 4.2.1 Online learning in bandits

- Audibert et al. (2009) [Exploration-exploitation trade-off using variance estimates in multi-armed bandits](http://certis.enpc.fr/~audibert/Mes%20articles/TCS08.pdf)
  - UCBにおける定数Rの代わりに、推定した分散を使うアルゴリズムの分析をした話。 **[TODO: Resultsについてひと言書く]**

#### 4.2.3 Active learning in Markov Decision Processes
- Ortner (2008) [Online regret bounds for Markov decision processes with deterministic transitions](http://ac.els-cdn.com/S0304397510002008/1-s2.0-S0304397510002008-main.pdf?_tid=baf2ef9e-e582-11e6-bea4-00000aab0f26&acdnat=1485626212_65faa377ff897ad0b15b7c54390e8b33)
- Kearns and Singht (2002) [Near-Optimal Reinforcement Learning in Polynomial Time](https://www.cis.upenn.edu/~mkearns/papers/KearnsSinghE3.pdf), Machine Learning.
  - E3アルゴリズムを提案。行動空間・状態空間のサイズ、及び時間T (mixing time or horizon time) の多項式オーダーの行動数と計算時間で探索が終わるアルゴリズム、という理解。
- Brafman and Tennenholtz (2002) [R-MAX - A General Polynomial Time Algorithm for Near-Optimal Reinforcement Learning](http://www.jmlr.org/papers/volume3/brafman02a/brafman02a.pdf), JMLR
  - R-MAXアルゴリズムを提案。E3アルゴリズムが洗練されている。

#### 4.2.4 Online learning in Markov DecisionProcesses
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

#### 4.4.2 Implementinganactor

- Bhatnagar et al. (2009) [Natural Actor–Critic Algorithms](https://webdocs.cs.ualberta.ca/~sutton/papers/BSGL-TR.pdf) Automatica
- Singh et al. (2000) [Convergence Results for Single-Step On-Policy Reinforcement-Learning Algorithms](https://sites.ualberta.ca/~szepesva/papers/singh98convergence.pdf)
  - CriticにテーブルSARSA(0)を用いて、GLIEという条件を満たす方策を更新していくと、漸近的に最適方策と一致するという結果を示した論文。

#### 5.1.0 Further reading
- Chow and Tsitsiklis (1989) [The Complexity of Dynamic Programming](http://www.mit.edu/~jnt/Papers/J026-89-dpcomplexity.pdf) Journal of Complexity
  - オフラインのプランニングの計算量の文脈で引用されている論文。
- Rust (1996) [Using Randomization to Break the Curse of Dimensionality](http://people.hss.caltech.edu/~mshum/gradio/papers/dinakar.pdf) Econometrica
  - オンラインのプランニングの文脈で引用されている論文。オフラインだと状態次元数に対し指数的に最悪計算量が増えるがオンラインだと違うらしい。
- Szepesvari (2001) [Efficient Approximate Planning in Continuous
Space Markovian Decision Problems](https://www.researchgate.net/profile/Csaba_Szepesvari/publication/2587899_Efficient_Approximate_Planning_in_Continuous_Space_Markovian_Decision_Problems/links/09e4150cb772a8e202000000.pdf)
  - オンラインのプランニングの文脈で引用されている論文。

#### 5.2.0 Applications
- Simao et al. (2008) [An Approximate Dynamic Programming Algorithm for Large-Scale Fleet Management: A Case Application](http://castlelab.princeton.edu/Papers/Simao_et_al_SchneiderNational.pdf)
  - トラックの車両管理 (fleet management) への応用
