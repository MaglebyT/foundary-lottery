// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {AddConsumer, CreateSubscription, FundSubscription} from "./Interactions.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle, HelperConfig){
        HelperConfig helperConfig = new helperConfig(); 
        AddConsumer addConsumer = new addConsumer();
        (
        uint256 entranceFee,
        uint256 timeInterval,
        address vrfCoordinator,
        bytes32 gasLane,
        uint64 subscriptionId,
        uint32 callbackGasLimit
        
        ) = helperConfig.activeNetworkConfig(); 

        vm.startBroadcast(deployerKey);
        Raffle raffle = new Raffle(
            entranceFee,
            timeInterval,
            vrfCoordinator,
            gasLane,
            subscriptionId,
            callbackGasLimit

        );
        vm.stopBroadcast(); 

        //  addConsumer.addConsumer(
        //     address(raffle),
        //     vrfCoordinatorV2,
        //     subscriptionId,
        //     deployerKey
        // );


        return Raffle; 

    }
}  