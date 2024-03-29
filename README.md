
### Boundary Element Method ###
                                       
This repository contains the exercises (1-4) from the lecture "fast boundary element method for engineers"
and a minimal implementation of the BEM.


## The minimal BEM example

The top level of this repository contains an minimal BEM solver (*main.m* file).
This solver is implemented as indirect Laplace BEM for a dirichlet problem
in a two dimensional domain with circular boundary.
The dirichlet boundary data is set according to the function declared in *getData.m*.

Running the main skript will yield a graphic representation of the potential inside of the circular domain.

![solution plot](./solution.png) 

## topics of the exercises:

# exercise 1

Discretisation methods for boundary elements and the collocation method for the assembly of the right hand side. 

# exercise 2

Post processing of the linear equation systems solution and advanced implementations for collocation.

# exercise 3

An implementation of the BEM with Galerkin method.

# exercise 4

Fast BEM compression by low rank approximations and a condensator example.