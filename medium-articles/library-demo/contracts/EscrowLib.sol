pragma solidity ^0.4.12;

library EscrowLib {
    function init(address owner, address recipient, uint amount) internal returns (EscrowData data) {
        data.owner = owner;
        data.recipient = recipient;
        data.amount = amount;
    }

    function confirmComplete(EscrowData storage data, address sender) internal {
        require(data.owner == sender);
        require(data.wasConfirmed == false);
        require(data.isWithdrawn == false);
        data.wasConfirmed = true;
    }
    
    function withdraw(EscrowData storage data, address sender) internal {
        require(data.recipient == sender);
        require(data.wasConfirmed == true);
        require(data.isWithdrawn == false);

        data.isWithdrawn = true;
        data.recipient.transfer(data.amount);
    }

    struct EscrowData {
        address owner;
        address recipient;
        uint amount;
        bool wasConfirmed;
        bool isWithdrawn;
    }
}