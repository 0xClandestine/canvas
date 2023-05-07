// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {LibRLE} from "../src/LibRLE.sol";
import {LibInflate} from "../src/LibInflate.sol";
import {OpenCanvasExperiment} from "../src/OpenCanvasExperiment.sol";

// 02 00 00 00 00 00 02 02 02 02 
// 00 00 00 00 00 00 00 00 00 02 
// 05 05 05 01 01 03 01 02 02 02 
// 01 05 01 01 01 03 01 01 01 02 
// 01 05 05 01 01 01 03 01 01 01 
// 05 01 01 01 01 03 03 03 03 02 
// 01 01 01 01 01 01 01 01 02 02 
// 00 00 04 00 00 00 00 02 02 02
// 00 00 04 00 00 04 00 00 00 02 
// 00 00 04 04 04 04 00 00 00 00

bytes constant MARIO =
    hex"01060121019601f301790155014801d3022f01ff01e001b20160017d018b03000102050004020900010203050201010301010302010101050301010303010102010102050301010303010105040104030102080102020200010404000302020001040200010403000102020004040400";

bytes constant MARIO_DEFLATED =
    hex"358c410d8040100377ba7b0464a0001b18e08f0d1e28e08f10ac60000f08803d12923633e9a334f4ecdc2c4c8c9c1a78b8389859d9dc50b15097f422f04c8252259baedf4b108e5a241911e61f6beb8f2c727b01";

contract CanvasTest is Test {
    function testPaint() public {
        OpenCanvasExperiment canvas = new OpenCanvasExperiment();

        canvas.paint(MARIO_DEFLATED, MARIO.length, address(this));

        console.log(canvas.tokenURI(0));
    }

    function testRLE() public {
        emit log_bytes(LibRLE.encode(MARIO));
    }

    function testInflate() public {
        (LibInflate.ErrorCode errorCode, bytes memory output) =
            LibInflate.puff(MARIO_DEFLATED, MARIO.length);

        assertEq(MARIO, output);
        assertEq(uint8(errorCode), uint8(0));
    }
}
