pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { console2 } from "forge-std/src/console2.sol";

import { SubOverflow } from "../src/SubOverflow.sol";

contract SubOverflow_test is Test {
    SubOverflow instance;
    /// @dev A function invoked before each test case is run.
    function setUp() public virtual {
        // Instantiate the contract-under-test.
        instance = new SubOverflow();
    }

    /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function test_Should_Sub_Two_Values() external view {
        uint256 actual = instance.subtract(160, 80);
        uint256 expected = 80;
        assertEq(actual, expected, "value mismatch");
    }

        /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function test_Should_Sub_Two_Values_Overflow() external view {
        uint256 UINT256_MAX = type(uint256).max;
        uint256 overflow_result = instance.subtract(1,UINT256_MAX);
        assertEq(overflow_result, 0, "value mismatch");

    }

}