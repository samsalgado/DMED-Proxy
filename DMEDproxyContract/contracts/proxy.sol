//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./Storage.sol";
contract Proxy is Storage {
    address currentAddress;
    constructor(address _currentAddress) {
        owner = msg.sender;
        currentAddress = _currentAddress;
    } 
    function upgrade(address _newAddress) public {
        require(msg.sender == owner);
        currentAddress = _newAddress;

    }
    receive() payable external {}
    
   
    // FALLBACK Function
     fallback () payable external  {
         gasleft();
         address implementation = currentAddress;
         require(currentAddress != address(0));
         bytes memory data = msg.data;


     assembly {
      let result := delegatecall(not(0),implementation, add(data, 0x20), mload(data),0, 0)
      let size := extcodesize(currentAddress.slot)
      let ptr := mload(0x40)
      returndatacopy(ptr, 0, size)
      switch result
      case 0 {revert(ptr, size)}
      default {return(ptr, size)}
    }
}
}

