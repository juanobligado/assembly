pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        // Modify state of the count variable from within
        // the assembly segment
        assembly {
            // Load the storage slot of the count variable
            let slot := sload(0)
            // Add the input num to the slot
            slot := add(slot, num)
            // Store the slot back to the count variable
            sstore(0, slot)
        }
    }
}
