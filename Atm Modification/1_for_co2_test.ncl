; changing atm of case1

begin
  fin  = "13_for_6co2_with_modify.cam.i.0003-01-01-00000.nc"
  fout = "new_13_for_6co2_with_modify.cam.i.0003-01-01-00000.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 


   t           = ncid->T
  tsice       = ncid->TSICE ;Ice temperature
  icefrac     = ncid->ICEFRAC ;Fraction of sfc area covered by sea-ice
  sicthk      = ncid->SICTHK ;Sea ice thickness
;related to O
  o     = ncid->O
 O_D    = ncid->O1D
 o2     = ncid->O2
 o2_D   = ncid->O2_1D
 o2_S   = ncid->O2_1S
 o2p    = ncid->O2p
 o3     = ncid->O3
 op     = ncid->Op

;related to oo
 ch3o2  = ncid->CH3O2 ; methylperoxy
 ho2    = ncid->HO2 
 h2o2   = ncid->H2O2 
 ho2no2 = ncid->HO2NO2

; CO2 
 co2    = ncid->CO2
 co     = ncid->CO 

 ch3ooh = ncid->CH3OOH  


;related to H2O
 oh     = ncid->OH 
 h      = ncid->H
 electron  = ncid->e ; electron concentration
 h2     = ncid->H2 

 n      = ncid->N 
 N_p    = ncid->Np 
 N_2D   = ncid->N2D ;N_2D 
 N2_p   = ncid->N2p ; N2+
 hno3   = ncid->HNO3 
 n2o    = ncid->N2O 
 n2o5   = ncid->N2O5 
 no     = ncid->NO
 NO_p   = ncid->NOp 
 no2    = ncid->NO2
 no3    = ncid->NO3
 Cl     = ncid->CL 
 Cl2    = ncid->CL2 
 Cl2O2  = ncid->CL2O2 ; chlorine monoxide dimer
 ClO    = ncid->CLO 
 ClONO2 = ncid->CLONO2 
 Cly    = ncid->CLY   ; total reactive chlorine
 HOCl   = ncid->HOCL
 HCl    = ncid->HCL
 ClO2   = ncid->OCLO  ;ClO2
 Br     = ncid->BR
 BrCl   = ncid->BRCL 
 BrO    = ncid->BRO 
 BrONO2 = ncid->BRONO2
 HBr    = ncid->HBR 
 Bry    = ncid->BRY   ;total reactive bromine
 HOBr   = ncid->HOBR
 ch4     = ncid->CH4
 ch2o    = ncid->CH2O
 CCl4    = ncid->CCL4
 CF2ClBr = ncid->CF2CLBR
 CF3Br   = ncid->CF3BR
 CFCl3   = ncid->CFC11 ;CFCl3
 CCl2FCClF2  = ncid->CFC113 ; CCl2FCClF2
 CF2Cl2  = ncid->CFC12 ; CF2Cl2
 CH3Br   = ncid->CH3BR
 CH3CCl3 = ncid->CH3CCL3
 CH3Cl   = ncid->CH3CL
 CHF2Cl  = ncid->HCFC22 ; CHF2Cl

 

; setting 

;  icefrac  = (/0./) 
  co2      = co2*6
;  co       = co*10    


;over 
 ncid->T        = t 
 ncid->TSICE    = tsice  
 ncid->ICEFRAC  = icefrac 
 ncid->SICTHK   = sicthk    

;related to O
 ncid->O     = o  
 ncid->O1D   = O_D 
 ncid->O2    = o2
 ncid->O2_1D = o2_D
 ncid->O2_1S = o2_S
 ncid->O2p   = o2p
 ncid->O3    = o3 
 ncid->Op    = op
 
;related to oo
 ncid->CH3O2  = ch3o2 
 ncid->HO2    = ho2
 ncid->H2O2   = h2o2 
 ncid->HO2NO2 = ho2no2 

;CO2 
 ncid->CO2    = co2   
 ncid->CO     = co   
 
;related to H2O
 ncid->OH    = oh 
 ncid->H     = h
 ncid->e     = electron
 ncid->H2    = h2
 ncid->N     = n
 ncid->Np    = N_p
 ncid->N2D   = N_2D   
 ncid->N2p   = N2_p
 ncid->HNO3  = hno3
 ncid->N2O   = n2o
 ncid->N2O5  = n2o5
 ncid->NO    = no 
 ncid->NOp   = NO_p 
 ncid->NO2   = no2
 ncid->NO3   = no3 
 ncid->CL     = Cl 
 ncid->CL2    = Cl2
 ncid->CL2O2  = Cl2O2
 ncid->CLO    =  ClO  
 ncid->CLONO2 = ClONO2
 ncid->CLY    =  Cly 
 ncid->HOCL   = HOCl 
 ncid->HCL    = HCl
 ncid->OCLO   = ClO2  
 ncid->BR     = Br 
 ncid->BRCL   = BrCl 
 ncid->BRO    = BrO 
 ncid->BRONO2 = BrONO2
 ncid->HBR    = HBr
 ncid->BRY    = Bry 
 ncid->HOBR   = HOBr
 ncid->CH4     = ch4
 ncid->CH2O    = ch2o
 ncid->CCL4    = CCl4 
 ncid->CF2CLBR = CF2ClBr
 ncid->CF3BR   = CF3Br
 ncid->CFC11   = CFCl3 
 ncid->CFC113  = CCl2FCClF2
 ncid->CFC12   = CF2Cl2 
 ncid->CH3BR   = CH3Br
 ncid->CH3CCL3 = CH3CCl3
 ncid->CH3CL   = CH3Cl
 ncid->HCFC22  = CHF2Cl 
 ncid->CH3OOH   = ch3ooh

end    

