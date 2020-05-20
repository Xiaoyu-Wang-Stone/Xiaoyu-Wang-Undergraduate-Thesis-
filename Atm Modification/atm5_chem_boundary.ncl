begin
  fin  = "LBC_1765-2005_1.9x2.5_CMIP5_za_c091204.nc"
  fout = "new_LBC_1765-2005_1.9x2.5_CMIP5_za_c091204.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  cfcl3   =  ncid->CFCL3_LBC
  cf2cl2  =  ncid->CF2CL2_LBC
  cfc113  =  ncid->CFC113_LBC
  ccl4    =  ncid->CCL4_LBC
  ch3ccl3 =  ncid->CH3CCL3_LBC
  hcfc22  =  ncid->HCFC22_LBC
  ch3cl   =  ncid->CH3CL_LBC
  ch3br   =  ncid->CH3BR_LBC
  cf2clbr =  ncid->CF2CLBR_LBC
  cf3br   =  ncid->CF3BR_LBC
  co2     = ncid->CO2_LBC
  co2_mean = ncid->CO2_LBC_mean
  ch4     =  ncid->CH4_LBC
  ch4_mean = ncid->CH4_LBC_mean
  n2o 	  =  ncid->N2O_LBC
  h2 	  = ncid->H2_LBC
  cl 	  = ncid->TOT_CLOY
  br 	  = ncid->TOT_BROY

;  cfcl3   =   0.   
;  cf2cl2  =   0.   
;  cfc113  =   0.   
;  ccl4    =   0.     
;  ch3ccl3 =   0.  
;  hcfc22  =   0.   
;  ch3cl   =   ch3cl/(100.)    
;  ch3br   =   ch3br/(100.)    
;  cf2clbr =   0.  
;  cf3br   =   0.  
;  ch4     =   ch4      
;  ch4_mean =  ch4_mean
;  n2o 	  =   n2o/(10.)  	  
  co2    =   co2*10
  co2_mean =  co2_mean*10
  h2 	  =   h2 	  
;  cl 	  =   cl/(100.)  	  
;  br 	  =   br/(100.)  	  


  ncid->CFCL3_LBC	=	cfcl3   
  ncid->CF2CL2_LBC	=	cf2cl2  
  ncid->CFC113_LBC	=	cfc113  
  ncid->CCL4_LBC	=	ccl4    
  ncid->CH3CCL3_LBC     =	ch3ccl3 
  ncid->HCFC22_LBC	=	hcfc22  
  ncid->CH3CL_LBC 	=	ch3cl   
  ncid->CH3BR_LBC 	=	ch3br   
  ncid->CF2CLBR_LBC     =	cf2clbr 
  ncid->CF3BR_LBC	= 	cf3br   
  ncid->CH4_LBC 	= 	ch4     
  ncid->CH4_LBC_mean    =	ch4_mean
  ncid->N2O_LBC		=	n2o 	  
  ncid->H2_LBC 		=	h2 	  
  ncid->TOT_CLOY 	=	cl 	  
  ncid->TOT_BROY 	=	br
  ncid->CO2_LBC   = co2  
  ncid->CO2_LBC_mean = co2_mean
  
end
