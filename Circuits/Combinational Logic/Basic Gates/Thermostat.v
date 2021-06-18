// In heating mode(mode = 1), turn the heater on when it is too cold (too_cold = 1) 
//     but do not use the air conditioner.
// In cooling mode(mode = 0), turn the air conditioner on when it is too hot (too_hot = 1),
//     but do not turn on the heater.
// When the heater or air conditioner are on, also turn on the fan to circulate the air.
// In addition, the user can also request the fan to turn on (fan_on = 1),
//     even if the heater and air conditioner are off.

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
assign fan = heater | aircon | fan_on;
assign aircon = ~mode & too_hot;
assign heater = mode & too_cold;
endmodule