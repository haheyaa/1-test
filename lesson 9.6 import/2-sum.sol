// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./1-interface.sol";
contract sumcontract is interfacecontract{
    function sum(uint a, uint b)public override pure returns(uint){
        return a+b;
    }
}