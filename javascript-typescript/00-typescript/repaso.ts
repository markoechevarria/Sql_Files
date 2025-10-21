// A quick revision to javascript/typescript

// Datatypes

let numOne: number = 3
let numTwo: number = 3

let js: string = 'JavaScript'
let py: string = 'Python'

let lightOn: boolean = true
let lightOff: boolean = false


let nums: number[] = [1, 2, 3]
let numbers: Array<number> = [1, 2, 3]

console.log(nums == numbers) // they have the same elements, but are not the same element in memeory

type user = {name: string, role:string, country:string}
let userOne: user  = {
    name:'Asabeneh',
    role:'teaching',
    country:'Finland'
}

let age: number = 35
const gravity: number = 9.81  //we use const for non-changing values, gravitational constant in  m/s2
let mass: number = 72         // mass in Kilogram
const PI: number = 3.14       // pi a geometrical constant

//More Examples
const boilingPoint: number = 100 // temperature in oC, boiling point of water which is a constant
const bodyTemp: number = 37      // oC average human body temperature, which is a constant

const PI2: number = Math.PI // 3.141592653589793

console.log(Math.round(PI))               // 3 to round values to the nearest number

console.log(Math.round(9.81))             // 10

console.log(Math.floor(PI))               // 3 rounding down

console.log(Math.ceil(PI))                // 4 rounding up

console.log(Math.min(-5, 3, 20, 4,5, 10)) // -5, returns the minimum value

console.log(Math.max(-5, 3, 20, 4,5, 10)) // 20, returns the maximum value

const randNum: number = Math.random() // creates random number between 0 to 0.999999
console.log(randNum)

const nume: number = Math.floor(Math.random () * 11) // creates random number between 0 and 10

console.log(Math.abs(-10))      //10
console.log(Math.sqrt(100))     // 10
console.log(Math.sqrt(2))      //1.4142135623730951
console.log(Math.pow(3, 2)) // 9
console.log(Math.E) // 2.718
console.log(Math.log(2))    // 0.6931471805599453
console.log(Math.log(10))   // 2.302585092994046
Math.sin(0)
Math.sin(60)
Math.cos(0)
Math.cos(60)


let numberRandom: number = Math.random() // [ 0 - 1 >
let numBtnZeroAndTen: number = numberRandom * 11 // [ 0 - 11 >
let randomNumRoundToFloor: number = Math.floor(numBtnZeroAndTen) // [ 0 - 10 ]

let space: string = ' '           // an empty space string
let firstName: string = 'Asabeneh'
let secondName: string = 'Alrede'
let fullName: string = firstName + secondName;
let fullName2: string = firstName + " - " + secondName;

let a: number = 2
let b: number = 3
console.log(`The sum of ${a} and ${b} is ${a + b}`)
console.log(`${a} is greater than ${b}: ${a > b}`)

let cadena: string = 'JavaScript'
console.log(cadena[0])
console.log(cadena.toUpperCase())
console.log(cadena.toLowerCase())
console.log(cadena.substring(1,5))
console.log(cadena.split("a"))
console.log(cadena.trim())
console.log(cadena.includes("Scrip"))
console.log(cadena.replace("Java", "Type"))
console.log(cadena.charAt(4))
console.log(cadena.charCodeAt(4))
console.log(cadena.indexOf("Scri"))
console.log(cadena.lastIndexOf("a"))
console.log(cadena.concat(" is", " fun"))
console.log(cadena.startsWith("a"))
console.log(cadena.endsWith("a"))
console.log(cadena.search("v"))
console.log(cadena.match(/\d+/))
console.log(cadena.repeat(5))

// Casting

let num1: string = '10'
let numInt1: number = parseInt(num1)
let numInt2 = Number(num1)  // paserFloat()

type user2 = {fullName: string, mass: number, height: number, calcBMI: () => number, bmi?: number }

const mark: user2 = {
  fullName: 'Mark Miller',
  mass: 78,
  height: 1.69,
  calcBMI: function () {
    this.bmi = this.mass / this.height ** 2;
    return this.bmi;
  }
};

mark.calcBMI();

type user3 = [string, string, number, string, string[], boolean]
const jonas: user3 = [
  'Jonas',
  'Schmedtmann',
  2037 - 1991,
  'teacher',
  ['Michael', 'Peter', 'Steven'],
  true
];

for (let i: number = jonas.length - 1; i >= 0; i--) {
  console.log(i, jonas[i]);
}

