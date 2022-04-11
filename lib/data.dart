const dataTest = '''
,x_start,y_start,index,id
0,1.86,-4.3,A1,0
1,2.47,-3.69,A2,1
''';

const dataNodes = '''
,x_start,y_start,index,id
0,1.86,-4.3,A1,0
1,-0.07,-3.99,A2,1
2,-0.23,-4.3,A3,2
3,-2.11,-3.99,A4,3
4,-2.26,-4.3,A5,4
5,-2.87,-3.68,A6,5
6,-2.26,-4.14,A7,6
8,-1.96,-3.99,A9,7
10,0.23,-4.14,A11,8
11,2.31,-3.61,A12,9
12,2.16,-3.46,A13,10
13,2.31,-3.15,A14,11
14,1.4,-2.92,A15,12
15,0.18,-3.31,A16,13
16,0.08,-3.61,A17,14
18,-0.23,-3.46,A19,15
19,-1.8,-3.3,A20,16
20,-1.95,-3.61,A21,17
21,-2.11,-3.16,A22,18
24,-0.07,-3.14,A25,19
27,1.77,-2.54,A28,20
28,2.16,-2.08,A29,21
29,2.23,-2.27,A30,22
30,2.47,-2.61,A31,23
31,2.57,-2.27,A32,24
33,-1.06,-2.77,A34,25
34,-1.66,-2.32,A35,26
35,-1.81,-2.16,A36,27
36,-1.95,-2.46,A37,28
38,-2.26,-2.31,A39,29
39,-2.72,-2.78,A40,30
40,-2.26,-2.16,A41,31
42,-2.11,-2.01,A43,32
45,2.47,-1.61,A46,33
46,2.62,-1.61,A47,34
47,2.01,-1.45,A48,35
48,2.01,-1.3,A49,36
51,2.31,-0.85,A52,37
52,2.16,-0.85,A53,38
53,0.38,-0.99,A54,39
54,0.38,-1.15,A55,40
55,0.08,-1.61,A56,41
56,0.23,-1.61,A57,42
59,-0.07,-0.84,A60,43
60,-0.23,-0.84,A61,44
63,-0.38,-1.3,A64,45
64,-0.37,-1.45,A65,46
69,-1.19,-1.4,A70,47
70,-1.53,-1.3,A71,48
71,-1.95,-1.45,A72,49
72,-1.81,-1.15,A73,50
73,-2.11,-0.99,A74,51
75,-1.19,-1.06,A76,52
76,-1.02,-0.99,A77,53
77,1.17,-0.99,A78,54
78,2.62,-0.21,A79,55
79,2.47,-0.2,A80,56
80,2.76,0.29,A81,57
81,2.63,0.37,A82,58
82,2.06,0.19,A83,59
84,2.0,0.05,A86,60
85,1.66,0.4,A87,61
86,1.8,0.48,A88,62
87,2.24,1.22,A89,63
88,2.24,1.07,A90,64
89,1.12,0.76,A91,65
90,1.22,0.91,A92,66
91,0.71,0.3,A93,67
92,0.23,0.3,A94,68
93,0.08,0.3,A95,69
94,-0.64,0.91,A96,70
95,-0.66,0.76,A97,71
96,-1.58,0.28,A98,72
97,-1.43,0.27,A99,73
98,-1.67,-0.15,A100,74
99,-2.39,-0.15,A101,75
100,-1.95,-0.69,A102,76
102,-2.17,0.79,A104,77
103,-2.26,0.91,A105,78
104,-0.87,1.22,A106,79
105,-0.87,1.06,A107,80
107,-1.47,0.58,A1082,81
108,-1.8,0.92,A1083,82
110,2.47,-3.69,A110,83
112,-0.91,-3.3,A112,84
113,-1.22,-3.15,A113,85
114,0.18,-2.27,A114,86
115,0.08,-2.61,A115,87
116,-0.16,-2.27,A116,88
117,-0.23,-2.08,A117,89
121,2.17,-0.0,A121,90
123,0.23,-4.3,S1,91
124,1.86,-4.15,S2,92
127,-1.8,-4.3,S5,93
128,-0.23,-4.14,S6,94
130,-1.8,-4.14,S8,95
131,-2.11,-3.61,S9,96
135,-1.8,-3.45,S13,97
136,-0.23,-3.31,S141,98
138,-1.37,-3.3,S143,99
139,-0.07,-3.61,S15,100
140,0.08,-3.99,S16,101
145,0.23,-3.46,S21,102
146,0.94,-3.31,S22 ,103
147,2.16,-3.3,S23,104
150,2.47,-3.15,S28,105
151,2.31,-2.6,S29,106
152,0.08,-3.15,S30,107
153,-0.07,-2.6,S31,108
154,-1.06,-3.15,S32,109
155,-1.21,-2.77,S33,110
156,-1.95,-3.15,S34,111
157,-2.11,-2.47,S35,112
158,-2.72,-3.69,S36,113
159,-2.87,-2.77,S37,114
164,-1.8,-2.32,S42,115
165,-1.67,-2.16,S43,116
166,-2.11,-1.45,S44,117
167,-1.95,-2.01,S45,118
168,-0.23,-1.6,S46,119
169,-0.07,-1.6,S47,120
170,0.23,-2.09,S48,121
172,2.16,-1.6,S50,122
173,2.31,-1.6,S51,123
174,2.61,-2.09,S52,124
180,0.38,-1.3,S58,125
181,0.38,-1.45,S59,126
182,2.01,-1.14,S60,127
183,2.01,-0.99,S611,128
192,-1.01,-1.45,S69,129
195,-0.38,-1.15,S72,130
196,-0.38,-0.99,S73,131
197,-1.8,-1.29,S74,132
198,-1.54,-1.15,S75,133
201,-1.95,-0.99,S78,134
202,-2.11,-0.69,S79,135
203,0.23,-0.84,S80,136
204,0.08,-0.84,S81,137
205,-0.07,0.31,S82,138
206,-0.22,0.3,S83,139
207,0.71,-0.54,S84,140
208,2.62,-0.84,S85,141
209,2.47,-0.84,S86,142
210,2.31,-0.2,S87,143
211,2.16,-0.21,S88,144
212,0.71,0.76,S89,145
213,0.73,0.91,S90,146
218,-0.87,0.76,S95,147
219,-0.87,0.91,S96,148
''';

