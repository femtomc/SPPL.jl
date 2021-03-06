module RandomSequence

include("../src/SPPL.jl")
using .SPPL

ns = @sppl begin
    X = array(3)
    W = array(3)
    X[1] ~ SPPL.Normal()
    for i in 2 : 4
        if X[i - 1] > 0
            X[i] ~ SPPL.Normal(0, 1)
            W[i] ~ SPPL.Atomic(0)
        else
            W[i] ~ SPPL.Bernoulli(0.5)
            W[i] == 0 ? X[i] .> SPPL.Fraction(1, 2) * X[i-1]^2 + X[i-1] : X[i] ~ SPPL.Normal(0, 1)
        end
    end
end

random_sequence = ns.model

# Observe X[2] > 0.
random_sequence_given_X1 = condition(model, ns.X[2] > 0)
probability(random_sequence, ns.X[1] > 0) |> println
probability(random_sequence_given_X1, ns.X[1] > 0) |> println

# Observe x[3] > 0.
random_sequence_given_X2 = random_sequence.condition(ns.X[3] > 0)
probability(random_sequence, ns.X[1] > 0) |> println
probability(random_sequence_given_X2, ns.X[1] > 0) |> println

# Compute mutual information.
mutual_information(random_sequence, ns.X[1]>0, ns.X[2]>0) |> println
mutual_information(random_sequence, ns.X[1]>0, ns.X[3]>0) |> println

end # module
