pragma solidity >=0.7.0 <0.9.0;

contract BeachTestCase
{
    
    address public MyCompany;    
    string public StatusOfPayment = "Pending";
    address public Beach;
    uint public QuantityofTShirtsCount;
    string public StatusofOrder = "Pending";
    bool NewOrderDealHere = false;
    uint public CostHere;

    constructor(uint quantity) public
    {
        Beach = msg.sender;
        QuantityofTShirtsCount = quantity;
    }

    function AcceptNewOffer() public
    {
        if ( msg.sender == Beach )
        {
            revert("Threads Inc will accept the offers!");
        }

        NewOrderDealHere = true;
        StatusofOrder = "Order Complete!";
        CostHere = QuantityofTShirtsCount*750;
    }
    
    function MakePayment() public
    {
        
        if ( NewOrderDealHere == false )
        {
            if (msg.sender == Beach)
            {
                revert("Let the offer be accepted first!");
            }
            else
            {
                revert("MyCompany can't make payment for themselves!");
            }
        }
        
        else
        {
            if ( msg.sender != Beach )
            {
                revert("MyCompany can't make payment for themselves!");
            }
            
            StatusOfPayment = "Done!";
        }
        
    }

}