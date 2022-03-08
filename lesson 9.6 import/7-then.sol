// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract conditional{
    
    function testconditional(uint a)public pure returns(string memory){

        string memory c;
        (a<20 ? c="less than 20":c="more than 20");
        require (a>5,'ridi');
            return c;
    }
    function test()public pure returns(uint,uint){
        uint a=50;
        uint b=30;
        (uint c,uint d)= a<b ? (a,b):(b,a);
        return(c,d);
    }
}