// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Nov 23 17:10:10 2018
// Host        : JohnHe_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top counter_s0 -prefix
//               counter_s0_ counter_f_sim_netlist.v
// Design      : counter_f
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "counter_f,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module counter_s0
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
  counter_s0_c_counter_binary_v12_0_12 U0
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
(* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module counter_s0_c_counter_binary_v12_0_12
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
  counter_s0_c_counter_binary_v12_0_12_viv i_synth
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
nRJW47XFmBhlwfomEMa3RJWO+BrGbI3MLDlqaHCorF+vgao5u38fRJEH1qC8VaAImQlFJ/UIQPSY
/AUSREJ+N6f6v0hXmIsRsZtU4nOKUT67T00Any+SK9xJGJSTuuUvmMwAtOFxpI+9bXDZZJTpjtQh
TDdF99WpyIBn55nv1CNaY6hLrVflx4PLbYQlCPDxsEw9vdpxBqB2STCT904Jq9iGxIlQ2OT6GS5l
SNijDU6IVvUqLuNGTMJMaYpv7Ysp0u9nAoMaWfqxy5TRl9LqO5SdZwvt0T1pz0f8K+qJQjg0NoMm
TiLtSdR0YwYwFcOQjkbIsObSZaAsfsBlHixHOA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
onjbEpgcQkmaGue9CWKNQJE6nJg6Mh5QqlVTw6NdC+h+w6ePJZi/Znm/GW9BTCIA9CzS2V+kwsc0
txGqHiLNNuyqENYtLZfCOFtu4m0hB9h5fm9E3m9U99GkySPaFTkZ2lud1UO2rWFkrSJLF3DM/Jpp
W/uf+e8wl2+/GVRmbuMPBuZkaZDik8hGQPctljaJ8g8zcCliu92ATlNxDhvi3aXyhl7CKvpiy330
vgjQ31vOoHx1EHdovZux8nwNVG98h3KnUM2WqPheTolVKmNIQfyxtee7KJGOPQB2rlLg8U1rm5fP
g+cTZdPn1u4NaKVTK7dhg1ZsJVdDHhtpqPqA9Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6448)
`pragma protect data_block
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
gh/QYfL5HEHR31ARPw==
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
