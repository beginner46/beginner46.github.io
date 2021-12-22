@def title = "Simulating the Ising Model I"
@def blogtitle = "Simulating the Ising Model I : Metropolis Algorithm"
@def description = "Using the Metropolis algorithm to simulate the Ising Model by sampling the states from equilibrium distribution."
@def date = "17 December 2021"

# {{ blogtitle }}
\date{ {{ date }} }
\description{ {{ description }} }
\toc

## The Ising Model and Motivation

The Ising model is a very simple model of a *magnet*. It consists a lattice with $N$ sites and at each site we have a **spin** (classical). The spin can take two values either $+1$ (up) or $-1$ (down). There can also be an external magnetic field that is applied parallel to the spins.

@@img-small
![](/assets/images/blog/ising_lattice.jpeg)
@@

Due to interaction of the spins with each other and with the magnetic field we write the total energy (*Hamiltonian*) of the lattice as:
$$
    H = -J\sum_{\langle ij \rangle} s_i s_j - B \sum_{i} s_i 
$$

Let's break down the Hamiltonian to see where it comes from:
- The first term represents the total energy due to the interactions between the neighbouring spins (here $\langle ij \rangle$ says that we should sum over nearest neighbours). In this term, $J$ is called the **interaction energy** b.w. nearest neighbours (n.n.). So if there are only two spins $s_1 = +1$ and $s_2=-1$ then the total interaction energy will be $J$.

- The second term represents the total energy due to the external magnetic field which is just the sum of the product of **magnetic field energy**, $B$ and the spins $s_i$.

For studying the physics of our system (lattice), we consider it to be in equilibrium with an external reservior at some temperature $T$. Then from statistical mechanics we have that the probability of the system being in some state $\mu$ is given by (*the Boltzmann distribution*):

$$p_\mu = \frac1Z e^{-\beta H_\mu}$$

Where, $\beta = \cfrac{1}{kT}$ with $k$ being the *Boltzmann constant* and $Z = \displaystyle \sum_{\mu} e^{-\beta H_\mu}$. Here, $Z$ seems like just a "normal" normalization factor but it is of extreme importance! In fact all the thermodynamic quantities for any system can be calculated if we know it's $Z$. So, it is given a special name, *the canonical partition function* (it won't be that important for our simulation but in general it is).

Now, let's say I want to calculate the expectation value of some quantity $Q$ (energy, magnetization etc.) then I can do so by:

$$\langle Q\rangle = \sum_{\mu} Q_\mu p_\mu$$

@@colbox-blue
Seems easy right? But there is a big issue with this, how do I know the distribution for my given system to begin with? I can't just go about calculating $Q_\mu$ and $p_\mu$ for every possible state (even for a lattice of size $N=100$ there are $2^{100}$ possible states, and there is no need to say that this is a HUGE number of states!). **This is where the simulation part comes to our rescue**.
@@

## The Markov-Chain-Monte-Carlo (MCMC) Methods

In order to determine the expectation values of physical quantities (and other related quantities) we need a representative sample of states that the system goes through at equilibrium. Then using this representative sample we can make an estimate of the desired quantity.

The Markov Chain Monte Carlo method is one such method that is used for sampling from a given distribution. To understand how this method works we need to understand what we mean by a Markov chain.

### Markov Chains

A Markov chain can be thought of as a sequence of random variables $X_0, X_1, \dots$ that take values from some state space $\mathscr{S}$. It is then completely specified by the following properties:

1. **Initial Distribution**: The probability of $X_0$ taking some value $\alpha \in \mathscr{S}$ i.e. $\pi_0(\alpha)\equiv\mathbb P (X_0 = \alpha)$.
2. **Transition Probabilities**: The probability that given some state $\alpha\in\mathscr S$ the next state will be $\beta\in\mathscr S$ i.e. $p(\alpha\rarr\beta)\equiv \mathbb P(X_{n+1} = \beta | X_n = \alpha)$. These transition probabilities have to be independent of $n$ for a Markov chain.

In addition to that we have the conditions, $\sum_{\alpha\in\mathscr{S}} \pi_0(\alpha) = 1$ (the chain has to start in some initial state) and $\sum_{\beta\in\mathscr{S}} p(\alpha\rarr\beta) = 1$ (the chain either stays in the same state or makes a transition at each step).


@@colbox-yellow
**Let's take an example to understand this**. Say that a company buys a machine that has 50% chance of being in a working condition (a really bad purchase to be honest). In addition to that if it is in working condition at some day then there is a 30% percent chance of it being broken the next day. The company also hired a technician who can fix the machine with 70% probability within a day if it is broken. Then this scenario can be modelled as the follownig Markov chain (graphically):

@@img-mid
![](/assets/images/blog/markov_chain_eg.jpeg)
@@
@@

---

Now, that we have got the basic definitions out of the way, similar to the initial distribution we define:

$$\pi_n(\alpha) = \mathbb P(X_n = \alpha \in \mathscr{S})$$

One of the important question that we need to ask while studying Markov chains is whether the chain converges to some stationary distribution for large $n$. Or in precise terms for $\alpha\in\mathscr{S}$ is there a fixed distribution $\pi$ such that:

$$\lim_{n\rarr\infty} \pi_n(\alpha) \stackrel{\color{red}{?}}= \pi(\alpha)$$

@@colbox-blue
One of the important results from the study of Markov chains is that if the Markov chain satisfies some specific properties (that is if it is *irreducible*) then it must converge to a stationary distribution that is independent of the initial distribution and is only dependent upon the transition probabilities.

What these properties are is not important right now because the MCMC algorithms are cleverly designed to have these properties. Refer to \citep{sokal1996} for more details on irreducibility and Markov chains.

**So, the main takeaway is that we can generate any distribution of states we want just by simulating some cleverly designed Markov chains and running them for a long time.**
@@


## References

- \biblabel{newman-barkema}{Newman, Barkema (1999)} **Newman, M. E. J., Barkema, G. T. (1999)**. Monte Carlo methods in statistical physics. Oxford: Clarendon Press. \note{(general reference)}

- \biblabel{sokal1996}{Sokal A. (1997)} **Sokal A. (1997)** Monte Carlo Methods in Statistical Mechanics: Foundations and New Algorithms. In: DeWitt-Morette C., Cartier P., Folacci A. (eds) Functional Integration. NATO ASI Series (Series B: Physics), vol 361. Springer, Boston, MA. [https://doi.org/10.1007/978-1-4899-0319-8_6](https://doi.org/10.1007/978-1-4899-0319-8_6)