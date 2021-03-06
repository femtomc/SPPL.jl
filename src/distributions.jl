@inline Atomic(loc) = dists.atomic(loc = loc)
@inline Choice(d) = dists.NominalDistribution(Dict(d))
@inline Uniform(loc, scale) = dists.uniform(loc = loc, scale = scale)
@inline Bernoulli(p) = dists.bernoulli(p = p)
@inline Poisson(μ) = dists.poisson(mu = μ)
@inline TruncatedNormal(a, b) = dists.truncnorm(a = a, b = b)
@inline Normal(loc, scale) = dists.norm(loc = loc, scale = scale)
@inline Normal() = dists.norm()
@inline Binomial(n, p) = dists.binomial(n = n, p = p)
@inline DiscreteUniform(values) = dists.uniformd(values = values)
@inline RandInt(low, high) = dists.randint(low = low, high = high)
@inline Beta(a, b) = dists.beta(a = a, b = b)
@inline DiscreteLaplace(loc, a) = dists.dlaplace(loc = loc, a = a)
@inline Gamma(loc, a) = dists.gamma(loc = loc, a = a)
