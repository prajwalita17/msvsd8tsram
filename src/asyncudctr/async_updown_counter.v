module async_updown_counter (input in2, output out);

wire vout_adc;

ring_oscillator ro(.vout(vout_adc)
adc1bit adc(.in1(vout_adc),
		.in2(in2),
		.out(out));
endmodule
