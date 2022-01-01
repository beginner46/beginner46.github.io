@def title = "Simulating the Ising Model I"
@def blogtitle = "Simulating the Ising Model I : Metropolis Algorithm"
@def description = "Using the Metropolis algorithm to simulate the Ising Model by sampling the states from equilibrium distribution."
@def date = "31 December 2021"

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

\emptypar

For studying the physics of our system (lattice), we consider it to be in equilibrium with an external reservior at some temperature $T$. Then from statistical mechanics we have that the probability of the system being in some state $\mu$ is given by (*the Boltzmann distribution*):

$$p_\mu = \frac1Z e^{-\beta H_\mu}\label{boltzmann}$$

Where, $\beta = \cfrac{1}{kT}$ with $k$ being the *Boltzmann constant* and $Z = \displaystyle \sum_{\mu} e^{-\beta H_\mu}$. Here, $Z$ seems like just a "normal" normalization factor but it is of extreme importance! In fact all the thermodynamic quantities for any system can be calculated if we know it's $Z$. So, it is given a special name, *the canonical partition function* (it won't be that important for our simulation but in general it is).

Now, let's say I want to calculate the expectation value of some quantity $Q$ (energy, magnetization etc.) then I can do so by:

$$\langle Q\rangle = \sum_{\mu} Q_\mu p_\mu$$

@@colbox-blue
Seems easy right? But there is a big issue with this, how do I know the distribution for my given system to begin with? I can't just go about calculating $Q_\mu$ and $p_\mu$ for every possible state (even for a lattice of size $N=100$ there are $2^{100}$ possible states, and there is no need to say that this is a HUGE number of states!). **This is where the simulation part comes to our rescue**.
@@

## The Markov Chain Monte Carlo (MCMC) Methods

In order to determine the expectation values of physical quantities (and other related quantities) we need a representative sample of states that the system goes through at equilibrium. Then using this representative sample we can make an estimate of the desired quantity.

The Markov Chain Monte Carlo method is one such method that is used for sampling from a given distribution. To understand how this method works we need to understand what we mean by a Markov chain.

### Markov Chains

A Markov chain can be thought of as a sequence of random variables $X_0, X_1, \dots$ that take values from some state space $\mathscr{S}$. It is then completely specified by the following properties:

1. **Initial Distribution**: The probability of $X_0$ taking some value $\alpha \in \mathscr{S}$ i.e. $\pi_0(\alpha)\equiv\mathbb P (X_0 = \alpha)$.
2. **Transition Probabilities**: The probability that given some state $\alpha\in\mathscr S$ the next state will be $\beta\in\mathscr S$ i.e. $T(\alpha\rarr\beta)\equiv \mathbb P(X_{n+1} = \beta | X_n = \alpha)$. These transition probabilities have to be independent of $n$ for a Markov chain.

In addition to that we have the conditions, $\sum_{\alpha\in\mathscr{S}} \pi_0(\alpha) = 1$ (the chain has to start in some initial state) and $\sum_{\beta\in\mathscr{S}}T(\alpha\rarr\beta) = 1$ (the chain either stays in the same state or makes a transition at each step).

\emptypar

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

$$
\lim_{n\rarr\infty} \pi_n(\alpha) \stackrel{\color{red}{?}}= \pi(\alpha)
\label{stationary distribution}
$$

\emptypar

@@colbox-blue
One of the important results from the study of Markov chains is that if the Markov chain satisfies some specific conditions then it must converge to a stationary distribution that is independent of the initial distribution and is only dependent upon the transition probabilities. These conditions are (conditions of *ergodicity*):

1. **Irreducibility**: Every state is reachable from every other state within finite number of steps.
2. **Non-periodicity**: After visiting any state it should not be possible to visit the same state with $nk$ steps for $n=1,2,\dots$ and fixed integer $k$.

The MCMC algorithms are cleverly designed to have these properties in order to generate states from a fixed distribution. Refer to \citep{sokal1996} for more details.

**So, the main takeaway is that we can generate any distribution of states we want just by simulating some cleverly designed Markov chains and running them for a long time.**
@@

### Detailed Balance and Acceptance Ratios

We say that the Markov chain is in equilibrium when the transitions into any state are just as just as probable as the transitions out of that state. This is when the Markov chain has converged to a stationary distribution. 

Mathematically for some state $\alpha\in\mathscr{S}$ and stationary distribution given by \eqref{stationary distribution}:

