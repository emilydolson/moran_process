import argparse
import random
import pandas as pd


def main():

    # Get arguments from parser
    args = get_args()
    N = args.N
    n_A = args.inital_a * N
    r = args.r
    gens = args.generations
    random.seed(args.seed)

    # Initialize empty list to store data
    data = []

    # Iterate over specified number of generations
    for gen in range(gens + 1):
        n_B = N - n_A
        data.append([gen, n_A, n_B])

        rand = random.random()
        p_decrease = (n_B/(r*n_A + n_B) * n_A/N)
        p_increase = ((r*n_A)/(r*n_A + n_B)) * (n_B/N)

        if (rand < p_decrease):  # Number of A decreases
            n_A -= 1
        elif (rand < p_decrease + p_increase):  # Number of A increases
            n_A += 1

    pd.DataFrame(data, columns=["Time", "A", "B"]).to_csv("moran_data.csv",
                                                          index=False)


def get_args():
    """
    Makes an argument parser for this model and returns the parsed arguments
    """

    parser = argparse.ArgumentParser(description='Load settings for model.')
    parser.add_argument("-a", "--inital_a", default=.5, type=float,
                        help="Initial proportion of population of type A")
    parser.add_argument("-N", "--N", default=1000, type=int,
                        help="Total population size")
    parser.add_argument("-r", "--r", default=1, type=float,
                        help="Fitness difference between A and B")
    parser.add_argument("-g", "--generations", default=1000, type=int,
                        help="Number of generations to run for")
    parser.add_argument("-s", "--seed", type=int,
                        help="Random seed")

    return parser.parse_args()


if __name__ == "__main__":
    main()
