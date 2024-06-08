




module perfil(){
    lonX=38.5;
lonZ=9.5;
  parA=3;
    fac=0.5;
    
    translate([(lonX*(3/4))/2,6])
    resize([lonX*(3/4),lonZ-6])
    rotate(180)
   projection(cut=true)
      translate([0, 0,-parA*fac])
        rotate([90,0,0])
    rotate_extrude($fn = 80)
            polygon( points=[[0,0],[parA,0],[0,parA]] );
     
    polygon([[0,0], 
    [0,6],[lonX*(3/4),6],
    [lonX,3],[lonX,0]]);
}

module RemixStrap(EspInt=34){

esp=5;

lonY=EspInt+(2*esp);
lonX=38.5;
lonZ=9.5;
    
    extFront=9;//limite extremo Frontal

    difference(){
        translate([-lonX/2,lonY/2,0])
        
        
        
        //scale([reEscala,reEscala,reEscala])
        resize([lonX,lonY,lonZ])
        rotate([90,0,0])
        linear_extrude(height=lonY)
        //import("Perfil.dxf");
        perfil();

        recortadorMink(
        lonX=lonX,
        mink1=5,
        mink2=12,
        esp=esp,
         EspInt=EspInt
        );
        
        //recorte fondo
        translate([-12,0,0])
        minkowski(){
            mink0=1;
            cube([0.1,EspInt-(2*mink0),100],center=true);
            cylinder(r=mink0,h=0.1);     
        }
        
        //recorte en Angulo
        translate([-16.65,0,-1])
        rotate([0,45,0])
        minkowski(){
            mink0=1;
            cube([0.1,EspInt-(2*mink0),100],center=true);
            cylinder(r=mink0,h=0.1);     
        }
        
        extPost=12;//limite extremo Posterior
        
        //recorte excedente 2 minkowki
        translate([-extPost,0,0])
        rotate([0,45,0])
         cube([4,EspInt,4],center=true);
        
         //recorte primeraMitad
        translate([-extPost,-EspInt/2,0])
         cube([extPost,EspInt,100]);
         
         //recorte segundaMitad
        translate([-1,-EspInt/2,0])
         cube([extFront+1,EspInt,100]);
    }
    
    //rampaFrontal
        translate([extFront,0,0])
    difference(){
        rotate([0,45,0])
         cube([4.5,EspInt,4.5],center=true);
        translate([0,0,-50])
        cube([100,100,100],center=true);
    }
    
    //poste triangular
    translate([1.5,-EspInt/2-1,6.45])
    scale([1,1,1.21])
    rotate([-90,-18,0])
    linear_extrude(height=EspInt+2)
    minkowski(){
       //cylinder(d=3,h=EspInt+2,center=true);
        circle(d=4,$fn=3);
        circle(r=0.7);
    }
    
    translate([-8,-EspInt/2-1,0])
    scale([1,1,1.5])
    rotate([-90,0,0])
    linear_extrude(height=EspInt+2)
    difference(){
         minkowski(){
           //cylinder(d=3,h=EspInt+2,center=true);
            square([2,2],center=true);
            circle(r=1.5);
        }
        translate([0,4])
        square([8,8],center=true);
    }
}//fin module



module recortadorMink(
lonX=38.5,
mink1=10,
mink2=15,
esp=5,
EspInt=34
){   
    
    lonY=EspInt+(2*esp);
    difference(){
      cube([100,100,100],center=true);
        //translate([-6.1,0,0])
        
        //redondeo chico
        intersection(){
             minkowski(){
                  cube([lonX-(2*mink1),lonY-(2*mink1),200],center=true);
                cylinder(r=mink1,h=0.1);
            }
            translate([-50,0,0])
            cube([100,100,200],center=true);
        }
        //redondeo grande
         intersection(){
             minkowski(){
                  cube([lonX-(2*mink2),lonY-(2*mink2),200],center=true);
                cylinder(r=mink2,h=0.1);
            }
            translate([50,0,0])
            cube([100,100,200],center=true);
        }
      
   }//fin difference
}//fin module

$fn=100;

RemixStrap(EspInt=24);