$$
    \sum_{\alpha'\in\mathscr{S}} \pi(\alpha)T(\alpha \rarr \alpha') = \sum_{\alpha'\in\mathscr{S}} \pi(\alpha')T(\alpha' \rarr \alpha)
$$

This condition can be satisfied in many different ways but one such case is if we have:

$$
\boxed{\pi(\alpha)T(\alpha \rarr \alpha') = \pi(\alpha')T(\alpha' \rarr \alpha)} \quad \forall \alpha,\alpha' \in \mathscr{S}
$$

\emptypar

The above condition is called the **condition of detailed balance**. So, in our case if we want the stationary (equilibrium) distribution of states to be the Boltzmann distribution \eqref{boltzmann} then from detailed balance we need to design the transition probabilities such that:

$$
    \frac{T(\alpha \rarr \alpha')}{T(\alpha' \rarr \alpha)} = \frac{\pi(\alpha')}{\pi(\alpha)} = \frac{p_{\alpha'}}{p_\alpha} = \exp(-\beta(H_{\alpha'} - H_{\alpha}))
$$

\emptypar

In order to design an algorithm for Markov chain Monte Carlo, we write the transition probability as product of two probabilities:

$$
    T(\alpha \rarr \alpha') = g(\alpha \rarr \alpha')A(\alpha \rarr \alpha')
$$

Here, $g(\alpha \rarr \alpha')$ is called the **selection probability** and $A(\alpha \rarr \alpha')$ is called the **acceptance ratio** (of state $\alpha'$ from state $\alpha$). We are free to choose any values for our selection probabilities and acceptance ratios as long as the condition of detailed balance is satisfied.

In the algorithm that we design, a new state $\alpha'$ given a current state $\alpha$ is generated with the selection probability and the acceptance ratio determines the fraction of times the new state will be accepted instead of keeping the state current same.

\emptypar

@@colbox-blue
On important note that must be made is that even if we are free to choose any acceptance ratios we want, a good sampling algorithm is always which keeps them as high as possible between $0$ and $1$. This is because if the acceptance ratios are small then the Markov chain will take a lot of selections to make a few transitions, this means that a lot of computational time is wasted as for getting a good estimate of the desired quantity we want to sample as much states as possible.

Due to this, for any two states $\alpha$ and $\alpha'$, we always fix either $A(\alpha\rarr\alpha')$ or $A(\alpha'\rarr\alpha)$ to $1$ and adjust the other to satisfy the ratio. This ensures that atleast in one direction a move is always accepted and more transitions occur in the algorithm.
@@

## The Metropolis Algorithm for the Ising Model

The Metropolis algorithm for Ising model follows the idea of **sigle spin updates** to generate new states. In this each consecutive state differs from the previous state in orientation of just one spin.

The first step in this algorithm (selection) is such that next state is selected at random from uniform distribution of possible states. This means that if there are $N$ spins then each spin has a probability of $\frac{1}{N}$ for getting selected for flipping.

Then in the next step, whether the selected spin will be flipped or not (acceptance) is given the probability of $P_{flip} = e^{-\beta \Delta H}$ for positive $\Delta H$ and is equal to $1$ for negative $\Delta H$. Here, $\Delta H$ is the change in the total energy after flipping. *It can be easily verified that this combination of selection probability and acceptance ratio satisfies detailed balance*.

@@algorithm-box
@@title
Metropolis Algorithm
@@
1. Choose a temperature $T$ to perform the simulation.
2. Select a spin at random from the lattice (uniformly).
3. Calculate the $\Delta H$ for spin flip. For selected spin $s$, it is given by $\Delta H = 2Js_{\text{old}} \displaystyle\sum_{\text{s' n.n. of s}} s'_{\text{old}}$
4. If $\Delta H$ is negative then flip the spin. Otherwise for positive $\Delta H$, choose a random number $r$ from $[0, 1)$ and if $r < e^{-\beta \Delta H}$ then flip the spin.
5. Steps $(2) - (4)$ are followed for several sweeps (one sweep is $N$ selection or flip attempts where $N$ is the total number of spins). The system is allowed to reach equilibrium first by running for several sweeps and then more sweeps are made for making measurements.
@@

<!-- ## The Appendix

### Code (In Julia)
\danger{TODO}

### Simulation Results
\danger{TODO} -->

## The References

- \biblabel{newman-barkema}{Newman, Barkema (1999)} **Newman, M. E. J., Barkema, G. T. (1999)**. Monte Carlo methods in statistical physics. Oxford: Clarendon Press. \note{(general reference)}

- \biblabel{sokal1996}{Sokal A. (1997)} **Sokal A. (1997)** Monte Carlo Methods in Statistical Mechanics: Foundations and New Algorithms. In: DeWitt-Morette C., Cartier P., Folacci A. (eds) Functional Integration. NATO ASI Series (Series B: Physics), vol 361. Springer, Boston, MA. [https://doi.org/10.1007/978-1-4899-0319-8_6](https://doi.org/10.1007/978-1-4899-0319-8_6). \note{(PDF can be found with a google search)}

- \biblabel{montecarlogh}{JaydevSR/spin-systems-monte-carlo} **Code for simulation**: [https://github.com/JaydevSR/spin-systems-monte-carlo](https://github.com/JaydevSR/spin-systems-monte-carlo)


{{ addcomments }}