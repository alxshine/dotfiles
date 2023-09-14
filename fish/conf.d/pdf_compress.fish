function pdf_compress
    for file in (ls Pezi\ Rechnungen/*pdf)
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=reduced/(basename $file) $file
    end
end
