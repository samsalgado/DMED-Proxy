// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./Storage.sol";
 contract DMED is Storage {
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    function getNumberOfPlants() public view returns(uint256) {
        return _uintStorage["Plants"];
    }
    function setNumberOfPlants(uint256 toSet) public onlyOwner {
        _uintStorage["Plants"] = toSet;
    }
    function getAlternativeMedicineTypes(string memory) public view returns(string memory) {
        return _stringStorage["Alternative Medicine Types"];
    }
     function getTotalProviders() public view returns(uint256) {
        return _uintStorage["Providers"];
    }
    function setTotalProviders(uint256 _toSet) public {
        _uintStorage["Providers"] = _toSet;
    }
    function getBalance (uint) view public returns(uint) {
        return balances[msg.sender];
    }
        

}