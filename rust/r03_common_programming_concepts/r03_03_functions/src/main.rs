fn main() {
    println!("Hello, world!");
    another_function(10);
    print_labeled_measurement(10, 'h');
    let four = expression();
    println!("The value of x + 1 is {four}");
}

fn another_function(x: i32) {
    println!("The value of x is: {x}");
}

fn print_labeled_measurement(value: i32, unit_label: char) {
    println!("the measurement is: {value}{unit_label}");
}

fn expression() -> i32 {
    let y = {
        let x = 3;
        x + 1
    };
    y
}
