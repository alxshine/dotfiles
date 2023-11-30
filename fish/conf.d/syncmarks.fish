function syncmarks
    fd bookmarks.md | xargs zip bookmarks.zip files.txt
    gpg -e -r Alex\ Schloegl bookmarks.zip
    rm bookmarks.zip
    mv bookmarks.zip.gpg /run/media/alex/Sticky/
end
