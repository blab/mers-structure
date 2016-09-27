# MERS-CoV dynamics in camels and sporadic clusters in humans
Looking into MERS-CoV dynamics through the structured coalescent lens.

------------------------------
# TODO (Spanish for "all"):
- ~~Run MTT trees with whole genomes, preventing humans from infecting camels.~~ Preventing reverse infection severely restricts tree space traversal, resulting in runs that go off the rails eventually.
- Run MTT trees with whole genomes, allowing humans to infect camels.__[in progress]__ Much better behaved than above, recovers reasonable parameter estimates, with human to camel counts being low and 95% HPD including 0.
- ~~Run MTT trees with fragmented genomes, with shared deme sizes.~~ More stable than single fragment analysis, but same problem. Restricting migration results in seemingly non-ergodic MCMC.
- Run MTT trees with fragmented genomes, with shared deme sizes and reverse infection allowed. __[in progress]__
- Run BEAST on camel sequences to get a skygrid. __[Done]__
- SIR simulations to look into R_0 and its variance?


Current problems:
- ~~Hard constraint on no back-transmission into camels makes MTT trees go crazy. Trying to introduce relatively strong priors to correct this. Uniform prior on ucld.mean (E-5 to E-2) and exponential (instead of gamma) prior on ucld.stdev might have worked.~~ Dropped - too many constraints required to run analysis.

------------------------------

# Figures
Main:
- Distribution of cluster sizes, will give an idea of R_0.
- Skygrid of camel MERS-CoVs, will give an idea of what's going on in camels.__[Done]__ Running second replicate now. So far difficult to tell apart from constant population size.
- Correlation between MERS pop sizes in camels versus introductions into humans.
- Correlation between MERS cases and MERS sequences, binned in time. __[~Done]__ Correlation not the best, but reasonable (Spearman ~0.6).
- Clade frequencies of each MERS cluster over time.


Supplementary:
- Tree with heatmap, showing the absence of a large number of synapomorphic loci supporting the maximum likelihood, or any other phylogeny.
- Heatmap of clade membership for human cases, should (the 'theoretically' should, not 'make it so' should) show that recombination does not affect human cluster inference.

------------------------------
