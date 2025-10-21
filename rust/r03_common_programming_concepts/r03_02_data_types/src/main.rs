use std::io;

fn main() {
    let guess: u32 = "42".parse().expect("Not a number");
    // integers types
    let num: u8 = 255; // 8,16,...,128 bits- i8, u8, i16, u16, ...

    // floating-point types
    let floating1: f64 = 2.0; // f32 and f64
    let floating2: f32 = 3.0;

    // numeric operations
    let sum = 5 + 10;
    let difference = 95.5 - 4.3;
    let product = 4 * 20;
    let quotient = 54.7 / 32.2;
    let truncated = -5 / 3;
    let remainder = 43 % 5;

    // the boolean type
    let t = true;
    let f: bool = false;

    // the caracter type
    let c = 'z';
    let z: char = 'ℤ';
    let heart_eyed_cat = '😻';

    // COMPOUND TYPES
    // tuple type
    let tup: (i32, f64, u8) = (500, 6.4, 1);
    let (x,y,z) = tup;
    let five_hundred = tup.0;

    // array type
    let a = [1,2,3,4,5];
    let months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ];
    let a: [i32; 5] = [1,2,3,4,5];
    let a = [3; 5];
    let first = a[0];

    let my_list: [u32; 5] = [1,2,3,4,5];
    println!("Enter an index");
    
    let mut index = String::new();
    io::stdin().read_line(&mut index).expect("error");
    let index: usize = index.trim().parse().expect("Input entered was not a number");

    let element = a[index];
    println!("The value of the element at index {index} is: {element}");
}


