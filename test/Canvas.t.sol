// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/Canvas.sol";

contract CanvasTest is Test {
    function testPaint() public {
        string[] memory board = new string[](100);

        board[0] = "#110e02";
        board[1] = "#e6d648";
        board[2] = "#ffea4e";
        board[3] = "#8b5a20";
        board[4] = "#1c468f";
        board[5] = "#0b4ba9";
        board[6] = "#0c4aa7";
        board[7] = "#0a4aa9";
        board[8] = "#1f498d";
        board[9] = "#83501d";
        board[10] = "#0d0e0d";
        board[11] = "#ac7b0c";
        board[12] = "#f5dc43";
        board[13] = "#b7820e";
        board[14] = "#7c5226";
        board[15] = "#215da5";
        board[16] = "#175fb5";
        board[17] = "#205da8";
        board[18] = "#7f5527";
        board[19] = "#b27909";
        board[20] = "#1f6dba";
        board[21] = "#7d572c";
        board[22] = "#b7800b";
        board[23] = "#ecd13d";
        board[24] = "#b6810d";
        board[25] = "#8d5f29";
        board[26] = "#8a5f2e";
        board[27] = "#8d5e23";
        board[28] = "#b7820c";
        board[29] = "#efd540";
        board[30] = "#1d8aeb";
        board[31] = "#2b81cc";
        board[32] = "#875620";
        board[33] = "#bd8809";
        board[34] = "#fae550";
        board[35] = "#f9f3a1";
        board[36] = "#f7f19f";
        board[37] = "#f9e652";
        board[38] = "#f4dd43";
        board[39] = "#c49213";
        board[40] = "#2198f7";
        board[41] = "#2590e9";
        board[42] = "#8d6029";
        board[43] = "#f6dd4f";
        board[44] = "#f1e658";
        board[45] = "#fefea8";
        board[46] = "#ffffa8";
        board[47] = "#fff35b";
        board[48] = "#fff35f";
        board[49] = "#e8d648";
        board[50] = "#40a6f9";
        board[51] = "#4c9dd1";
        board[52] = "#b48c28";
        board[53] = "#d6cfbe";
        board[54] = "#322d1e";
        board[55] = "#eada4e";
        board[56] = "#fff557";
        board[57] = "#fdf15f";
        board[58] = "#d8d5c4";
        board[59] = "#242019";
        board[60] = "#68aee4";
        board[61] = "#ae842b";
        board[62] = "#e7c942";
        board[63] = "#312d1d";
        board[64] = "#4c250c";
        board[65] = "#f4e14c";
        board[66] = "#f9ec50";
        board[67] = "#f0e24f";
        board[68] = "#352f1d";
        board[69] = "#3e1606";
        board[70] = "#93bde6";
        board[71] = "#d0301f";
        board[72] = "#f15845";
        board[73] = "#ebd148";
        board[74] = "#f3e64e";
        board[75] = "#edd64a";
        board[76] = "#a16e21";
        board[77] = "#ebd549";
        board[78] = "#ebde4a";
        board[79] = "#f4dd4a";
        board[80] = "#bed3ec";
        board[81] = "#d23c37";
        board[82] = "#d32a11";
        board[83] = "#fcba27";
        board[84] = "#fbe449";
        board[85] = "#a5701e";
        board[86] = "#ab6e05";
        board[87] = "#a5711e";
        board[88] = "#fce149";
        board[89] = "#fcc427";
        board[90] = "#e3f3fe";
        board[91] = "#dcdadf";
        board[92] = "#975920";
        board[93] = "#b57801";
        board[94] = "#fabb22";
        board[95] = "#f6b420";
        board[96] = "#f8b61e";
        board[97] = "#f5b520";
        board[98] = "#f7b721";
        board[99] = "#ba7d03";

        console.log(paint(board));
    }
}