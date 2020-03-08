// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Nov 16 17:37:37 2018
// Host        : JohnHe_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top c_counter_binary_1 -prefix
//               c_counter_binary_1_ c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_1
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
  c_counter_binary_1_c_counter_binary_v12_0_12 U0
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
(* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_1_c_counter_binary_v12_0_12
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
  c_counter_binary_1_c_counter_binary_v12_0_12_viv i_synth
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
o1Wlg9YsYTTMNJ99ZG4sZsOMqzf882yFq8Pof6R6KB/3GGIJm3YoZ7HYPsLzu9OSSWyvrwTHGwS5
nPmCnS3jaon8p8bSUesl+PkBFEkK1PN8RYL1bpbMF3mSn2fF/KwC/QJAWFmkfhiQYk6ZmUHNHOG3
099brV01bz3B6wfXhsatpiMIki1d93ueEJXb44YSEix1DQgPrB1HeTjHG/B4NHf2b1vCE6KO+vds
HHSDqN8YLonJpe186rYmyeUH+1hNJbvNPiSfmMwgroy7BZq4ETvi3HXywtMLVJYYNYQZKbqaDNgY
IEZ+KkHEj0OBeWHsUjtlKWah0YoOu91CP0tPGw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vASVa59KI79D2z8c1NGhfT0BLOLCEaNCxEGu7BRJllP3gF8iuguVfyA7FaUa8DQG6/ID3OfbKnxI
oOVewWb8yfNjYn2Gr1Nl9R+Vah0u1599+cWXYKOYn2xFDj8H5OowjYIhHbMJt9Bk+y9LbMIaJNbC
eUbGsdB6D2+DszWY4zStK5dLheKtDd6aId9ZU2WPSNi+dQuVjBJMEywUeMVbo06H8BFxjrS9gXUt
Yol+T10kfu3hBhQDWnPxtxgGsIMwCCS02aGPJXhORfrfHqZhbsK0Yc1ldvfzkZFA2SzOq+YSSMWk
j+h27XzaaVolKmxq21GLfNdjJPmF5QUsw18EPw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5936)
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
