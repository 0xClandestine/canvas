// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/OpenCanvasExperiment.sol";

bytes constant MARIO =
    hex"062196f3795548d32f2fffe0b2607d8b00000004000000020401000403060002080001040009010102000203010302050005020300060204020702030000030100010303020203050005030302060304000903030000040101010403020304050006040302070401000005030301050503050504000905030700060401080602010007000002070203030704020707020100080000020802010308000005080202060804000908020100090003020902030609";

contract CanvasTest is Test {
    function testPaint() public {
        OpenCanvasExperiment canvas = new OpenCanvasExperiment();

        assertEq(canvas.totalSupply(), 0);

        canvas.paint(MARIO, address(this));

        assertEq(
            0x31749da5e154113287a4d8abb25606e2bbb0b7b7212095c7cd78aa46d6fc8351,
            keccak256(bytes(canvas.tokenURI(0)))
        );
        assertEq(canvas.totalSupply(), 1);

        console.log(canvas.tokenURI(0));
    }
}
