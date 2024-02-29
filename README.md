## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
export $(cat .env | xargs)
forge script script/DeployMessageReceiver.s.sol:DeployMessageReceiver --rpc-url $CCHAIN_RPC_URL \
      -vvv --broadcast --account mytestkey --verify \
      --verifier-url 'https://api.routescan.io/v2/network/testnet/evm/43113/etherscan' \
      --etherscan-api-key "verifyContract"
```

### Verify
```shell
forge verify-contract 0x4E79e429e546532334515FCd574489608FA8ECA1 src/MessageReceiver.sol:MessageReceiver \
      --verifier-url 'https://api.routescan.io/v2/network/testnet/evm/43113/etherscan' \
      --etherscan-api-key "verifyContract" \
      --num-of-optimizations 200 \
      --compiler-version 0.8.18 \
      --constructor-args $(cast abi-encode "MessageReceiver()")
```

### Send Message
```
forge script script/SendMsg2CChain.s.sol:SendMsg2CChain --rpc-url $KTS_RPC_URL \
      -vvv --broadcast --account mytestkey 
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
