// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu Nov 29 23:19:58 2018
// Host        : JohnHe_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               I:/lab9/project/lab9_3_1/lab9_3_1.srcs/sources_1/ip/counter_m/counter_m_sim_netlist.v
// Design      : counter_m
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "counter_m,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module counter_m
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [3:0]Q;

  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire NLW_U0_THRESH0_UNCONNECTED;

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
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_m_c_counter_binary_v12_0_12 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1001" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1001" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "4" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module counter_m_c_counter_binary_v12_0_12
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

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [3:0]Q;
  wire SCLR;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
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
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1001" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_m_c_counter_binary_v12_0_12_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
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
T0G/jHFIaWJ2XAlkVzFeOW8MES6xvyjORSLAsU0k9F6MpLhe4yyP/kM4A8b7EzuWwDuvaChy2j0r
fLV/TZSAC9lEQaoaJBcYQuL5IHa02klWA4DSuHh7qq7L48v/c1Cf0aIpbtvw4ylmK4uqEr/Ra1J0
rCqF0LdjFiipgsQaATwN3S+GfDk4iWb0QhXgUET4d5UJd2Tm33b23z4hg7bdNxlKtPr2sVyK4ZgV
1kcLAiBLBMzKDtkSJzCZARa4wU8WSb2iIDi0+0RkURWRWKDgHlbJR+esubS6yusKdZI/rimTn8p1
7m3FYo358Rkv1wMQotAlIgCTpz4xJL+2/do31Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zyE2crR8H+8HgDyE0gcbf4ZauTAGpPRixvCqEBevBQAkDLUa1IWxoCL/Clf2hZDulU2SCX9NIAQh
xr8rxshHHazf/i03OWkXt4GDGf3AzMhuaH45zz2VLJkTfNK0q1EolOUzjYC/2v2oCMrkqvyZo4ru
DU19SIWZdz/3m/nappJfKzjut961xNF1TZqwPcTa0oaSPIy4DNHMux0eh9nAfPevmMJCS6zz8k6w
a2RWP+iNWStmIr70qrzJ2Xc3xFTS64wY9ZLAEESzMGRSYUsXO0XFQxExx9M5IxPEUDzgPRP6Ypwl
I6SJTR1bSulZAq2gxD81EmXGE2YTQrheo3laug==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5312)
`pragma protect data_block
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
1WltkPo8N3vm0l0=
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
