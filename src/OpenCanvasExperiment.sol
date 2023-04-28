// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "solady/tokens/ERC721.sol";
import {SSTORE2} from "solady/utils/SSTORE2.sol";
import {OpenCanvasLib} from "./OpenCanvasLib.sol";

contract OpenCanvasExperiment is ERC721 {
    /// -----------------------------------------------------------------------
    /// Events
    /// -----------------------------------------------------------------------

    event PaintingIssued(address indexed issuer, bytes indexed painting);

    /// -----------------------------------------------------------------------
    /// Mutable Storage
    /// -----------------------------------------------------------------------

    address[] public paintings;

    /// -----------------------------------------------------------------------
    /// Mint Logic
    /// -----------------------------------------------------------------------

    function paint(bytes memory painting, address to)
        external
        virtual
        returns (uint256 id)
    {
        _mint(to, id = paintings.length);

        paintings.push(SSTORE2.write(painting));

        emit PaintingIssued(msg.sender, painting);
    }

    /// -----------------------------------------------------------------------
    /// ERC721 Metadata Logic
    /// -----------------------------------------------------------------------

    /// @dev Returns the token collection name.
    function name() public view virtual override returns (string memory) {
        return "Open Canvas Experiment";
    }

    /// @dev Returns the token collection symbol.
    function symbol() public view virtual override returns (string memory) {
        return "PAINT";
    }

    /// @dev Returns the Uniform Resource Identifier (URI) for token `id`.
    function tokenURI(uint256 id)
        public
        view
        virtual
        override
        returns (string memory)
    {
        return string.concat(
            "{" 
                '"name":"Open Canvas Experiment",' 
                '"description":"TBD",'
                '"image":"data:image/svg+xml;base64,',
                OpenCanvasLib.paint(SSTORE2.read(paintings[id])),
            '"}'
        );
    }

    /// -----------------------------------------------------------------------
    /// ERC721 Supply Logic
    /// -----------------------------------------------------------------------

    function totalSupply() external view virtual returns (uint256) {
        return paintings.length;
    }
}
