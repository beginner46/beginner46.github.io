@def title = "Simulating the Ising Model I"
@def blogtitle = "Simulating the Ising Model I : Metropolis Algorithm"
@def description = "Using the Metropolis algorithm to simulate the Ising Model by sampling the states from equilibrium distribution."
@def date = "17 December 2021"

# {{ blogtitle }}
\date{ {{ date }} }
\description{ {{ description }} }
\toc

## The Ising Model and Motivation

The Ising model is a very simple model of a *magnet*. I consists a lattice with $N$ sites and at each site we have a **spin** (classical). The spin can take two values either $+1$ (up) or $-1$ (down). There can also be an external magnetic field that is applied parallel to the spins.

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
Seems easy right? But there is a big issue with this, how do I know the distribution for my given system to begin with? I can't just go about calculating $Q_\mu$ and $p_\mu$ for every possible state (even for a lattice of size $N=100$ there are $2^{100}$ possible states, and there is no need to say that this is a HUGE number of states!). \danger{This is where the simulation part comes to our rescue.}
@@

## The Markov-Chain-Monte-Carlo (MCMC) Method

\danger{In progress}