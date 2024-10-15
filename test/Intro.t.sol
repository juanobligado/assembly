pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { console2 } from "forge-std/src/console2.sol";

import { Intro } from "../src/Intro.sol";

contract Assembly_1_test is Test {
    Intro assembly_1;
    /// @dev A function invoked before each test case is run.
    function setUp() public virtual {
        // Instantiate the contract-under-test.
        assembly_1 = new Intro();
    }

    /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function test_Should_Return_420() external view {
        uint16 expected = 420;
        uint16 actual = assembly_1.intro();
        assertEq(actual, expected, "value mismatch");
    }

}