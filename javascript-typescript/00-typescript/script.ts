// The primitives: string, number, and boolean

let primitive1: number = 10
let primitive2: string = "this is a string"
let primitive3: boolean = true

// Arrays

let array1: number[] = [1,2,3]
let array2: Array<number> = [1,2]
let array3: Array<boolean> = [true, false, false]

// Functions
 
function function1 (param1: string): string { // Return Type Annotations
    return (`Do nothing with ${param1}`)
}

async function functionReturnPromise(): Promise<number> { // Functions Which Return Promises
    return 93
}

const names = ["Alice", "Bob", "Eve"]; // Anonymous Functions
names.forEach(function (s) {
  console.log(s.toUpperCase());
});

// Object Types

function printCoord(pt: { x: number; y: number }) {
  console.log("The coordinate's x value is " + pt.x + "\nThe coordinate's y value is " + pt.y);
}

function printName(obj: { first: string; last?: string }) {} // Optional properties
 
// Union types
 
function printId(id: number | string) { // parameter 'id' could be a number or a string
  console.log("Your ID is: " + id);
}

function printId2(id: number | string) {
  if (typeof id === "string") {
    console.log(id.toUpperCase());
  } else {
    console.log(id);
  }
}

function welcomePeople(x: string[] | string) {
  if (Array.isArray(x)) {
    console.log("Hello, " + x.join(" and "));
  } else {
    console.log("Welcome lone traveler " + x);
  }
}

function getFirstThree(x: number[] | string) {
  return x.slice(0, 3);
}

// Type Aliases

type Point = {
  x: number;
  y: number;
};

function printCoord2(pt: Point) {
  console.log("The coordinate's x value is " + pt.x);
  console.log("The coordinate's y value is " + pt.y);
}

type UserInputSanitizedString = string;
function sanitizeInput(str: string): UserInputSanitizedString {
  return sanitize(str);
}
let userInput = sanitizeInput(getInput());
userInput = "new input";

// Interfaces

interface Point2 {
  x: number;
  y: number;
}
function print_Coord(pt: Point2) {
  console.log("The coordinate's x value is " + pt.x);
  console.log("The coordinate's y value is " + pt.y);
}

/*
Differences Between Type Aliases and Interfaces
-> type alias and interfaces are very similar, the diference is that
a type cannot be re-opened to add new properties vs a interface
which is always extendable
*/ 

// Type Assertions

const myCanvas1 = document.getElementById("main_canvas") as HTMLCanvasElement;
const myCanvas2 = <HTMLCanvasElement>document.getElementById("main_canvas");
const x = "hello" as number; // imposible
const a = expr as any as T;

// Literal Types

let changingString = "Hello World";
changingString = "Olá Mundo";      
let changingString: string
const constantString = "Hello World";
const constantString: "Hello World"

let x: "hello" = "hello";
x = "hello"; // right
x = "howdy"; // right'nt

function printText(s: string, alignment: "left" | "right" | "center") {}
printText("Hello, world", "left");
printText("G'day, mate", "centre"); // centre causes error

function compare(a: string, b: string): -1 | 0 | 1 {
  return a === b ? 0 : a > b ? 1 : -1;
}

interface Options {
  width: number;
}
function configure(x: Options | "auto") {}
configure({ width: 100 });
configure("auto");
configure("automatic"); // dont work

// Literal Inference

const obj = { counter: 0 };
if (someCondition) {
  obj.counter = 1;
}

declare function handleRequest(url: string, method: "GET" | "POST"): void;
const req = { url: "https://example.com", method: "GET" };
handleRequest(req.url, req.method);

const req = { url: "https://example.com", method: "GET" as "GET" };
handleRequest(req.url, req.method as "GET");

// null and undefined

function doSomething(x: string | null) {
  if (x === null) {
    // do something
  } else {
    console.log("Hello, " + x.toUpperCase());
  }
}

function liveDangerously(x?: number | null) {
  console.log(x!.toFixed());
}

// Enums

// Generics

function identity<Type>(arg: Type): Type {
  return arg;
}
let output = identity<string>("myString");

function identity<Type>(arg: Type): Type {
  return arg;
}

function loggingIdentity<Type>(arg: Type): Type {
  console.log(arg.length);
  return arg;
}

function loggingIdentity<Type>(arg: Type[]): Type[] {
  console.log(arg.length);
  return arg;
}

function loggingIdentity<Type>(arg: Array<Type>): Array<Type> {
  console.log(arg.length); // Array has a .length, so no more error
  return arg;
}

function identity<Type>(arg: Type): Type {
  return arg;
}
let myIdentity: <Type>(arg: Type) => Type = identity;

function identity<Type>(arg: Type): Type {
  return arg;
}
let myIdentity: <Input>(arg: Input) => Input = identity;

function identity<Type>(arg: Type): Type {
  return arg;
}
let myIdentity: { <Type>(arg: Type): Type } = identity;

interface GenericIdentityFn {
  <Type>(arg: Type): Type;
}
function identity<Type>(arg: Type): Type {
  return arg;
}
let myIdentity: GenericIdentityFn = identity


class GenericNumber<NumType> {
  zeroValue: NumType;
  add: (x: NumType, y: NumType) => NumType;
}
 
let myGenericNumber = new GenericNumber<number>();
myGenericNumber.zeroValue = 0;
myGenericNumber.add = function (x, y) {
  return x + y;
};

let stringNumeric = new GenericNumber<string>();
stringNumeric.zeroValue = "";
stringNumeric.add = function (x, y) {
  return x + y;
};
console.log(stringNumeric.add(stringNumeric.zeroValue, "test"));