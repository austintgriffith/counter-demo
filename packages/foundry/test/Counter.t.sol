// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../contracts/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_InitialCountIsZero() public view {
        assertEq(counter.count(), 0);
    }

    function test_IncrementIncreasesCountByOne() public {
        counter.increment();
        assertEq(counter.count(), 1);
    }

    function test_MultipleIncrements() public {
        counter.increment();
        counter.increment();
        counter.increment();
        assertEq(counter.count(), 3);
    }

    function test_EmitsEventWithCorrectValue() public {
        vm.expectEmit(true, true, true, true);
        emit Counter.CounterIncremented(1);
        counter.increment();

        vm.expectEmit(true, true, true, true);
        emit Counter.CounterIncremented(2);
        counter.increment();
    }

    function test_AnyoneCanCallIncrement() public {
        address alice = makeAddr("alice");
        address bob = makeAddr("bob");

        vm.prank(alice);
        counter.increment();
        assertEq(counter.count(), 1);

        vm.prank(bob);
        counter.increment();
        assertEq(counter.count(), 2);
    }
}
