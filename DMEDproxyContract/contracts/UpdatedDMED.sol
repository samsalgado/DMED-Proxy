// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./DMED.sol";
 contract UpdatedDMED is DMED {
    constructor() {
        initialize(msg.sender);
    }
    function initialize(address _owner) public {
        require(!_initialized);
        owner = _owner;
        _initialized = true;
    }
}