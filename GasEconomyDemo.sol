// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract GasEconomyDemo {
    uint256 public total;

    //total amount of gass after execution with memory array = 49721
    //total amount of gass after execution with calldata array = 48156
    //total amount of gass after execution when declar variable in the function and set it to the state variable array  47945
    // short circut => 47629 gss
    // cashing arr.length => 47602 gas
    //when declar a number befor validations insted searching it every tieme when i need => 47475 gas;

    function sumIfEvenAndLestThenInput(uint256[] calldata input) external {
        uint256 _total = total;
        uint256 length = input.length;

        for (uint256 i = 0; i < length; i++) {
            uint256 num = input[i];
            // bool isEven = input[i] % 2 == 0;
            // bool isLessThen = input[i] < input.length;
            if (num % 2 == 0 && num < input.length) {
                _total += num;
            }
        }
        total = _total;
    }
}
