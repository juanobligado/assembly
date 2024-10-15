pragma solidity ^0.8.25;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;
        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            let stack_variable := and(mol,0xFFFF)
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            mstore(0x00, stack_variable)
            // to return you need to specify address and the size from the starting point
            // something important to note is that the size is 32 bytes, this is because
            // the EVM is a 256-bit machine, so it needs to return 32 bytes
            // to avoid reverting
            return(0x00, 32)
        }
    }
}
