function rollDie(numSides = 6) {
    // numSides = typeof numSides !== 'undefined' ? numSides : 6;
    return Math.floor(Math.random() * numSides) + 1;
}

function greet(person, msg = 'こんにちは', suffix='!!') {
    console.log(`${msg}、${person}さん${suffix}`);
}

function rollDie(numSides=6){
    return Math.floor(Math.random() * numSides) + 1;
}
//スプレッド構文
const nums = (11, 1221, 133, 3)
Math.max(...nums)
console.log(nums) //配列を渡してくれる
console.log(...nums) //個別の中身が渡してくれる
console.log(11, 1221, 133, 3)//列挙可能なオブジェクト（配列や文字列、数字）に対してスプレッド構文が使える

//配列リテラルにおけるスプレッド構文
