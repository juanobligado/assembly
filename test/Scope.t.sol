pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { console2 } from "forge-std/src/console2.sol";

import {Scope} from "../src/Scope.sol";

contract Scope_test is Test {
    Scope instance;
    /// @dev A function invoked before each test case is run.
    function setUp() public virtual {
        // Instantiate the contract-under-test.
        instance = new Scope();
    }

    /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function test_Should_Modify_state() external {
        uint256 state = instance.count();
        assertEq(10, state, "value mismatch");
        instance.increment(5);
        uint256 newState = instance.count();
        assertEq(newState , 10 + 5, "value mismatch");
    }

}