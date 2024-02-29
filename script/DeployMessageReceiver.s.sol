// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {ITeleporterMessenger, TeleporterMessageInput, TeleporterFeeInfo} from "teleporter/contracts/src/Teleporter/ITeleporterMessenger.sol";
import {MessageReceiver} from "../src/MessageReceiver.sol";

contract DeployMessageReceiver is Script {
    function run() external {
        vm.startBroadcast();
        new MessageReceiver();
        vm.stopBroadcast();
    }
}
