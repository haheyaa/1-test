// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./2-sum.sol";
contract callcontract{
     interfacecontract obj;
     uint public  c;
    function call(uint a, uint b)public returns(uint){
        obj=new sumcontract();
        return c=  obj.sum(a,b);

    }
}
