# STEEM Testnet Installation

So far, steem will generate the blocks when forcing a logging/parsing error. Without it, the node will not work. 

__Needs further tests to have error free testnet installation__ 

# Rough Instruction

## Building

Follow the instructions from the [Official build guide](https://github.com/steemit/steem). When setting the cmake flags, instead of the following:

    cmake -DBOOST_ROOT="$BOOST_ROOT" -DCMAKE_BUILD_TYPE=Release ..

Replace it with 

    cmake -DLOW_MEMORY_NODE=ON -DBUILD_STEEM_TESTNET=ON -DENABLE_COVERAGE_TESTING=true -DCMAKE_BUILD_TYPE=Debug ../steem

and run `make` on the build folder.

## Configuration

### Initializing

In your build folder, run
    
    ./program/steem/steemd -d testnet
    
and close it (`CTRL + C`) after it initializes (i.e. create config files). Take note of the `initminer private key: 5xxxxx` from the output

_Note: testnet can be named to anything. It will be the storage of data from the daemon. If ommitted, the folder will be named `witness_node_dir`._

### Configuring the witness and miners

Edit the file `testnet/config.ini` or the folder set in the initial run (`-d testnet`). Edit the following:

    enable-stale-production=true

    miner = ["initminer","INITMINER_PRIVATE_KEY"] // Add the private key taken from initial run to the second element in the array
    witness = "initminer"
    witness = "randomwitness" // This makes the config ini break for some reason... or not

    private-key = "INITMINER_PRIVATE_KEY" // Add the private key taken from initial run to the second element in the array

## Running `steemd` to generate blocks

Save it and rerun `steemd` again

    ./program/steem/steemd -d testnet

If all goes well, after awhile (~20 seconds) it should show a welcome screen and start generating blocks

# TODO:

- Figure out what really happens when adding new unrelated witness
- UI (check steem/condenser)
