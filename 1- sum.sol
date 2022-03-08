pragma solidity 0.6.0;
contract Sumtotal
{
    int firstNo;
    int secondNo;
    
    function firstNoSet(int x) public 
    {
        firstNo = x;
    } 
    function secondNoset(int y) public 
    {
        secondNo = y;
    }
    function sum() public view returns(int)
    {
        int result = firstNo + secondNo;
        
        return result;
    }


}