cd data

# Initial set of experiments

# start_seed=1
# end_seed=10

# for r in 0.5 0.75 0.9 0.99 1 1.01 1.1 1.5 2
# do
#     mkdir r_${r}_n_1000
#     cd r_${r}_n_1000
#     for ((seed=start_seed;seed<end_seed;seed++))
#     do
#         mkdir $seed
#         cd $seed
#         python ../../../moran_process.py -r $r -s $seed -g 5000
#         cd ..
#     done
#     cd ..
#     start_seed=$((start_seed + 10))
#     end_seed=$((end_seed + 10))
# done

# Varying population size

start_seed=101
end_seed=110

for r in 0.5 0.75 0.9 0.99 1 1.01 1.1 1.5 2
do
    for n in 500 100 10
    do
        mkdir r_${r}_n_${n}
        cd r_${r}_n_${n}
        for ((seed=start_seed;seed<end_seed;seed++))
        do
            mkdir $seed
            cd $seed
            python ../../../moran_process.py -r $r -s $seed -g 5000 -N $n
            cd ..
        done
        cd ..
        start_seed=$((start_seed + 10))
        end_seed=$((end_seed + 10))
    done
done