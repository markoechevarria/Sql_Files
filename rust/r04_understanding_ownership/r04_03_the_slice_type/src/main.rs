fn main() {
    let mut texto = String::from("he llo"); 
    let length = first_word(&texto);
    println!("{length}");


    let mut s = String::from("hello world");
    let word = first_word(&s);
    s.clear();


    let s = String::from("hello world");
    let hello = &s[0..5];
    let world = &s[6..11];


    let s = String::from("hello");
    let slice = &s[0..2];
    let slice = &s[..2];


    let slice = &s[..2];
    let slice = &s[3..s.len()];

    let palabra = String::from("hola marko");
    let word1 = second_word(&palabra);
    println!("{word1}");


    let my_string = String::from("hello world");
    let word = first_word(&my_string[0..6]);
    let word = first_word(&my_string[..]);
 
    let word = first_word(&my_string);

    let my_string_literal = "hello world";
    let word = first_word(&my_string_literal[0..6]);
    let word = first_word(&my_string_literal[..]);
 
    let word = first_word(&my_string_literal);




    let a = [1,2,3,4,5];
    let slice = &a[1..3];
    assert_eq!(slice, &[2,3]);
}

fn first_word(s: &String) -> &str {
    println!("{s}");
    let bytes = s.as_bytes();
    let space = b' ';
    for (a, &item) in bytes.iter().enumerate() {
        println!("{a}, {item}, {space}");
        if item == b' ' {
            return &s[0..a];
        }
    }
    &s[..]
}

fn second_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (a, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[..a]
        }
    }
    &s[..]
}





