function singSong() {
    console.log('ド');
    console.log('レ');
    console.log('ミ');
}

// singSong();
// singSong();
// singSong();
// singSong();
// singSong();
// singSong();
// singSong();

// 201 複数の引数

function greet(firstName, lastName) {
    console.log(`Hi, ${firstName} ${lastName[0]}.`);
}
// パラメータは用意して、引数(渡すもののこと)を与えないと${firstName}のところとかがundifindになる。
// エラーにはならない。

// greet('Ken', 'Fukuyama');

// repeat('hi', 3); // hihihi

function repeat(str, numTimes) {
    let result = '';
    for (let i = 0; i < numTimes; i++) {
        result += str;
    }
    console.log(result);
}
// returnは値を返す。一つの値だけ返せる。returnを実行された後のコードは実行されない。
function add(x, y) {
    if (typeof x !== 'number' || typeof y !== 'number') {
        return false;
    }
    return x + y;
}

function printHeart(){
    console.log('<3');
}
// printHeart();

function multiply(num1, num2){
    return num1 * num2;
}


// 短パンででかけても良いような気温かどうかを判断するisShortsWeatherという関数を作ってください！
// パラメータは一つ受け取る関数にしてください。例えばtemperatureなど
// temperatureが25以上であれば、trueをreturnしてください
// そうでなければfalseをreturnしてください
// （注意：temperatureはセ氏を前提にしてます。華氏圏の生徒がいましたらごめんなさい）

isShortsWeather(25) //true
isShortsWeather(15) //false
isShortsWeather(35) //true

function isShortsWeather(temperature){
    if (temperature >= 25){
        return true;
    }else {
        return false:
    }

// lastElementという関数を作ってください。関数は一つの配列を引数として受け取ります。
// そして、受け取った配列の最後の要素を返してください。もし配列が空の場合は、関数はnullを返してください。

lastElement(['a', 'b']) // b
lastElement([3,5,7]) //7
lastElement([1]) //1
lastElement([]) //null

function lastElement()

// 決められた時間の後で関数を実行する
setTimeout(() => {
    console.log('やっほー');
}, 3000);