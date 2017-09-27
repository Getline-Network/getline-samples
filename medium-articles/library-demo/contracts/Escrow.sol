pragma solidity ^0.4.12;

import "./EscrowLib.sol";

contract Escrow {
    using EscrowLib for EscrowLib.EscrowData;    

    EscrowLib.EscrowData data;

    function Escrow(address recipient) payable {
        data = EscrowLib.init(msg.sender, recipient, msg.value);
    }

    function confirmComplete() {
        data.confirmComplete(msg.sender);
    }

    function withdraw() {
        data.withdraw(msg.sender);
    }
}