const dataLines = '''
i,index,x,y,x_start,y_start,x_end,y_end,length,start_node,end_node,speed_limit,adjusted_length
123,S1,0.228,-4.296,0.23,-4.3,1.86,-4.3,1.63,91,0,30,0.05433333317438761
124,S2,1.858,-4.136,1.86,-4.15,0.23,-4.14,1.63,92,8,30,0.05433333317438761
125,S3,-0.232,-4.296,-0.23,-4.3,0.23,-4.3,0.46,2,91,30,0.015333333611488342
126,S4,0.228,-4.136,0.23,-4.14,-0.23,-4.14,0.46,8,94,30,0.015333333611488342
127,S5,-1.802,-4.296,-1.8,-4.3,-0.23,-4.3,1.57,93,2,30,0.052333335081736244
128,S6,-0.232,-4.136,-0.23,-4.14,-1.8,-4.14,1.57,94,95,30,0.052333335081736244
129,S7,-2.262,-4.296,-2.26,-4.3,-1.8,-4.3,0.46,4,93,30,0.015333333611488342
130,S8,-1.802,-4.136,-1.8,-4.14,-2.26,-4.14,0.46,95,6,30,0.015333333611488342
131,S9,-2.112,-3.606,-2.11,-3.61,-2.11,-3.99,0.38,96,3,30,0.012666666507720947
132,S10,-1.952,-3.986,-1.96,-3.99,-1.95,-3.61,0.38,7,17,30,0.012666666507720947
133,S11,-1.952,-3.606,-1.95,-3.61,-1.95,-3.15,0.46,17,111,30,0.015333333611488342
134,S12,-2.112,-3.146,-2.11,-3.16,-2.11,-3.61,0.46,18,96,30,0.015333333611488342
135,S13,-1.802,-3.456,-1.8,-3.45,-0.23,-3.46,1.57,97,15,30,0.052333335081736244
136,S141,-0.232,-3.296,-0.23,-3.31,-0.91,-3.3,0.68,98,84,30,0.022666666905085245
137,S142,-0.91,-3.296,-0.91,-3.3,-1.37,-3.3,0.46,84,99,30,0.015333333611488342
138,S143,-1.37,-3.296,-1.37,-3.3,-1.8,-3.3,0.43,99,16,30,0.014333333571751912
139,S15,-0.072,-3.606,-0.07,-3.61,-0.07,-3.99,0.38,100,1,30,0.012666666507720947
140,S16,0.078,-3.986,0.08,-3.99,0.08,-3.61,0.38,101,14,30,0.012666666507720947
141,S17,-0.072,-3.146,-0.07,-3.14,-0.07,-3.61,0.46,19,100,30,0.015333333611488342
142,S18,0.078,-3.606,0.08,-3.61,0.08,-3.15,0.46,14,107,30,0.015333333611488342
143,S19,0.228,-3.306,0.18,-3.31,-0.23,-3.31,0.46,13,98,30,0.015333333611488342
144,S20,-0.232,-3.456,-0.23,-3.46,0.23,-3.46,0.46,15,102,30,0.015333333611488342
145,S21,0.228,-3.456,0.23,-3.46,2.16,-3.46,1.93,102,10,30,0.06433333158493042
146,S22 ,0.938,-3.306,0.94,-3.31,0.18,-3.31,0.76,103,13,30,0.025333333015441894
147,S23,2.158,-3.306,2.16,-3.3,0.94,-3.31,1.22,104,103,30,0.040666667620340984
148,S26,2.468,-3.606,2.47,-3.69,2.47,-3.15,0.46,83,105,30,0.015333333611488342
149,S27,2.308,-3.146,2.31,-3.15,2.31,-3.61,0.46,11,9,30,0.015333333611488342
150,S28,2.468,-3.146,2.47,-3.15,2.47,-2.61,0.54,105,23,30,0.01800000071525574
151,S29,2.308,-2.606,2.31,-2.6,2.31,-3.15,0.54,106,11,30,0.01800000071525574
152,S30,0.078,-3.146,0.08,-3.15,0.08,-2.61,0.54,107,87,30,0.01800000071525574
153,S31,-0.072,-2.596,-0.07,-2.6,-0.07,-3.14,0.54,108,19,30,0.01800000071525574
154,S32,-1.062,-3.146,-1.06,-3.15,-1.06,-2.77,0.38,109,25,30,0.012666666507720947
155,S33,-1.222,-2.766,-1.21,-2.77,-1.22,-3.15,0.38,110,85,30,0.012666666507720947
156,S34,-1.952,-3.146,-1.95,-3.15,-1.95,-2.46,0.69,111,28,30,0.02299999992052714
157,S35,-2.112,-2.466,-2.11,-2.47,-2.11,-3.16,0.69,112,18,30,0.02299999992052714
158,S36,-2.722,-3.686,-2.72,-3.69,-2.72,-2.78,0.91,113,30,30,0.03033333420753479
159,S37,-2.872,-2.766,-2.87,-2.77,-2.87,-3.68,0.91,114,5,30,0.03033333420753479
160,S38,-2.112,-2.006,-2.11,-2.01,-2.11,-2.47,0.46,32,112,30,0.015333333611488342
161,S39,-1.802,-2.156,-1.81,-2.16,-2.26,-2.16,0.46,27,31,30,0.015333333611488342
162,S40,-1.952,-2.466,-1.95,-2.46,-1.95,-2.01,0.46,28,118,30,0.015333333611488342
163,S41,-2.262,-2.316,-2.26,-2.31,-1.8,-2.32,0.46,29,115,30,0.015333333611488342
164,S42,-1.802,-2.316,-1.8,-2.32,-1.66,-2.32,0.14,115,26,30,0.004666666686534882
165,S43,-1.672,-2.156,-1.67,-2.16,-1.81,-2.16,0.14,116,27,30,0.004666666686534882
166,S44,-2.112,-1.446,-2.11,-1.45,-2.11,-2.01,0.56,117,32,30,0.018666666746139527
167,S45,-1.952,-2.006,-1.95,-2.01,-1.95,-1.45,0.56,118,49,30,0.018666666746139527
168,S46,-0.232,-1.596,-0.23,-1.6,-0.23,-2.08,0.48,119,89,30,0.015999999642372132
169,S47,-0.072,-1.596,-0.07,-1.6,-0.07,-2.6,1.0,120,108,30,0.03333333333333333
170,S48,0.228,-2.086,0.23,-2.09,0.23,-1.61,0.48,121,42,30,0.015999999642372132
171,S49,0.078,-2.606,0.08,-2.61,0.08,-1.61,1.0,87,41,30,0.03333333333333333
172,S50,2.158,-1.596,2.16,-1.6,2.16,-2.08,0.48,122,21,30,0.015999999642372132
173,S51,2.308,-1.596,2.31,-1.6,2.31,-2.6,1.0,123,106,30,0.03333333333333333
174,S52,2.618,-2.086,2.61,-2.09,2.62,-1.61,0.48,124,34,30,0.015999999642372132
175,S53,2.468,-2.606,2.47,-2.61,2.47,-1.61,1.0,23,33,30,0.03333333333333333
176,S54,2.618,-1.596,2.62,-1.61,2.62,-0.84,0.76,34,141,30,0.025333333015441894
177,S55,2.468,-1.596,2.47,-1.61,2.47,-0.84,0.76,33,142,30,0.025333333015441894
178,S56,2.308,-0.836,2.31,-0.85,2.31,-1.6,0.76,37,123,30,0.025333333015441894
179,S57,2.158,-0.836,2.16,-0.85,2.16,-1.6,0.76,38,122,30,0.025333333015441894
180,S58,0.378,-1.296,0.38,-1.3,2.01,-1.3,1.63,125,36,30,0.05433333317438761
181,S59,0.378,-1.446,0.38,-1.45,2.01,-1.45,1.63,126,35,30,0.05433333317438761
182,S60,2.008,-1.146,2.01,-1.14,0.38,-1.15,1.63,127,40,30,0.05433333317438761
183,S611,2.008,-0.986,2.01,-0.99,1.17,-0.99,0.84,128,54,30,0.027999999125798543
184,S612,1.17,-0.986,1.17,-0.99,0.38,-0.99,0.79,54,39,30,0.02633333404858907
185,S62,-0.382,-1.296,-0.38,-1.3,0.38,-1.3,0.76,45,125,30,0.025333333015441894
186,S63,-0.382,-1.446,-0.37,-1.45,0.38,-1.45,0.76,46,126,30,0.025333333015441894
187,S64,0.078,-1.596,0.08,-1.61,0.08,-0.84,0.76,41,137,30,0.025333333015441894
188,S65,0.228,-1.596,0.23,-1.61,0.23,-0.84,0.76,42,136,30,0.025333333015441894
189,S66,-0.072,-0.836,-0.07,-0.84,-0.07,-1.6,0.76,43,120,30,0.025333333015441894
190,S67,-0.232,-0.836,-0.23,-0.84,-0.23,-1.6,0.76,44,119,30,0.025333333015441894
191,S68,-1.542,-1.296,-1.53,-1.3,-0.38,-1.3,1.16,48,45,30,0.03866666555404663
192,S69,-1.012,-1.446,-1.01,-1.45,-0.37,-1.45,0.64,129,46,30,0.021333332856496176
193,S70,0.378,-0.986,0.38,-0.99,-0.38,-0.99,0.76,39,131,30,0.025333333015441894
194,S71,0.378,-1.146,0.38,-1.15,-0.38,-1.15,0.76,40,130,30,0.025333333015441894
195,S72,-0.382,-1.146,-0.38,-1.15,-1.54,-1.15,1.16,130,133,30,0.03866666555404663
196,S73,-0.382,-0.986,-0.38,-0.99,-1.02,-0.99,0.64,131,53,30,0.021333332856496176
197,S74,-1.802,-1.296,-1.8,-1.29,-1.53,-1.3,0.27,132,48,30,0.00900000035762787
198,S75,-1.542,-1.146,-1.54,-1.15,-1.81,-1.15,0.27,133,50,30,0.00900000035762787
199,S76,-2.112,-0.986,-2.11,-0.99,-2.11,-1.45,0.46,51,117,30,0.015333333611488342
200,S77,-1.952,-1.446,-1.95,-1.45,-1.95,-0.99,0.46,49,134,30,0.015333333611488342
201,S78,-1.952,-0.986,-1.95,-0.99,-1.95,-0.69,0.3,134,76,30,0.010000000397364298
202,S79,-2.112,-0.686,-2.11,-0.69,-2.11,-0.99,0.3,135,51,30,0.010000000397364298
203,S80,0.228,-0.836,0.23,-0.84,0.23,0.3,1.14,136,68,30,0.03799999952316284
204,S81,0.078,-0.836,0.08,-0.84,0.08,0.3,1.14,137,69,30,0.03799999952316284
205,S82,-0.072,0.304,-0.07,0.31,-0.07,-0.84,1.14,138,43,30,0.03799999952316284
206,S83,-0.232,0.304,-0.22,0.3,-0.23,-0.84,1.14,139,44,30,0.03799999952316284
207,S84,0.708,-0.536,0.71,-0.54,0.71,0.3,0.84,140,67,30,0.027999999125798543
208,S85,2.618,-0.836,2.62,-0.84,2.62,-0.21,0.63,141,55,30,0.02099999984105428
209,S86,2.468,-0.836,2.47,-0.84,2.47,-0.2,0.64,142,56,30,0.021333332856496176
210,S87,2.308,-0.206,2.31,-0.2,2.31,-0.85,0.64,143,37,30,0.021333332856496176
211,S88,2.158,-0.206,2.16,-0.21,2.16,-0.85,0.64,144,38,30,0.021333332856496176
212,S89,0.637,0.759,0.71,0.76,1.12,0.76,0.48,145,65,30,0.015999999642372132
213,S90,0.724,0.913,0.73,0.91,1.22,0.91,0.5,146,66,30,0.016666666666666666
214,S91,-0.637,0.759,-0.66,0.76,0.71,0.76,1.35,71,145,30,0.045000000794728594
215,S92,-0.722,0.914,-0.64,0.91,0.73,0.91,1.45,70,146,30,0.04833333492279053
216,S93,2.238,1.064,2.24,1.07,-0.87,1.06,3.11,64,80,30,0.10366666316986084
217,S94,2.238,1.224,2.24,1.22,-0.87,1.22,3.11,63,79,30,0.10366666316986084
218,S95,-0.874,0.762,-0.87,0.76,-0.66,0.76,0.21,147,71,30,0.006999999781449636
219,S96,-0.874,0.913,-0.87,0.91,-0.64,0.91,0.23,148,70,30,0.007666666805744171
''';

