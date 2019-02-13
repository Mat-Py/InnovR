import numpy as np


class DimensionError(Exception):
    pass

class PolynomialLeastSquare:
    @staticmethod
    def compute_least_squares(A, b):
        return np.linalg.tensorsolve(np.dot(A.transpose(), b), np.dot(A.transpose(), A))

    @staticmethod
    def sample_function(f, Es):
        dim = len(Es)
        if dim == 1:
            try:
                return np.array([f((xi,)) for xi in Es[0]])
            except:
                raise DimensionError("Dimension error : function needs more inputs")

        Es2 = Es[1:]

        try:
            return np.array([PolynomialLeastSquare.sample_function(lambda x2: f((xi, *x2)), Es2)
                             for xi in Es[0]])
        except DimensionError:
            raise
        except:
            raise DimensionError("Dimension error : function needs less inputs")

    @staticmethod
    def create_coeff(f, E, res, degree):
        dim = len(E)
        Es = [np.linspace(E[i][0], E[i][1], res[i]) for i in range(dim)]
        y = PolynomialLeastSquare.sample_function(f, Es).flat()
        n = len(y)

        A = np.ones((n, 1))
        # TODO
        for i in range(degree):
            pass



if __name__ == "__main__":
    def f(args):
        return args[0]
    E = [(0, 1), (0, 1)]
    res = [11, 11]
    print(PolynomialLeastSquare.sample_function(f, E, res))
