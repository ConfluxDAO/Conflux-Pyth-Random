// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@pythnetwork/entropy-sdk-solidity/IEntropyConsumer.sol";
import "@pythnetwork/entropy-sdk-solidity/IEntropy.sol";

contract RandomNumber is IEntropyConsumer {
    IEntropy private entropy;

    constructor(address _entropy) {
        entropy = IEntropy(_entropy);
    }

    // This method is required by the IEntropyConsumer interface.
    // It returns the address of the entropy contract which will call the callback.
    function getEntropy() internal view override returns (address) {
        return address(entropy);
    }

    // It is called by the entropy contract when a random number is generated.
    function entropyCallback(
        uint64 sequenceNumber,
        // If your app uses multiple providers, you can use this argument to
        // distinguish which one is calling the app back.
        address provider,
        bytes32 randomNumber
    ) internal override {
        // Implement your callback logic here.
        uint256 randomNum = uint256(randomNumber);

        // Use the random number
    }

    function getRandomNumber() public payable {
        address provider = entropy.getDefaultProvider();
        uint fee = entropy.getFee(provider);
        // This method returns a sequence number and emits a RequestedWithCallback event.
        uint64 sequenceNumber = entropy.requestWithCallback{value: fee}(
            provider,
            keccak256(abi.encodePacked(block.timestamp))
        );
        // You can store this sequence number to identify the request in next step.
    }
}
