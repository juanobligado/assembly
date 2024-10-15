pragma solidity ^0.8.25;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between  assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        // and return the result from the second block
        assembly {
            let result := add(x, y)
            if lt(result, x) {
                // If the result is less than x, it means an overflow occurred just add the error message to memory
                mstore(0x0, "addition overflow")
                revert(0, 32)
            } 
            mstore(0x0,result)
        }

        assembly {
            // Retrieve the result from memory (0x20 -- 32 bytes)
            return(0x0,32)
        }
    }
}
