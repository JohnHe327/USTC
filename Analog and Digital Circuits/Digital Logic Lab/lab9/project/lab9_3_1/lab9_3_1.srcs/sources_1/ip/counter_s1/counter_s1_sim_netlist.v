// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Nov 23 17:18:27 2018
// Host        : JohnHe_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               i:/lab9/project/lab9_3_1/lab9_3_1.srcs/sources_1/ip/counter_s1/counter_s1_sim_netlist.v
// Design      : counter_s1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "counter_s1,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module counter_s1
   (CLK,
    CE,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "4" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "101" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_s1_c_counter_binary_v12_0_12 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "101" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "101" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module counter_s1_c_counter_binary_v12_0_12
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [3:0]L;
  output THRESH0;
  output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "4" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "101" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_s1_c_counter_binary_v12_0_12_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
RhedCTftnR/lFLJouqVu00X8CC4TkDlMiW/WeWJSYDyQHVO1xW1z9+hmgAziXI4s3uGElBs9cXRS
4yVMV7QH0w==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
qX90FYlZfOA3sZpcv0rrvWRKCSlr3skWpeAe5OSxHcZPsVQFyY0hhWVDtP/vB+dV9hIUwAN29Fn9
+L9OEXYMlIw5gH6s9NmquAs3lmPRLTrrpKJWdvf6+b+LeG9CPwLz87bXAk4qQW80zUHBaDKDLV3q
pd/gEf8Y3st+mLOGjNU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
chpH3Rj5RAirYZHkpJvTu4EJpydPPSy15v646y2lN/1w3bwHI+M8EpLMBjimx8uIWRJZ6dDWPR8E
zkwK1TMroEKFaL8IkFMSHPyzqbrH9l1jxYFs0ee8Itp8Rg8qenv5RXM+h4JRTtRmzHk1A8s8zeKY
MgXzIBCAzBa/vSgzDuDaUnO8r8f/5KtRjmE28JLNXXAxyijBrMTCiIHMRJZL5/+LgUyVq7/Zr5yx
7kuNGWv7Q0wESEqhsQbK6UNel5ak1cor7647dYJgIxnNZ6jGVJPkqi8ydAIZ0z0Dy4txBvVaMyP6
2kYYnbVN6S6q6yr/QcJHEOgefF59B/8JuWzdoQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z2XauOF3/9FUIv1kEFfEtdy93+zHY5q9dH1pJCNLytoWWhhJBfCI5Uc2w/fQLrvVw2Ivy0/rs9qH
9fomTNECWeCphNDVpWGNcFDGE51jt6SDWt7FmgfZq4iXN7XWrfmkQa4DB7QbtSBHCMcBT53TKbDH
suKNhAWMV0htWeNEgN4Y0biiz8U4RLT1stdsMMtEzfYVhtrTmFWLihJ/9gJ01pm/kv4OB2cJEslg
sjbxCE2B4Y1uSj93tnBAw4/f2RYGfPcSrkaXkNgOYK2dc5NQgd82XvP8siAK/ETcZQ1lBK367Rxv
nlr6QUMwKALmjLVe/IThpCRGbOSy3QykkwnpHw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F/mF2RV90mf5PFUZZUjMej6jQS+Qx16uCeiDQxUX+H+O2yjP6UECegDbtLmGk9algbDuGBCE0KgZ
HzSxX5pMwDq1J7nFyBsu1dGyu8NeJxfu0fFA/qS/SYJSTtwnZ/eIj09mNLJ3w8wGR87ke1ETTRpx
4Ni9DzGJ/aaWFaUenL/x4UWS9yqlaNi5Utcpa4kcUHC6fW0asZsThZJBqpArO54TF40nxZAD+V82
6mBGFOKUzgmHqXNsbVif4JqUd63LG8YWxjrOeesq61xzyjw9caQMuA9v/5sQslCFaeSt2atgqyaA
y4mcm0kU60s6mYqJr4KZt8DWG7LPGoIjhjpnMg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YNrNxIZl8p2OCPz+4Y4awQ09ZZ41X8EdKu2SX1gXfB3qoV3EOXf4eFHtYJ+bFIccfEIqPfZ+dnr7
udcSDAJMcxqZe+YNk5hTq+uX4PlnQH/IVlkgyYiDhQ7aRIS5pwtIRC3biXn80933ov4zlWLI+ZBq
bG8lodZjxKh6HZPWi7s=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eWToRZf4bzAQhHTj44yEkOqolJ3BOvlBPKnKoDCpSvCHSrnRcJKgOd47PnboABTqLVstQenz8AFe
rWHBbaad7KOIh3LsEXBwDHKDdby7iDAB5nd3j2Wp7qiHOv7WpIJ5RG1GMQa8+QXHMVaV4jSvsdmt
d0D9H0WEVaqrSFW2ucpsMYNE0LnKcSJ1SejKOcgISzaGJgXcmEAOVAOnCDPc4slwc3dt7Jne1KvY
i66An36Mfhhd1b0RikMf4yqpM+uVrL5XWIP+TBtw3iQRE0ZkUSn3K0My73/2vKKBfwyV0c+M/Il+
aMxNaD44Gq+/f6zGjkelgMEI4BjB5rs1KRvSCg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gMqmWW4+GnF/Dwl+XipYbH/ozw8lqDVC1YV95t8sg2+7iTA1FLqVB42qaHr9AsTJHnITWxF9/aJm
E34oyXIbUkbMuw5nIs3ZafbnHKXW0zZZWS7MiG1mjxPc13/DgPT52zcT+EeAZosbohr17pMr0384
rA3027KB4hQ4AnJcxSmqDF2F3+8LdeRorCdk+VNnR3M4NFaxYhYLyXzM2PsE9Tlxehg0h2mzh2uY
p2gnKCpUa58c4VvB9ewlNQXs2zi4bEO0h/K9xMZiENxT4C5/D+lWdp/PTD5CpspoNoXM2qKH7KmR
MMAo09W4DXdPn5NC08TNzT9cE7CGrVAWnqquLg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
p6if6QPEGSqoZxXyWxTRR5dPPvPWXR2cFz/hpDO7RzoQbxGQp/zF0VtkaO6j8WZIx14B2ytWrvSh
hKIA1P8O+vFUdPVQr4x89WPcU3K/oBRcvsul8YplAzEugvOYoAzWD83XntU2ODCOhjGsSfi2eTuv
AFqHdUH40CKEdgyS75530n3uJYOcZtdQVYRZHIjcG7fyyrpZMahcN9GsPxRrc6oxBdPozS3pTE62
S0jZAzcpNt7N2hioUROywSz+TYV57wt+HPb8HEdAh7gNo0Eq2RWxFDyipUW75M5n7ML7MHeFyT9Q
SQlu4m5Ny5XWlMyvpGBPgVwPrxvm1WmZt/jh3A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6432)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
