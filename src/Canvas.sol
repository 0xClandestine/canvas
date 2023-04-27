// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solady/utils/Base64.sol";
import "solady/utils/LibString.sol";

function paint(string[] memory pixels)
    pure
    returns (string memory canvas)
{
    canvas =
        '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">'
        "<style>rect {width: 10px; height: 10px;}</style>";

    unchecked {
        for (uint256 row; row < 10; ++row) {
            for (uint256 column; column < 10; ++column) {
                canvas = string.concat(
                    canvas,
                    '<rect x="',
                    LibString.toString(column * 10),
                    '" y="',
                    LibString.toString(row * 10),
                    '" fill="',
                    pixels[row * 10 + column],
                    '"/>'
                );
            }
        }
    }

    return string.concat(
        "data:image/svg+xml;base64,",
        Base64.encode(bytes(string.concat(canvas, "</svg>")))
    );
}

function paint(uint256[] memory pixels, string[] memory colors)
    pure
    returns (string memory canvas)
{
    canvas =
        '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">'
        "<style>rect {width: 10px; height: 10px;}</style>";

    unchecked {
        for (uint256 row; row < 10; ++row) {
            for (uint256 column; column < 10; ++column) {
                canvas = string.concat(
                    canvas,
                    '<rect x="',
                    LibString.toString(column * 10),
                    '" y="',
                    LibString.toString(row * 10),
                    '" fill="',
                    colors[pixels[row * 10 + column]],
                    '"/>'
                );
            }
        }
    }

    return string.concat(
        "data:image/svg+xml;base64,",
        Base64.encode(bytes(string.concat(canvas, "</svg>")))
    );
}