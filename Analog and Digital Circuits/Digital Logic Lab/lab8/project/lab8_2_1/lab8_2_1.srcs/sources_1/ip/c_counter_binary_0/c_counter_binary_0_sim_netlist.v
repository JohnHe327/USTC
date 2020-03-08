// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Nov 16 17:37:40 2018
// Host        : JohnHe_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               i:/lab8/project/lab8_2_1/lab8_2_1.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    CE,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
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
  (* c_count_to = "1001" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_12 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1001" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1001" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_0_c_counter_binary_v12_0_12
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
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
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
  (* c_count_to = "1001" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_12_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
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
mO4QOTSZF2w9Y9B8dGxAD9WPm8Qqx4LOSfo5mH1vOfGe5h0/2e+RcooO5mr75hpvwDjox7h+W2JF
3Gbw2Rd0JZxSPUFyQYSkG1QqBjuI7Dw9ZvxBmnG9V0phrJXK+FssVfN+CrZQ7iAb/FWcU097iLPL
f5ldHoV5oIT52x2BIpeocaUN77QgTMbiAyJ/IdPLSYI/gMYf3OijeRQq+m4BubgCoiKihBIKjVV6
Wo2mJF9nD/Ci83kfBYqRKZLjdDwTJOyY/Exr6j9iAB6pnRtIbrDP/6cjSF73tIojJNTbXmq6QPcP
Ioq1ksygUzrQUXnJNgy7bnqgEARunI69Pso3OQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sLoNH5A/FseKsUXRF+zyPixVvlwxEV663DzAIAJnk7dRWcFwYIjLcaB2t1B8/Ua4iOZH3PQKy6CN
hmscKQEEcedkeWitxeqTvQbZcWBEJeDHfKfmuwfbnZ6gar5vG1z4eEeRZSiTlZZ8bpauB04+dkpB
80qZKLfW9g3mS+Kadps1tAxd6Y3xUPOsjHITFatLJgCftmRevAqoIIjvAqONgcjPgz+LZKa84QNo
jmgBJcS+uFsWvGuGFcBVUcTVogUONVwM9drTyMmNjkeB0XNHdCHab8XBMBmxHcUl8VSPhxI5Tbea
h8jQHSwbuADCkPxa6yAINq7Iabt0R7SRGv72fQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6000)
`pragma protect data_block
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
h3ZE1hXPI3GMug/Yve5F
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
