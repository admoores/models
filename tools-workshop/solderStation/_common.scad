$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

solderSuckerWidth = 20;

handleLen = 115;
handleWidth = 19;

tipLen = handleLen;
tipWidth = 12;

holderLen = handleLen;
holderWidth = 14;

holderBaseLen = 15;
holderBaseWidth = 12.75;

wallThickness = 5;

totalHeight = 75;

totalWidth = 235;
totalLen = solderSuckerWidth + handleLen + wallThickness * 3;

spongeHolderWidth = 12.5;
spongeHolderLen = 30;
spongeHolderHeight = 20;

chargerWidth = 60;
chargerHeight = 30;
chargerLen = 60;

helpingHandHoleRad = 6.3;
helpingHandHoleDepth = 15;

middleXDim = totalWidth - (handleWidth + tipWidth * 2 + wallThickness * 7) - (holderWidth + chargerHeight);
middleYDim = totalLen - wallThickness * 3 - solderSuckerWidth;
middleZDim = totalHeight - wallThickness;

solderSuckerLen = totalWidth - (holderWidth + chargerHeight + wallThickness * 4);

powerBrickSide = 41;
powerBrickLen = 76;
powerBrickPlugRad = 10;

m2ThreadRad = 1;
m2ThreadDepth = 25;