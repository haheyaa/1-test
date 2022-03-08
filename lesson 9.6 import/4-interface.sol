// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract addcontract{

    function add(uint a,uint b)public pure returns(uint){
        return a+b;
    }
    function sub(uint a,uint b)external pure returns(uint){
        return a-b;
    }
}
interface inter{
    function add(uint a,uint b)external pure returns(uint);
    function sub(uint a,uint b)external pure returns(uint);
}
contract callcontract{
    function call(address _addcontract,uint a, uint b)public pure returns(uint,uint){
        uint aa= inter(_addcontract).add(a,b);
        uint bb= inter(_addcontract).sub(a,b);
        return(aa,bb);
    }
}