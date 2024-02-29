// (c) 2023, Ava Labs, Inc. All rights reserved.
// See the file LICENSE for licensing terms.

// SPDX-License-Identifier: Ecosystem

pragma solidity 0.8.18;

import "teleporter/contracts/src/Teleporter/ITeleporterMessenger.sol";
import "teleporter/contracts/src/Teleporter/ITeleporterReceiver.sol";

contract MessageReceiver is ITeleporterReceiver {
    ITeleporterMessenger public immutable teleporterMessenger =
        ITeleporterMessenger(0xF7cBd95f1355f0d8d659864b92e2e9fbfaB786f7);

    string public lastMessage;
    int public messagesReceived;

    function receiveTeleporterMessage(
        bytes32 originChainID,
        address originSenderAddress,
        bytes calldata message
    ) external {
        // Only the Teleporter receiver can deliver a message.
        require(
            msg.sender == address(teleporterMessenger),
            "ReceiverOnDispatch: unauthorized TeleporterMessenger"
        );

        messagesReceived++;

        // Store the message.
        lastMessage = abi.decode(message, (string));
    }
}
