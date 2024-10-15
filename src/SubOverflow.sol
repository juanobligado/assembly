pragma solidity ^0.8.25;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            if lt(x, y) {
                // If x < y, return 0
                mstore(0x00, 0)
                return(0x00, 0x20)
            }
            let sub_result := sub(x, y)
            mstore(0x00, sub_result)
            return(0x00, 0x20)
        }
    }
}
