//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./DeployHelpers.s.sol";
import { Counter } from "../contracts/Counter.sol";

contract DeployScript is ScaffoldETHDeploy {
    function run() external ScaffoldEthDeployerRunner {
        Counter counter = new Counter();
        console.logString(string.concat("Counter deployed at: ", vm.toString(address(counter))));
        deployments.push(Deployment("Counter", address(counter)));
    }
}
