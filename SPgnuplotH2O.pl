#################################################################
#スペクトル図を作成するプログラム
#################################################################


#!/usr/bin/perl

#$Dgnu = "/usr/local/bin/gnuplot";			## Please input a directory of gnuplot ##
$Ddat = "/Users/ovo/OVO-AUTO/data";	 ## Please input a directory of data ##

open(IN0,"@ARGV[0]");
$filesp = @ARGV[0];
$file = $filesp;
($mae,$ushiro) = split (/\_K\_/, $file);
($mae2,$name) = split (/H2O\//, $mae);
$wc = `wc -l $filesp`;
($gyosu,$a) = split(/\s+/, $wc);
while ($line = <IN0>) {
	chomp $line;
	if($line =~ /\#/){
		$date = $line;
		$date =~ s/\#//;
		$date2 = $date;
		$date2 =~ s/\///g;
	}
	if($. == 2){
		($xmin,$y) = split(/\s/, $line);
	}
        if($. == $gyosu){
                ($xmax,$y) = split(/\s/, $line);
        }
}
close(IN0);

#system("tcsh");
$gnuplot = '/scisoft/bin/gnuplot -persist';
&make_gnuplot;
open(GNUPLOT,"|".$gnuplot);
foreach $k (0..$#plot){print GNUPLOT $plot[$k];}

sub make_gnuplot{
	$k=0;
	$plot[$k++] = sprintf("set xlabel \"Vlsr[km/s]\"\n");
	$plot[$k++] = sprintf("set mxtics\n");
	$plot[$k++] = sprintf("set xrange [$xmin-1:$xmax+1]\n");
	$plot[$k++] = sprintf("set ylabel \"Intensity[K]\"\n");
	$plot[$k++] = sprintf("set title \"H2O Maser, $name, $date\"\n");
	$plot[$k++] = sprintf("set key outside\n");
        $plot[$k++] = sprintf("set terminal png\n");
	$plot[$k++] = sprintf("set output '$Ddat/$name/H2O/$name\_$date2.png'\n");
	$plot[$k++] = sprintf("plot \"$filesp\" u 1:2 ti \"\" w l\n");
	$plot[$k++] = sprintf("set output\n");
}
