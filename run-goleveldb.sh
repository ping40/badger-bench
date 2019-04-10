#!/usr/bin/env bash
#set -x

# 运行结果根 内层密切相关
export LD_LIBRARY_PATH=/usr/local/lib
#keysMil=(250 75 5 1000)
keysMil=( 250 75)
#valueSizes=(128 1024 16384 16)
valueSizes=(128 1024)

for i in "${!keysMil[@]}"; do 
    keyMil=${keysMil[$i]}
    valueSz=${valueSizes[$i]}
    echo "keyMil:$keyMil, valueSz:$valueSz"

    DATADIR=~/temp/bench-data-$valueSz
   # if [ ! -d "$DATADIR" ]; then
   #     mkdir $DATADIR
   # fi

    #populate --kv leveldb --valsz $valueSz --keys_mil $keyMil --dir=$DATADIR | tee logs/populate-rocksdb-$valueSz.log
    #populate --kv badger  --valsz $valueSz --keys_mil $keyMil --dir=$DATADIR | tee logs/populate-rocksdb-$valueSz.log


 #   go test --bench BenchmarkReadRandomBadger --keys_mil $keyMil --valsz $valueSz --dir $DATADIR --timeout 10m --benchtime 3m -v|tee  logs/randomread-badger-$valueSz.log
 #   go test --bench BenchmarkReadRandomLevel --keys_mil $keyMil --valsz $valueSz --dir $DATADIR --timeout 10m --benchtime 3m -v
 #   go test --bench BenchmarkIterateBadgerOnly --keys_mil $keyMil --valsz $valueSz --dir $DATADIR --timeout 10m --cpuprofile logs/iterate-badger-cpu-$valueSz.out -v
#    go test --bench BenchmarkIterateLevelOnlyKeys --keys_mil $keyMil --valsz $valueSz --dir $DATADIR --timeout 10m --cpuprofile logs/iterate-level-cpu-$valueSz.out -v
    go test --bench BenchmarkIterateLevelWithValues --keys_mil $keyMil --valsz $valueSz --dir $DATADIR --timeout 10m --cpuprofile logs/iterate-level-cpu-$valueSz.out -v

  #  go test --bench BenchmarkIterateBadgerWithValues --keys_mil $keyMil --valsz $valueSz --dir $DATADIR --timeout 10m  --cpuprofile logs/iterate-badger-with-values-cpu-$valueSz.out -v

done

