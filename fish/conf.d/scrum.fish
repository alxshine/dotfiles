function scrum
  Rscript -e 'writeLines(paste(c("Rainer", sample(c("Martin", "Judith", "Manuel", "Alex", "Paulina", "Svetlana", "Nora", "Leonid", "Thomas", "Benedikt")), "and guests"), collapse=", "))' $argv; 
end