for (let exercise: number = 1; exercise < 4; exercise++) {
  console.log(`-------- Starting exercise ${exercise}`);

  for (let rep: number = 1; rep < 6; rep++) {
    console.log(`Exercise ${exercise}: Lifting weight repetition ${rep}`);
  }
}

const calcTip = function (bill: number): number {
  return bill >= 50 && bill <= 300 ? bill * 0.15 : bill * 0.2;
}
const bills: number[] = [22, 295, 176, 440, 37, 105, 10, 1100, 86, 52];
const tips: number[] = [];
const totals: number[] = [];

for (let i = 0; i < bills.length; i++) {
  const tip: number = calcTip(bills[i]);
  tips.push(tip);
  totals.push(tip + bills[i]);
}
console.log(bills, tips, totals);

const calcAverage = function (arr: number[]): number {
  let sum: number = 0;
  for (let i: number = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum / arr.length;
}

// modal

function calcAge(birthYear: number): number {
  const age: number = 2037 - birthYear;

  function printAge(): void {
    let output: string = `${firstName}, you are ${age}, born in ${birthYear}`;
    console.log(output);

    if (birthYear >= 1981 && birthYear <= 1996) {
      var millenial: boolean = true;
      const firstName: string = 'Steven';

      output = 'NEW OUTPUT!';

      const str: string = `Oh, and you're a millenial, ${firstName}`;
      console.log(str);

      function add(a: number, b: number): number {
        return a + b;
      }
    }
    console.log(output);
  }
  printAge();

  return age;
}

// DATA STRUCTURES AND OPERATORS

const weekdays: string[] = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

interface HourRange { open: number, close: number }
type HourRange2 = { open: number, close: number }

type Weekday = typeof weekdays[number]

type OpeningHours = { [k in Weekday]: HourRange2 }

const openingHours: OpeningHours = {
  [weekdays[3]]: {
    open: 12,
    close: 22,
  },
  [weekdays[4]]: {
    open: 11,
    close: 23,
  },
  [weekdays[5]]: {
    open: 0, // Open 24 hours
    close: 24,
  },
};


type Restaurant = { 
    name: string, 
    location: string, 
    categories: string[], 
    starterMenu: string[], 
    mainMenu: string[],
    openingHours: OpeningHours,
    order : (starterIndex: number, mainIndex: number) => [string, string],
    orderDelivery: ({ starterIndex, mainIndex, time, address }: { starterIndex?: number | undefined; mainIndex?: number | undefined; time?: string | undefined; address: any; }) => void
    orderPasta: ( value1: string, value2: string, value3: string) => void,
    orderPizza: ( mainIngredient: string, otherIngredients: string[] ) => void

}

const restaurant: Restaurant = {
  name: 'Classico Italiano',
  location: 'Via Angelo Tavanti 23, Firenze, Italy',
  categories: ['Italian', 'Pizzeria', 'Vegetarian', 'Organic'],
  starterMenu: ['Focaccia', 'Bruschetta', 'Garlic Bread', 'Caprese Salad'],
  mainMenu: ['Pizza', 'Pasta', 'Risotto'],

  openingHours,

  order(starterIndex: number, mainIndex: number): [string, string] {
    return [this.starterMenu[starterIndex], this.mainMenu[mainIndex]];
  },

  orderDelivery({ starterIndex = 1, mainIndex = 0, time = '20:00', address }) {
    console.log(
      `Order received! ${this.starterMenu[starterIndex]} and ${this.mainMenu[mainIndex]} will be delivered to ${address} at ${time}`
    );
  },

  orderPasta(ing1, ing2, ing3) {
    console.log(
      `Here is your declicious pasta with ${ing1}, ${ing2} and ${ing3}`
    );
  },

  orderPizza(mainIngredient, ...otherIngredients) {
    console.log(mainIngredient);
    console.log(otherIngredients);
  },
};


// FUNCTIONS
/*
const poll: {question: string, options: string[], answer: } = {
  question: 'What is your favourite programming language?',
  options: ['0: JavaScript', '1: Python', '2: Rust', '3: C++'],
  
  answers: new Array(4).fill(0),
  registerNewAnswer() {
    
    const answer = Number(
      prompt(
        `${this.question}\n${this.options.join('\n')}\n(Write option number)`
      )
    );
    console.log(answer);

    // Register answer
    typeof answer === 'number' &&
      answer < this.answers.length &&
      this.answers[answer]++;

    this.displayResults();
    this.displayResults('string');
  },

  displayResults(type = 'array') {
    if (type === 'array') {
      console.log(this.answers);
    } else if (type === 'string') {
      // Poll results are 13, 2, 4, 1
      console.log(`Poll results are ${this.answers.join(', ')}`);
    }
  },
};
*/

// ARRAY'S ITERATIVES METHODS 

const products: {id: number, name: string, price: number, discount: number}[] = [      // MAP
  { id: 1, name: 'Laptop', price: 1200, discount: 0.15 },
  { id: 2, name: 'Mouse', price: 25, discount: 0 },
  { id: 3, name: 'Monitor', price: 350, discount: 0.20 }
];
const discountedProducts: {id: number, name: string, price: number, discount: number}[] = products.map(product => {
  const netPrice: number = product.price * (1 - product.discount);
  return {
    ...product,
    netPrice: parseFloat(netPrice.toFixed(2)),
    isDiscounted: product.discount > 0
  };
});
console.log(discountedProducts);


const users: {id: number, name: string, active: boolean, score: number}[] = [     // FILTER
  { id: 101, name: 'Alice', active: true, score: 92 },
  { id: 102, name: 'Bob', active: false, score: 80 },
  { id: 103, name: 'Charlie', active: true, score: 75 },
  { id: 104, name: 'David', active: true, score: 65 }
];
const highScoringActiveUsers: {id: number, name: string, active: boolean, score: number}[] = users.filter(user => {
  return user.active && user.score >= 75;
});
console.log(highScoringActiveUsers);


const salesData: {category: string, amount: number}[] = [ // REDUCE
  { category: 'Electronics', amount: 1200 },
  { category: 'Apparel', amount: 50 },
  { category: 'Electronics', amount: 350 },
  { category: 'Apparel', amount: 150 },
  { category: 'Home Goods', amount: 75 }
];

const salesByCategory = salesData.reduce((accumulator, item) => {
  const category: string = item.category;
  const amount: number = item.amount;
  accumulator[category] = (accumulator[category] || 0) + amount;
  return accumulator;
}, {});
console.log(salesByCategory);


const preferences: {key: string, value: string | boolean}[] = [       // FOREACH
  { key: 'theme', value: 'dark' },
  { key: 'notifications', value: true },
  { key: 'language', value: 'en' }
];

const userSettings = {};
preferences.forEach(pref => {
  userSettings[pref.key] = pref.value;
  console.log(`Setting ${pref.key} updated to ${pref.value}`);
});
console.log(userSettings);


const employees = [     // SORT
  { name: 'Zack', salary: 70000 },
  { name: 'Mia', salary: 110000 },
  { name: 'Alex', salary: 95000 }
];
employees.sort((a, b) => b.salary - a.salary);
console.log(employees);


const contacts = [      // SORT
  { id: 45, email: 'john@example.com', role: 'admin' },
  { id: 12, email: 'jane@example.com', role: 'user' },
  { id: 88, email: 'sam@example.com', role: 'guest' }
];
const targetId = 12;
const janeContact = contacts.find(contact => contact.id === targetId);
console.log(janeContact);


const inventory = [         // FINDINDEX
  { title: 'JS Basics', stock: 15 },
  { title: 'CSS Mastery', stock: 0 },
  { title: 'Node Pro', stock: 22 }
];
const outOfStockIndex = inventory.findIndex(book => book.stock === 0);
if (outOfStockIndex !== -1) {
    console.log(`Found out-of-stock item at index: ${outOfStockIndex}`);
} else {
    console.log("All items are in stock.");
}



const userPermissions = [       // SOME
  { name: 'User A', permissions: ['read', 'write'] },
  { name: 'User B', permissions: ['read', 'delete'] },
  { name: 'User C', permissions: ['read', 'write', 'superuser'] }
];
const hasSuperUser = userPermissions.some(user => 
  user.permissions.includes('superuser')
);
console.log(`Is there a superuser in the list? ${hasSuperUser}`);



const formFields = [            // EVERY
  { name: 'username', value: 'js_master', isValid: true },
  { name: 'email', value: 'valid@mail.com', isValid: true },
  { name: 'password', value: '', isValid: false }
];
const isFormValid = formFields.every(field => field.isValid && field.value.length > 0);
console.log(`Is the entire form valid? ${isFormValid}`);



const workflow = ['Prepare Data', 'Analyze', 'Review Results', 'Deploy'];       // SPLICE
const removedElements = workflow.splice(1, 1, 'Process Data', 'Validate');
console.log(`Removed element: ${removedElements}`);
console.log(workflow);

