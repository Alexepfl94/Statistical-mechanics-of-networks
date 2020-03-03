function ecarttype(filePath)

output = load(filePath);
x = output(1:end,1);

somme = 0;
for i = 1:length(x)
   somme = somme + x(i);
end
moyenne = somme/length(x);

variance = 0;
for i = 1:length(x) 
	variance = variance + (x(i)-moyenne)*(x(i)-moyenne);
end

variance = variance/length(x);

ecart = sqrt(variance);

end


