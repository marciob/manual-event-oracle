// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MagicWorld is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("Magic World", "MGW") ERC20Permit("Magic World") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    // The following functions are overrides required by Solidity.

    event TransferMade(
        address indexed sender,
        address indexed to,
        uint amount,
        string message
    );

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);

        emit TransferMade(from, to, amount, "A transfer happened!");
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
