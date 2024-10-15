pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { console2 } from "forge-std/src/console2.sol";

import { Add } from "../src/Add.sol";

contract Assembly_1_test is Test {
    Add instance;
    /// @dev A function invoked before each test case is run.
    function setUp() public virtual {
        // Instantiate the contract-under-test.
        instance = new Add();
    }

    /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function test_Should_Add_Two_Values() external view {
        uint256 actual = instance.addAssembly(80, 80);
        uint256 expected = 160;
        assertEq(actual, expected, "value mismatch");
    }

        /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function test_Should_Add_Two_Values_Overflow() external {
        uint256 UINT256_MAX = type(uint256).max;
        vm.expectRevert();
        instance.addAssembly(UINT256_MAX, 1);

    }

}