const dataArcs = '''
i,index,x,y,radius,angleStart,angleEnd,Rotation,x_start,y_start,x_end,y_end,length,start_node,end_node,speed_limit,adjusted_length
0,A1,1.858,-3.686,0.61,-1.5708,0.0,CCW,1.86,-4.3,2.47,-3.69,0.958188,0,83,15,0.06387919982274373
1,A2,0.228,-3.986,0.3,-3.1416,-1.5708,CCW,-0.07,-3.99,0.23,-4.3,0.47124,1,91,15,0.031416000922520955
2,A3,-0.232,-3.986,0.3,-1.5708,0.0,CCW,-0.23,-4.3,0.08,-3.99,0.47124,2,101,15,0.031416000922520955
3,A4,-1.802,-3.986,0.3,-3.1416,-1.5708,CCW,-2.11,-3.99,-1.8,-4.3,0.47124,3,93,15,0.031416000922520955
4,A5,-2.262,-3.986,0.3,-1.5708,0.0,CCW,-2.26,-4.3,-1.96,-3.99,0.47124,4,7,15,0.031416000922520955
5,A6,-2.262,-3.686,0.61,-3.1416,-1.5708,CCW,-2.87,-3.68,-2.26,-4.3,0.958188,5,4,15,0.06387919982274373
6,A7,-2.262,-3.686,0.46,-1.5708,-3.1416,CW,-2.26,-4.14,-2.72,-3.69,0.722568,6,113,15,0.04817119836807251
7,A8,-2.262,-3.986,0.15,0.0,-1.5708,CW,-2.11,-3.99,-2.26,-4.14,0.23562,3,6,15,0.015708000461260477
8,A9,-1.802,-3.986,0.15,-3.1416,-1.5708,CCW,-1.96,-3.99,-1.8,-4.14,0.23562,7,95,15,0.015708000461260477
9,A10,-0.232,-3.986,0.15,0.0,-1.5708,CW,-0.07,-3.99,-0.23,-4.14,0.23562,1,94,15,0.015708000461260477
10,A11,0.228,-3.986,0.15,-1.5708,-3.1416,CW,0.23,-4.14,0.08,-3.99,0.23562,8,101,15,0.015708000461260477
11,A12,1.858,-3.686,0.46,0.0,-1.5708,CW,2.31,-3.61,1.86,-4.15,0.722568,9,92,15,0.04817119836807251
12,A13,2.158,-3.146,0.3,-1.5708,0.0,CCW,2.16,-3.46,2.47,-3.15,0.47124,10,105,15,0.031416000922520955
13,A14,2.158,-3.146,0.15,0.0,-1.5708,CW,2.31,-3.15,2.16,-3.3,0.23562,11,104,15,0.015708000461260477
14,A15,0.938,-2.846,0.46,-0.1553,-1.5708,CW,1.4,-2.92,0.94,-3.31,0.65112996,12,103,15,0.04340866406758626
15,A16,0.228,-3.606,0.3,1.5708,3.1416,CCW,0.18,-3.31,-0.07,-3.61,0.47124,13,100,15,0.031416000922520955
16,A17,0.228,-3.606,0.15,3.1416,1.5708,CW,0.08,-3.61,0.23,-3.46,0.23562,14,102,15,0.015708000461260477
17,A18,-0.232,-3.606,0.3,0.0,1.5708,CCW,0.08,-3.61,-0.23,-3.31,0.47124,14,98,15,0.031416000922520955
18,A19,-0.232,-3.606,0.15,1.5708,0.0,CW,-0.23,-3.46,-0.07,-3.61,0.23562,15,100,15,0.015708000461260477
19,A20,-1.802,-3.606,0.3,1.5708,3.1416,CCW,-1.8,-3.3,-2.11,-3.61,0.47124,16,96,15,0.031416000922520955
20,A21,-1.802,-3.606,0.15,3.1416,1.5708,CW,-1.95,-3.61,-1.8,-3.45,0.23562,17,97,15,0.015708000461260477
21,A22,-1.802,-3.146,0.3,-3.1416,-1.5708,CCW,-2.11,-3.16,-1.8,-3.45,0.47124,18,97,15,0.031416000922520955
22,A23,-1.802,-3.146,0.15,-1.5708,-3.1416,CW,-1.8,-3.3,-1.95,-3.15,0.23562,16,111,15,0.015708000461260477
23,A24,-0.232,-3.146,0.3,-1.5708,0.0,CCW,-0.23,-3.46,0.08,-3.15,0.47124,15,107,15,0.031416000922520955
24,A25,-0.232,-3.146,0.15,0.0,-1.5708,CW,-0.07,-3.14,-0.23,-3.31,0.23562,19,98,15,0.015708000461260477
25,A26,0.228,-3.146,0.3,-3.1416,-1.5708,CCW,-0.07,-3.14,0.23,-3.46,0.47124,19,102,15,0.031416000922520955
26,A27,0.228,-3.146,0.15,-1.5708,-3.1416,CW,0.18,-3.31,0.08,-3.15,0.23562,13,107,15,0.015708000461260477
27,A28,1.848,-2.986,0.46,1.7261,2.9864,CCW,1.77,-2.54,1.4,-2.92,0.57973796,20,12,15,0.03864919741948446
28,A29,1.698,-2.086,0.46,0.0,-1.4155,CW,2.16,-2.08,1.77,-2.54,0.65113,21,20,15,0.04340866804122925
29,A30,1.318,-2.696,0.99,0.4475,0.0878,CW,2.23,-2.27,2.31,-2.6,0.356103,22,106,15,0.02374020020167033
30,A31,3.458,-2.696,0.99,3.0538,2.6941,CW,2.47,-2.61,2.57,-2.27,0.3561032,23,24,15,0.023740214109420777
31,A32,2.308,-2.086,0.3,-0.6288,0.0,CCW,2.57,-2.27,2.61,-2.09,0.18864,24,124,15,0.012575999895731608
32,A33,2.468,-2.086,0.3,-3.1416,-2.5128,CCW,2.16,-2.08,2.23,-2.27,0.18863998,21,22,15,0.012575998902320862
33,A34,-1.672,-2.766,0.61,0.0,1.5708,CCW,-1.06,-2.77,-1.67,-2.16,0.958188,25,116,15,0.06387919982274373
34,A35,-1.672,-2.766,0.46,1.5708,0.0,CW,-1.66,-2.32,-1.21,-2.77,0.722568,26,110,15,0.04817119836807251
35,A36,-1.802,-2.466,0.3,1.5708,3.1416,CCW,-1.81,-2.16,-2.11,-2.47,0.47124,27,112,15,0.031416000922520955
36,A37,-1.802,-2.466,0.15,3.1416,1.5708,CW,-1.95,-2.46,-1.8,-2.32,0.23562,28,115,15,0.015708000461260477
37,A38,-2.262,-2.466,0.3,0.0,1.5708,CCW,-1.95,-2.46,-2.26,-2.16,0.47124,28,31,15,0.031416000922520955
38,A39,-2.262,-2.466,0.15,1.5708,0.0,CW,-2.26,-2.31,-2.11,-2.47,0.23562,29,112,15,0.015708000461260477
39,A40,-2.262,-2.766,0.46,3.1416,1.5708,CW,-2.72,-2.78,-2.26,-2.31,0.722568,30,29,15,0.04817119836807251
40,A41,-2.262,-2.766,0.61,1.5708,3.1416,CCW,-2.26,-2.16,-2.87,-2.77,0.958188,31,114,15,0.06387919982274373
41,A42,-2.262,-2.006,0.3,-1.5708,0.0,CCW,-2.26,-2.31,-1.95,-2.01,0.47124,29,118,15,0.031416000922520955
42,A43,-2.262,-2.006,0.15,0.0,-1.5708,CW,-2.11,-2.01,-2.26,-2.16,0.23562,32,31,15,0.015708000461260477
43,A44,-1.802,-2.006,0.3,-3.1416,-1.5708,CCW,-2.11,-2.01,-1.8,-2.32,0.47124,32,115,15,0.031416000922520955
44,A45,-1.802,-2.006,0.15,-1.5708,-3.1416,CW,-1.81,-2.16,-1.95,-2.01,0.23562,27,118,15,0.015708000461260477
45,A46,2.008,-1.596,0.46,0.0,1.5708,CCW,2.47,-1.61,2.01,-1.14,0.722568,33,127,15,0.04817119836807251
46,A47,2.008,-1.596,0.61,0.0,1.5708,CCW,2.62,-1.61,2.01,-0.99,0.958188,34,128,15,0.06387919982274373
47,A48,2.008,-0.836,0.61,-1.5708,0.0,CCW,2.01,-1.45,2.62,-0.84,0.958188,35,141,15,0.06387919982274373
48,A49,2.008,-0.836,0.46,-1.5708,0.0,CCW,2.01,-1.3,2.47,-0.84,0.722568,36,142,15,0.04817119836807251
49,A50,2.008,-1.596,0.15,1.5708,0.0,CW,2.01,-1.45,2.16,-1.6,0.23562,35,122,15,0.015708000461260477
50,A51,2.008,-1.596,0.3,1.5708,0.0,CW,2.01,-1.3,2.31,-1.6,0.47124,36,123,15,0.031416000922520955
51,A52,2.008,-0.836,0.3,0.0,-1.5708,CW,2.31,-0.85,2.01,-1.14,0.47124,37,127,15,0.031416000922520955
52,A53,2.008,-0.836,0.15,0.0,-1.5708,CW,2.16,-0.85,2.01,-0.99,0.23562,38,128,15,0.015708000461260477
53,A54,0.378,-1.596,0.61,1.5708,3.1416,CCW,0.38,-0.99,-0.23,-1.6,0.958188,39,119,15,0.06387919982274373
54,A55,0.378,-1.596,0.46,1.5708,3.1416,CCW,0.38,-1.15,-0.07,-1.6,0.722568,40,120,15,0.04817119836807251
55,A56,0.378,-1.596,0.3,3.1416,1.5708,CW,0.08,-1.61,0.38,-1.3,0.47124,41,125,15,0.031416000922520955
56,A57,0.378,-1.596,0.15,3.1416,1.5708,CW,0.23,-1.61,0.38,-1.45,0.23562,42,126,15,0.015708000461260477
57,A58,0.378,-0.836,0.15,-1.5708,-3.1416,CW,0.38,-0.99,0.23,-0.84,0.23562,39,136,15,0.015708000461260477
58,A59,0.378,-0.846,0.3,-1.5708,-3.1416,CW,0.38,-1.15,0.08,-0.84,0.47124,40,137,15,0.031416000922520955
59,A60,0.378,-0.836,0.46,-3.1416,-1.5708,CCW,-0.07,-0.84,0.38,-1.3,0.722568,43,125,15,0.04817119836807251
60,A61,0.378,-0.836,0.61,-3.1416,-1.5708,CCW,-0.23,-0.84,0.38,-1.45,0.958188,44,126,15,0.06387919982274373
61,A62,-0.382,-1.596,0.61,0.0,1.5708,CCW,0.23,-1.61,-0.38,-0.99,0.958188,42,131,15,0.06387919982274373
62,A63,-0.382,-1.596,0.46,0.0,1.5708,CCW,0.08,-1.61,-0.38,-1.15,0.722568,41,130,15,0.04817119836807251
63,A64,-0.382,-1.596,0.3,1.5708,0.0,CW,-0.38,-1.3,-0.07,-1.6,0.47124,45,120,15,0.031416000922520955
64,A65,-0.382,-1.596,0.15,1.5708,0.0,CW,-0.37,-1.45,-0.23,-1.6,0.23562,46,119,15,0.015708000461260477
65,A66,-0.382,-0.836,0.15,0.0,-1.5708,CW,-0.23,-0.84,-0.38,-0.99,0.23562,44,131,15,0.015708000461260477
66,A67,-0.382,-0.836,0.3,0.0,-1.5708,CW,-0.07,-0.84,-0.38,-1.15,0.47124,43,130,15,0.031416000922520955
67,A68,-0.382,-0.836,0.46,-1.5708,0.0,CCW,-0.38,-1.3,0.08,-0.84,0.722568,45,137,15,0.04817119836807251
68,A69,-0.382,-0.836,0.61,-1.5708,0.0,CCW,-0.37,-1.45,0.23,-0.84,0.958188,46,136,15,0.06387919982274373
69,A70,-1.012,-1.146,0.3,-2.1996,-1.5708,CCW,-1.19,-1.4,-1.01,-1.45,0.18864001,47,129,15,0.012576000889142354
70,A71,-1.622,-2.286,0.99,1.483,1.1233,CW,-1.53,-1.3,-1.19,-1.4,0.3561031,48,47,15,0.023740206162134805
71,A72,-1.802,-1.446,0.15,3.1416,1.5708,CW,-1.95,-1.45,-1.8,-1.29,0.23562,49,132,15,0.015708000461260477
72,A73,-1.802,-1.446,0.3,1.5708,3.1416,CCW,-1.81,-1.15,-2.11,-1.45,0.47124,50,117,15,0.031416000922520955
73,A74,-1.802,-0.986,0.3,-3.1416,-1.5708,CCW,-2.11,-0.99,-1.8,-1.29,0.47124,51,132,15,0.031416000922520955
74,A75,-1.802,-0.986,0.15,-1.5708,-3.1416,CW,-1.81,-1.15,-1.95,-0.99,0.23562,50,134,15,0.015708000461260477
75,A76,-1.622,-0.156,0.99,-1.1233,-1.483,CW,-1.19,-1.06,-1.54,-1.15,0.3561031,52,133,15,0.023740206162134805
76,A77,-1.012,-1.296,0.3,1.5708,2.1996,CCW,-1.02,-0.99,-1.19,-1.06,0.18864001,53,52,15,0.012576000889142354
77,A78,1.168,-0.536,0.46,-1.5708,-3.1416,CW,1.17,-0.99,0.71,-0.54,0.722568,54,140,15,0.04817119836807251
78,A79,3.568,-0.206,0.95,3.1416,2.5932,CW,2.62,-0.21,2.76,0.29,0.52097994,55,57,15,0.03473199605941772
79,A80,3.568,-0.206,1.1,3.1416,2.5932,CW,2.47,-0.2,2.63,0.37,0.60323995,56,58,15,0.040215996901194255
80,A81,2.238,0.614,0.61,-0.5484,1.5708,CCW,2.76,0.29,2.24,1.22,1.292712,57,63,15,0.08618079821268718
81,A82,2.238,0.614,0.46,-0.5484,1.5708,CCW,2.63,0.37,2.24,1.07,0.974832,58,64,15,0.0649887998898824
82,A83,2.238,0.614,0.46,-1.9801,-0.5484,CCW,2.06,0.19,2.63,0.37,0.65858203,59,58,15,0.04390546878178914
83,A85,1.878,-0.206,0.43,1.1615,0.0,CW,2.06,0.19,2.31,-0.2,0.499445,59,143,15,0.03329633275667827
84,A86,1.878,-0.206,0.28,1.1615,0.0,CW,2.0,0.05,2.16,-0.21,0.32522,60,144,15,0.021681332588195802
85,A87,2.238,0.614,0.61,-2.8208,-1.9801,CCW,1.66,0.4,2.0,0.05,0.51282704,61,60,15,0.03418846925099691
86,A88,2.238,0.614,0.46,-2.8728,-1.9801,CCW,1.8,0.48,2.06,0.19,0.41064203,62,59,15,0.02737613519032796
87,A89,2.238,0.614,0.61,1.5708,3.4617,CCW,2.24,1.22,1.66,0.4,1.153449,63,61,15,0.07689660390218099
88,A90,2.238,0.614,0.46,1.5708,3.4104,CCW,2.24,1.07,1.8,0.48,0.846216,64,62,15,0.05641440153121948
89,A91,1.158,0.224,0.53,1.5708,0.3398,CW,1.12,0.76,1.66,0.4,0.65242994,65,61,15,0.04349532922108968
90,A92,1.158,0.224,0.69,1.476,0.3869,CW,1.22,0.91,1.8,0.48,0.7514789,66,62,15,0.05009859402974447
91,A93,1.168,0.304,0.46,3.1416,1.676,CW,0.71,0.3,1.12,0.76,0.674176,67,65,15,0.04494506518046061
92,A94,0.688,0.304,0.46,3.1416,1.6781,CW,0.23,0.3,0.71,0.76,0.67320997,68,145,15,0.044880664348602294
93,A95,0.688,0.304,0.61,3.1416,1.5083,CW,0.08,0.3,0.73,0.91,0.996313,69,146,15,0.06642086505889892
94,A96,-0.695,0.304,0.61,1.5062,0.0,CW,-0.64,0.91,-0.07,0.31,0.918782,70,138,15,0.061252133051554365
95,A97,-0.682,0.304,0.46,1.5139,0.0,CW,-0.66,0.76,-0.22,0.3,0.696394,71,139,15,0.046426268418629964
96,A98,-0.872,0.204,0.71,3.0248,1.5708,CW,-1.58,0.28,-0.87,0.91,1.03234,72,148,15,0.06882266998291016
97,A99,-0.872,0.204,0.56,3.0123,1.5708,CW,-1.43,0.27,-0.87,0.76,0.80724007,73,147,15,0.05381600459416707
98,A100,-2.032,0.354,0.61,-0.9467,-0.1307,CCW,-1.67,-0.15,-1.43,0.27,0.49776,74,73,15,0.03318399985631307
99,A101,-2.032,0.354,0.61,-2.2007,-0.9467,CCW,-2.39,-0.15,-1.67,-0.15,0.7649401,75,74,15,0.05099600553512573
100,A102,-1.282,-0.686,0.67,3.1416,2.1949,CW,-1.95,-0.69,-1.67,-0.15,0.6342889,76,74,15,0.04228592713673909
101,A103,-2.782,-0.686,0.67,0.9467,0.0,CW,-2.39,-0.15,-2.11,-0.69,0.634289,75,135,15,0.04228593508402507
102,A104,-2.032,0.354,0.46,1.8808,6.1326,CCW,-2.17,0.79,-1.58,0.28,1.9558278,77,72,15,0.13038852214813232
103,A105,-2.032,0.354,0.61,1.9628,4.0883,CCW,-2.26,0.91,-2.39,-0.15,1.2965552,78,75,15,0.08643701076507568
104,A106,-0.762,-2.696,3.91,1.619,1.9659,CCW,-0.87,1.22,-2.26,0.91,1.356379,79,78,15,0.09042526880900065
105,A107,-0.762,-2.696,3.76,1.6006,1.9551,CCW,-0.87,1.06,-2.17,0.79,1.3329202,80,77,15,0.08886134624481201
106,A1081,-2.032,0.354,0.61,-0.1307,0.395,CCW,-1.43,0.27,-1.47,0.58,0.32067704,73,81,15,0.021378469467163087
107,A1082,-2.032,0.354,0.61,0.395,1.186,CCW,-1.47,0.58,-1.8,0.92,0.48250997,81,82,15,0.032167331377665205
108,A1083,-2.032,0.354,0.61,1.186,1.9628,CCW,-1.8,0.92,-2.26,0.91,0.47384804,82,78,15,0.03158986965815226
109,A109,-2.032,0.354,0.46,-0.1506,1.8808,CCW,-1.58,0.28,-2.17,0.79,0.934444,72,77,15,0.06229626735051473
110,A110,2.118,-3.646,0.35,0.1107,1.4601,CCW,2.47,-3.69,2.16,-3.3,0.47229,83,104,15,0.031486000617345175
111,A111,2.118,-3.646,0.19,1.3734,0.1974,CW,2.16,-3.46,2.31,-3.61,0.22343999,10,9,15,0.014895999431610107
112,A112,-0.912,-3.146,0.15,-1.5708,-3.1416,CW,-0.91,-3.3,-1.06,-3.15,0.23562,84,109,15,0.015708000461260477
113,A113,-1.372,-3.146,0.15,0.0,-1.5708,CW,-1.22,-3.15,-1.37,-3.3,0.23562,85,99,15,0.015708000461260477
114,A114,-0.072,-2.086,0.3,-0.6288,0.0,CCW,0.18,-2.27,0.23,-2.09,0.18864,86,121,15,0.012575999895731608
115,A115,1.068,-2.696,0.99,3.0538,2.6941,CW,0.08,-2.61,0.18,-2.27,0.3561032,87,86,15,0.023740214109420777
116,A116,-1.062,-2.696,0.99,0.4475,0.0878,CW,-0.16,-2.27,-0.07,-2.6,0.356103,88,108,15,0.02374020020167033
117,A117,0.078,-2.086,0.3,-3.1416,-2.5128,CCW,-0.23,-2.08,-0.16,-2.27,0.18863998,89,88,15,0.012575998902320862
118,A118,-0.6432703,0.17842542,0.58098125,1.559731,0.21927208,CW,-0.66,0.76,-0.07,0.31,0.7787815,71,138,15,0.05191876490910848
119,A119,0.6385138,0.1842918,0.57508177,2.9304783,1.573704,CW,0.08,0.3,0.71,0.76,0.78025615,69,145,15,0.052017076810201006
120,A120,2.2352,0.6096,0.6096,-2.000539,-1.6810795,CCW,2.0,0.05,2.17,-0.0,0.19474255,60,90,15,0.012982836365699768
121,A121,2.2352,0.6096,0.6096,-1.6810795,-0.5483349,CCW,2.17,-0.0,2.76,0.29,0.69052106,90,57,15,0.046034737428029375
122,A122,2.0903776,-0.2032,0.22102253,1.211427,0.0,CW,2.17,-0.0,2.31,-0.2,0.26775265,90,143,15,0.017850176493326823
''';
