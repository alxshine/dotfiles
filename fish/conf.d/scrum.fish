function scrum
  Rscript -e 'writeLines(paste(c("Rainer", sample(c("Julia", "Martin", "Judith", "Manuel", "Alex", "Paulina", "Svetlana", "Nora", "Leonid", "Thomas", "Benedikt", "Verena")), "and guests"), collapse=", "))' $argv; 
end
