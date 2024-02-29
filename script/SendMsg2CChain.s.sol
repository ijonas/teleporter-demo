// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {ITeleporterMessenger, TeleporterMessageInput, TeleporterFeeInfo} from "teleporter/contracts/src/Teleporter/ITeleporterMessenger.sol";

contract SendMsg2CChain is Script {
    ITeleporterMessenger public immutable teleporterMessenger =
        ITeleporterMessenger(0xF7cBd95f1355f0d8d659864b92e2e9fbfaB786f7);

    /**
     * @dev Sends message to Fuji C-Chain.
     */
    function sendMessage(
        address destinationAddress,
        string memory message
    ) public {
        console.log("Sending message to Fuji C-Chain");
        teleporterMessenger.sendCrossChainMessage(
            TeleporterMessageInput({
                destinationBlockchainID: 0x7fc93d85c6d62c5b2ac0b519c87010ea5294012d1e407030d6acd0021cac10d5,
                destinationAddress: destinationAddress,
                feeInfo: TeleporterFeeInfo({
                    feeTokenAddress: address(0),
                    amount: 0
                }),
                requiredGasLimit: 100000,
                allowedRelayerAddresses: new address[](0),
                message: abi.encode(message)
            })
        );
    }

    function run() external {
        vm.startBroadcast();
        string memory message = "Hello World, its working.";
        sendMessage(0x4E79e429e546532334515FCd574489608FA8ECA1, message);
        vm.stopBroadcast();
    }
}
