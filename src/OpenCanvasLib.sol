// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Base64} from "solady/utils/Base64.sol";
import {LibString} from "solady/utils/LibString.sol";

library OpenCanvasLib {
    function paint(bytes memory data)
        internal
        pure
        returns (string memory canvas)
    {
        unchecked {
            uint256 endOfColors = uint8(data[0]) * 3 + 1;
            uint256 totalPixels = (data.length - endOfColors) >> 2;

            for (uint256 i; i < totalPixels; ++i) {
                uint256 startOfPixel = endOfColors + i * 4;
                uint256 startOfColor = uint8(data[startOfPixel]) * 3 + 1;
                uint256 pixelsToRepeat = uint8(data[++startOfPixel]);

                canvas = string.concat(
                    canvas,
                    "<rect ",
                    pixelsToRepeat > 0
                        ? string.concat(
                            'style="width:',
                            LibString.toString(pixelsToRepeat * 10 + 10),
                            'px;"'
                        )
                        : "",
                    ' x="',
                    LibString.toString(uint8(data[++startOfPixel]) * 10),
                    '" y="',
                    LibString.toString(uint8(data[++startOfPixel]) * 10),
                    '" fill="#',
                    toHexString({
                        r: data[startOfColor],
                        g: data[++startOfColor],
                        b: data[++startOfColor]
                    }),
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

    bytes16 constant HEX_SYMBOLS = "0123456789abcdef";

    function toHexString(bytes1 r, bytes1 g, bytes1 b)
        internal
        pure
        returns (string memory)
    {
        uint24 value = uint24(bytes3(bytes.concat(r, g, b)));

        bytes memory buffer = new bytes(6);
        buffer[5] = HEX_SYMBOLS[value & 0xF];
        buffer[4] = HEX_SYMBOLS[(value >> 4) & 0xF];
        buffer[3] = HEX_SYMBOLS[(value >> 8) & 0xF];
        buffer[2] = HEX_SYMBOLS[(value >> 12) & 0xF];
        buffer[1] = HEX_SYMBOLS[(value >> 16) & 0xF];
        buffer[0] = HEX_SYMBOLS[(value >> 20) & 0xF];
        return string(buffer);
    }
}
