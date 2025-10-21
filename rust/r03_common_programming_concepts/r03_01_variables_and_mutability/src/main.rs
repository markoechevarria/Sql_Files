fn main() {
    let x = 5;
    // x = 6; cannot assign twice to inmutable variable 'x'
    let mut y = 5;
    y = 10;

    // constants
    const THREE_HOURS_IN_SECONDS: u32 = 60 * 60 * 3;

    // shadowind
    let value = 5;
    let value = value * 10;
    {
        let value = value * 2;
        println!("The value of x in the inner scope is: {value}");
    }
    println!("The value of x is: {value}");

    let valor = "   ";
    let valor = valor.len(); // shadowing allow change the variable type, 'mut' doesn't do it
    println!("{valor}");
}
