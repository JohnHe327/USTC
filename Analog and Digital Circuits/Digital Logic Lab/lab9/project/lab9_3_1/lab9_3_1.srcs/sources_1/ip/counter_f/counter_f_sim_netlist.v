// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Nov 23 17:10:14 2018
// Host        : JohnHe_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               i:/lab9/project/lab9_3_1/lab9_3_1.srcs/sources_1/ip/counter_f/counter_f_sim_netlist.v
// Design      : counter_f
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "counter_f,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module counter_f
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
  (* c_count_to = "1001" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_f_c_counter_binary_v12_0_12 U0
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
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1001" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "1" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1001" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module counter_f_c_counter_binary_v12_0_12
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
  (* c_count_to = "1001" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_f_c_counter_binary_v12_0_12_viv i_synth
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
TT4E2S7Tc49XUvxOcr23m6ueTD46j0Jmjr8CyshWsURHRSR3pSTiB1IWwuZZS6KStB3S5em+Auhs
9TnQTx2ghqfGDvMiLmqF/AHQn/jPwUtmHpw9rVQkVx1iy/bFUGQvSK+ilEvAQO17R6OEgDx0ulpB
+QzJaR5yOrtvCqUuqxNyltMiTIWXJqX9faecUVv5UKPZnV/qRylV9tjs3QKMmdy2qzWuam0byl7X
AJSP9P/tKKKkIRpo6Ku4D5WwbruGl4ofZMNKh/EhwaXHPm4KVAQXr4tIJFv/pmTUH9KxADY9UWYV
0zCkC9J+vfSJKnSRmuWulRfdOYaraSYUtAc75w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
07DB8uyr59PkDTaN3OfEwKhFzmL0Q+mbkJxlWZJbYuGrmlN3i4N6R7YpFenvezZDUt/uZM37nW3W
TAvtCPRXsReMXaFm2BO7AHQKoKoeRfh9qO+yFVCXyOIg0u43jnpZc/EqIoIyOOwTiNg64AJhfwAY
qMdsLoQ2ea+fSrwk4V5W3D1V4AHsK5hVmgbnrOWl+Px9CSPJcoJSFesXDa7Go5qqVYSr35YnQvAo
xI50g16SXtWYmDOLdxX/umI8aIxz81jlfyfy9IHIXVIJyn7KyagIRB8PZffvJrPcLIOhJv9rS1wL
sQt7JE91BrPGmmEn8IoDLDA5d3xVkKmOcJaTvw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6416)
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
