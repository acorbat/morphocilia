/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectClassifier
feature_specification = area mean_intensity mean_max_distance_to_centroid_ratio
num_ground_truth_dimensions = 1
num_classes = 3
num_features = 3
max_depth = 2
num_trees = 100
feature_importances = 0.32804496035560915,0.3881173328623161,0.2838377067820749
apoc_version = 0.12.0
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_in1_TYPE in1, IMAGE_in2_TYPE in2, IMAGE_out_TYPE out) {
 sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
 const int x = get_global_id(0);
 const int y = get_global_id(1);
 const int z = get_global_id(2);
 float i0 = READ_IMAGE(in0, sampler, POS_in0_INSTANCE(x,y,z,0)).x;
 float i1 = READ_IMAGE(in1, sampler, POS_in1_INSTANCE(x,y,z,0)).x;
 float i2 = READ_IMAGE(in2, sampler, POS_in2_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
 float s2=0;
if(i2<2.0229997634887695){
 if(i0<4605.0){
  s0+=11.0;
  s1+=9.0;
 } else {
  s2+=3.0;
 }
} else {
 s2+=4.0;
}
if(i0<1000.0){
 s1+=7.0;
} else {
 if(i2<1.9353108406066895){
  s0+=12.0;
  s1+=3.0;
 } else {
  s2+=5.0;
 }
}
if(i0<3141.5){
 if(i2<1.664933204650879){
  s0+=3.0;
 } else {
  s0+=3.0;
  s1+=16.0;
 }
} else {
 s2+=5.0;
}
if(i1<18.322879791259766){
 s2+=7.0;
} else {
 if(i2<1.679125189781189){
  s0+=6.0;
 } else {
  s0+=4.0;
  s1+=9.0;
  s2+=1.0;
 }
}
if(i0<4465.5){
 if(i2<1.664933204650879){
  s0+=6.0;
 } else {
  s0+=5.0;
  s1+=10.0;
 }
} else {
 s2+=6.0;
}
if(i1<19.20924186706543){
 s2+=9.0;
} else {
 if(i2<1.8118244409561157){
  s0+=7.0;
 } else {
  s0+=6.0;
  s1+=5.0;
 }
}
if(i2<1.9559860229492188){
 if(i1<16.5717716217041){
  s2+=3.0;
 } else {
  s0+=9.0;
  s1+=8.0;
 }
} else {
 if(i1<18.584148406982422){
  s2+=1.0;
 } else {
  s1+=6.0;
 }
}
if(i1<18.071508407592773){
 s2+=7.0;
} else {
 if(i1<23.10601043701172){
  s0+=10.0;
  s1+=2.0;
  s2+=4.0;
 } else {
  s0+=1.0;
  s1+=3.0;
 }
}
if(i1<19.332256317138672){
 s2+=4.0;
} else {
 if(i2<1.6520872116088867){
  s0+=3.0;
 } else {
  s0+=4.0;
  s1+=14.0;
  s2+=2.0;
 }
}
if(i0<3141.5){
 if(i0<1000.0){
  s0+=1.0;
  s1+=5.0;
 } else {
  s0+=7.0;
  s1+=3.0;
 }
} else {
 s2+=11.0;
}
if(i1<18.584148406982422){
 s2+=7.0;
} else {
 if(i0<1327.5){
  s0+=2.0;
  s1+=11.0;
 } else {
  s0+=7.0;
 }
}
if(i1<17.351900100708008){
 s2+=4.0;
} else {
 if(i2<1.9396001100540161){
  s0+=11.0;
  s1+=2.0;
 } else {
  s1+=6.0;
  s2+=4.0;
 }
}
if(i2<1.679125189781189){
 s0+=4.0;
} else {
 if(i0<4178.0){
  s0+=5.0;
  s1+=14.0;
 } else {
  s2+=4.0;
 }
}
if(i2<1.9353108406066895){
 if(i1<16.5717716217041){
  s2+=1.0;
 } else {
  s0+=10.0;
  s1+=4.0;
 }
} else {
 if(i2<2.0229997634887695){
  s1+=4.0;
  s2+=2.0;
 } else {
  s1+=1.0;
  s2+=5.0;
 }
}
if(i0<4892.5){
 if(i2<1.8118244409561157){
  s0+=6.0;
 } else {
  s0+=6.0;
  s1+=7.0;
  s2+=1.0;
 }
} else {
 s2+=7.0;
}
if(i2<1.9353108406066895){
 if(i0<981.5){
  s1+=3.0;
 } else {
  s0+=11.0;
  s1+=3.0;
 }
} else {
 if(i0<2318.0){
  s1+=3.0;
 } else {
  s2+=7.0;
 }
}
if(i1<19.08248519897461){
 s2+=4.0;
} else {
 if(i2<1.6637580394744873){
  s0+=5.0;
 } else {
  s0+=5.0;
  s1+=10.0;
  s2+=3.0;
 }
}
if(i0<7242.0){
 if(i2<1.664933204650879){
  s0+=5.0;
 } else {
  s0+=8.0;
  s1+=10.0;
 }
} else {
 s2+=4.0;
}
if(i1<19.08248519897461){
 s2+=6.0;
} else {
 if(i0<1637.5){
  s0+=5.0;
  s1+=9.0;
 } else {
  s0+=7.0;
 }
}
if(i1<19.08248519897461){
 s2+=8.0;
} else {
 if(i0<1553.5){
  s0+=5.0;
  s1+=8.0;
 } else {
  s0+=5.0;
  s2+=1.0;
 }
}
if(i2<2.289466381072998){
 if(i2<1.6973704099655151){
  s0+=5.0;
 } else {
  s0+=9.0;
  s1+=9.0;
 }
} else {
 s2+=4.0;
}
if(i0<1327.5){
 if(i1<23.1622371673584){
  s0+=3.0;
  s1+=6.0;
 } else {
  s1+=6.0;
 }
} else {
 if(i1<18.582548141479492){
  s2+=6.0;
 } else {
  s0+=6.0;
 }
}
if(i0<4605.0){
 if(i0<1042.5){
  s0+=2.0;
  s1+=9.0;
 } else {
  s0+=6.0;
  s1+=1.0;
 }
} else {
 s2+=9.0;
}
if(i0<4605.0){
 if(i2<1.664933204650879){
  s0+=6.0;
 } else {
  s0+=10.0;
  s1+=6.0;
 }
} else {
 s2+=5.0;
}
if(i1<18.584148406982422){
 s2+=6.0;
} else {
 if(i2<1.677950143814087){
  s0+=3.0;
 } else {
  s0+=6.0;
  s1+=12.0;
 }
}
if(i0<4892.5){
 if(i0<1218.0){
  s0+=3.0;
  s1+=7.0;
 } else {
  s0+=9.0;
 }
} else {
 s2+=8.0;
}
if(i0<4605.0){
 if(i1<19.069591522216797){
  s0+=3.0;
 } else {
  s0+=10.0;
  s1+=10.0;
 }
} else {
 s2+=4.0;
}
if(i2<1.9353108406066895){
 if(i2<1.8726329803466797){
  s0+=6.0;
  s1+=8.0;
 } else {
  s0+=6.0;
  s2+=1.0;
 }
} else {
 if(i0<2318.0){
  s1+=2.0;
 } else {
  s2+=4.0;
 }
}
if(i2<1.9474871158599854){
 if(i2<1.8118244409561157){
  s0+=9.0;
 } else {
  s0+=5.0;
  s1+=5.0;
 }
} else {
 if(i2<1.9946682453155518){
  s2+=3.0;
 } else {
  s1+=2.0;
  s2+=3.0;
 }
}
if(i0<4605.0){
 if(i1<23.23055648803711){
  s0+=14.0;
  s1+=4.0;
 } else {
  s0+=1.0;
  s1+=4.0;
 }
} else {
 s2+=4.0;
}
if(i1<18.322879791259766){
 s2+=4.0;
} else {
 if(i2<1.664933204650879){
  s0+=5.0;
 } else {
  s0+=6.0;
  s1+=11.0;
  s2+=1.0;
 }
}
if(i2<1.664933204650879){
 s0+=4.0;
} else {
 if(i1<17.613168716430664){
  s2+=5.0;
 } else {
  s0+=4.0;
  s1+=12.0;
  s2+=2.0;
 }
}
if(i1<18.45953369140625){
 s2+=5.0;
} else {
 if(i0<1637.5){
  s0+=3.0;
  s1+=13.0;
 } else {
  s0+=5.0;
  s2+=1.0;
 }
}
if(i0<3141.5){
 if(i2<1.6637580394744873){
  s0+=5.0;
 } else {
  s0+=3.0;
  s1+=10.0;
 }
} else {
 if(i1<23.304452896118164){
  s2+=8.0;
 } else {
  s0+=1.0;
 }
}
if(i1<19.332256317138672){
 if(i0<2289.0){
  s0+=1.0;
 } else {
  s2+=7.0;
 }
} else {
 if(i0<1637.5){
  s0+=5.0;
  s1+=9.0;
 } else {
  s0+=4.0;
  s2+=1.0;
 }
}
if(i2<1.9353108406066895){
 if(i0<4605.0){
  s0+=9.0;
  s1+=3.0;
 } else {
  s2+=3.0;
 }
} else {
 if(i1<22.5588321685791){
  s1+=2.0;
  s2+=8.0;
 } else {
  s1+=2.0;
 }
}
if(i0<1042.5){
 s1+=12.0;
} else {
 if(i2<1.8134524822235107){
  s0+=5.0;
 } else {
  s0+=7.0;
  s1+=2.0;
  s2+=1.0;
 }
}
if(i1<19.20924186706543){
 if(i0<3194.5){
  s0+=1.0;
 } else {
  s2+=4.0;
 }
} else {
 if(i2<1.6637580394744873){
  s0+=2.0;
 } else {
  s0+=6.0;
  s1+=13.0;
  s2+=1.0;
 }
}
if(i1<21.007843017578125){
 if(i1<20.06036376953125){
  s0+=5.0;
  s2+=5.0;
 } else {
  s1+=6.0;
 }
} else {
 if(i1<21.96830940246582){
  s0+=2.0;
  s2+=1.0;
 } else {
  s0+=8.0;
 }
}
if(i2<1.9353108406066895){
 if(i2<1.6637580394744873){
  s0+=5.0;
 } else {
  s0+=4.0;
  s1+=4.0;
  s2+=1.0;
 }
} else {
 if(i1<19.08248519897461){
  s2+=6.0;
 } else {
  s1+=5.0;
  s2+=2.0;
 }
}
if(i1<19.08248519897461){
 if(i2<1.7751743793487549){
  s0+=1.0;
 } else {
  s2+=7.0;
 }
} else {
 if(i2<1.677950143814087){
  s0+=5.0;
 } else {
  s0+=4.0;
  s1+=10.0;
 }
}
if(i2<2.3290839195251465){
 if(i1<18.322879791259766){
  s2+=3.0;
 } else {
  s0+=7.0;
  s1+=13.0;
  s2+=1.0;
 }
} else {
 s2+=3.0;
}
if(i1<18.071508407592773){
 s2+=6.0;
} else {
 if(i1<23.10601043701172){
  s0+=12.0;
  s1+=4.0;
  s2+=1.0;
 } else {
  s1+=4.0;
 }
}
if(i0<4047.0){
 if(i1<22.672080993652344){
  s0+=3.0;
  s1+=8.0;
 } else {
  s0+=4.0;
  s1+=3.0;
 }
} else {
 s2+=9.0;
}
if(i2<1.9474871158599854){
 if(i1<22.328289031982422){
  s0+=6.0;
 } else {
  s0+=5.0;
  s1+=6.0;
 }
} else {
 if(i0<3511.0){
  s1+=1.0;
 } else {
  s2+=9.0;
 }
}
if(i1<19.08248519897461){
 s2+=3.0;
} else {
 if(i2<1.6520872116088867){
  s0+=3.0;
 } else {
  s0+=5.0;
  s1+=15.0;
  s2+=1.0;
 }
}
if(i0<4892.5){
 if(i0<1327.5){
  s0+=6.0;
  s1+=12.0;
 } else {
  s0+=5.0;
 }
} else {
 s2+=4.0;
}
if(i1<18.322879791259766){
 s2+=5.0;
} else {
 if(i2<1.664933204650879){
  s0+=7.0;
 } else {
  s0+=5.0;
  s1+=9.0;
  s2+=1.0;
 }
}
if(i0<4465.5){
 if(i2<1.6985454559326172){
  s0+=6.0;
 } else {
  s0+=5.0;
  s1+=11.0;
 }
} else {
 s2+=5.0;
}
if(i1<19.20924186706543){
 s2+=7.0;
} else {
 if(i1<23.1622371673584){
  s0+=11.0;
  s1+=4.0;
  s2+=2.0;
 } else {
  s1+=3.0;
 }
}
if(i2<1.9433579444885254){
 if(i2<1.862675666809082){
  s0+=6.0;
  s1+=9.0;
 } else {
  s0+=6.0;
  s2+=2.0;
 }
} else {
 s2+=4.0;
}
if(i1<18.322879791259766){
 s2+=7.0;
} else {
 if(i1<22.398786544799805){
  s0+=7.0;
  s1+=3.0;
 } else {
  s0+=3.0;
  s1+=7.0;
 }
}
if(i1<18.322879791259766){
 s2+=5.0;
} else {
 if(i1<25.4876651763916){
  s0+=17.0;
  s1+=3.0;
  s2+=1.0;
 } else {
  s1+=1.0;
 }
}
if(i1<18.322879791259766){
 s2+=5.0;
} else {
 if(i1<23.1622371673584){
  s0+=11.0;
  s1+=5.0;
 } else {
  s0+=1.0;
  s1+=5.0;
 }
}
if(i1<19.08248519897461){
 s2+=6.0;
} else {
 if(i1<21.007843017578125){
  s0+=1.0;
  s1+=7.0;
 } else {
  s0+=6.0;
  s1+=7.0;
 }
}
if(i0<3272.5){
 if(i1<23.23055648803711){
  s0+=11.0;
  s1+=7.0;
 } else {
  s1+=4.0;
 }
} else {
 s2+=5.0;
}
if(i1<21.897811889648438){
 if(i1<19.56221580505371){
  s0+=1.0;
  s2+=8.0;
 } else {
  s1+=4.0;
  s2+=3.0;
 }
} else {
 if(i1<23.23055648803711){
  s0+=8.0;
 } else {
  s1+=3.0;
 }
}
if(i2<1.9311816692352295){
 if(i2<1.8726329803466797){
  s0+=5.0;
  s1+=7.0;
 } else {
  s0+=6.0;
  s2+=1.0;
 }
} else {
 if(i1<19.08248519897461){
  s2+=3.0;
 } else {
  s1+=4.0;
  s2+=1.0;
 }
}
if(i2<1.9311816692352295){
 if(i2<1.6985454559326172){
  s0+=7.0;
 } else {
  s0+=7.0;
  s1+=5.0;
 }
} else {
 if(i2<1.9832525253295898){
  s2+=3.0;
 } else {
  s1+=3.0;
  s2+=2.0;
 }
}
if(i1<18.322879791259766){
 s2+=4.0;
} else {
 if(i2<1.664933204650879){
  s0+=3.0;
 } else {
  s0+=5.0;
  s1+=14.0;
  s2+=1.0;
 }
}
if(i0<3272.5){
 if(i1<23.1622371673584){
  s0+=8.0;
  s1+=7.0;
 } else {
  s1+=3.0;
 }
} else {
 s2+=9.0;
}
if(i1<18.322879791259766){
 s2+=10.0;
} else {
 if(i1<23.23055648803711){
  s0+=9.0;
  s1+=3.0;
 } else {
  s1+=5.0;
 }
}
if(i0<3272.5){
 if(i2<1.6637580394744873){
  s0+=3.0;
 } else {
  s0+=4.0;
  s1+=12.0;
 }
} else {
 s2+=8.0;
}
if(i2<2.0229997634887695){
 if(i0<1637.5){
  s0+=5.0;
  s1+=10.0;
 } else {
  s0+=6.0;
  s2+=1.0;
 }
} else {
 s2+=5.0;
}
if(i0<3141.5){
 if(i1<22.328289031982422){
  s0+=7.0;
 } else {
  s0+=2.0;
  s1+=7.0;
 }
} else {
 s2+=11.0;
}
if(i2<2.3290839195251465){
 if(i0<1229.5){
  s0+=2.0;
  s1+=12.0;
 } else {
  s0+=6.0;
  s1+=1.0;
  s2+=3.0;
 }
} else {
 s2+=3.0;
}
if(i1<19.08248519897461){
 s2+=8.0;
} else {
 if(i2<1.9946682453155518){
  s0+=9.0;
  s1+=4.0;
  s2+=1.0;
 } else {
  s1+=5.0;
 }
}
if(i1<19.332256317138672){
 if(i0<2289.0){
  s0+=1.0;
 } else {
  s2+=5.0;
 }
} else {
 if(i0<1637.5){
  s0+=5.0;
  s1+=12.0;
 } else {
  s0+=4.0;
 }
}
if(i2<2.0229997634887695){
 if(i0<1637.5){
  s0+=3.0;
  s1+=9.0;
 } else {
  s0+=5.0;
  s2+=3.0;
 }
} else {
 if(i1<18.584148406982422){
  s2+=6.0;
 } else {
  s1+=1.0;
 }
}
if(i0<3272.5){
 if(i2<1.8726329803466797){
  s0+=3.0;
  s1+=7.0;
 } else {
  s0+=5.0;
  s1+=1.0;
 }
} else {
 if(i2<1.9274238348007202){
  s0+=1.0;
  s2+=3.0;
 } else {
  s2+=7.0;
 }
}
if(i1<19.08248519897461){
 if(i2<1.7751743793487549){
  s0+=3.0;
 } else {
  s2+=9.0;
 }
} else {
 if(i2<1.6637580394744873){
  s0+=2.0;
 } else {
  s0+=2.0;
  s1+=11.0;
 }
}
if(i1<18.322879791259766){
 s2+=7.0;
} else {
 if(i1<20.06036376953125){
  s0+=3.0;
 } else {
  s0+=8.0;
  s1+=9.0;
 }
}
if(i2<1.8118244409561157){
 if(i2<1.6985454559326172){
  s0+=6.0;
 } else {
  s0+=3.0;
  s1+=1.0;
 }
} else {
 if(i2<1.8785494565963745){
  s1+=4.0;
 } else {
  s0+=4.0;
  s1+=4.0;
  s2+=5.0;
 }
}
if(i0<2461.5){
 if(i1<23.03769302368164){
  s0+=5.0;
  s1+=2.0;
 } else {
  s1+=7.0;
 }
} else {
 if(i2<1.9274238348007202){
  s0+=1.0;
  s2+=1.0;
 } else {
  s2+=11.0;
 }
}
if(i1<19.08248519897461){
 if(i1<18.322879791259766){
  s2+=3.0;
 } else {
  s0+=1.0;
  s2+=2.0;
 }
} else {
 if(i0<1002.0){
  s1+=6.0;
 } else {
  s0+=11.0;
  s1+=4.0;
 }
}
if(i0<4178.0){
 if(i2<1.664933204650879){
  s0+=7.0;
 } else {
  s0+=4.0;
  s1+=11.0;
 }
} else {
 s2+=5.0;
}
if(i1<19.937349319458008){
 if(i2<1.9716893434524536){
  s0+=4.0;
 } else {
  s2+=6.0;
 }
} else {
 if(i2<1.6520872116088867){
  s0+=3.0;
 } else {
  s0+=2.0;
  s1+=11.0;
  s2+=1.0;
 }
}
if(i1<19.20924186706543){
 if(i0<3194.5){
  s0+=1.0;
 } else {
  s2+=7.0;
 }
} else {
 if(i1<20.06036376953125){
  s0+=4.0;
 } else {
  s0+=3.0;
  s1+=10.0;
  s2+=2.0;
 }
}
if(i2<1.8785494565963745){
 if(i0<1938.0){
  s0+=3.0;
  s1+=9.0;
 } else {
  s0+=1.0;
 }
} else {
 if(i0<4605.0){
  s0+=6.0;
  s1+=1.0;
  s2+=1.0;
 } else {
  s2+=6.0;
 }
}
if(i1<18.322879791259766){
 s2+=8.0;
} else {
 if(i0<4892.5){
  s0+=10.0;
  s1+=5.0;
 } else {
  s2+=4.0;
 }
}
if(i2<1.8918719291687012){
 if(i1<23.1622371673584){
  s0+=12.0;
  s1+=3.0;
 } else {
  s1+=3.0;
 }
} else {
 if(i2<2.161444664001465){
  s1+=1.0;
  s2+=3.0;
 } else {
  s2+=5.0;
 }
}
if(i2<1.9274238348007202){
 if(i1<16.183746337890625){
  s2+=1.0;
 } else {
  s0+=13.0;
  s1+=3.0;
 }
} else {
 if(i0<2198.5){
  s1+=2.0;
 } else {
  s2+=8.0;
 }
}
if(i0<4605.0){
 if(i1<21.007843017578125){
  s0+=3.0;
  s1+=4.0;
 } else {
  s0+=13.0;
  s1+=3.0;
 }
} else {
 s2+=4.0;
}
if(i1<18.322879791259766){
 s2+=4.0;
} else {
 if(i1<23.1622371673584){
  s0+=9.0;
  s1+=5.0;
  s2+=3.0;
 } else {
  s0+=1.0;
  s1+=5.0;
 }
}
if(i0<2153.0){
 if(i1<23.1622371673584){
  s0+=3.0;
  s1+=6.0;
 } else {
  s1+=12.0;
 }
} else {
 if(i0<3272.5){
  s0+=2.0;
 } else {
  s2+=4.0;
 }
}
if(i0<4605.0){
 if(i0<1553.5){
  s0+=4.0;
  s1+=7.0;
 } else {
  s0+=5.0;
  s2+=1.0;
 }
} else {
 s2+=10.0;
}
if(i1<18.322879791259766){
 s2+=3.0;
} else {
 if(i2<1.9474871158599854){
  s0+=13.0;
  s1+=3.0;
 } else {
  s1+=5.0;
  s2+=3.0;
 }
}
if(i0<4605.0){
 if(i1<20.960891723632812){
  s0+=2.0;
  s1+=3.0;
 } else {
  s0+=13.0;
  s1+=3.0;
 }
} else {
 s2+=6.0;
}
if(i2<1.9474871158599854){
 if(i0<4605.0){
  s0+=12.0;
  s1+=3.0;
 } else {
  s2+=2.0;
 }
} else {
 if(i2<2.0229997634887695){
  s1+=3.0;
  s2+=2.0;
 } else {
  s1+=1.0;
  s2+=4.0;
 }
}
if(i0<3141.5){
 if(i0<1000.0){
  s0+=2.0;
  s1+=5.0;
 } else {
  s0+=9.0;
  s1+=2.0;
 }
} else {
 if(i2<1.9274238348007202){
  s0+=2.0;
  s2+=2.0;
 } else {
  s2+=5.0;
 }
}
if(i0<3272.5){
 if(i2<1.8118244409561157){
  s0+=9.0;
  s1+=1.0;
 } else {
  s0+=4.0;
  s1+=6.0;
 }
} else {
 if(i0<6895.5){
  s0+=1.0;
  s2+=2.0;
 } else {
  s2+=4.0;
 }
}
if(i1<18.071508407592773){
 s2+=4.0;
} else {
 if(i2<1.664933204650879){
  s0+=4.0;
 } else {
  s0+=7.0;
  s1+=10.0;
  s2+=2.0;
 }
}
if(i2<1.9353108406066895){
 if(i2<1.664933204650879){
  s0+=7.0;
 } else {
  s0+=5.0;
  s1+=6.0;
 }
} else {
 if(i1<19.08248519897461){
  s2+=5.0;
 } else {
  s1+=4.0;
 }
}
if(i2<2.0229997634887695){
 if(i1<22.398786544799805){
  s0+=8.0;
  s2+=1.0;
 } else {
  s0+=5.0;
  s1+=10.0;
 }
} else {
 s2+=3.0;
}
if(i1<18.710905075073242){
 s2+=5.0;
} else {
 if(i1<21.007843017578125){
  s0+=1.0;
  s1+=6.0;
 } else {
  s0+=9.0;
  s1+=6.0;
 }
}
if(i2<1.9353108406066895){
 if(i2<1.8001422882080078){
  s0+=6.0;
 } else {
  s0+=6.0;
  s1+=3.0;
  s2+=1.0;
 }
} else {
 if(i2<1.9832525253295898){
  s2+=4.0;
 } else {
  s1+=5.0;
  s2+=2.0;
 }
}
if(i1<23.1622371673584){
 if(i1<16.789974212646484){
  s2+=2.0;
 } else {
  s0+=11.0;
  s1+=7.0;
  s2+=1.0;
 }
} else {
 s1+=6.0;
}
if(i1<19.08248519897461){
 s2+=8.0;
} else {
 if(i0<1637.5){
  s0+=3.0;
  s1+=9.0;
 } else {
  s0+=6.0;
  s2+=1.0;
 }
}
if(i1<18.322879791259766){
 s2+=5.0;
} else {
 if(i0<4892.5){
  s0+=12.0;
  s1+=7.0;
 } else {
  s2+=3.0;
 }
}
if(i1<19.20924186706543){
 s2+=6.0;
} else {
 if(i1<20.06036376953125){
  s0+=3.0;
 } else {
  s0+=7.0;
  s1+=11.0;
 }
}
 float max_s=s0;
 int cls=1;
 if (max_s < s1) {
  max_s = s1;
  cls=2;
 }
 if (max_s < s2) {
  max_s = s2;
  cls=3;
 }
 WRITE_IMAGE (out, POS_out_INSTANCE(x,y,z,0), cls);
}
