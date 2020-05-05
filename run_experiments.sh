cd data
start_seed=1
end_seed=10

for r in 0.5 0.75 0.9 0.99 1 1.01 1.1 1.5 2
do
    mkdir $r
    cd $r
    for ((seed=start_seed;seed<end_seed;seed++))
    do
        mkdir $seed
        cd $seed
        python ../../../moran_process.py -r $r -s $seed -g 5000
        cd ..
    done
    cd ..
    start_seed=$((start_seed + 10))
    end_seed=$((end_seed + 10))
done