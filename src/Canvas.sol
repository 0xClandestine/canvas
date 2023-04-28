// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Base64} from "solady/utils/Base64.sol";
import {LibString} from "solady/utils/LibString.sol";

function paint(bytes memory data) pure returns (string memory canvas) {
    unchecked {
        // Since the first byte of `data` is a count of colors, we can
        // compute the `endOfColors` index by taking the value of the
        // first byte multiplied by 3, then adding 1 to account for the
        // byte that stores the total amount of colors.
        uint256 endOfColors = uint8(data[0]) * 3 + 1;

        // The total number of pixels in the painting can be computed by
        // subtracting the `endOfColors` index from the total length of
        // `data`, and then dividing by 3, since each pixel is represented
        // by 3 bytes (color index, x, y).
        uint256 totalPixels = (data.length - endOfColors) / 3;

        for (uint256 i; i < totalPixels; ++i) {
            uint256 startOfPixel = endOfColors + i * 3;

            uint256 startOfColor = uint8(data[startOfPixel]) * 3 + 1;

            canvas = string.concat(
                canvas,
                '<rect x="',
                LibString.toString(uint8(data[startOfPixel + 1]) * 10),
                '" y="',
                LibString.toString(uint8(data[startOfPixel + 2]) * 10),
                '" fill="#',
                string.concat(
                    LibString.toHexStringNoPrefix(uint256(uint8(data[startOfColor]))),
                    LibString.toHexStringNoPrefix(uint256(uint8(data[startOfColor + 1]))),
                    LibString.toHexStringNoPrefix(uint256(uint8(data[startOfColor + 2])))
                ),
                '"/>'
            );
        }

        return string.concat(
            "data:image/svg+xml;base64,",
            Base64.encode(
                bytes(
                    string.concat(
                        '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">',
                        "<style>rect {width: 10px; height: 10px;}</style>",
                        canvas,
                        "</svg>"
                    )
                )
            )
        );
    }
}
