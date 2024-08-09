const nums = [13, 4, 5, 21, 3, 3, 1, 2, 7, 6, 4, 2, 53456];
Math.max(nums) //NaN
Math.max(...nums) //53456

//配列リテラルの場合

//concatと似ている。違うところ、自分で新しいオブジェクトも追加できる
//列挙可能なオブジェクト
const cats = ['Tama', 'Tora', 'Momo'];
const dogs = ['Hachi', 'Pochi'];

const allPets = [...cats, ...dogs];

//オブジェクトリテラルの場合 {}
const feline = {legs: 4, family: 'ネコ科'};
const canine = {family: 'イヌ科', bark: true};

// {...canine, ...feline}
// {family: 'ネコ科', bark: true, legs: 4} オブジェクトが上書きされる。共通のfamilyは最後に書いたfelineになる
// {...feline, ...canine, family: 'Yamada'}

const formData = {
    email: 'hoge@example.com',
    password: 'secret',
    username: 'hoge'
}

// formData.id = 123;
// formData.isVerified = false;

// const user = formData;

const user = {...formData, id: 123, isVerified: false};